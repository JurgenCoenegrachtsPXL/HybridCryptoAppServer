using System.ComponentModel.DataAnnotations;

namespace HybridCryptoApp_Server.Models
{
    public class ChangeKeyModel
    {
        [Required(AllowEmptyStrings = false)]
        public string NewKey { get; set; }
    }
}