using System.ComponentModel.DataAnnotations;

namespace OnlineAuctionSystem.Models;

public class RegisterViewModel
{
    [Required] public string FullName { get; set; }
    [Required, EmailAddress] public string Email { get; set; }
    [Required, DataType(DataType.Password)] public string Password { get; set; }
    [Required, DataType(DataType.Password), Compare("Password")] public string ConfirmPassword { get; set; }
    [Required, Range(typeof(bool), "true", "true", ErrorMessage = "You must accept the terms")] public bool AcceptTerms { get; set; }
}
