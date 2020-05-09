using System;
using Microsoft.AspNetCore.Identity;
using Scrypt;

namespace HybridCryptoApp_Server.Services
{
    public class SCryptPasswordHasher<TUser> : IPasswordHasher<TUser> where TUser : class
    {
        private readonly int blockSize;
        private readonly int iterationCount;
        private readonly int threadCount;

        public SCryptPasswordHasher(int blockSize, int iterationCount, int threadCount)
        {
            this.blockSize = blockSize;
            this.iterationCount = iterationCount;
            this.threadCount = threadCount;
        }

        /// <inheritdoc />
        public string HashPassword(TUser user, string password)
        {
            // check input
            if (string.IsNullOrEmpty(password))
            {
                throw new ArgumentException(nameof(password));
            }

            // hash password
            ScryptEncoder scryptEncoder = new ScryptEncoder(iterationCount, blockSize, threadCount);
            return scryptEncoder.Encode(password);
        }

        /// <inheritdoc />
        public PasswordVerificationResult VerifyHashedPassword(TUser user, string hashedPassword, string providedPassword)
        {
            // check inputs
            if (string.IsNullOrEmpty(hashedPassword))
            {
                throw new ArgumentException(nameof(hashedPassword));
            }

            if (string.IsNullOrEmpty(providedPassword))
            {
                throw new ArgumentException(nameof(providedPassword));
            }

            // check password
            ScryptEncoder encoder = new ScryptEncoder();
            bool isValid = encoder.Compare(providedPassword, hashedPassword);

            // return PasswordVerificationResult based on result of check
            if (isValid)
            {
                return PasswordVerificationResult.Success;
            }

            return PasswordVerificationResult.Failed;
        }
    }
}