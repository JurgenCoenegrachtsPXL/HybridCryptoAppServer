using System.ComponentModel.DataAnnotations;

namespace HybridCryptoApp_Server.Models
{
    public class UserContactModel
    {
        [Required]
        public int ContactId { get; set; }
    }
}