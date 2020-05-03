using System;
using System.Collections.Generic;
using System.Linq;
using HybridCryptoApp_Server.Data.Models;
using HybridCryptoApp_Server.Data.Repositories;
using NUnit.Framework;

namespace HybridCryptoApp_Server.Tests.RepositoryTests {

    [TestFixture]
    public class EncryptedPacketRepositoryTests : DatabaseTests
    {
        private EncryptedPacketRepository encryptedPacketRepository;
        private User user1, user2;

        [SetUp]
        public void SetUp()
        {
            user1 = new User { Email = "test@testing.co.uk" };
            user2 = new User { Email = "test2@testing.com" };

            Context.Users.Add(user1);
            Context.Users.Add(user2);
            Context.SaveChanges();

            encryptedPacketRepository = new EncryptedPacketRepository(Context);
        }

        private EncryptedPacket ValidEncryptedPacket => new EncryptedPacket
        {
            SenderId = user1.Id,
            ReceiverId = user2.Id,
            SendDateTime = DateTime.Now
        };

        [Test]
        public void Get_By_Id_Should_Return_A_EncryptedPacket_With_That_Id()
        {
            EncryptedPacket existingEncryptedPacket = ValidEncryptedPacket;
            Context.EncryptedPackets.Add(existingEncryptedPacket);
            Context.SaveChanges();

            EncryptedPacket foundEncryptedPackets = encryptedPacketRepository.GetById(existingEncryptedPacket.Id);
            Assert.That(foundEncryptedPackets, Is.EqualTo(existingEncryptedPacket));
        }


        [Test]
        public void Add_Should_Add_New_EncryptedPacket_To_Context()
        {
            // arrange
            EncryptedPacket newEncryptedPacket = ValidEncryptedPacket;
            int beforeCount = Context.EncryptedPackets.Count();

            // act
            encryptedPacketRepository.Add(newEncryptedPacket);
            int afterCount = Context.EncryptedPackets.Count();

            // assert
            Assert.That(afterCount, Is.EqualTo(beforeCount + 1));
        }

        [Test]
        public void Add_Should_Throw_ArgumentException_If_Id_Already_Exists()
        {
            EncryptedPacket newEncryptedPacket = ValidEncryptedPacket;
            Context.EncryptedPackets.Add(newEncryptedPacket);
            Context.SaveChanges();

            Assert.That(() => encryptedPacketRepository.Add(newEncryptedPacket), Throws.ArgumentException);
        }

        [Test]
        public void Update_Should_Update_An_Existing_EncryptedPacket()
        {
            EncryptedPacket existingEncryptedPacket = ValidEncryptedPacket;
            Context.EncryptedPackets.Add(existingEncryptedPacket);
            Context.SaveChanges();

            DateTime dateNow = DateTime.Now.AddHours(6);

            existingEncryptedPacket.SendDateTime = dateNow;
            encryptedPacketRepository.Update(existingEncryptedPacket);

            Assert.That(Context.EncryptedPackets.Find(existingEncryptedPacket.Id).SendDateTime, Is.EqualTo(dateNow));
        }

        [Test]
        public void Update_Should_Throw_ArgumentException_If_Id_Does_Not_Exists()
        {
            EncryptedPacket existingEncryptedPacket = ValidEncryptedPacket;
            existingEncryptedPacket.Id = -5;
            Assert.That(() => encryptedPacketRepository.Update(existingEncryptedPacket), Throws.ArgumentException);
        }

        [Test]
        public void Delete_Should_Throw_ArgumentException_If_Id_Does_Not_Exists()
        {
            EncryptedPacket existingEncryptedPacket = ValidEncryptedPacket;
            existingEncryptedPacket.Id = -5;
            Assert.That(() => encryptedPacketRepository.Delete(existingEncryptedPacket), Throws.ArgumentException);
        }

        [Test]
        public void Delete_Should_Delete_Existing_EncryptedPacket()
        {
            EncryptedPacket existingEncryptedPacket = ValidEncryptedPacket;
            Context.EncryptedPackets.Add(existingEncryptedPacket);
            Context.SaveChanges();

            encryptedPacketRepository.Delete(existingEncryptedPacket);

            Assert.That(Context.EncryptedPackets.Find(existingEncryptedPacket.Id), Is.Null);
        }

        [Test]
        public void GetAllPacketsOfReceiver_Should_Return_Packets_With_Given_Receiver_Id()
        {
            List<EncryptedPacket> encryptedPackets = new List<EncryptedPacket>();

            for (int i = 0; i < 5; i++) // 5 packets toevoegen aan context
            {
                encryptedPackets.Add(CreateRandomEncryptedPacketWithData(user1.Id, user2.Id, DateTime.Now.AddHours(i)));
            }

            Context.AddRange(encryptedPackets);
            Context.SaveChanges();

            List<EncryptedPacket> foundEncryptedPackets = encryptedPacketRepository.GetAllPacketsOfReceiver(user2.Id);

            Assert.That(foundEncryptedPackets.Count, Is.EqualTo(encryptedPackets.Count));
        }

        [Test]
        public void GetAllPacketsOfReceiver_Should_Return_Packets_With_Given_Receiver_Id_And_After_Given_Time()
        {
            List<EncryptedPacket> encryptedPackets = new List<EncryptedPacket>();

            for (int i = 0; i < 5; i++) // 5 packets toevoegen aan context
            {
                encryptedPackets.Add(CreateRandomEncryptedPacketWithData(user1.Id, user2.Id, DateTime.Now.AddHours(i)));
            }

            Context.AddRange(encryptedPackets);
            Context.SaveChanges();

            List<EncryptedPacket> foundEncryptedPackets = encryptedPacketRepository.GetAllPacketsOfReceiver(user2.Id, DateTime.Now.AddHours(2));

            Assert.That(foundEncryptedPackets.Count, Is.EqualTo(2));
        }


        [Test]
        public void GetAllPacketsOfSender_Should_Return_Packets_With_Given_Sender_Id()
        {
            List<EncryptedPacket> encryptedPackets = new List<EncryptedPacket>();

            for (int i = 0; i < 5; i++) // 5 packets toevoegen aan context
            {
                encryptedPackets.Add(CreateRandomEncryptedPacketWithData(user2.Id, user1.Id, DateTime.Now.AddHours(i)));
            }

            Context.AddRange(encryptedPackets);
            Context.SaveChanges();

            List<EncryptedPacket> foundEncryptedPackets = encryptedPacketRepository.GetAllPacketsOfSender(user2.Id);

            Assert.That(foundEncryptedPackets.Count, Is.EqualTo(encryptedPackets.Count));
        }

        [Test]
        public void GetAllPacketsOfSender_Should_Return_Packets_With_Given_Sender_Id_And_After_Given_Time()
        {
            List<EncryptedPacket> encryptedPackets = new List<EncryptedPacket>();

            for (int i = 0; i < 5; i++) // 5 packets toevoegen aan context
            {
                encryptedPackets.Add(CreateRandomEncryptedPacketWithData(user2.Id, user1.Id, DateTime.Now.AddHours(i)));
            }

            Context.AddRange(encryptedPackets);
            Context.SaveChanges();

            List<EncryptedPacket> foundEncryptedPackets = encryptedPacketRepository.GetAllPacketsOfSender(user2.Id, DateTime.Now.AddHours(2));

            Assert.That(foundEncryptedPackets.Count, Is.EqualTo(2));
        }


        //Maakt encrypted data packet met willekeurige data erin
        /// <summary>
        /// Create new EncryptedPacket with random data
        /// </summary>
        /// <param name="senderId">User id of the sender</param>
        /// <param name="receiverId">User id of the receiver</param>
        /// <param name="sendTime">DateTime at which the packet was sent</param>
        /// <returns></returns>
        private EncryptedPacket CreateRandomEncryptedPacketWithData(int senderId, int receiverId, DateTime? sendTime = null)
        {
            return new EncryptedPacket
            {
                SendDateTime = sendTime ?? DateTime.Now,
                SenderId = senderId,
                ReceiverId = receiverId,

                DataType = DataType.File,
                Hmac = RandomBytes(64),
                Iv = RandomBytes(16),
                EncryptedSessionKey = RandomBytes(64),
                Signature = RandomBytes(64),
                EncryptedData = RandomBytes(256)
            };
        }

        private static byte[] RandomBytes(int length)
        {
            byte[] output = new byte[length];
            new Random().NextBytes(output);
            return output;
        }
    }
}