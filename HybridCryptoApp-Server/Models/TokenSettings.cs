namespace HybridCryptoApp_Server.Models
{
    public class TokenSettings
    {
        public string Audience { get; set; }
        public int ExpirationTimeInMinutes { get; set; }
        public string Issuer { get; set; }
        public string Key { get; set; }
    }
}