namespace OnlineAuctionSystem.ViewModels
{
    public class BiddingItemVm
    {
        public int BidId { get; set; }
        public int ItemId { get; set; }         
        public string ImageUrl { get; set; } = "";
        public string Title { get; set; } = "";
        public decimal Amount { get; set; }
        public string Status { get; set; } = "";
    }
}
