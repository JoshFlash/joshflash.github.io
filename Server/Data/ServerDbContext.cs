using Microsoft.EntityFrameworkCore;

namespace Server.Data
{
    public class ServerDbContext : DbContext
    {
        public ServerDbContext(DbContextOptions<ServerDbContext> options) : base(options) { }

        public DbSet<PortfolioPost>? PortfolioPosts { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            var seededPosts = new PortfolioPost[3];

            for (int i = 0; i < seededPosts.Length; i++)
            {
                seededPosts[i] = new PortfolioPost
                {
                    ID = i,
                    ThumbnailImagePath = "uploads/gamepad-01.jpg",
                    Title = $"Post Title {i}",
                    Description = $"Lorem ipsum {i}"
                };
            }

            modelBuilder.Entity<PortfolioPost>().HasData(seededPosts);
        }
    }
}