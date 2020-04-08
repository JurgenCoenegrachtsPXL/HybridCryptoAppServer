using HybridCryptoApp_Server.Data.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace HybridCryptoApp_Server.Data
{
    public class HybridCryptoAppContext : IdentityDbContext<User, Role, int>
    {
        public DbSet<UserContact> UserContacts { get; set; }
        public DbSet<EncryptedPacket> EncryptedPackets { get; set; }

        public HybridCryptoAppContext()
        {
        }

        public HybridCryptoAppContext(DbContextOptions options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<UserContact>().HasKey(u => new { u.OwnerId, u.ContactId});
            modelBuilder.Entity<UserContact>().HasOne(u => u.Contact);
            modelBuilder.Entity<UserContact>().HasOne(u => u.Owner);

            modelBuilder.Entity<User>().HasMany(u => u.ContactList).WithOne(u => u.Owner).OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<EncryptedPacket>().HasOne(e => e.Sender);
            modelBuilder.Entity<EncryptedPacket>().HasOne(e => e.Receiver);
        }

        public void CreateOrUpdateDatabase()
        {
            Database.Migrate();
        }
    }
}