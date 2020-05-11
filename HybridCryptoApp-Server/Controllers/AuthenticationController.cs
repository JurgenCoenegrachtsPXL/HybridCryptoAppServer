using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using HybridCryptoApp_Server.Data.Models;
using HybridCryptoApp_Server.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

namespace HybridCryptoApp_Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly RoleManager<Role> roleManager;
        private readonly IPasswordHasher<User> passwordHasher;
        private readonly IOptions<TokenSettings> tokenSettings;
        private readonly UserManager<User> userManager;

        public AuthenticationController(UserManager<User> userManager, RoleManager<Role> roleManager,
            IPasswordHasher<User> passwordHasher,
            IOptions<TokenSettings> tokenSettings) //User die we zelf hebben aangemaakt
        {
            this.roleManager = roleManager;
            this.passwordHasher = passwordHasher;
            this.tokenSettings = tokenSettings;
            this.userManager = userManager;
        }

        /// <summary>
        /// Try to register new user
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegistrationModel model) // zoeken in body niet header
        {
            var user = new User
            {
                UserName = model.Email,
                Email = model.Email,
                FirstName = model.FirstName,
                LastName = model.LastName,
                PublicKeyXml = model.PublicKey
            };

            var result = await userManager.CreateAsync(user, model.Password); //await omdat we deze regel volledig synchroon willen doen

            if (result.Succeeded)
            {
                string role = Role.RegularUser;
                await EnsureRoleExists(role).ConfigureAwait(false); // we geven de rol mee, we kijken of het bestaat 
                await userManager.AddToRoleAsync(user, role);

                return Ok();
            }

            foreach (var error in result.Errors)
            {
                ModelState.AddModelError(error.Code, error.Description);
            }

            return BadRequest(ModelState);
        }

        /// <summary>
        /// Create new token for user
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost("token")]
        public async Task<IActionResult> CreateToken([FromBody] LoginModel model)
        {
            var user = await userManager.FindByNameAsync(model.Email);
            if (user == null)
            {
                return Unauthorized();
            }

            if (passwordHasher.VerifyHashedPassword(user, user.PasswordHash, model.Password) !=
                PasswordVerificationResult.Success)
            {
                return Unauthorized();
            }

            var token = await CreateJwtToken(user).ConfigureAwait(false);
            return Ok(new LoginResponseModel
            {
                Token = token,
                Name = user.Fullname
            });
        }

        /// <summary>
        /// Change public key of logged in user
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost("changeKey")]
        [Authorize(Roles="RegularUser")]
        public async Task<IActionResult> ChangePublicKey([FromBody]ChangeKeyModel model)
        {
            User user = await userManager.FindByEmailAsync(User.FindFirst(ClaimTypes.Email).Value);

            user.PublicKeyXml = model.NewKey;
            await userManager.UpdateAsync(user);

            return Ok();
        }

        /// <summary>
        /// Create new token for specified user
        /// </summary>
        /// <param name="user"></param>
        /// <returns>String representation of token</returns>
        private async Task<string> CreateJwtToken(User user)
        {
            // add claims to identity user
            var claims = await userManager.GetClaimsAsync(user);
            claims.Add(new Claim(JwtRegisteredClaimNames.NameId, user.Id.ToString()));
            claims.Add(new Claim(JwtRegisteredClaimNames.Sub, user.UserName));
            claims.Add(new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()));
            claims.Add(new Claim(JwtRegisteredClaimNames.Email, user.Email));

            // add their role(s)
            var userRoles = await userManager.GetRolesAsync(user);
            foreach (var role in userRoles)
            {
                claims.Add(new Claim(ClaimTypes.Role, role));
            }

            // create signature
            var keyBytes = Encoding.UTF8.GetBytes(tokenSettings.Value.Key);
            var symmetricSecurityKey = new SymmetricSecurityKey(keyBytes);
            var signingCredentials = new SigningCredentials(symmetricSecurityKey, SecurityAlgorithms.HmacSha256);

            // combine everything
            var token = new JwtSecurityToken(
                tokenSettings.Value.Issuer,
                tokenSettings.Value.Audience,
                claims,
                expires: DateTime.UtcNow.AddMinutes(tokenSettings.Value.ExpirationTimeInMinutes),
                signingCredentials: signingCredentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        private async Task EnsureRoleExists(string roleName)
        {
            if (await roleManager.RoleExistsAsync(roleName))
            {
                return; // als role bestaat dan doen we niets anders maken we het aan
            }

            await roleManager.CreateAsync(new Role
            {
                Name = roleName,
                NormalizedName = roleName.ToUpper()
            });
        }
    }
}