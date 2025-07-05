namespace OnlineAuctionSystem.ViewModels
{
    public class HomeIndexVm
    {
        public IEnumerable<AuctionCardVm> StreamingAuctions { get; set; } = new List<AuctionCardVm>();
        public IEnumerable<AuctionCardVm> GeneralArtworks { get; set; } = new List<AuctionCardVm>();
        public IEnumerable<AuctionCardVm> UpcomingAuctions { get; set; } = new List<AuctionCardVm>();
        
        public DateTime BidEndDate { get; set; }
    }
}
