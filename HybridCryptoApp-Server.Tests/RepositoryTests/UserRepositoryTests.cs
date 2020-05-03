using System.Linq;
using HybridCryptoApp_Server.Data.Models;
using HybridCryptoApp_Server.Data.Repositories;
using NUnit.Framework;

namespace HybridCryptoApp_Server.Tests.RepositoryTests
{
    [TestFixture]
    public class UserRepositoryTests : DatabaseTests
    {
        private UserRepository userRepository;
        private User ValidUser => new User
        {
            Id = 0,
            Email = "Testy@McTestFace.co.uk",
            NormalizedEmail = "TESTY@MCTESTFACE.CO.UK",
            UserName = "Testy@McTestFace.co.uk",
            NormalizedUserName = "TESTY@MCTESTFACE.CO.UK",
        };

        [SetUp]
        public void SetUp()
        {
            userRepository = new UserRepository(Context);
        }

        [Test]
        public void Add_Should_Add_New_User_To_Context()
        {
            // arrange
            User newUser = ValidUser;
            int beforeCount = Context.Users.Count();

            // act
            userRepository.Add(newUser);
            int afterCount = Context.Users.Count();

            // assert
            Assert.That(afterCount, Is.EqualTo(beforeCount + 1));
        }

        [Test]
        public void Add_Should_Throw_ArgumentException_If_Id_Already_Exists()
        {
            User newUser = ValidUser;
            Context.Users.Add(newUser);
            Context.SaveChanges();

            Assert.That(() => userRepository.Add(newUser), Throws.ArgumentException);
        }

        [Test]
        public void Add_Should_Set_Email_Of_User_In_Context()
        {
            User newUser = ValidUser;
            userRepository.Add(newUser);

            Assert.That(Context.Users.Find(newUser.Id).Email, Is.EqualTo(newUser.Email));
        }

        [Test]
        public void Update_Should_Update_An_Existing_User()
        {
            User existingUser = ValidUser;
            Context.Users.Add(existingUser);
            Context.SaveChanges();

            existingUser.FirstName = "TeŞtFirstName";
            userRepository.Update(existingUser);

            Assert.That(Context.Users.Find(existingUser.Id).FirstName, Is.EqualTo("TeŞtFirstName"));
        }

        [Test]
        public void Update_Should_Throw_ArgumentException_If_Id_Does_Not_Exists()
        {
            User existingUser = ValidUser;
            existingUser.Id = -5;
            Assert.That(() => userRepository.Update(existingUser), Throws.ArgumentException);
        }

        [Test]
        public void Delete_Should_Throw_ArgumentException_If_Id_Does_Not_Exists()
        {
            User existingUser = ValidUser;
            existingUser.Id = -5;
            Assert.That(() => userRepository.Delete(existingUser), Throws.ArgumentException);
        }

        [Test]
        public void Delete_Should_Delete_Existing_User()
        {
            User existingUser = ValidUser;
            Context.Users.Add(existingUser);
            Context.SaveChanges();

            userRepository.Delete(existingUser);

            Assert.That(Context.Users.Find(existingUser.Id), Is.Null);
        }

        [Test]
        public void Get_By_Id_Should_Return_A_User_With_That_Id()
        {
            User existingUser = ValidUser;
            Context.Users.Add(existingUser);
            Context.SaveChanges();

            User foundUser = userRepository.GetById(existingUser.Id);
            Assert.That(foundUser, Is.EqualTo(existingUser));
        }

        [Test]
        public void Get_By_Id_Should_Return_Null_If_No_User_With_Id_Was_Found()
        {
            User foundUser = userRepository.GetById(-5);
            Assert.That(foundUser, Is.Null);
        }
    }
}