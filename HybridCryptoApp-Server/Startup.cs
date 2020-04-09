using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HybridCryptoApp_Server.Data;
using HybridCryptoApp_Server.Data.Models;
using HybridCryptoApp_Server.Data.Repositories;
using HybridCryptoApp_Server.Data.Repositories.Interfaces;
using HybridCryptoApp_Server.Models;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;

namespace HybridCryptoApp_Server
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //services.AddDbContext<HybridCryptoAppContext>(options => options.UseSqlServer(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=HybridCryptoDB;Integrated Security=True;"), ServiceLifetime.Transient);


            services.AddControllers();

            services.AddDbContext<HybridCryptoAppContext>(options =>
            {
                if (Configuration.GetValue<bool>("UseInMemory", false))
                {
                    options.UseInMemoryDatabase("Kevin" + Guid.NewGuid());
                }
                else
                {
                    //var connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=HybridCryptoDB;Integrated Security=True;";
                    options.UseSqlServer(Configuration.GetValue<string>("ConnectionString", @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=HybridCryptoDB;Integrated Security=True;"));
                }
            }, ServiceLifetime.Singleton);

            services.AddIdentity<User, Role>(options =>
                {
                    options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(15);
                    options.Lockout.MaxFailedAccessAttempts = 5;
                    options.Lockout.AllowedForNewUsers = true;

                    options.Password.RequireNonAlphanumeric = false;
                    options.Password.RequiredLength = 8;

                    options.SignIn.RequireConfirmedEmail = false;
                    options.SignIn.RequireConfirmedPhoneNumber = false;
                })
                .AddEntityFrameworkStores<HybridCryptoAppContext>()
                .AddDefaultTokenProviders();

            // injecteer voor TokenSettings altijd de sectie Token uit de configuratie
            services.Configure<TokenSettings>(Configuration.GetSection("Token"));

            services.AddAuthentication(options =>
                {
                    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme; // string value: "Bearer"
                })
                .AddJwtBearer(options =>
                {
                    var tokenSettings = new TokenSettings();
                    Configuration.Bind("Token", tokenSettings); // injection doesn't work yet, force manually
                    options.TokenValidationParameters = new TokenValidationParameters()
                    {
                        ValidIssuer = tokenSettings.Issuer,
                        ValidAudience = tokenSettings.Audience,
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(tokenSettings.Key))
                    };
                });

            // Repositories
            services.AddScoped<IEncryptedPacketRepository, EncryptedPacketRepository>();
            services.AddScoped<IUserContactRepository, UserContactRepository>();
            services.AddScoped<IUserRepository, UserRepository>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            if (Configuration.GetValue<bool>("UseHttps", false))
            {
                app.UseHttpsRedirection();
            }

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
