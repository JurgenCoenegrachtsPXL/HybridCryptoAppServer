using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using HybridCryptoApp_Server.Data.Models;
using HybridCryptoApp_Server.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using NUnit.Framework;

namespace HybridCryptoApp_Server.Tests.ControllerTests
{
    [TestFixture]
    public class MessageControllerTests : ServerTests
    {
        private const string NewMessagePath = "/api/Message/NewMessage";
        private const string AsReceiverPath = "/api/Message/AsReceiver";
        private const string AsSenderPath = "/api/Message/AsSender";
        private const string GetMessagesOfContactPath = "/api/Message/OfContact/";

        private User user;

        private readonly Random random = new Random();

        private byte[] RandomBytes(int length)
        {
            byte[] output = new byte[length];
            random.NextBytes(output);
            return output;
        }

        private NewEncryptedPacketModel ValidEncryptedPacket => new NewEncryptedPacketModel
        {
            DataType = DataType.File,
            
            //byte arrays
            EncryptedData = RandomBytes(16),
            EncryptedSessionKey = RandomBytes(32),
            Hmac = RandomBytes(64),
            Iv = RandomBytes(128),
            Signature = RandomBytes(256),

            ReceiverId = user.Id,
            MeantForReceiver = true
        };

        [SetUp]
        public async Task SetUp()
        {
            UserManager<User> userManager = Server.Host.Services.GetService<UserManager<User>>();
            user = new User
            {
                FirstName="Hallo",
                LastName="Test",
                UserName = "user@pxl.be",
                Email = "user@pxl.be",
                PublicKeyXml = "aSomewhatRandomKey"
            };
            await userManager.CreateAsync(user, "ThisIsPassword123@");
            string role = Role.RegularUser;
            await EnsureRoleExists(role); // we geven de rol mee, we kijken of het bestaat 
            await userManager.AddToRoleAsync(user, role);

            user = await userManager.FindByEmailAsync(user.Email);

            //User is altijd ingelogd
            await LoginAsExistingUser("user@pxl.be", "ThisIsPassword123@");
        }

        #region SendNewMessage method
        [Test]
        public async Task SendNewMessage_Should_Return_Ok()
        {
            NewEncryptedPacketModel encryptedPacket = ValidEncryptedPacket;
            HttpResponseMessage result = await Client.PostAsync(NewMessagePath, Stringify(encryptedPacket));
            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }

        [Test]
        public async Task SendNewMessage_Should_Return_Bad_Request_If_Receiver_Does_Not_exist()
        {
            NewEncryptedPacketModel encryptedPacket = ValidEncryptedPacket;
            encryptedPacket.ReceiverId = -5;

            HttpResponseMessage result = await Client.PostAsync(NewMessagePath, Stringify(encryptedPacket));
            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task SendNewMessage_Should_Return_Bad_Request_If_EncryptedSessionKey_Is_Empty()
        {
            NewEncryptedPacketModel encryptedPacket = ValidEncryptedPacket;
            encryptedPacket.EncryptedSessionKey = null;

            HttpResponseMessage result = await Client.PostAsync(NewMessagePath, Stringify(encryptedPacket));
            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task SendNewMessage_Should_Return_Bad_Request_If_Iv_Is_Empty()
        {
            NewEncryptedPacketModel encryptedPacket = ValidEncryptedPacket;
            encryptedPacket.Iv = null;

            HttpResponseMessage result = await Client.PostAsync(NewMessagePath, Stringify(encryptedPacket));
            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task SendNewMessage_Should_Return_Bad_Request_If_Hmac_Is_Empty()
        {
            NewEncryptedPacketModel encryptedPacket = ValidEncryptedPacket;
            encryptedPacket.Hmac = null;

            HttpResponseMessage result = await Client.PostAsync(NewMessagePath, Stringify(encryptedPacket));
            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task SendNewMessage_Should_Return_Bad_Request_If_Signature_Is_Empty()
        {
            NewEncryptedPacketModel encryptedPacket = ValidEncryptedPacket;
            encryptedPacket.Signature = null;

            HttpResponseMessage result = await Client.PostAsync(NewMessagePath, Stringify(encryptedPacket));
            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task SendNewMessage_Should_Return_Bad_Request_If_EncryptedData_Is_Empty()
        {
            NewEncryptedPacketModel encryptedPacket = ValidEncryptedPacket;
            encryptedPacket.EncryptedData = null;

            HttpResponseMessage result = await Client.PostAsync(NewMessagePath, Stringify(encryptedPacket));
            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }
        #endregion

        [Test]
        public async Task GetMessagesAsReceiver_Should_Return_Ok()
        {
            HttpResponseMessage response = await Client.GetAsync(AsReceiverPath);

            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }

        [Test]
        public async Task GetMessagesAsReceiver_Should_Return_List_Of_StrippedDownEncryptedPackets()
        {
            HttpResponseMessage response = await Client.GetAsync(AsReceiverPath);

            string responseString = await response.Content.ReadAsStringAsync();

            //response = list van strippeddown of null
            Assert.That(() => JsonConvert.DeserializeObject<List<StrippedDownEncryptedPacket>>(responseString), Throws.Nothing);
        }

        [Test]
        public async Task GetMessagesAsReceiver_Should_Return_List_Of_StrippedDownEncryptedPackets_With_2_Values()
        {
            // add two encrypted messages
            await Client.PostAsync(NewMessagePath, Stringify(ValidEncryptedPacket));
            await Client.PostAsync(NewMessagePath, Stringify(ValidEncryptedPacket));

            HttpResponseMessage response = await Client.GetAsync(AsReceiverPath);

            string responseString = await response.Content.ReadAsStringAsync();
            var list = JsonConvert.DeserializeObject<List<StrippedDownEncryptedPacket>>(responseString);

            Assert.That(list.Count, Is.EqualTo(2));
        }

        [Test]
        public async Task GetMessagesAsSender_Should_Return_Ok()
        {
            HttpResponseMessage response = await Client.GetAsync(AsSenderPath);

            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }

        [Test]
        public async Task GetMessagesAsSender_Should_Return_List_Of_StrippedDownEncryptedPackets()
        {
            NewEncryptedPacketModel packet = ValidEncryptedPacket;
            packet.MeantForReceiver = false;

            HttpResponseMessage response = await Client.GetAsync(AsSenderPath);

            string responseString = await response.Content.ReadAsStringAsync();

            //response = list van strippeddown of null
            Assert.That(() => JsonConvert.DeserializeObject<List<StrippedDownEncryptedPacket>>(responseString), Throws.Nothing);
        }

        [Test]
        public async Task GetMessagesAsSender_Should_Return_List_Of_StrippedDownEncryptedPackets_With_2_Values()
        {
            // add two encrypted messages
            NewEncryptedPacketModel packet = ValidEncryptedPacket;
            packet.MeantForReceiver = false;

            await Client.PostAsync(NewMessagePath, Stringify(packet));
            await Client.PostAsync(NewMessagePath, Stringify(packet));

            HttpResponseMessage response = await Client.GetAsync(AsSenderPath);

            string responseString = await response.Content.ReadAsStringAsync();
            var list = JsonConvert.DeserializeObject<List<StrippedDownEncryptedPacket>>(responseString);

            Assert.That(list.Count, Is.EqualTo(2));
        }

        [Test]
        public async Task GetMessagesOfContact_Should_Return_Ok()
        {
            // add two encrypted messages
            await Client.PostAsync(NewMessagePath, Stringify(ValidEncryptedPacket));
            await Client.PostAsync(NewMessagePath, Stringify(ValidEncryptedPacket));

            HttpResponseMessage response = await Client.GetAsync(GetMessagesOfContactPath + ValidEncryptedPacket.ReceiverId);
            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }

        [Test]
        public async Task GetMessagesOfContact_Should_Return_Bad_Request_If_Contact_Does_Not_Exist()
        {
            int userIdThatDoesNotExist = -10234;

            HttpResponseMessage response = await Client.GetAsync(GetMessagesOfContactPath + userIdThatDoesNotExist);
            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task GetMessagesOfContact_Should_Return_List_Of_StrippedDownEncryptedPackets()
        {
            // add two encrypted messages
            await Client.PostAsync(NewMessagePath, Stringify(ValidEncryptedPacket));
            await Client.PostAsync(NewMessagePath, Stringify(ValidEncryptedPacket));

            HttpResponseMessage response = await Client.GetAsync(GetMessagesOfContactPath + ValidEncryptedPacket.ReceiverId);
            string content = await response.Content.ReadAsStringAsync();

            Assert.That(() => JsonConvert.DeserializeObject<List<StrippedDownEncryptedPacket>>(content), Throws.Nothing);
        }

        [Test]
        public async Task GetMessagesOfContact_Should_Return_Non_Empty_List()
        {
            // add two encrypted messages
            await Client.PostAsync(NewMessagePath, Stringify(ValidEncryptedPacket));
            await Client.PostAsync(NewMessagePath, Stringify(ValidEncryptedPacket));

            HttpResponseMessage response = await Client.GetAsync(GetMessagesOfContactPath + ValidEncryptedPacket.ReceiverId);
            string content = await response.Content.ReadAsStringAsync();

            Assert.That(content, Is.Not.Null);
            Assert.That(content, Is.Not.Empty);
        }
    }
}