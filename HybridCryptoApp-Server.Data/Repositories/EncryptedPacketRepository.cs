using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HybridCryptoApp_Server.Data.Models;
using HybridCryptoApp_Server.Data.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

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
            if (context.EncryptedPackets.Find(existingItem.Id) != null)
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
            if (context.EncryptedPackets.Find(existingItem.Id) != null)
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
            return context.EncryptedPackets.Where(e => e.IsMeantForReceiver && e.ReceiverId == receiverId).ToList();
        }

        /// <inheritdoc />
        public List<EncryptedPacket> GetAllPacketsOfReceiver(int receiverId, DateTime after)
        {
            return context.EncryptedPackets.Where(e => e.IsMeantForReceiver && e.ReceiverId == receiverId && e.SendDateTime >= after).ToList();
        }

        /// <inheritdoc />
        public List<EncryptedPacket> GetAllPacketsOfSender(int senderId)
        {
            return context.EncryptedPackets.Where(e => !e.IsMeantForReceiver && e.SenderId == senderId).ToList();
        }

        /// <inheritdoc />
        public List<EncryptedPacket> GetAllPacketsOfSender(int senderId, DateTime after)
        {
            return context.EncryptedPackets.Where(e => !e.IsMeantForReceiver && e.SenderId == senderId && e.SendDateTime >= after).ToList();
        }

        /// <summary>
        /// Get all packets sent between two users
        /// </summary>
        /// <param name="user1Id"></param>
        /// <param name="user2Id"></param>
        /// <returns></returns>
        public async Task<List<EncryptedPacket>> GetAllPacketsBetweenUsers(int user1Id, int user2Id)
        {
            return await context.EncryptedPackets.Where(e => e.SenderId == user1Id && e.ReceiverId == user2Id || 
                                                                         e.SenderId == user2Id && e.ReceiverId == user1Id)
                                                 .ToListAsync();
        }
    }
}