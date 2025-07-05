using System.Linq;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using OnlineAuctionSystem.Data;
using OnlineAuctionSystem.Models;
using OnlineAuctionSystem.ViewModels;

using System.Security.Claims;
using Microsoft.EntityFrameworkCore;
namespace OnlineAuctionSystem.Controllers
{
    [Authorize]
    public class DashboardController : Controller
    {
        private readonly ApplicationDbContext _db;
        public DashboardController(ApplicationDbContext db)
        {
            _db = db;
        }

        public IActionResult Index()
        {
            var userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);

            var bidCount = _db.Bids
                              .Count(b => b.UserId == userId);

            var listedCount = _db.Items
                                 .Count(i => i.SellerId == userId);

            var model = new Dashboard
            {
                WelcomeName = User.Identity?.Name ?? "User",
                BidCount = bidCount,
                ListedCount = listedCount
            };
            return View(model);
        }

        // GET /Dashboard/BiddingItems
        public async Task<IActionResult> BiddingItems()
        {
            var userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);

            var bidCount = await _db.Bids.CountAsync(b => b.UserId == userId);
            var listedCount = await _db.Items.CountAsync(i => i.SellerId == userId);

            var biddingItems = await _db.Bids
                .Where(b => b.UserId == userId)
                .Select(b => new BiddingItemVm
                {
                    BidId = b.BidId,
                    ItemId = b.ItemId,
                    ImageUrl = b.Item.Images.First(i => i.IsMain).FilePath,
                    Title = b.Item.Title,
                    Amount = b.BidAmount,
                    Status = b.Item.BidStatus
                })
                .ToListAsync();

            var model = new Dashboard
            {
                WelcomeName = User.Identity?.Name ?? "User",
                BidCount = bidCount,
                ListedCount = listedCount,
                BiddingItems = biddingItems
            };

            return View(model);
        }

        // GET /Dashboard/ListedItems
        public async Task<IActionResult> ListedItems()
        {
            var userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);

            var list = await _db.Items
                .Where(i => i.SellerId == userId)
                .Select(i => new ListedItemDto
                {
                    ItemId = i.ItemId,
                    Title = i.Title,
                    ImageUrl = i.Images.FirstOrDefault(img => img.IsMain)!.FilePath,
                    MinimumBid = i.MinimumBid,
                    BidEndDate = i.BidEndDate,
                    ArtistName = i.Artist.Name
                })
                .ToListAsync();

            var model = new Dashboard
            {
                WelcomeName = User.Identity?.Name ?? "User",
                BidCount = _db.Bids.Count(b => b.UserId == userId),
                ListedCount = list.Count,
                ListedItems = list
            };

            return View(model);
        }

    }
}
