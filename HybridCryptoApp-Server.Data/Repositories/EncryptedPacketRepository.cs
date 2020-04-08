using System;
using System.Collections.Generic;
using System.Linq;
using HybridCryptoApp_Server.Data.Models;
using HybridCryptoApp_Server.Data.Repositories.Interfaces;

namespace HybridCryptoApp_Server.Data.Repositories
{
    public class EncryptedPacketRepository : IEncryptedPacketRepository
    {
        private readonly HybridCryptoAppContext context;

        public EncryptedPacketRepository(HybridCryptoAppContext context)
        {
            this.context = context;
        }

        /// <inheritdoc />
        public void Add(EncryptedPacket newEncryptedPacket)
        {
            // check if id exists
            if (context.EncryptedPackets.Find(newEncryptedPacket.Id) == null)
            {
                context.EncryptedPackets.Add(newEncryptedPacket);
                context.SaveChanges();
            }
            else
            {
                throw new ArgumentException($"EncryptedPacket with Id: {newEncryptedPacket.Id} already exists!");
            }
        }

        /// <inheritdoc />
        public void Update(EncryptedPacket existingItem)
        {
            // check if id exists
            if (context.EncryptedPackets.Find(existingItem.Id) == null)
            {
                context.EncryptedPackets.Update(existingItem);
                context.SaveChanges();
            }
            else
            {
                throw new ArgumentException($"No EncryptedPacket found with Id: {existingItem.Id}!");
            }
        }

        /// <inheritdoc />
        public void Delete(EncryptedPacket existingItem)
        {
            // check if id exists
            if (context.EncryptedPackets.Find(existingItem.Id) == null)
            {
                context.EncryptedPackets.Remove(existingItem);
                context.SaveChanges();
            }
            else
            {
                throw new ArgumentException($"No EncryptedPacket found with Id: {existingItem.Id}!");
            }
        }

        /// <inheritdoc />
        public EncryptedPacket GetById(int id)
        {
            return context.EncryptedPackets.Find(id);
        }

        /// <inheritdoc />
        public List<EncryptedPacket> GetAllPacketsOfReceiver(int receiverId)
        {
            return context.EncryptedPackets.Where(e => e.ReceiverId == receiverId).ToList();
        }

        /// <inheritdoc />
        public List<EncryptedPacket> GetAllPacketsOfSender(int senderId)
        {
            return context.EncryptedPackets.Where(e => e.SenderId == senderId).ToList();
        }

        /// <inheritdoc />
        public List<EncryptedPacket> GetAllPacketsOfReceiver(int receiverId, DateTime after)
        {
            return context.EncryptedPackets.Where(e => e.ReceiverId == receiverId && e.SendDateTime >= after).ToList();
        }

        /// <inheritdoc />
        public List<EncryptedPacket> GetAllPacketsOfSender(int senderId, DateTime after)
        {
            return context.EncryptedPackets.Where(e => e.SenderId == senderId && e.SendDateTime >= after).ToList();
        }
    }
}