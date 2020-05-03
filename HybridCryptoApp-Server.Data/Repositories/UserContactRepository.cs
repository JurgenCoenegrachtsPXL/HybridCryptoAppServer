using System;
using System.Collections.Generic;
using System.Linq;
using HybridCryptoApp_Server.Data.Models;
using HybridCryptoApp_Server.Data.Repositories.Interfaces;

namespace HybridCryptoApp_Server.Data.Repositories
{
    public class UserContactRepository : IUserContactRepository
    {
        private readonly HybridCryptoAppContext context;

        public UserContactRepository(HybridCryptoAppContext context)
        {
            this.context = context;
        }

        /// <inheritdoc />
        public List<UserContact> GetUserContactsOfUser(int ownerId)
        {
            return context.UserContacts.Where(u => u.OwnerId == ownerId).ToList();
        }

        /// <inheritdoc />
        public void Add(UserContact newUserContact)
        {
            if(context.Users.Find(newUserContact.OwnerId) != null && context.Users.Find(newUserContact.ContactId) != null)
            {
                // check if id exists
                if (context.UserContacts.Find(newUserContact.OwnerId, newUserContact.ContactId) == null)
                {
                    context.UserContacts.Add(newUserContact);
                    context.SaveChanges();
                }
                else
                {
                    throw new ArgumentException($"Usercontact with ownerId: {newUserContact.OwnerId} and contactId: {newUserContact.ContactId} already exists!");
                }
            }
            else
            {
                throw new ArgumentException($"User with id: {newUserContact.OwnerId} and/or id: {newUserContact.ContactId} does not exist!");
            }
        }

        /// <inheritdoc />
        public void Update(UserContact existingItem)
        {
            throw new ArgumentException("Update is not possible for UserContacts.");
        }

        /// <inheritdoc />
        public void Delete(UserContact existingItem)
        {
            // check if id exists
            UserContact foundContact = context.UserContacts.Find(existingItem.OwnerId, existingItem.ContactId);
            if (foundContact != null)
            {
                foundContact = context.Entry(foundContact).Entity;

                context.UserContacts.Remove(foundContact);
                context.SaveChanges();
            }
            else
            {
                throw new ArgumentException($"No UserContact found with ownerId: {existingItem.OwnerId} and contactId: {existingItem.ContactId} !");
            }
        }
    }
}