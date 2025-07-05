using System;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using OnlineAuctionSystem.Data;
using OnlineAuctionSystem.Models;
using OnlineAuctionSystem.ViewModels;

namespace OnlineAuctionSystem.Controllers
{
    [Authorize]
    public class ItemsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment _env;

        public ItemsController(ApplicationDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        // GET: /Items/Sell
        public IActionResult Sell()
        {
            var vm = new SellItemViewModel
            {
                Categories = new SelectList(_context.Categories, "CategoryId", "CategoryName"),
                ArtistList = new SelectList(_context.Artists, "ArtistId", "Name"),
                EndDate = DateTime.Now.AddDays(7)
            };
            return View(vm);
        }

        // POST: /Items/Sell
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Sell(SellItemViewModel vm)
        {
            vm.Categories = new SelectList(_context.Categories, "CategoryId", "CategoryName");
            vm.ArtistList = new SelectList(_context.Artists, "ArtistId", "Name");

            if (!ModelState.IsValid)
                return View(vm);

            if (!string.IsNullOrWhiteSpace(vm.NewArtistName))
            {
                var newArtist = new Artist { Name = vm.NewArtistName.Trim() };
                _context.Artists.Add(newArtist);
                await _context.SaveChangesAsync();
                vm.ArtistId = newArtist.ArtistId;
            }

            string imagePath = null;
            if (vm.ImageFile != null)
            {
                var fileName = Path.GetFileName(vm.ImageFile.FileName);
                var uploads = Path.Combine(_env.WebRootPath, "uploads");
                Directory.CreateDirectory(uploads);
                var full = Path.Combine(uploads, fileName);
                using var fs = new FileStream(full, FileMode.Create);
                await vm.ImageFile.CopyToAsync(fs);
                imagePath = "/uploads/" + fileName;
            }

            string docPath = null;
            if (vm.DocumentFile != null)
            {
                var fileName = Path.GetFileName(vm.DocumentFile.FileName);
                var docs = Path.Combine(_env.WebRootPath, "docs");
                Directory.CreateDirectory(docs);
                var full = Path.Combine(docs, fileName);
                using var fs = new FileStream(full, FileMode.Create);
                await vm.DocumentFile.CopyToAsync(fs);
                docPath = "/docs/" + fileName;
            }

            var userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));
            var item = new Item
            {
                Title = vm.Title,
                Description = vm.Description,
                ArtistId = vm.ArtistId,
                CategoryId = vm.CategoryId,
                SellerId = userId,
                MinimumBid = vm.StartingBid,
                BidIncrement = vm.BidIncrement,
                BidStartDate = DateTime.UtcNow,
                BidEndDate = vm.EndDate,
                BidStatus = "Live",
                CreatedAt = DateTime.UtcNow,
                DocumentPath = docPath
            };
            _context.Items.Add(item);
            await _context.SaveChangesAsync();

            if (imagePath != null)
            {
                _context.ItemImages.Add(new ItemImage
                {
                    ItemId = item.ItemId,
                    FilePath = imagePath,
                    IsMain = true
                });
                await _context.SaveChangesAsync();
            }

            TempData["Success"] = "Your item has been listed!";
            return RedirectToAction("ListedItems", "Dashboard");
        }

        // GET: /Items
        public IActionResult Index()
        {
            var userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));
            var items = _context.Items
                .Include(i => i.Category)
                .Include(i => i.Artist)
                .Where(i => i.SellerId == userId)
                .OrderByDescending(i => i.CreatedAt)
                .ToList();
            return View(items);
        }

        // GET: /Items/Edit/5
        public async Task<IActionResult> Edit(int id)
        {
            var item = await _context.Items.FindAsync(id);
            var userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));
            if (item == null || item.SellerId != userId) return NotFound();

            var vm = new EditItemViewModel
            {
                ItemId = item.ItemId,
                Title = item.Title,
                Description = item.Description,
                CategoryId = item.CategoryId,
                ArtistId = item.ArtistId,
                StartingBid = item.MinimumBid,
                BidIncrement = item.BidIncrement,
                EndDate = item.BidEndDate,
                Categories = new SelectList(_context.Categories, "CategoryId", "CategoryName", item.CategoryId),
                ArtistList = new SelectList(_context.Artists, "ArtistId", "Name", item.ArtistId)
            };
            return View(vm);
        }

        // POST: /Items/Edit/5
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(EditItemViewModel vm)
        {
            vm.Categories = new SelectList(_context.Categories, "CategoryId", "CategoryName", vm.CategoryId);
            vm.ArtistList = new SelectList(_context.Artists, "ArtistId", "Name", vm.ArtistId);

            if (!ModelState.IsValid) return View(vm);

            var item = await _context.Items.FindAsync(vm.ItemId);
            var userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));
            if (item == null || item.SellerId != userId) return NotFound();

            item.Title = vm.Title;
            item.Description = vm.Description;
            item.CategoryId = vm.CategoryId;
            item.ArtistId = vm.ArtistId;
            item.MinimumBid = vm.StartingBid;
            item.BidIncrement = vm.BidIncrement;
            item.BidEndDate = vm.EndDate;

            await _context.SaveChangesAsync();
            TempData["Success"] = "Item updated successfully.";
            return RedirectToAction("ListedItems", "Dashboard");

        }

        // POST: /Items/Delete/5
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var item = await _context.Items.FindAsync(id);
            var userId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));
            if (item == null || item.SellerId != userId) return NotFound();

            _context.Items.Remove(item);
            await _context.SaveChangesAsync();
            TempData["Success"] = "Item deleted.";
            return RedirectToAction("ListedItems", "Dashboard");

        }
    }
}
