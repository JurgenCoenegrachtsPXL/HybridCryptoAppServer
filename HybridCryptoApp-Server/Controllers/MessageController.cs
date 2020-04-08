using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using HybridCryptoApp_Server.Data.Models;
using HybridCryptoApp_Server.Data.Repositories.Interfaces;
using HybridCryptoApp_Server.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace HybridCryptoApp_Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class MessageController : ControllerBase
    {
        private readonly IEncryptedPacketRepository encryptedPacketRepository;
        private readonly UserManager<User> userManager;

        /// <inheritdoc />
        public MessageController(IEncryptedPacketRepository encryptedPacketRepository, UserManager<User> userManager)
        {
            this.encryptedPacketRepository = encryptedPacketRepository;
            this.userManager = userManager;
        }

        [HttpPost("NewMessage")]
        public async Task<IActionResult> SendNewMessage([FromBody] NewEncryptedPacketModel newMessage)
        {
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
                SenderId = (await GetUserAsync()).Id,
                SendDateTime = DateTime.Now
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
            return Ok(encryptedPacketRepository.GetAllPacketsOfReceiver((await GetUserAsync()).Id));
        }

        [HttpGet("AsSender")]
        public async Task<IActionResult> GetMessagesAsSender()
        {
            return Ok(encryptedPacketRepository.GetAllPacketsOfSender((await GetUserAsync()).Id));
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