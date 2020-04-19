using System.ComponentModel.DataAnnotations;
using DataType = HybridCryptoApp_Server.Data.Models.DataType;

namespace HybridCryptoApp_Server.Models
{
    public class NewEncryptedPacketModel
    {
        /// <summary>
        /// Id of the receiver
        /// </summary>
        [Required]
        public int ReceiverId { get; set; }

        /// <summary>
        /// Type of data in packet
        /// </summary>
        [Required]
        public DataType DataType { get; set; }

        /// <summary>
        /// EAS session key, encrypted with RSA
        /// </summary>
        [Required]
        public byte[] EncryptedSessionKey { get; set; }

        /// <summary>
        /// Initialization Vector for AES (adds entropy to process)
        /// </summary>
        [Required]
        public byte[] Iv { get; set; }

        /// <summary>
        /// Hash to verify sender and data integrity
        /// </summary>
        [Required]
        public byte[] Hmac { get; set; }

        /// <summary>
        /// Signature of sender
        /// </summary>
        [Required]
        public byte[] Signature { get; set; }

        /// <summary>
        /// Actual data encrypted with EAS
        /// </summary>
        [Required]
        public byte[] EncryptedData { get; set; }

        /// <summary>
        /// Is packet meant for listed receiver
        /// </summary>
        public bool MeantForReceiver { get; set; } = true;
    }
}