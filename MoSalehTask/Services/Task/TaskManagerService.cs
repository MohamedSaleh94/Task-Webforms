using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MoSalehTask.Data;
using MoSalehTask.Models.Enums;
using MoSalehTask.Repositories;
using MoSalehTask.Repositories.Interfaces;
using MoSalehTask.Services.Core;
using MoSalehTask.ViewModels;

namespace MoSalehTask.Services.Task
{
    public class TaskManagerService : ITaskManagerService
    {
        private readonly IUnitOfWork _unitOfWork;

        public TaskManagerService()
        {
            _unitOfWork = new UnitOfWork(new ApplicationDbContext());
        }

        public void Create(TaskViewModel viewModel, string serverPath)
        {
            _unitOfWork.TaskRepository.Add(new Models.Entities.Task()
            {
                Attachment = AttachmentService.CheckFileAbleToSave(viewModel.AttachmentFile)
                    ? AttachmentService.SaveImg(viewModel.AttachmentFile, serverPath, "Task")
                    : null,
                AssignedDate = viewModel.AssignedDate,
                Description = viewModel.Description,
                AssignedToUser = viewModel.AssignedToUser,
                Status = viewModel.Status,
                Title = viewModel.Title,
                Id = viewModel.Id

            });
            _unitOfWork.CommitChanges();
        }

        public IEnumerable<TaskViewModel> GetAllTasks()
        {
            return _unitOfWork.TaskRepository.GetAllNotDeletedIncludeUser().Select(l => l.TaskModelToViewModelTask());
        }

        public IEnumerable<TaskViewModel> GetAllUserTasks(string getUserId)
        {
            return _unitOfWork.TaskRepository.GetAllUserTasks(getUserId).Select(l => l.TaskModelToViewModelTask());
        }

        public TaskViewModel GetById(int parse)
        {
            return _unitOfWork.TaskRepository.GetIncludeUser(parse).TaskModelToViewModelTask();
        }

        public void UpdateStatus(int parse, Status @new)
        {
            var currentTask = _unitOfWork.TaskRepository.Get(parse);
            if (currentTask != null)
            {
                currentTask.Status = @new;
                _unitOfWork.TaskRepository.Edit(currentTask);
                _unitOfWork.CommitChanges();
            }
        }

        public IEnumerable<TaskViewModel> GetAllTasksByStatusOrAssignedTo(Status result, string assignedToSelectedValue)
        {
            return _unitOfWork.TaskRepository.GetAllTasksByStatusOrAssignedTo(assignedToSelectedValue, result)
                .Select(l => l.TaskModelToViewModelTask());
            ;
        }

        public void EditTaskByAdmin(int parse, string taskTitleText, string assignedToSelectedValue)
        {
            var currentTask = _unitOfWork.TaskRepository.Get(parse);
            if (currentTask != null)
            {
                currentTask.Title = taskTitleText;
                if (assignedToSelectedValue != currentTask.AssignedToUser)
                {
                    currentTask.AssignedToUser = assignedToSelectedValue;
                    currentTask.AssignedDate = DateTime.Now;
                }

                _unitOfWork.TaskRepository.Edit(currentTask);
                _unitOfWork.CommitChanges();
            }
        }
    }
}