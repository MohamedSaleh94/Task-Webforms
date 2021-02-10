using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using MoSalehTask.Models;
using MoSalehTask.Repositories.Interfaces;
using MoSalehTask.Services.Core;

namespace MoSalehTask.Repositories
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : BaseModel
    {
        // ReSharper disable once InconsistentNaming
        protected readonly DbContext _context;

        // ReSharper disable once InconsistentNaming
        protected readonly DbSet<TEntity> entities;

        public Repository(DbContext context)
        {
            _context = context;
            entities = _context.Set<TEntity>();
        }

        public TEntity Get(int id)
        {
            return entities.Find(id);
        }

        public IEnumerable<TEntity> GetAll()
        {
            return entities.ToList();
        }

        public IEnumerable<TEntity> GetAllNotDeleted()
        {
            return entities.Where(ww => !ww.IsDeleted).ToList();
        }

        public IEnumerable<TEntity> Find(Expression<Func<TEntity, bool>> predicate)
        {
            return entities.Where(predicate).ToList();
        }

        public TEntity Add(TEntity entity)
        {
            return entities.Add(entity);
        }

        public TEntity Edit(TEntity entity)
        {
            entity.UpdatedDate = DateTime.Now;
            entity.UpdatedByUser = ApplicationUserService.GetUser().Id;
            _context.Entry(entity).State = EntityState.Modified;
            return entity;
        }

        public bool Remove(int id)
        {
            TEntity entity = entities.Find(id);
            if (entity != null)
            {
                entity.UpdatedByUser = ApplicationUserService.GetUser().Id;
                entity.IsDeleted = !entity.IsDeleted;
                entity.UpdatedDate = DateTime.Now;

                _context.Entry(entity).State = EntityState.Modified;

                return true;
            }
            else
            {
                return false;
            }
        }

        public bool IsExist(int id)
        {
            return entities.Any(c => c.Id == id && c.IsDeleted == false);
        }

        public int Count()
        {
            return entities.Where(c => c.IsDeleted == false).ToList().Count;
        }
    }
}