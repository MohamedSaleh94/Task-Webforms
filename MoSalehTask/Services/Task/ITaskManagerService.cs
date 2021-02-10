using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MoSalehTask.Models.Enums;
using MoSalehTask.ViewModels;

namespace MoSalehTask.Services.Task
{
    public interface ITaskManagerService
    {
        void Create(TaskViewModel viewModel, string serverPath);
        IEnumerable<TaskViewModel> GetAllTasks();
        IEnumerable<TaskViewModel> GetAllUserTasks(string getUserId);
        TaskViewModel GetById(int parse);
        void UpdateStatus(int parse, Status @new);
        IEnumerable<TaskViewModel> GetAllTasksByStatusOrAssignedTo(Status result, string assignedToSelectedValue);
        void EditTaskByAdmin(int parse, string taskTitleText, string assignedToSelectedValue);
    }
}