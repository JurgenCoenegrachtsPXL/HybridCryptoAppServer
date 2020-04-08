using System.Collections.Generic;
using HybridCryptoApp_Server.Data.Models;
using HybridCryptoApp_Server.Data.Repositories;
using NUnit.Framework;
using System.Linq;

namespace HybridCryptoApp_Server.Tests.RepositoryTests
{
    [TestFixture]
    public class UserContactRepositoryTests : DatabaseTests
    {
        private UserContactRepository userContactRepository;
        private User user1;
        private User user2;

        private UserContact ValidUserContact => new UserContact()
        {
            OwnerId = user1.Id,
            ContactId = user2.Id
        };

        [SetUp]
        public void SetUp()
        {
            user1 = new User() { Email = "test@testing.co.uk" };
            user2 = new User() { Email = "test2@testing.com" };

            Context.Users.Add(user1);
            Context.Users.Add(user2);
            Context.SaveChanges();

            userContactRepository = new UserContactRepository(Context);
        }

        [Test]
        public void Add_Should_Add_New_UserContact_To_Context()
        {
            // arrange
            UserContact newUserContact = ValidUserContact;
            int beforeCount = Context.UserContacts.Count();

            // act
            userContactRepository.Add(newUserContact);
            int afterCount = Context.UserContacts.Count();

            // assert
            Assert.That(afterCount, Is.EqualTo(beforeCount + 1));
        }

       

        [Test]
        public void Add_Should_Throw_ArgumentException_If_ContactId_Does_Not_Exist()
        {
            UserContact userContact = ValidUserContact;
            userContact.ContactId = -5;

            Assert.That(() => userContactRepository.Add(userContact), Throws.ArgumentException);
        }

        [Test]
        public void Add_Should_Throw_ArgumentException_If_Combination_Of_Ids_Already_Exists()
        {
            userContactRepository.Add(ValidUserContact);

            Assert.That(() => userContactRepository.Add(ValidUserContact), Throws.ArgumentException);
        }

        [Test]
        public void Update_Should_Always_Throw_ArgumentException()
        {
            Assert.That(() => userContactRepository.Update(ValidUserContact), Throws.ArgumentException);
        }

        [Test]
        public void Delete_Should_Delete_An_Existing_UserContact()
        {
            // arrange
            UserContact userContact = ValidUserContact;
            Context.UserContacts.Add(userContact);
            Context.SaveChanges();
            int before = Context.UserContacts.Count();
            
            // act
            userContactRepository.Delete(userContact);
            int after = Context.UserContacts.Count();

            // assert
            Assert.That(before - 1, Is.EqualTo(after));
        }

        [Test]
        public void Delete_Should_Throw_ArgumentException_If_Combination_Of_Ids_Does_Not()
        {
            UserContact userContact = ValidUserContact;
            userContact.OwnerId = -5;

            Assert.That(() => userContactRepository.Delete(userContact), Throws.ArgumentException);
        }

        [Test]
        public void GetUserContactsOfUser_Should_List_Of_UserContacts_Where_OwnerId_Is_Equal_To_Given_Id()
        {
            UserContact userContact = ValidUserContact;
            Context.UserContacts.Add(userContact);
            Context.SaveChanges();

            List<UserContact> userContactsList = userContactRepository.GetUserContactsOfUser(userContact.OwnerId);
            Assert.That(userContactsList.Count, Is.EqualTo(1));
            Assert.That(userContactsList, Contains.Item(userContact));
        }
    }
}