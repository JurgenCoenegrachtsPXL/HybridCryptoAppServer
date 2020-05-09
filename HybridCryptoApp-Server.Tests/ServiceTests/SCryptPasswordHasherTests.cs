using HybridCryptoApp_Server.Data.Models;
using HybridCryptoApp_Server.Services;
using Microsoft.AspNetCore.Identity;
using NUnit.Framework;

namespace HybridCryptoApp_Server.Tests.ServiceTests
{
    [TestFixture]
    public class SCryptPasswordHasherTests
    {
        private SCryptPasswordHasher<User> hasher;
        private User user;

        private string SecurePassword => "securePassw0rd!";

        [SetUp]
        public void SetUp()
        {
            hasher = new SCryptPasswordHasher<User>(16, 8, 1);
            user = new User();
        }

        [Test]
        public void HashPassword_Should_Return_Non_Empty_String()
        {
            string hashedPassword = hasher.HashPassword(user, SecurePassword);

            Assert.That(hashedPassword, Is.Not.Null.And.Not.Empty);
        }

        [Test]
        public void HashPassword_Should_Return_Output_Differing_From_Password()
        {
            string hashedPassword = hasher.HashPassword(user, SecurePassword);

            Assert.That(hashedPassword, Is.Not.EqualTo(SecurePassword));
        }

        [Test]
        public void HashPassword_Should_Return_Different_Output_For_Different_Users_And_Same_Password()
        {
            User otherUser = new User();

            string hashedPassword1 = hasher.HashPassword(user, SecurePassword);
            string hashedPassword2 = hasher.HashPassword(otherUser, SecurePassword);

            Assert.That(hashedPassword1, Is.Not.EqualTo(hashedPassword2));
        }

        [Test]
        public void HashPassword_Should_Return_Different_Output_For_Same_User_And_Same_Password()
        {
            string hashedPassword1 = hasher.HashPassword(user, SecurePassword);
            string hashedPassword2 = hasher.HashPassword(user, SecurePassword);

            Assert.That(hashedPassword1, Is.Not.EqualTo(hashedPassword2));
        }

        [Test]
        public void HashPassword_Should_Throw_ArgumentException_If_Password_Is_Null()
        {
            Assert.That(() => hasher.HashPassword(user, null), Throws.ArgumentException);
        }

        [Test]
        public void HashPassword_Should_Throw_ArgumentException_If_Password_Is_Empty_String()
        {
            Assert.That(() => hasher.HashPassword(user, string.Empty), Throws.ArgumentException);
        }

        [Test]
        public void VerifyHashedPassword_Should_Return_Success_If_Original_Password_And_ProvidedPassword_Are_Equal()
        {
            // arrange
            string hashedPassword = hasher.HashPassword(user, SecurePassword);

            // act
            PasswordVerificationResult result = hasher.VerifyHashedPassword(user, hashedPassword, SecurePassword);

            // assert
            Assert.That(result, Is.EqualTo(PasswordVerificationResult.Success));
        }

        [Test]
        public void VerifyPassword_Should_Return_Failure_If_ProvidedPassword_Is_Wrong()
        {
            // arrange
            string differentPassword = "dit is geen password";
            string hashedPassword = hasher.HashPassword(user, SecurePassword);

            // act
            PasswordVerificationResult result = hasher.VerifyHashedPassword(user, hashedPassword, differentPassword);

            // assert
            Assert.That(result, Is.EqualTo(PasswordVerificationResult.Failed));
        }

        [Test]
        public void VerifyPassword_Should_Throw_ArgumentException_If_HashedPassword_Is_Null()
        {
            Assert.That(() => hasher.VerifyHashedPassword(user, null, "coolPassword"), Throws.ArgumentException);
        }

        [Test]
        public void VerifyPassword_Should_Throw_ArgumentException_If_HashedPassword_Is_Empty_String()
        {
            Assert.That(() => hasher.VerifyHashedPassword(user, string.Empty, "coolPassword"), Throws.ArgumentException);
        }

        [Test]
        public void VerifyPassword_Should_Throw_ArgumentException_If_ProvidedPassword_Is_Null()
        {
            Assert.That(() => hasher.VerifyHashedPassword(user, "coolPasswordHash", null), Throws.ArgumentException);
        }

        [Test]
        public void VerifyPassword_Should_Throw_ArgumentException_If_ProvidedPassword_Is_Empty_String()
        {
            Assert.That(() => hasher.VerifyHashedPassword(user, "coolPasswordHash", string.Empty), Throws.ArgumentException);
        }
    }
}
