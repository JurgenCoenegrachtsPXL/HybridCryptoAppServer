using System.Collections.Generic;
using Microsoft.AspNetCore.Identity;

namespace HybridCryptoApp_Server.Data.Models
{
    public class User : IdentityUser<int>
    {
        /// <summary>
        /// List of contacts for the user
        /// </summary>
        public List<UserContact> ContactList { get; set;}

        /// <summary>
        /// XML representation of user's public RSA key
        /// </summary>
        public string PublicKeyXml { get; set; }

        /// <summary>
        /// First name of user
        /// </summary>
        public string FirstName { get; set; }

        /// <summary>
        /// Last name of user
        /// </summary>
        public string LastName { get; set; }

        /// <summary>
        /// Full name of user
        /// </summary>
        public string Fullname => FirstName + " " + LastName;
    }
}