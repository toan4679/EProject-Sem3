namespace OnlineAuctionSystem.Models
{
    public class ItemImage
    {
        public int ImageId { get; set; }
        public int ItemId { get; set; }
        public string FilePath { get; set; } = null!;
        public bool IsMain { get; set; }

        public virtual Item Item { get; set; } = null!;
    }
}