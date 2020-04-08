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
    public class UserContactController : ControllerBase
    {
        private readonly UserManager<User> userManager;
        private readonly IUserContactRepository userContactRepository;

        /// <inheritdoc />
        public UserContactController(UserManager<User> userManager, IUserContactRepository userContactRepository)
        {
            this.userManager = userManager;
            this.userContactRepository = userContactRepository;
        }

        [HttpPost("Add")]
        public async Task<IActionResult> AddUserContact([FromBody] UserContactModel userContactModel)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            User user = await GetUserAsync();

            try
            {
                userContactRepository.Add(new UserContact()
                {
                    OwnerId = user.Id,
                    ContactId = userContactModel.ContactId
                });

                return Ok();
            }
            catch (ArgumentException e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpPost("Remove")]
        public async Task<IActionResult> RemoveUserContact([FromBody] UserContactModel userContactModel)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            User user = await GetUserAsync();

            try
            {
                userContactRepository.Delete(new UserContact()
                {
                    OwnerId = user.Id,
                    ContactId = userContactModel.ContactId
                });

                return Ok();
            }
            catch (ArgumentException e)
            {
                return BadRequest(e.Message);
            }
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