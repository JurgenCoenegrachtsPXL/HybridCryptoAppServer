using System;

namespace HybridCryptoApp_Server.Data.Models
{
    public class EncryptedPacket
    {
        // Primary ID in de database
        public int Id { get; set; } 

        // Kunnen linken aan gebruikers
        public int SenderId { get; set; } 
        public User Sender { get; set; }

        public int ReceiverId { get; set; }
        public User Receiver { get; set; }

        /// <summary>
        /// When packet was sent
        /// </summary>
        public DateTime SendDateTime { get; set; }

        /// <summary>
        /// Type of data in packet
        /// </summary>
        public DataType DataType { get; set; }

        /// <summary>
        /// EAS session key, encrypted with RSA
        /// </summary>
        public byte[] EncryptedSessionKey { get; set; }

        /// <summary>
        /// Initialization Vector for AES (adds entropy to process)
        /// </summary>
        public byte[] Iv { get; set; }

        /// <summary>
        /// Hash to verify sender and data integrity
        /// </summary>
        public byte[] Hmac { get; set; }

        /// <summary>
        /// Signature of sender
        /// </summary>
        public byte[] Signature { get; set; }

        /// <summary>
        /// Actual data encrypted with EAS
        /// </summary>
        public byte[] EncryptedData { get; set; }
    }
}