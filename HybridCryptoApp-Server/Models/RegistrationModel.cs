using System.ComponentModel.DataAnnotations;

namespace HybridCryptoApp_Server.Models
{
    public class RegistrationModel
    {
        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [MinLength(6)]
        public string Password { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string FirstName { get; set; }
        
        [Required(AllowEmptyStrings = false)]
        public string LastName { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string PublicKey { get; set; }
    }
}
