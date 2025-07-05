// File: ViewModels/EditItemViewModel.cs
using System;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace OnlineAuctionSystem.ViewModels
{
    public class EditItemViewModel
    {
        public int ItemId { get; set; }

        [Required]
        [Display(Name = "Title")]
        public string Title { get; set; } = "";

        [Required]
        [Display(Name = "Description")]
        public string Description { get; set; } = "";

        [Required]
        [Display(Name = "Category")]
        public int CategoryId { get; set; }
        public SelectList? Categories { get; set; }

        [Display(Name = "Author available")]
        public int ArtistId { get; set; }
        public SelectList? ArtistList { get; set; }

        [Display(Name = "Or enter new author")]
        public string? NewArtistName { get; set; }

        [Required]
        [Range(0.01, double.MaxValue)]
        [Display(Name = "Starting price")]
        public decimal StartingBid { get; set; }

        [Required]
        [Range(0.01, double.MaxValue)]
        [Display(Name = "Price step")]
        public decimal BidIncrement { get; set; }

        [Required]
        [Display(Name = "End date")]
        public DateTime EndDate { get; set; }
    }
}
