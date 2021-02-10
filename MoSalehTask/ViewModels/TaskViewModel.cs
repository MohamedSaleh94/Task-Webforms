using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using MoSalehTask.Models;
using MoSalehTask.Models.Entities;
using MoSalehTask.Models.Enums;

namespace MoSalehTask.ViewModels
{
    public class TaskViewModel
    {
        public int Id { get; set; }

        [Display(Name = "Assigned Date")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
        [DataType(DataType.Date, ErrorMessageResourceType = typeof(Localization.Shared.Resource),
            ErrorMessageResourceName = "DateValidation")]
        [Required(ErrorMessageResourceType = typeof(Localization.Shared.Resource),
            ErrorMessageResourceName = "RequiredFieldValidation")]
        public DateTime AssignedDate { get; set; }

        public string AssignedDateStr => AssignedDate.ToString("yyyy-MM-dd");

        //
        [Display(Name = "Attachment")] public string Attachment { get; set; }

        //
        [Display(Name = "Assigned To User Id")]
        public string AssignedToUser { get; set; }

        public string UserName => AssignedTo.UserName;

        //
        [Display(Name = "Assigned To")] public ApplicationUser AssignedTo { get; set; }

        //
        [Display(Name = "Title")] [Required] public string Title { get; set; }

        //
        [Display(Name = "Description")]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }

        //
        [Display(Name = "Status")] public Status Status { get; set; }
        public string StatusStr => Status.ToString(); 
        public HttpPostedFileBase AttachmentFile { get; set; }
    }

    public static class ModelToViewModel
    {
        public static TaskViewModel TaskModelToViewModelTask(this Models.Entities.Task task)
        {
            return new TaskViewModel
            {
                AssignedDate = task.AssignedDate,
                AssignedTo = task.AssignedTo,
                AssignedToUser = task.AssignedToUser,
                Attachment = task.Attachment,
                Description = task.Description,
                Id = task.Id,
                Status = task.Status,
                Title = task.Title
            };
        }
    }
}
