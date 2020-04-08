namespace HybridCryptoApp_Server.Data.Models
{
    public class UserContact
    {
        public int OwnerId { get; set; }
        public User Owner { get; set; }

        public int ContactId { get; set; }
        public User Contact { get; set; }
    }
}