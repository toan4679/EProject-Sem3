public class ListedItemVm
{
    public int ItemId { get; set; }
    public string ImageUrl { get; set; } = "";
    public string Title { get; set; } = "";
    public decimal CurrentBid { get; set; }
    public string Status { get; set; } = "";
    public string CertificateUrl { get; set; } = "";
}