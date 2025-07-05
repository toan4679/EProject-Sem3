using OnlineAuctionSystem.ViewModels;
namespace OnlineAuctionSystem.Models
{
    public class ListedItemDto
    {
        public int ItemId { get; set; }
        public string Title { get; set; } = "";
        public string ImageUrl { get; set; } = "";

        public string ArtistName { get; set; } = "";
        public decimal MinimumBid { get; set; }
        public DateTime BidEndDate { get; set; }
    }

    public class Dashboard
    {
        public string WelcomeName { get; set; } = string.Empty;
        public int BidCount { get; set; }
        public int ListedCount { get; set; }

        public List<ListedItemDto> ListedItems { get; set; } = new();

        public List<BiddingItemVm> BiddingItems { get; set; } = new();

    }
}
