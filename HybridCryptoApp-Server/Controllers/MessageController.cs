using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using HybridCryptoApp_Server.Data.Models;
using HybridCryptoApp_Server.Data.Repositories.Interfaces;
using HybridCryptoApp_Server.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace HybridCryptoApp_Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles="RegularUser")]
    public class MessageController : ControllerBase
    {
        private readonly IEncryptedPacketRepository encryptedPacketRepository;
        private readonly UserManager<User> userManager;
        private readonly IUserRepository userRepository;

        /// <inheritdoc />
        public MessageController(IEncryptedPacketRepository encryptedPacketRepository, UserManager<User> userManager, IUserRepository userRepository)
        {
            this.encryptedPacketRepository = encryptedPacketRepository;
            this.userManager = userManager;
            this.userRepository = userRepository;
        }

        [HttpPost("NewMessage")]
        public async Task<IActionResult> SendNewMessage([FromBody] NewEncryptedPacketModel newMessage)
        {
            if (userRepository.GetById(newMessage.ReceiverId) == null)
            {
                ModelState.AddModelError("error", "Receiver does not exist");
                return BadRequest(ModelState);
            }

            // convert model to EncryptedPacket
            EncryptedPacket encryptedPacket = new EncryptedPacket
            {
                DataType = newMessage.DataType,
                EncryptedData = newMessage.EncryptedData,
                EncryptedSessionKey = newMessage.EncryptedSessionKey,
                Hmac = newMessage.Hmac,
                Iv = newMessage.Iv,
                ReceiverId = newMessage.ReceiverId,
                Signature = newMessage.Signature,
                SenderId = (await GetUserAsync().ConfigureAwait(false)).Id,
                SendDateTime = DateTime.Now,
                IsMeantForReceiver = newMessage.MeantForReceiver
            };

            // try to add to database
            try
            {
                encryptedPacketRepository.Add(encryptedPacket);
                return Ok();
            }
            catch (ArgumentException e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("AsReceiver")]
        public async Task<IActionResult> GetMessagesAsReceiver()
        {
            return Ok(encryptedPacketRepository.GetAllPacketsOfReceiver((await GetUserAsync().ConfigureAwait(false)).Id).Select(e => new StrippedDownEncryptedPacket(e)));
        }

        [HttpGet("AsSender")]
        public async Task<IActionResult> GetMessagesAsSender()
        {
            return Ok(encryptedPacketRepository.GetAllPacketsOfSender((await GetUserAsync().ConfigureAwait(false)).Id).Select(e => new StrippedDownEncryptedPacket(e)));
        }

        [HttpPost("AsReceiverAfter")]
        public async Task<IActionResult> GetMessagesAsReceiverAfter([FromBody] MessagesAfterModel model)
        {
            return Ok(encryptedPacketRepository.GetAllPacketsOfReceiver((await GetUserAsync().ConfigureAwait(false)).Id, model.DateTime).Select(e => new StrippedDownEncryptedPacket(e)));
        }

        [HttpPost("AsSenderAfter")]
        public async Task<IActionResult> GetMessagesAsSenderAfter([FromBody] MessagesAfterModel model)
        {
            return Ok(encryptedPacketRepository.GetAllPacketsOfSender((await GetUserAsync().ConfigureAwait(false)).Id, model.DateTime).Select(e => new StrippedDownEncryptedPacket(e)));
        }

        [HttpGet("OfContact/{id}")]
        public async Task<IActionResult> GetMessagesOfContact(int id)
        {
            User user = await GetUserAsync().ConfigureAwait(false);
            User contact = userRepository.GetById(id);
            if (contact == null)
            {
                return BadRequest();
            }

            List<EncryptedPacket> packets = await encryptedPacketRepository.GetAllPacketsBetweenUsers(user.Id, contact.Id).ConfigureAwait(false);
            return Ok(packets.Select(e => new StrippedDownEncryptedPacket(e)));
        }

        /// <summary>
        /// Get user from token
        /// </summary>
        /// <returns></returns>
        private async Task<User> GetUserAsync()
        {
            return await userManager.FindByEmailAsync(User.FindFirst(ClaimTypes.Email).Value);
        }
    }
}