using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace OnlineAuctionSystem.ViewModels
{
    public class CreateItemViewModel
    {
        [Required] 
        public string Title { get; set; }
        
        [Required] 
        public string Description { get; set; }
        
        [Required]
        [Display(Name = "Category")]
        public int CategoryId { get; set; }
        
        [Display(Name = "Item Image")]
        public IFormFile ImageFile { get; set; }
        
        [Display(Name = "Specification Document")]
        public IFormFile DocumentFile { get; set; }
        
        [Required]
        [Display(Name = "Starting Bid")]
        [DataType(DataType.Currency)]
        public decimal StartingBid { get; set; }
        
        [Required]
        [Display(Name = "Bid Increment")]
        [DataType(DataType.Currency)]
        public decimal BidIncrement { get; set; }
        
        [Required]
        [Display(Name = "Auction End Date")]
        [DataType(DataType.DateTime)]
        public DateTime EndDate { get; set; }
        
        public IEnumerable<SelectListItem> Categories { get; set; }
    }
}
