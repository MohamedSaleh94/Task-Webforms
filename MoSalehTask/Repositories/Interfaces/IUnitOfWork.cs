using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MoSalehTask.Repositories.Task.Interfaces;

namespace MoSalehTask.Repositories.Interfaces
{
    public interface IUnitOfWork : IDisposable
    {
        ITaskRepository TaskRepository { get; }
        int CommitChanges();
    }
}