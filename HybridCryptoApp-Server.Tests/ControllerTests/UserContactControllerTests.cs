using System.Collections.Generic;
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
    public class UserContactControllerTests : ServerTests
    {
        private const string AddByIdPath = "/api/UserContact/AddById";
        private const string AddByEmailPath = "/api/UserContact/AddByEmail";
        private const string RemovePath = "/api/UserContact/remove";
        private const string GetAllPath = "/api/UserContact/all";

        private User user;

        private UserContactModel ValidUserContactModel => new UserContactModel
        {
            ContactId = user.Id,
            ContactEmail = user.Email
        };

        [SetUp]
        public async Task SetUp()
        {
            UserManager<User> userManager = Server.Host.Services.GetService<UserManager<User>>();
            user = new User
            {
                FirstName = "Hallo",
                LastName = "Test",
                UserName = "user@pxl.be",
                Email = "user@pxl.be"
            };
            await userManager.CreateAsync(user, "ThisIsPassword123");
            string role = Role.RegularUser;
            await EnsureRoleExists(role); // we geven de rol mee, we kijken of het bestaat 
            await userManager.AddToRoleAsync(user, role);

            user = await userManager.FindByEmailAsync(user.Email);

            //User is altijd ingelogd
            await LoginAsExistingUser("user@pxl.be", "ThisIsPassword123");
        }

        [Test]
        public async Task AddById_Should_Add_New_UserContact_To_Context()
        {
            UserContactModel model = ValidUserContactModel;
            int beforeCount = Context.UserContacts.Count();

            await Client.PostAsync(AddByIdPath, Stringify(model));
            int afterCount = Context.UserContacts.Count();
            Assert.That(afterCount, Is.EqualTo(beforeCount + 1));
        }

        [Test]
        public async Task AddById_Should_Return_Ok_If_Contact_Id_Is_An_Existing_User()
        {
            UserContactModel model = ValidUserContactModel;
            
            HttpResponseMessage result = await Client.PostAsync(AddByIdPath, Stringify(model));
            
            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }

        [Test]
        public async Task AddById_Should_Return_Bad_Request_If_ContactId_Is_Not_An_Existing_User()
        {
            UserContactModel model = ValidUserContactModel;
            model.ContactId = -5;

            HttpResponseMessage result = await Client.PostAsync(AddByIdPath, Stringify(model));

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task AddById_Should_Return_Bad_Request_If_UserContact_Already_Exists()
        {
            Context.UserContacts.Add(new UserContact
            {
                ContactId = user.Id,
                OwnerId = user.Id,
            });
            Context.SaveChanges();

            UserContactModel model = ValidUserContactModel;

            HttpResponseMessage result = await Client.PostAsync(AddByIdPath, Stringify(model));

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task AddByEmail_Should_Add_New_UserContact_To_Context()
        {
            UserContactModel model = ValidUserContactModel;
            int beforeCount = Context.UserContacts.Count();

            await Client.PostAsync(AddByEmailPath, Stringify(model));
            int afterCount = Context.UserContacts.Count();
            Assert.That(afterCount, Is.EqualTo(beforeCount + 1));
        }

        [Test]
        public async Task AddByEmail_Should_Return_Ok_If_Contact_Email_Is_An_Existing_User()
        {
            UserContactModel model = ValidUserContactModel;

            HttpResponseMessage result = await Client.PostAsync(AddByEmailPath, Stringify(model));

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }

        [Test]
        public async Task AddByEmail_Should_Return_Bad_Request_If_ContactEmail_Is_Not_An_Existing_User()
        {
            UserContactModel model = ValidUserContactModel;
            model.ContactEmail = model.ContactEmail + "randomTextAndStuffs";

            HttpResponseMessage result = await Client.PostAsync(AddByEmailPath, Stringify(model));

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task AddByEmail_Should_Return_Bad_Request_If_UserContact_Already_Exists()
        {
            Context.UserContacts.Add(new UserContact
            {
                ContactId = user.Id,
                OwnerId = user.Id,
            });
            Context.SaveChanges();

            UserContactModel model = ValidUserContactModel;

            HttpResponseMessage result = await Client.PostAsync(AddByEmailPath, Stringify(model));

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }


        [Test]
        public async Task Remove_Should_Remove_Existing_UserContact_From_Context()
        {
            Context.UserContacts.Add(new UserContact
            {
                ContactId = user.Id,
                OwnerId = user.Id,
            });
            Context.SaveChanges();

            UserContactModel model = ValidUserContactModel;
            int beforeCount = Context.UserContacts.Count();

            await Client.PostAsync(RemovePath, Stringify(model));
            int afterCount = Context.UserContacts.Count();
            Assert.That(afterCount, Is.EqualTo(beforeCount - 1));
        }

        [Test]
        public async Task Remove_Should_Return_Ok_If_Contact_Id_Is_An_Existing_User()
        {
            UserContact userContact = new UserContact
            {
                ContactId = user.Id,
                OwnerId = user.Id,
            };

            Context.UserContacts.Add(userContact);
            Context.SaveChanges();

            UserContactModel model = ValidUserContactModel;
            HttpResponseMessage result = await Client.PostAsync(RemovePath, Stringify(model));
            await result.Content.ReadAsStringAsync();

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }

        [Test]
        public async Task Remove_Should_Return_Bad_Request_If_ContactId_Is_Not_An_Existing_User()
        {
            Context.UserContacts.Add(new UserContact
            {
                ContactId = user.Id,
                OwnerId = user.Id,
            });
            Context.SaveChanges();

            UserContactModel model = ValidUserContactModel;
            model.ContactId = -5;

            HttpResponseMessage result = await Client.PostAsync(RemovePath, Stringify(model));

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task Remove_Should_Return_Bad_Request_If_UserContact_Does_Not_Exists()
        {
            // remove all user contacts
            Context.UserContacts.RemoveRange(Context.UserContacts);

            UserContactModel model = ValidUserContactModel;
            model.ContactId = user.Id;

            HttpResponseMessage result = await Client.PostAsync(RemovePath, Stringify(model));

            Assert.That(result.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }

        [Test]
        public async Task GetAll_Should_Return_Ok()
        {
            HttpResponseMessage response = await Client.GetAsync(GetAllPath);

            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }

        [Test]
        public async Task GetAll_Should_Return_A_List_Of_Contacts()
        {
            HttpResponseMessage response = await Client.GetAsync(GetAllPath);
            string content = await response.Content.ReadAsStringAsync();

            Assert.That(() => JsonConvert.DeserializeObject<List<ContactInformationModel>>(content), Throws.Nothing);
        }

        [Test]
        public async Task GetAll_Should_Return_All_Contacts_Of_Logged_In_User()
        {
            HttpResponseMessage response = await Client.GetAsync(GetAllPath);
            string content = await response.Content.ReadAsStringAsync();
            List<ContactInformationModel> models = JsonConvert.DeserializeObject<List<ContactInformationModel>>(content);

            CollectionAssert.AreEquivalent(Context.UserContacts.Where(u => u.OwnerId == user.Id).Select(u => u.ContactId), models.Select(c => c.Id));
        }
    }
}