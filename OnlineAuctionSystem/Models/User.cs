using System.Collections.Generic;

namespace OnlineAuctionSystem.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string Username { get; set; } = null!;
        public string PasswordHash { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string Role { get; set; } = null!;    // Seller, Buyer, Admin
        public string Status { get; set; } = null!;  // Active, Inactive

        public virtual ICollection<Item> SellingItems { get; set; } = new List<Item>();
        public virtual ICollection<Bid> Bids { get; set; } = new List<Bid>();
        public virtual ICollection<Notification> Notifications { get; set; } = new List<Notification>();
        public virtual ICollection<Rating> Ratings { get; set; } = new List<Rating>();  // ratings given
    }
}
