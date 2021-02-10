using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using MoSalehTask.Services.Core;

namespace MoSalehTask.Models
{
    public class BaseModel
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Display(Name = "Create Date")] public DateTime CreateDate { get; private set; } = DateTime.Now;

        [Display(Name = "Updated Date")]
        // ReSharper disable once UnusedAutoPropertyAccessor.Global
        public DateTime? UpdatedDate { get; set; }

        [Display(Name = "Is Deleted")]
        // ReSharper disable once RedundantDefaultMemberInitializer
        public bool IsDeleted { get; set; } = false;

        // ReSharper disable once UnusedAutoPropertyAccessor.Global
        [ForeignKey("CreatedBy")] public string CreatedByUser { get; set; } = ApplicationUserService.GetUser()?.Id;

        // ReSharper disable once UnusedAutoPropertyAccessor.Local
        // ReSharper disable once UnusedAutoPropertyAccessor.Global
        public ApplicationUser CreatedBy { get; set; }

        // ReSharper disable once UnusedAutoPropertyAccessor.Global
        [ForeignKey("UpdatedBy")] public string UpdatedByUser { get; set; }

        // ReSharper disable once UnusedAutoPropertyAccessor.Local
        // ReSharper disable once UnusedAutoPropertyAccessor.Global
        public ApplicationUser UpdatedBy { get; set; }
    }
}