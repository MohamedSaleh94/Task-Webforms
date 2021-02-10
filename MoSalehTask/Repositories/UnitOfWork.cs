using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using MoSalehTask.Repositories.Interfaces;
using MoSalehTask.Repositories.Task.Interfaces;
using MoSalehTask.Repositories.Task.Repository;

namespace MoSalehTask.Repositories
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly DbContext _context;

        public UnitOfWork(DbContext context)
        {
            _context = context;
            TaskRepository = new TaskRepository(_context);
        }

        public ITaskRepository TaskRepository { get; private set; }

        public int CommitChanges()
        {
            return _context.SaveChanges();
        }

        public void Dispose()
        {
            _context.Dispose();
        }
    }
}