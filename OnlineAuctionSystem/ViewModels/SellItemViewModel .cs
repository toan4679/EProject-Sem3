using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace OnlineAuctionSystem.ViewModels
{
    public class SellItemViewModel : IValidatableObject
    {
        [Required, MaxLength(200)]
        public string Title { get; set; } = null!;

        public string? Description { get; set; }

        [Required]
        [Display(Name = "Category")]
        public int CategoryId { get; set; }

        public IEnumerable<SelectListItem> Categories { get; set; } = new List<SelectListItem>();

        [Display(Name = "Existing Author")]
        public int ArtistId { get; set; }

        public IEnumerable<SelectListItem> ArtistList { get; set; } = new List<SelectListItem>();

        [Display(Name = "Or Enter New Author")]
        // bỏ [Required]
        public string? NewArtistName { get; set; }

        [Required]
        [Display(Name = "Artwork Image")]
        public IFormFile ImageFile { get; set; } = null!;

        public IFormFile? DocumentFile { get; set; }

        [Required]
        [Range(0.01, double.MaxValue)]
        [Display(Name = "Starting Bid")]
        public decimal StartingBid { get; set; }

        [Required]
        [Range(0.01, double.MaxValue)]
        [Display(Name = "Bid Increment")]
        public decimal BidIncrement { get; set; }

        [Required]
        [Display(Name = "Auction End Date")]
        public DateTime EndDate { get; set; }

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            if (ArtistId == 0 && String.IsNullOrWhiteSpace(NewArtistName))
            {
                yield return new ValidationResult(
                    "You must select an existing author or enter a new author name.",
                    new[] { nameof(NewArtistName) }
                );
            }
        }
    }
}
