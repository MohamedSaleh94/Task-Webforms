using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using MoSalehTask.Models.Enums;
using MoSalehTask.Repositories.Task.Interfaces;

namespace MoSalehTask.Repositories.Task.Repository
{
    public class TaskRepository : Repository<Models.Entities.Task>, ITaskRepository
    {
        public TaskRepository(DbContext context) : base(context)
        {
        }


        public IEnumerable<Models.Entities.Task> GetAllNotDeletedIncludeUser()
        {
            return entities.Include(l => l.AssignedTo).Where(l => !l.IsDeleted).ToList();
        }

        public IEnumerable<Models.Entities.Task> GetAllUserTasks(string getUserId)
        {
            return entities.Include(l => l.AssignedTo)
                .Where(l => !l.IsDeleted && l.Status != Status.Complete && l.AssignedToUser == getUserId).ToList();
        }

        public Models.Entities.Task GetIncludeUser(int parse)
        {
            return entities.Include(l => l.AssignedTo).FirstOrDefault(l => l.Id == parse && !l.IsDeleted);
        }

        public IEnumerable<Models.Entities.Task> GetAllTasksByStatusOrAssignedTo(string assignedToSelectedValue,
            Status result)
        {
            return entities.Include(l => l.AssignedTo).Where(l => !l.IsDeleted && (
                l.Status == result ||
                l.AssignedToUser == assignedToSelectedValue
            )).ToList();
        }
    }
}