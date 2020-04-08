namespace HybridCryptoApp_Server.Data.Repositories.Interfaces
{
    public interface IBaseRepository<T>
    {
        void Add(T newItem);

        void Update(T existingItem);

        void Delete(T existingItem);
    }
}