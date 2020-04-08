using Microsoft.AspNetCore.Identity;

namespace HybridCryptoApp_Server.Data.Models
{
    public class Role : IdentityRole<int>
    {
        public const string RegularUser = "RegularUser";
    }
}