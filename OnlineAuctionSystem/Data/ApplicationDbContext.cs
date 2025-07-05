using Microsoft.EntityFrameworkCore;
using OnlineAuctionSystem.Models;

namespace OnlineAuctionSystem.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Artist> Artists { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Item> Items { get; set; }
        public DbSet<ItemImage> ItemImages { get; set; }
        public DbSet<Bid> Bids { get; set; }
        public DbSet<Notification> Notifications { get; set; }
        public DbSet<Rating> Ratings { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Define primary key for ItemImage
            modelBuilder.Entity<ItemImage>()
                .HasKey(ii => ii.ImageId);

            // Item - Artist
            modelBuilder.Entity<Item>()
                .HasOne(i => i.Artist)
                .WithMany(a => a.Items)
                .HasForeignKey(i => i.ArtistId)
                .OnDelete(DeleteBehavior.Restrict);

            // Item - Category
            modelBuilder.Entity<Item>()
                .HasOne(i => i.Category)
                .WithMany(c => c.Items)
                .HasForeignKey(i => i.CategoryId)
                .OnDelete(DeleteBehavior.Restrict);

            // Item - Seller (User)
            modelBuilder.Entity<Item>()
                .HasOne(i => i.Seller)
                .WithMany(u => u.SellingItems)
                .HasForeignKey(i => i.SellerId)
                .OnDelete(DeleteBehavior.Restrict);

            // ItemImage - Item
            modelBuilder.Entity<ItemImage>()
                .HasOne(img => img.Item)
                .WithMany(i => i.Images)
                .HasForeignKey(img => img.ItemId)
                .OnDelete(DeleteBehavior.Cascade);

            // Bid - Item
            modelBuilder.Entity<Bid>()
                .HasOne(b => b.Item)
                .WithMany(i => i.Bids)
                .HasForeignKey(b => b.ItemId)
                .OnDelete(DeleteBehavior.Cascade);

            // Bid - Bidder (User)
            modelBuilder.Entity<Bid>()
                .HasOne(b => b.Bidder)
                .WithMany(u => u.Bids)
                .HasForeignKey(b => b.UserId)
                .OnDelete(DeleteBehavior.Restrict);

            // Notification - User
            modelBuilder.Entity<Notification>()
                .HasOne(n => n.User)
                .WithMany(u => u.Notifications)
                .HasForeignKey(n => n.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            // Rating - Item
            modelBuilder.Entity<Rating>()
                .HasOne(r => r.Item)
                .WithMany(i => i.Ratings)
                .HasForeignKey(r => r.ItemId)
                .OnDelete(DeleteBehavior.Cascade);

            // Rating - Rater (User)
            modelBuilder.Entity<Rating>()
                .HasOne(r => r.Rater)
                .WithMany(u => u.Ratings)
                .HasForeignKey(r => r.RatedBy)
                .OnDelete(DeleteBehavior.Restrict);
        }


    }
}
