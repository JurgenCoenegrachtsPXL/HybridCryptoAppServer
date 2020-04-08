using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using HybridCryptoApp_Server.Data.Models;
using HybridCryptoApp_Server.Models;
using Microsoft.AspNetCore.Http;
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
        private readonly RoleManager<Role> _roleManager;
        private readonly IPasswordHasher<User> _passwordhasher;
        private readonly IOptions<TokenSettings> _tokenSettings;
        private readonly UserManager<User> _userManager;

        public AuthenticationController(UserManager<User> userManager, RoleManager<Role> roleManager,
            IPasswordHasher<User> passwordhasher,
            IOptions<TokenSettings> tokenSettings) //User die we zelf hebben aangemaakt
        {
            _roleManager = roleManager;
            _passwordhasher = passwordhasher;
            _tokenSettings = tokenSettings;
            _userManager = userManager;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegistrationModel model) // zoeken in body niet header
        {
            var user = new User
            {
                UserName = model.Email,
                Email = model.Email,
            };

            var result = await _userManager.CreateAsync(user, model.Password); //await omdat we deze regel volledig synchroon willen doen

            if (result.Succeeded)
            {
                string role = Role.RegularUser;
                await EnsureRoleExists(role); // we geven de rol mee, we kijken of het bestaat 
                await _userManager.AddToRoleAsync(user, role);

                return Ok();
            }

            foreach (var error in result.Errors)
            {
                ModelState.AddModelError(error.Code, error.Description);
            }

            return BadRequest(ModelState);
        }

        [HttpPost("token")]
        public async Task<IActionResult> CreateToken([FromBody] LoginModel model)
        {
            var user = await _userManager.FindByNameAsync(model.Email);
            if (user == null) return Unauthorized();

            if (_passwordhasher.VerifyHashedPassword(user, user.PasswordHash, model.Password) !=
                PasswordVerificationResult.Success)
            {
                return Unauthorized(); //omdat de wachtwoord niet klopt
            }

            var token = await CreateJwtToken(user);
            return Ok(token);
        }

        private async Task<string> CreateJwtToken(User user)
        {
            var claims = await _userManager.GetClaimsAsync(user);
            claims.Add(new Claim(JwtRegisteredClaimNames.NameId, user.Id.ToString()));
            claims.Add(new Claim(JwtRegisteredClaimNames.Sub, user.UserName));
            claims.Add(new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())); // voor traceerbaarheid
            claims.Add(new Claim(JwtRegisteredClaimNames.Email, user.Email));

            var userRoles =
                await _userManager.GetRolesAsync(user); // alle rollen van users ophalen, lijst van strings komt eruit
            foreach (var role in userRoles)
            {
                claims.Add(new Claim(ClaimTypes.Role, role));
            }

            var keyBytes = Encoding.UTF8.GetBytes(_tokenSettings.Value.Key); //we willen key in byteArray
            var symmetricSecurityKey = new SymmetricSecurityKey(keyBytes);
            var signingCredentials = new SigningCredentials(symmetricSecurityKey, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                _tokenSettings.Value.Issuer,
                _tokenSettings.Value.Audience,
                claims,
                expires: DateTime.UtcNow.AddMinutes(_tokenSettings.Value.ExpirationTimeInMinutes),
                signingCredentials: signingCredentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
            // token binnenpakken signing encryption toepassen & string teruggeven
        }

        private async Task EnsureRoleExists(string roleName)
        {
            if (await _roleManager.RoleExistsAsync(roleName))
                return; // als role bestaat dan doen we niets anders maken we het aan

            await _roleManager.CreateAsync(new Role
            {
                Name = roleName,
                NormalizedName = roleName.ToUpper()
            });
        }
    }
}