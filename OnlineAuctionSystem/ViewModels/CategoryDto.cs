namespace OnlineAuctionSystem.ViewModels
{
    public class CategoryDto
    {
        public int CategoryId { get; set; }
        public string Name { get; set; } = null!;
        public string? ParentName { get; set; }
    }
}
