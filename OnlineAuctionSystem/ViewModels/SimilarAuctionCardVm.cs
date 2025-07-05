namespace OnlineAuctionSystem.ViewModels
{
    public class SimilarAuctionCardVm
    {
        public int ItemId { get; set; }
        public string Title { get; set; } = string.Empty;
        public string ArtistName { get; set; } = string.Empty;
        public decimal CurrentBid { get; set; }
        public DateTime BidEndDate { get; set; }
        public string ImageUrl { get; set; } = string.Empty;
        public string BidStatus { get; set; } = string.Empty; 
    }
}
