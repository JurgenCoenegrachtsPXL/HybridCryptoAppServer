using System;
using System.Text;
using HybridCryptoApp_Server.Data;
using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using NUnit.Framework;

namespace HybridCryptoApp_Server.Tests.RepositoryTests
{
    public class DatabaseTests
    {
        private SqliteConnection connection;
        private string migrationError = "";

        protected Random Random = new Random();
        protected HybridCryptoAppContext Context;

        [SetUp]
        public void BaseSetUp()
        {
            CreateDatabase();
            Context = CreateDbContext();
        }

        [TearDown]
        public void TearDown()
        {
            Context.Database.EnsureDeleted();
            Context?.Dispose();
        }

        /// <summary>
        /// Create in memory sqlite database
        /// </summary>
        [OneTimeSetUp]
        public void CreateDatabase()
        {
            connection?.Dispose();
            connection = new SqliteConnection("DataSource=:memory:");
            connection.Open();

            using (var context = CreateDbContext(false))
            {
                //Check if migration succeeds on sqlite
                try
                {
                    //context.Database.Migrate(); // <- EF doesn't like this
                }
                catch (Exception e)
                {
                    var messageBuilder = new StringBuilder();
                    messageBuilder.AppendLine("The migration (creation) of the database is not configured properly.");
                    messageBuilder.AppendLine();
                    messageBuilder.AppendLine(e.Message);
                    migrationError = messageBuilder.ToString();
                }
            }
        }

        public void Dispose()
        {
            connection?.Dispose();
        }

        protected HybridCryptoAppContext CreateDbContext(bool assertMigration = true)
        {
            if (assertMigration)
            {
                AssertMigratedSuccessfully();
            }

            //var options = new DbContextOptionsBuilder<HybridCryptoAppContext>().UseSqlite(connection).Options;
            var options = new DbContextOptionsBuilder<HybridCryptoAppContext>().UseInMemoryDatabase("HybridCryptoDB").Options;

            return new HybridCryptoAppContext(options);
        }

        private void AssertMigratedSuccessfully()
        {
            if (!string.IsNullOrEmpty(migrationError))
            {
                Assert.Fail(migrationError);
            }
        }
    }
}