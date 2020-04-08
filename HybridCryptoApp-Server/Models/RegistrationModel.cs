using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using HybridCryptoApp_Server.Data.Models;

namespace HybridCryptoApp_Server.Models
{
    public class RegistrationModel
    {
        public List<User> ContactList { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [MinLength(6)]
        public string Password { get; set; }
    }
}
