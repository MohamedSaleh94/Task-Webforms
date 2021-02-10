using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using MoSalehTask.Models.Enums;
using MoSalehTask.Services.Task;
using MoSalehTask.ViewModels;

namespace MoSalehTask.Admin
{
    public partial class Edit : AdminBasePage
    {
        private readonly ITaskManagerService _taskManagerService;
        private ApplicationUserManager manager;

        public Edit()
        {
            _taskManagerService = new TaskManagerService();
            manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillDropDownList();
                string taskId = (Request.QueryString["task"]).ToString();
                if (string.IsNullOrEmpty(taskId))
                {
                    Response.Redirect("~/Admin/Index");
                }

                var task = _taskManagerService.GetById(int.Parse(taskId));
                if (task == null)
                {
                    Response.Redirect("~/Admin/Index");
                }

                TaskTitle.Text = task.Title;
                AssignedTo.Text = task.UserName;
                Description.Text = task.Description;
                if (task.Status == Status.New)
                {
                    Description.Enabled = true;
                }
                else
                {
                    Description.Enabled = false;

                }
            }
        }

        private void FillDropDownList()
        {
            AssignedTo.DataSource = manager.Users.ToList();
            AssignedTo.DataTextField = "UserName";
            AssignedTo.DataValueField = "Id";
            AssignedTo.DataBind();
        }

        protected void EditTask_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TaskTitle.Text))
            {
                string taskId = (Request.QueryString["task"]);
                if (string.IsNullOrEmpty(taskId))
                {
                    Response.Redirect("~/Admin/Index");
                }

                _taskManagerService.EditTaskByAdmin(int.Parse(taskId), TaskTitle.Text, AssignedTo.SelectedValue);
                Response.Redirect("~/Admin/Index");
            }
        }
    }
}