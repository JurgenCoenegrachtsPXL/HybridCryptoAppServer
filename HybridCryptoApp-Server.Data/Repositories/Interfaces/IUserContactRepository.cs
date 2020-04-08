using System.Collections.Generic;
using HybridCryptoApp_Server.Data.Models;

namespace HybridCryptoApp_Server.Data.Repositories.Interfaces
{
    public interface IUserContactRepository : IBaseRepository<UserContact>
    {
        List<UserContact> GetUserContactsOfUser(int ownerId);
    }
}