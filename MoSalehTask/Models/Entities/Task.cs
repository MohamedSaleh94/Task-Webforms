using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using MoSalehTask.Models.Enums;
using MoSalehTask.Services.Core;

namespace MoSalehTask.Models.Entities
{
    [Table("Task")]
    public class Task : BaseModel
    {
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
        [DataType(DataType.Date)]
        public DateTime AssignedDate { get; set; }

        public string Attachment { get; set; }
        [ForeignKey("AssignedTo")] public string AssignedToUser { get; set; }

        public ApplicationUser AssignedTo { get; set; }
        public string Title { get; set; }
        [DataType(DataType.MultilineText)] public string Description { get; set; }
        public Status Status { get; set; } = Status.New;
    }
}