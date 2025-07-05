namespace OnlineAuctionSystem.Models
{
    public class Rating
    {
        public int RatingId { get; set; }
        public int ItemId { get; set; }
        public int RatedBy { get; set; }
        public int Score { get; set; }
        public string? Comment { get; set; }

        public virtual Item Item { get; set; } = null!;
        public virtual User Rater { get; set; } = null!;
    }
}