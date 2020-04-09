using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using HybridCryptoApp_Server.Models;
using Newtonsoft.Json;
using NUnit.Framework;

namespace HybridCryptoApp_Server.Tests.ControllerTests
{
    [TestFixture]
    public class AuthenticationController : ServerTests
    {
        private const string RegistrationPath = "/api/Authentication/register";
        private const string LoginPath = "/api/Authentication/token";

        [Test]
        public async Task Register_Should_Return_Ok_If_Model_Is_Valid()
        {
            RegistrationModel registrationModel = new RegistrationModel()
            {
                Email = "test.testAnother@test.test",
                Password = "Test123456"
            };
            
            HttpResponseMessage result = await Client.PostAsync(RegistrationPath, Stringify(registrationModel));
            
            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }

        [Test]
        public async Task Register_With_Password_That_Not_Contains_Upper_Letter_Should_Return_BadRequest()
        {
            RegistrationModel registrationModel = new RegistrationModel()
            {
                Email = "test.tes2t@test.test",
                Password = "test12345"
            };

            HttpResponseMessage result = await Client.PostAsync(RegistrationPath, Stringify(registrationModel));

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task Register_With_Password_That_Not_Contains_8_Characters_Should_Return_BadRequest()
        {
            RegistrationModel registrationModel = new RegistrationModel()
            {
                Email = "test.test3@test.test",
                Password = "Test"
            };

            HttpResponseMessage result = await Client.PostAsync(RegistrationPath, Stringify(registrationModel));

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task Register_With_Password_That_Does_Not_Contains_1_Number_Should_Return_BadRequest()
        {
            RegistrationModel registrationModel = new RegistrationModel()
            {
                Email = "test.test4@test.test",
                Password = "Testtestttt"
            };

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
                Password = password
            }));
        }
    }
}