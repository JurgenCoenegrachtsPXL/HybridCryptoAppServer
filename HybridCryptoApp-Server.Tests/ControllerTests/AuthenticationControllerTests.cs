using System.Linq;
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
    public class AuthenticationController : ServerTests
    {
        private static int emailCounter;
        private const string RegistrationPath = "/api/Authentication/register";
        private const string LoginPath = "/api/Authentication/token";
        private const string ChangeKeyPath = "/api/Authentication/changeKey";

        private RegistrationModel ValidRegistrationModel => new RegistrationModel()
        {
            Email = $"emailnumber{emailCounter++}@test.test",
            Password = "SecurePassword1",
            LastName = "last name",
            FirstName = "first",
            PublicKey = "fes4f56se4f56se4f",
        };

        private ChangeKeyModel ValidChangeKeyModel => new ChangeKeyModel()
        {
            NewKey = "thisIsAKeyThereAreManyLikeItButThisOneIsMine",
        };

        [Test]
        public async Task Register_Should_Return_Ok_If_Model_Is_Valid()
        {
            RegistrationModel registrationModel = ValidRegistrationModel;
            
            HttpResponseMessage result = await Client.PostAsync(RegistrationPath, Stringify(registrationModel));
            
            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }

        [Test]
        public async Task Register_With_Password_That_Not_Contains_Upper_Letter_Should_Return_BadRequest()
        {
            RegistrationModel registrationModel = ValidRegistrationModel;
            registrationModel.Password = "test12345";

            HttpResponseMessage result = await Client.PostAsync(RegistrationPath, Stringify(registrationModel));

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task Register_With_Password_That_Not_Contains_8_Characters_Should_Return_BadRequest()
        {
            RegistrationModel registrationModel = ValidRegistrationModel;
            registrationModel.Password = "Test";

            HttpResponseMessage result = await Client.PostAsync(RegistrationPath, Stringify(registrationModel));

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task Register_With_Password_That_Does_Not_Contains_1_Number_Should_Return_BadRequest()
        {
            RegistrationModel registrationModel = ValidRegistrationModel;
            registrationModel.Password = "Testtestttt";

            HttpResponseMessage result = await Client.PostAsync(RegistrationPath, Stringify(registrationModel));

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task Login_Should_Return_Ok_If_Email_And_Password_Are_Valid()
        {
            string email = "test.test17@test.test";
            string password = "Test12345";

            await RegisterUser(email, password);

            LoginModel loginmodel = new LoginModel(){
                Email = email,
                Password = password
            };

            HttpResponseMessage result = await Client.PostAsync(LoginPath, Stringify(loginmodel));

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }

        [Test]
        public async Task Login_Should_Return_A_Token_As_String_If_Email_And_Password_Are_Valid()
        {
            string email = "test.test1@test.test";
            string password = "Test12345";

            await RegisterUser(email, password);

            LoginModel loginmodel = new LoginModel()
            {
                Email = email,
                Password = password
            };

            HttpResponseMessage result = await Client.PostAsync(LoginPath, Stringify(loginmodel));
            string responseMessage = await result.Content.ReadAsStringAsync();

            Assert.That(responseMessage, Is.Not.Empty);
        }

        [Test]
        public async Task Login_Should_Return_Bad_Request_If_Email_Is_Invalid()
        {
            //await RegisterUser("test.test6@test.test", "Test12345");

            LoginModel loginmodel = new LoginModel()
            {
                Email = "test.test.test",
                Password = "Test12345"
            };

            HttpResponseMessage result = await Client.PostAsync(LoginPath, Stringify(loginmodel));

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task Login_Should_Return_Unauthorized_If_No_User_With_Email_Exists()
        {
            // arrange
            await RegisterUser("test2@pxl.be", "Test12345");
            LoginModel loginmodel = new LoginModel()
            {
                Email = "test@pxl.be",
                Password = "Test12345"
            };

            // act
            HttpResponseMessage result = await Client.PostAsync(LoginPath, Stringify(loginmodel));

            // assert
            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.Unauthorized));
        }

        [Test]
        public async Task Login_Should_Return_Unauthorized_If_Password_Is_Wrong()
        {
            // arrange
            await RegisterUser("test2@pxl.be", "Test12345");
            LoginModel loginmodel = new LoginModel()
            {
                Email = "test2@pxl.be",
                Password = "Test123456"
            };

            // act
            HttpResponseMessage result = await Client.PostAsync(LoginPath, Stringify(loginmodel));

            // assert
            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.Unauthorized));
        }

        [Test]
        public async Task ChangeKey_Should_Change_Key_Of_User()
        {
            await RegisterUser("test17@pxl.be", "Test12345");
            await LoginAsExistingUser("test17@pxl.be", "Test12345");

            ChangeKeyModel changeKeyModel = ValidChangeKeyModel;

            await Client.PostAsync(ChangeKeyPath, Stringify(changeKeyModel));

            Assert.That(Context.Users.FirstOrDefault(u => u.Email == "test17@pxl.be")?.PublicKeyXml, Is.EqualTo(changeKeyModel.NewKey));
        }

        [Test]
        public async Task ChangeKey_Should_Return_Ok()
        {
            await RegisterUser("test17@pxl.be", "Test12345");
            await LoginAsExistingUser("test17@pxl.be", "Test12345");

            ChangeKeyModel changeKeyModel = ValidChangeKeyModel;

            HttpResponseMessage response = await Client.PostAsync(ChangeKeyPath, Stringify(changeKeyModel));

            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }

        [Test]
        public async Task ChangeKey_Should_Return_Bad_Request_If_Key_Field_Is_Eloty()
        {
            await RegisterUser("test17@pxl.be", "Test12345");
            await LoginAsExistingUser("test17@pxl.be", "Test12345");

            ChangeKeyModel changeKeyModel = ValidChangeKeyModel;
            changeKeyModel.NewKey = "";

            HttpResponseMessage response = await Client.PostAsync(ChangeKeyPath, Stringify(changeKeyModel));

            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }



        /// <summary>
        /// Create new user with given email and password
        /// </summary>
        /// <param name="email"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        private async Task RegisterUser(string email, string password)
        {
            await Client.PostAsync(RegistrationPath, Stringify(new RegistrationModel()
            {
                Email = email, 
                Password = password,
                FirstName = "newName",
                LastName = "LastNamus",
                PublicKey = "KeyToTheCity",
            }));
        }
    }
}