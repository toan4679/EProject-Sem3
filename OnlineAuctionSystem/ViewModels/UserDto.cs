namespace OnlineAuctionSystem.ViewModels
{
    public class UserDto
    {
        public int UserId { get; set; }
        public string Username { get; set; } = null!;
        public string Email { get; set; } = null!;
        public string Status { get; set; } = null!;  
    }
}
