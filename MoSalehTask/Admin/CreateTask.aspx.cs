using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MoSalehTask.Services.Task;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using MoSalehTask.Models.Enums;
using MoSalehTask.ViewModels;

namespace MoSalehTask.Admin
{
    public partial class CreateTask : AdminBasePage
    {
        private readonly ITaskManagerService _taskManagerService;
        private ApplicationUserManager manager;

        public CreateTask()
        {
            _taskManagerService = new TaskManagerService();
            manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillDropDownList();

            }
        }


        private void FillDropDownList()
        {
            AssignedTo.DataSource = manager.Users.ToList();
            AssignedTo.DataTextField = "UserName";
            AssignedTo.DataValueField = "Id";
            AssignedTo.DataBind();
        }

        protected void CreateTask_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TaskTitle.Text))
            {
                _taskManagerService.Create(new TaskViewModel
                {
                    AssignedDate = DateTime.Now,
                    AssignedToUser = AssignedTo.SelectedValue,
                    AttachmentFile = new HttpPostedFileWrapper(Attachment.PostedFile),
                    Description = Description.Text,
                    Status = Status.New,
                    Id = 0,
                    Title = TaskTitle.Text
                }, Server.MapPath("~/Attachments/Task"));
                Response.Redirect("~/Admin/Index");
            }
        }
    }
}