using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OnlineAuctionSystem.Models
{
    [Table("Items")]
    public class Item
    {
        [Key]
        public int ItemId { get; set; }

        [Required, MaxLength(200)]
        public string Title { get; set; } = null!;

        public string? Description { get; set; }

        public int ArtistId { get; set; }
        public virtual Artist Artist { get; set; } = null!;

        public int CategoryId { get; set; }
        public virtual Category Category { get; set; } = null!;

        public int SellerId { get; set; }
        public virtual User Seller { get; set; } = null!;

        [Column(TypeName = "decimal(18,2)")]
        public decimal MinimumBid { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal BidIncrement { get; set; }

        public DateTime BidStartDate { get; set; }
        public DateTime BidEndDate { get; set; }

        [Required, MaxLength(50)]
        public string BidStatus { get; set; } = null!; 

        public DateTime CreatedAt { get; set; }

        public string? DocumentPath { get; set; }

        public virtual ICollection<ItemImage> Images { get; set; } = new List<ItemImage>();
        public virtual ICollection<Bid> Bids { get; set; } = new List<Bid>();
        public virtual ICollection<Rating> Ratings { get; set; } = new List<Rating>();
    }
}
