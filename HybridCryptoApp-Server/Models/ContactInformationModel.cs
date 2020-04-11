namespace HybridCryptoApp_Server.Models
{
    public class ContactInformationModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
		public string PublicKey { get; set; }
    }
}