using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using OnlineAuctionSystem.Models;

namespace OnlineAuctionSystem.ViewModels

{

    public class BidHistoryVm
    {
        public decimal Amount { get; set; }
        public string BidderName { get; set; } = "";
        public DateTime Time { get; set; }
        public decimal BidAmount { get; set; }
        public DateTime BidTime   { get; set; }
    }
    public class AuctionDetailsVm
    {
        // Thông tin item
        public int ItemId { get; set; }
        public string Title { get; set; } = "";
        public string? Description { get; set; }
        public decimal MinimumBid { get; set; }
        public decimal CurrentBid { get; set; }
        public decimal BidIncrement { get; set; }
        public DateTime BidEndDate { get; set; }

        public string CategoryName { get; set; } = "";

        public string ArtistName { get; set; } = "";



        // Seller
        public int SellerId { get; set; }
        public string SellerName { get; set; } = "";

        // Hình ảnh
        public List<ItemImage> Images { get; set; } = new();
        public List<string> ThumbnailUrls { get; set; } = new();

        public string? DocumentPath { get; set; }

        public List<SimilarAuctionCardVm> SimilarAuctions { get; set; } = new();

        // Cho form PlaceBid
        [Display(Name = "Your Bid")]
        [Required, Range(0.01, double.MaxValue, ErrorMessage = "Giá thầu phải lớn hơn 0")]
        public decimal NewBidAmount { get; set; }
    }
}
