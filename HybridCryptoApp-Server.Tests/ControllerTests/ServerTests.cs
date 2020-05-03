using NUnit.Framework;
using System;
using System.IO;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.TestHost;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using HybridCryptoApp_Server.Data;
using HybridCryptoApp_Server.Data.Models;
using Newtonsoft.Json;
using HybridCryptoApp_Server.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;

namespace HybridCryptoApp_Server.Tests.ControllerTests
{
    public class ServerTests : IDisposable
    {
        public Random Random { get; private set; }

        public TestServer Server { get; private set; }

        public HttpClient Client { get; private set; }

        public HybridCryptoAppContext Context { get; private set; }

        [SetUp]
        public void ServerSetUp()
        {
            string mainDirectory = Directory.GetCurrentDirectory();

            Server = new TestServer(new WebHostBuilder()
                .UseStartup<Startup>()
                .UseContentRoot(mainDirectory)
                .UseEnvironment("Development")
                .UseConfiguration(new ConfigurationBuilder()
                    .SetBasePath(mainDirectory)
                    .AddJsonFile("appsettings.json")
                    .AddJsonFile("appsettings.development.json")
                    .Build())
            );

            Client = Server.CreateClient();

            Context = (HybridCryptoAppContext)Server.Host.Services.GetService(typeof(HybridCryptoAppContext));

            Random = new Random();
        }

        [TearDown]
        public void ServerTearDown()
        {
            Context?.Database?.EnsureDeleted();

            Dispose();
        }

        /// <inheritdoc />
        public void Dispose()
        {
            Context?.Database?.EnsureDeleted();
            Context?.Dispose();

            Server?.Dispose();
            Client?.Dispose();
        }

        public static StringContent Stringify(object obj)
        {
            return new StringContent(JsonConvert.SerializeObject(obj), Encoding.UTF8, "application/json");
        }

        public async Task<string> LoginAsNewUser()
        {
            byte[] buffer = new byte[16];
            Random.NextBytes(buffer);
            string randomMailPart = Encoding.UTF8.GetString(buffer);

            RegistrationModel registration = new RegistrationModel
            {
                Email = $"mailPerson{randomMailPart}@mails.com",
                Password = "V3ryS3cur3P455w0rd!!",
            };
            LoginModel login = new LoginModel
            {
                Email = registration.Email,
                Password = registration.Password
            };

            await Client.PostAsync("/api/Authentication/register", Stringify(registration));
            var result = await Client.PostAsync("/api/Authentication/token", Stringify(login));
            string content = await result.Content.ReadAsStringAsync();
            string token = JsonConvert.DeserializeObject<LoginResponseModel>(content).Token;

            Client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);

            return registration.Email;
        }

        public async Task LoginAsExistingUser(string email, string password)
        {
            LoginModel login = new LoginModel
            {
                Email = email,
                Password = password
            };

            var result = await Client.PostAsync("/api/Authentication/token", Stringify(login));
            string content = await result.Content.ReadAsStringAsync();
            string token = JsonConvert.DeserializeObject<LoginResponseModel>(content).Token;

            Client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
        }

        protected async Task EnsureRoleExists(string roleName)
        {
            RoleManager<Role> roleManager = Server.Host.Services.GetService<RoleManager<Role>>();

            if (await roleManager.RoleExistsAsync(roleName))
            {
                return; // als role bestaat dan doen we niets anders maken we het aan
            }

            await roleManager.CreateAsync(new Role
            {
                Name = roleName,
                NormalizedName = roleName.ToUpper()
            });
        }
    }
}
