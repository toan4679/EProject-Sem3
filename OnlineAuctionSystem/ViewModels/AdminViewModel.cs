namespace OnlineAuctionSystem.ViewModels
{
    public class CategoryAdminViewModel
    {
        public int    CategoryId { get; set; }
        public string Name       { get; set; } = null!;
        public string ParentName { get; set; } = "-";
    }

    public class UserAdminViewModel
    {
        public int    UserId   { get; set; }
        public string Username { get; set; } = null!;
        public string Email    { get; set; } = null!;
        public string Status   { get; set; } = null!;
    }

    public class AdminViewModel
    {
        public List<CategoryAdminViewModel> Categories { get; set; } = new();
        public List<UserAdminViewModel> Users { get; set; } = new();

        public NotificationViewModel? Notification { get; set; }
        
        public string? SuccessMessage { get; set; }
        public string? ErrorMessage   { get; set; }
    }
}
