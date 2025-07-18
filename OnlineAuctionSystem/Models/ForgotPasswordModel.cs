using System.ComponentModel.DataAnnotations;

namespace OnlineAuctionSystem.Models
{
    public class ForgotPasswordModel
    {
        [Required, EmailAddress]
        public string Email { get; set; } = string.Empty;
    }
}
