using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HybridCryptoApp_Server.Data.Models;

namespace HybridCryptoApp_Server.Data.Repositories.Interfaces
{
    public interface IEncryptedPacketRepository : IBaseRepository<EncryptedPacket>
    {
        /// <summary>
        /// Get packet via its primary key
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        EncryptedPacket GetById(int id);

        /// <summary>
        /// Get all packets where given id is the receiver of the packet
        /// </summary>
        /// <param name="receiverId">Id of the receiver</param>
        /// <returns></returns>
        List<EncryptedPacket> GetAllPacketsOfReceiver(int receiverId);

        /// <summary>
        /// Get all packets where given id is the sender of the packet
        /// </summary>
        /// <param name="senderId">Id of the sender</param>
        /// <returns></returns>
        List<EncryptedPacket> GetAllPacketsOfSender(int senderId);

        /// <summary>
        /// Get all packets where given id is the receiver after a certain date and time
        /// </summary>
        /// <param name="receiverId">Id of the receiver</param>
        /// <param name="after">Time after which packets should have been send</param>
        /// <returns></returns>
        List<EncryptedPacket> GetAllPacketsOfReceiver(int receiverId, DateTime after);

        /// <summary>
        /// Get all packets where given id is the sender after a certain date and time
        /// </summary>
        /// <param name="senderId">Id of the sender</param>
        /// <param name="after">Time after which packets should have been send</param>
        /// <returns></returns>
        List<EncryptedPacket> GetAllPacketsOfSender(int senderId, DateTime after);

        /// <summary>
        /// Get all packets sent between two users
        /// </summary>
        /// <param name="user1Id"></param>
        /// <param name="user2Id"></param>
        /// <returns></returns>
        Task<List<EncryptedPacket>> GetAllPacketsBetweenUsers(int user1Id, int user2Id);
    }
}