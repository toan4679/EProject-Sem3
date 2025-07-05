using System;
using System.Collections.Generic;

namespace OnlineAuctionSystem.Models
{
    public class Artist
    {
        public int ArtistId { get; set; }
        public string Name { get; set; } = null!;
        public string? Country { get; set; }
        public int? BirthYear { get; set; }
        public int? DeathYear { get; set; }
        public string? Portrait { get; set; }  // /assets/img/home1/artist-imgX.png

        public virtual ICollection<Item> Items { get; set; } = new List<Item>();
    }
}