using System.ComponentModel.DataAnnotations;

namespace HybridCryptoApp_Server.Models
{
    public class UserContactModel
    {
        public int ContactId { get; set; }

        [EmailAddress]
        public string ContactEmail { get; set; }
    }
}