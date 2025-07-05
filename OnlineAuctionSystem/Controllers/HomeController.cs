using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineAuctionSystem.Data;
using OnlineAuctionSystem.ViewModels;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;
using OnlineAuctionSystem.Models;
using System.Globalization;

using System.Linq;
using System.Threading.Tasks;

namespace OnlineAuctionSystem.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _context;
        public HomeController(ApplicationDbContext context) => _context = context;

        public async Task<IActionResult> Index()
        {
            var streaming = await _context.Items
        .Where(i => i.BidStatus == "Live"
                && i.Images.Any(img => img.FilePath.Contains("/assets/img/home1/auction-img")))
        .Include(i => i.Images)
        .Include(i => i.Artist)
        .Select(i => new AuctionCardVm
        {
            ItemId = i.ItemId,
            Title = i.Title,
            ImageUrl = i.Images
                            .Where(img => img.IsMain
                                    && img.FilePath.Contains("/assets/img/home1/auction-img"))
                            .Select(img => img.FilePath)
                            .FirstOrDefault()
                        ?? "/assets/img/home1/auction-img1.jpg",
            CurrentBid = _context.Bids
                            .Where(b => b.ItemId == i.ItemId)
                            .Max(b => (decimal?)b.BidAmount)
                        ?? i.MinimumBid,
            BidEndDate = i.BidEndDate,
            BidStatus = i.BidStatus,
            ArtistName = i.Artist.Name
        })
        .ToListAsync();

            // 2) General Artworks = những ảnh có đường dẫn `/assets/img/home1/general-art-img*`
            var general = await _context.Items
    .Where(i => i.Images.Any(img => img.FilePath.Contains("/assets/img/home1/general-art-img")))
                .Include(i => i.Images)
                .Include(i => i.Artist)
                .Select(i => new AuctionCardVm
                {
                    ItemId = i.ItemId,
                    Title = i.Title,
                    ImageUrl = i.Images
                                    .Where(img => img.FilePath.Contains("/assets/img/home1/general-art-img"))
                                    .Select(img => img.FilePath)
                                    .FirstOrDefault()
                                ?? "/assets/img/home1/general-art-img1.jpg",
                    CurrentBid = _context.Bids
                        .Where(b => b.ItemId == i.ItemId)
                        .Max(b => (decimal?)b.BidAmount)
                    ?? i.MinimumBid,
                    BidEndDate = i.BidEndDate,
                    BidStatus = i.BidStatus,
                    ArtistName = i.Artist.Name
                })
                .ToListAsync();

            // 3) Upcoming = những item chưa bắt đầu hoặc BidStatus == "Upcoming"
            var upcoming = await _context.Items
    .Where(i => i.BidStatus == "Upcoming"
            && i.Images.Any(img => img.FilePath.Contains("/assets/img/home1/upcoming-auction-img")))
                .Include(i => i.Images)
                .Include(i => i.Artist)
                .Select(i => new AuctionCardVm
                {
                    ItemId = i.ItemId,
                    Title = i.Title,
                    ImageUrl = i.Images
                                    .Where(img => img.IsMain)
                                    .Select(img => img.FilePath)
                                    .FirstOrDefault()
                                ?? "/assets/img/home1/upcoming-auction-img1.jpg",
                    CurrentBid = 0,
                    BidEndDate = i.BidEndDate,
                    BidStatus = i.BidStatus,
                    ArtistName = i.Artist.Name
                })
                .ToListAsync();

            var vm = new HomeIndexVm
            {
                StreamingAuctions = streaming,
                GeneralArtworks = general,
                UpcomingAuctions = upcoming
            };

            return View(vm);
        }

        // ============================   ArtistsPortfolio ================================================
        public IActionResult ArtistsPortfolio()
        {
            return View();
        }


        [HttpGet]
        public async Task<IActionResult> AuctionGrid(
    [FromQuery(Name = "status")] List<string> statusFilters,
    [FromQuery(Name = "category")] List<int> categoryFilters,
    [FromQuery] int page = 1)
        {
            const int pageSize = 9;
            // Nếu null thì khởi tạo thành list rỗng
            statusFilters ??= new List<string>();
            categoryFilters ??= new List<int>();

            // Xây query
            var query = _context.Items
                .Include(i => i.Artist)
                .Include(i => i.Images)
                .AsQueryable();

            if (statusFilters.Any())
                query = query.Where(i => statusFilters.Contains(i.BidStatus));
            if (categoryFilters.Any())
                query = query.Where(i => categoryFilters.Contains(i.CategoryId));

            var totalCount = await query.CountAsync();

            var items = await query
                .OrderByDescending(i => i.CreatedAt)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .Select(i => new AuctionCardVm
                {
                    ItemId = i.ItemId,
                    Title = i.Title,
                    ImageUrl = i.Images.FirstOrDefault(img => img.IsMain)!.FilePath,
                    MinimumBid = i.MinimumBid,
                    CurrentBid = _context.Bids.Where(b => b.ItemId == i.ItemId)
                                                .Max(b => (decimal?)b.BidAmount) ?? i.MinimumBid,
                    BidIncrement = i.BidIncrement,
                    BidEndDate = i.BidEndDate,
                    BidStatus = i.BidStatus,
                    ArtistName = i.Artist.Name,
                    SellerId = i.SellerId,
                })
                .ToListAsync();

            var pageCount = (int)Math.Ceiling(totalCount / (double)pageSize);

            // Đẩy thẳng xuống ViewBag, đảm bảo không bao giờ null
            ViewBag.CurrentPage = page;
            ViewBag.PageCount = pageCount;
            ViewBag.StatusFilters = statusFilters;
            ViewBag.CategoryFilters = categoryFilters;

            // Nếu cần dùng danh sách category để hiển filter checkbox
            ViewBag.AllCategories = await _context.Categories.ToListAsync();

            return View(items);
        }

        [HttpGet]
        public async Task<IActionResult> GeneralArtGrid()
        {
            var items = await _context.Items
                .Where(i => i.Images.Any(img => img.FilePath.Contains("/assets/img/home1/general-art-img")))
                .Include(i => i.Images)
                .Include(i => i.Artist)
                .Select(i => new AuctionCardVm
                {
                    ItemId = i.ItemId,
                    Title = i.Title,
                    ImageUrl = i.Images
                                    .Where(img => img.FilePath.Contains("/assets/img/home1/general-art-img"))
                                    .Select(img => img.FilePath)
                                    .FirstOrDefault()
                                ?? "/assets/img/home1/general-art-img1.jpg",
                    CurrentBid = i.MinimumBid,
                    BidEndDate = i.BidEndDate,
                    BidStatus = i.BidStatus,
                    ArtistName = i.Artist.Name
                })
                .ToListAsync();

            return View(items);
        }

        [HttpGet]
        public async Task<IActionResult> UpcomingArtGrid()
        {
            var items = await _context.Items
                .Where(i => i.BidStatus == "Upcoming"
                         && i.Images.Any(img => img.FilePath.Contains("/assets/img/home1/upcoming-auction-img")))
                .Include(i => i.Images)
                .Include(i => i.Artist)
                .Select(i => new AuctionCardVm
                {
                    ItemId = i.ItemId,
                    Title = i.Title,
                    ImageUrl = i.Images
                                    .Where(img => img.FilePath.Contains("/assets/img/home1/upcoming-auction-img"))
                                    .Select(img => img.FilePath)
                                    .FirstOrDefault()
                                ?? "/assets/img/home1/upcoming-auction-img1.jpg",
                    CurrentBid = _context.Bids
                                    .Where(b => b.ItemId == i.ItemId)
                                    .Max(b => (decimal?)b.BidAmount)
                                ?? i.MinimumBid,
                    BidEndDate = i.BidEndDate,
                    BidStatus = i.BidStatus,
                    ArtistName = i.Artist.Name
                })
                .ToListAsync();

            return View(items);
        }

        //Hiển thị trang Contact
        public IActionResult Contact()
        {
            return View();
        }
        // Hiển thị trang About Us
        public IActionResult AboutUs()
        {
            return View();
        }

        // Hiển thị trang How to Bid
        [HttpGet]
        public IActionResult HowToBid()
        {
            return View();
        }

        //Hiển thị trang How to Sell
        [HttpGet]
        public IActionResult HowToSell()
        {
            return View();
        }
        //Hiển thị trang ArticleGrid
        [HttpGet]
        public async Task<IActionResult> ArticleGrid()
        {
            return View();
        }

        // Hiển thị trang FAQ
        [HttpGet]
        public IActionResult Faq()
        {
            return View();
        }

        //Hiển thị trang ArtistGrid
        [HttpGet]
        public IActionResult ArtistsGrid()
        {
            return View();
        }

        //Hiển thị trang Privacy
        [HttpGet]
        public IActionResult PrivacyPolicy()
        {
            return View();
        }

        //Hiển thị trang Terms
        [HttpGet]
        public IActionResult TermsCondition()
        {
            return View();
        }


        // GET: /Home/Details/5
        [HttpGet]
        public async Task<IActionResult> Details(int id)
        {
            var item = await _context.Items
                .Include(i => i.Images)
                .Include(i => i.Seller)
                .Include(i => i.Artist)
                .Include(i => i.Category)
                .Include(i => i.Bids)
                .FirstOrDefaultAsync(i => i.ItemId == id);

            if (item == null) return NotFound();

            // Tính giá hiện tại: max(BidAmount) hoặc MinimumBid
            var currentBid = await _context.Bids
                .Where(b => b.ItemId == id)
                .MaxAsync(b => (decimal?)b.BidAmount)
                ?? item.MinimumBid;

            var vm = new AuctionDetailsVm
            {
                ItemId = item.ItemId,
                Title = item.Title,
                Description = item.Description,
                ArtistName = item.Artist.Name,
                CategoryName = item.Category.CategoryName,
                MinimumBid = item.MinimumBid,
                CurrentBid = currentBid,
                BidIncrement = item.BidIncrement,
                BidEndDate = item.BidEndDate,
                SellerId = item.SellerId,
                SellerName = item.Seller.Username,
                Images = item.Images.OrderBy(img => img.IsMain ? 0 : 1).ToList(),
                ThumbnailUrls = item.Images.Select(img => img.FilePath).ToList(),
                NewBidAmount = currentBid + item.BidIncrement
            };

            return View(vm);
        }

        [HttpPost]
        [Authorize]
        public async Task<IActionResult> PlaceBid(int itemId, decimal bidAmount)
        {
            var userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);
            var item = await _context.Items.FindAsync(itemId);
            if (item == null)
                return NotFound();

            // Không cho seller tự đặt giá
            if (item.SellerId == userId)
            {
                TempData["Error"] = "You cannot set the price for your own product.";
                return RedirectToAction("Details", new { id = itemId });
            }

            // Lấy giá hiện tại
            var currentBid = await _context.Bids
                .Where(b => b.ItemId == itemId)
                .MaxAsync(b => (decimal?)b.BidAmount)
                ?? item.MinimumBid;

            var minAllowed = currentBid + item.BidIncrement;
            if (bidAmount < minAllowed)
            {
                TempData["Error"] = $"Bids must be at least {minAllowed:C}.";
                return RedirectToAction("Details", new { id = itemId });
            }

            // Thêm vào lịch sử Bids
            _context.Bids.Add(new Bid
            {
                ItemId = itemId,
                UserId = userId,
                BidAmount = bidAmount,
                BidTime = DateTime.UtcNow
            });
            await _context.SaveChangesAsync();

            TempData["Success"] = $"You have successfully placed a bid: {bidAmount.ToString("C", CultureInfo.GetCultureInfo("en-US"))}";

            // Chuyển hướng về trang Dashboard/BiddingItems để user nhìn thấy lượt đặt mới
            return RedirectToAction("BiddingItems", "Dashboard");
        }

        // GET: /Home/BidHistory/5
        [HttpGet]
        public async Task<IActionResult> BidHistory(int id)
        {
            // kiểm tra item tồn tại
            var item = await _context.Items.FindAsync(id);
            if (item == null) return NotFound();

            var history = await _context.Bids
                .Where(b => b.ItemId == id)
                .Include(b => b.Bidder)
                .OrderByDescending(b => b.BidTime)
                .Select(b => new BidHistoryVm
                {
                    BidderName = b.Bidder.Username,
                    BidAmount = b.BidAmount,
                    BidTime = b.BidTime
                })
                .ToListAsync();

            ViewBag.ItemTitle = item.Title;
            ViewBag.ItemId = id;
            return View(history);
        }


    }


}
