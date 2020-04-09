using System;
using HybridCryptoApp_Server.Data.Models;
using HybridCryptoApp_Server.Data.Repositories.Interfaces;

namespace HybridCryptoApp_Server.Data.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly HybridCryptoAppContext context;

        public UserRepository(HybridCryptoAppContext context)
        {
            this.context = context;
        }

        /// <inheritdoc />
        public User GetById(int userId)
        {
            return context.Users.Find(userId);
        }

        /// <inheritdoc />
        public void Add(User newUser)
        {
            // check if id exists
            if (context.Users.Find(newUser.Id) == null)
            {
                context.Users.Add(newUser);
                context.SaveChanges();
            }
            else
            {
                throw new ArgumentException($"User with {newUser.Id} already exists!");
            }
        }

        /// <inheritdoc />
        public void Update(User existingUser)
        {
            // check if id exists
            if (context.Users.Find(existingUser.Id) != null)
            {
                context.Users.Update(existingUser);
                context.SaveChanges();
            }
            else
            {
                throw new ArgumentException($"No user found with Id {existingUser.Id}");
            }
        }

        /// <inheritdoc />
        public void Delete(User existingUser)
        {
            // check if id exists
            if (context.Users.Find(existingUser.Id) != null)
            {
                context.Users.Remove(existingUser);
                context.SaveChanges();
            }
            else
            {
                throw new ArgumentException($"No user found with Id {existingUser.Id}");
            }
        }
    }
}