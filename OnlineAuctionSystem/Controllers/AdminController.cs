using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineAuctionSystem.Data;
using OnlineAuctionSystem.Models;
using OnlineAuctionSystem.ViewModels;

namespace OnlineAuctionSystem.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private readonly ApplicationDbContext _context;

        public AdminController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: /Admin
        public async Task<IActionResult> Index()
        {
            var categories = await _context.Categories
                .Select(c => new CategoryAdminViewModel
                {
                    CategoryId = c.CategoryId,
                    Name = c.CategoryName
                })
                .ToListAsync();

            var users = await _context.Users
                .Select(u => new UserAdminViewModel
                {
                    UserId = u.UserId,
                    Username = u.Username,
                    Email = u.Email,
                    Status = u.Status
                })
                .ToListAsync();

            TempData.TryGetValue("Success", out var s);
            TempData.TryGetValue("Error", out var e);

            var vm = new AdminViewModel
            {
                Categories = categories,
                Users = users,
                SuccessMessage = s as string,
                ErrorMessage = e as string
            };
            return View(vm);
        }

        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateCategory(string Name)
        {
            if (string.IsNullOrWhiteSpace(Name))
            {
                TempData["Notif.Type"] = "danger";
                TempData["Notif.Message"] = "Category name cannot be blank.";
                return RedirectToAction(nameof(Index));
            }

            _context.Categories.Add(new Category { CategoryName = Name });
            await _context.SaveChangesAsync();

            TempData["Notif.Type"] = "success";
            TempData["Notif.Message"] = $"Added category \"<strong>{Name}</strong>\".";
            return RedirectToAction(nameof(Index));
        }

        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> EditCategory(int categoryId, string name)
        {
            var cat = await _context.Categories.FindAsync(categoryId);
            if (cat == null)
            {
                TempData["Notif.Type"] = "danger";
                TempData["Notif.Message"] = "Category does not exist.";
            }
            else
            {
                cat.CategoryName = name;
                await _context.SaveChangesAsync();
                TempData["Notif.Type"] = "warning";
                TempData["Notif.Message"] = $"Changed name to \"<strong>{name}</strong>\".";
            }
            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> DeleteCategory(int id)
        {
            var cat = await _context.Categories.FindAsync(id);
            if (cat == null)
            {
                TempData["Notif.Type"] = "danger";
                TempData["Notif.Message"] = "Category not found.";
            }
            else
            {
                _context.Categories.Remove(cat);
                await _context.SaveChangesAsync();
                TempData["Notif.Type"] = "danger";
                TempData["Notif.Message"] = $"Category \"<strong>{cat.CategoryName}</strong>\" has been removed.";
            }
            return RedirectToAction(nameof(Index));
        }

        // POST: /Admin/BlockUser/5
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> BlockUser(int id)
        {
            var u = await _context.Users.FindAsync(id);
            if (u != null)
            {
                u.Status = "Inactive";
                await _context.SaveChangesAsync();

                TempData["Notif.Type"] = "danger";
                TempData["Notif.Message"] = $"User <strong>{u.Username}</strong> has been blocked.";
            }
            return RedirectToAction(nameof(Index));
        }

        // POST: /Admin/UnblockUser/5
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> UnblockUser(int id)
        {
            var u = await _context.Users.FindAsync(id);
            if (u != null)
            {
                u.Status = "Active";
                await _context.SaveChangesAsync();

                TempData["Notif.Type"] = "success";
                TempData["Notif.Message"] = $"User <strong>{u.Username}</strong> has been unlocked.";
            }
            return RedirectToAction(nameof(Index));
        }
    }
}
