using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineAuctionSystem.Data;
using OnlineAuctionSystem.Models;
using OnlineAuctionSystem.ViewModels;

namespace OnlineAuctionSystem.Controllers
{
    public class AccountController : Controller
    {
        private readonly ApplicationDbContext _context;

        public AccountController(ApplicationDbContext context)
        {
            _context = context;
        }



        // GET: /Account/Login
        [HttpGet]
        public IActionResult Login(string returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
            return View(new LoginViewModel());
        }

        // POST: /Account/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginViewModel model, string returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
            if (!ModelState.IsValid)
                return View(model);

            // 1) Tìm user theo email
            var user = await _context.Users
                .SingleOrDefaultAsync(u => u.Email == model.Email);
            if (user == null || !BCrypt.Net.BCrypt.Verify(model.Password, user.PasswordHash))
            {
                ModelState.AddModelError(string.Empty, "Invalid email or password");
                return View(model);
            }

            // 2) Chặn login nếu tài khoản không Active
            if (user.Status != "Active")
            {
                ModelState.AddModelError(string.Empty, "Your account has been blocked. Please contact support.");
                return View(model);
            }

            // 3) Nếu OK thì tạo claims và đăng nhập
            var claims = new List<Claim>
    {
        new Claim(ClaimTypes.NameIdentifier, user.UserId.ToString()),
        new Claim(ClaimTypes.Name, user.Username),
        new Claim(ClaimTypes.Role, user.Role)
    };
            var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var principal = new ClaimsPrincipal(identity);
            await HttpContext.SignInAsync(
                CookieAuthenticationDefaults.AuthenticationScheme,
                principal,
                new AuthenticationProperties { IsPersistent = model.RememberMe }
            );

            // 4) Chuyển hướng
            if (!string.IsNullOrEmpty(returnUrl) && Url.IsLocalUrl(returnUrl))
                return Redirect(returnUrl);

            return RedirectToAction("Index", "Home");
        }

        // POST: /Account/Logout
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index", "Home");
        }

        // /Account/Register
        [HttpGet]
        public IActionResult Register() => View(new RegisterViewModel());

        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(RegisterViewModel vm)
        {
            if (!ModelState.IsValid) return View(vm);

            // Kiểm tra email
            if (await _context.Users.AnyAsync(u => u.Email == vm.Email))
            {
                ModelState.AddModelError(nameof(vm.Email), "Email is already in use");
                return View(vm);
            }

            // Tạo user mới
            var user = new User
            {
                Username = vm.FullName,
                Email = vm.Email,
                PasswordHash = BCrypt.Net.BCrypt.HashPassword(vm.Password),
                Role = "Buyer",
                Status = "Active"
            };
            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            TempData["RegisterSuccess"] = true;
            return RedirectToAction(nameof(Register));
        }

        // GET: /Account/ForgotPassword
        [HttpGet]
        public IActionResult ForgotPassword()
            => View(new ForgotPasswordModel());

        // POST: /Account/ForgotPassword
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> ForgotPassword(ForgotPasswordModel vm)
        {
            if (!ModelState.IsValid)
                return View(vm);

            TempData["PasswordSent"] = true;
            return RedirectToAction(nameof(ForgotPassword));
        }






    }


}
