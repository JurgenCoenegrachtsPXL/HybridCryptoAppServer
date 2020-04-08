using HybridCryptoApp_Server.Data.Models;

namespace HybridCryptoApp_Server.Data.Repositories.Interfaces
{
    public interface IUserRepository : IBaseRepository<User>
    {
        User GetById(int userId);
    }
}