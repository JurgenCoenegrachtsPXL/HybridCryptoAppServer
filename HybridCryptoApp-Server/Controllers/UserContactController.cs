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

        /// <summary>
        /// Add a new contact
        /// </summary>
        /// <param name="userContactModel"></param>
        /// <returns></returns>
        [HttpPost("AddById")]
        public async Task<IActionResult> AddUserContactById([FromBody] UserContactModel userContactModel)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            User user = await GetUserAsync().ConfigureAwait(false);

            if (await userManager.FindByIdAsync(userContactModel.ContactId.ToString()) == null)
            {
                return BadRequest("No user with specified id found");
            }

            try
            {
                userContactRepository.Add(new UserContact
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
        /// Add a new contact
        /// </summary>
        /// <param name="userContactModel"></param>
        /// <returns></returns>
        [HttpPost("AddByEmail")]
        public async Task<IActionResult> AddUserContactByEmail([FromBody] UserContactModel userContactModel)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            User user = await GetUserAsync().ConfigureAwait(false);

            // find other user
            User contact = await userManager.FindByEmailAsync(userContactModel.ContactEmail);
            if (contact == null)
            {
                return BadRequest("No user with specified email found");
            }

            try
            {
                userContactRepository.Add(new UserContact
                {
                    OwnerId = user.Id,
                    ContactId = contact.Id
                });

                return Ok();
            }
            catch (ArgumentException e)
            {
                return BadRequest(e.Message);
            }
        }

        /// <summary>
        /// Remove an existing contact
        /// </summary>
        /// <param name="userContactModel"></param>
        /// <returns></returns>
        [HttpPost("Remove")]
        public async Task<IActionResult> RemoveUserContact([FromBody] UserContactModel userContactModel)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            User user = await GetUserAsync().ConfigureAwait(false);

            try
            {
                userContactRepository.Delete(new UserContact
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
        /// Get all contacts of currently logged in user
        /// </summary>
        /// <returns></returns>
        [HttpGet("all")]
        public async Task<IActionResult> GetAll()
        {
            List<int> ids = userContactRepository.GetUserContactsOfUser((await GetUserAsync().ConfigureAwait(false)).Id).Select(u => u.ContactId).ToList();
            List<ContactInformationModel> models = new List<ContactInformationModel>();
            
            foreach (int id in ids)
            {
                User other = await userManager.FindByIdAsync(id.ToString());

                models.Add(new ContactInformationModel
                {
                    Id = id,
                    FirstName = other.FirstName,
                    LastName = other.LastName,
					PublicKey = other.PublicKeyXml
                });
            }

            return Ok(models);
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