namespace OnlineAuctionSystem.Models
{
    public class Document
    {
        public int DocumentId { get; set; }

        public int ItemId { get; set; }
        public Item? Item { get; set; }

        public string FilePath { get; set; } = string.Empty;
        public string? Description { get; set; }
    }
}
