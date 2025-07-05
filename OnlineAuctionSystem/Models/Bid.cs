// Models/Bid.cs
using System;

namespace OnlineAuctionSystem.Models
{
    public class Bid
    {
        public int BidId { get; set; }
        public int ItemId { get; set; }
        public int UserId { get; set; }
        public decimal BidAmount { get; set; }
        public DateTime BidTime { get; set; }

        public virtual Item Item { get; set; } = null!;
        public virtual User Bidder { get; set; } = null!;
    }
}