using System;
using System.Collections.Generic;

namespace OnlineAuctionSystem.ViewModels
{
    public class AuctionCardVm
    {
        public int ItemId { get; set; }
        public string Title { get; set; } = string.Empty;
        public string? Description { get; set; }      // Mô tả
        public string ImageUrl { get; set; } = string.Empty;
        public decimal MinimumBid { get; set; }       // Giá thầu tối thiểu
        public decimal CurrentBid { get; set; }       // Giá thầu hiện tại
        public decimal BidIncrement { get; set; }     // Mức tăng thầu
        public DateTime BidEndDate { get; set; }
        public string BidStatus { get; set; } = string.Empty;
        public string ArtistName { get; set; } = string.Empty;

        public int SellerId { get; set; }
        public string SellerName { get; set; } = "";  // Tên người bán

        // Để giữ filter paging
        public List<string> SelectedFilters { get; set; } = new();

        public List<string> SelectedStatuses { get; set; } = new();
        public List<int> SelectedCategories { get; set; } = new();
        public string CategoryName { get; set; } = string.Empty;
    }
}
