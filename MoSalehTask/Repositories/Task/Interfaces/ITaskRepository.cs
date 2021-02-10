using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MoSalehTask.Models.Enums;
using MoSalehTask.Repositories.Interfaces;

namespace MoSalehTask.Repositories.Task.Interfaces
{
    public interface ITaskRepository : IRepository<Models.Entities.Task>
    {
        IEnumerable<Models.Entities.Task> GetAllNotDeletedIncludeUser();
        IEnumerable<Models.Entities.Task> GetAllUserTasks(string getUserId);
        Models.Entities.Task GetIncludeUser(int parse);
        IEnumerable<Models.Entities.Task> GetAllTasksByStatusOrAssignedTo(string assignedToSelectedValue, Status result);
    }
}
