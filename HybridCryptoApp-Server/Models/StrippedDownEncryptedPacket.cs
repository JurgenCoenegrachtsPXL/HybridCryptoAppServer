﻿using System;
using HybridCryptoApp_Server.Data.Models;

namespace HybridCryptoApp_Server.Models
{
    public class StrippedDownEncryptedPacket
    {
        // Primary ID in de database
        public int Id { get; set; }

        // Kunnen linken aan gebruikers

        /// <summary>
        /// Sender of the packet
        /// </summary>
        public StrippedDownUser Sender { get; set; }

        /// <summary>
        /// Receiver of the packet
        /// </summary>
        public StrippedDownUser Receiver { get; set; }

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

        public StrippedDownEncryptedPacket()
        {
        }

        public StrippedDownEncryptedPacket(EncryptedPacket encryptedPacket)
        {
            Id = encryptedPacket.Id;

            Receiver = new StrippedDownUser(encryptedPacket.Receiver);
            Sender = new StrippedDownUser(encryptedPacket.Sender);
            SendDateTime = encryptedPacket.SendDateTime;

            DataType = encryptedPacket.DataType;
            EncryptedSessionKey = encryptedPacket.EncryptedSessionKey;
            Iv = encryptedPacket.Iv;
            EncryptedData = encryptedPacket.EncryptedData;
            Hmac = encryptedPacket.Hmac;
            Signature = encryptedPacket.Signature;
        }
    }
}