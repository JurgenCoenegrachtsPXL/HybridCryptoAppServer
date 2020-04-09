using HybridCryptoApp_Server.Data.Models;

namespace HybridCryptoApp_Server.Models
{
    public class StrippedDownUser
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PublicKey { get; set; }

        public StrippedDownUser()
        {
        }

        public StrippedDownUser(User user)
        {
            Id = user.Id;
            FirstName = user.FirstName;
            LastName = user.LastName;
            PublicKey = user.PublicKeyXml;
        }
    }
}