using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using MoSalehTask.Services.Task;
using MoSalehTask.ViewModels;

namespace MoSalehTask.UserTask
{
    public partial class Edit : UserBasePage
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
                string taskId = (Request.QueryString["task"]).ToString();
                if (string.IsNullOrEmpty(taskId))
                {
                    Response.Redirect("~/UserTask/Index");
                }

                var task = _taskManagerService.GetById(int.Parse(taskId));
                if (task == null || task.AssignedToUser != Context?.User?.Identity?.GetUserId())
                {
                    Response.Redirect("~/UserTask/Index");
                }

                FillDropDownList();
                TaskTitle.Text = task.Title;
                HyperLink1.NavigateUrl = task.Attachment;
                AssignedTo.Text = task.UserName;
                Description.Text = task.Description;
                Status.Text = task.StatusStr;
                AssignedDate.Text = task.AssignedDateStr;
                if (task.Status != Models.Enums.Status.Complete)
                {
                    EditStatus.Visible = true;
                }
                else
                {

                    EditStatus.Visible = false;
                }


            }
        }

        private void FillDropDownList()
        {
            Status.DataSource = new List<StatusEnum>()
            {
                new StatusEnum()
                {
                    Id = "0", Name = Models.Enums.Status.New.ToString()
                },
                new StatusEnum()
                {
                    Id = "1", Name = Models.Enums.Status.InProgress.ToString()
                },
                new StatusEnum()
                {
                    Id = "2", Name = Models.Enums.Status.Complete.ToString()
                }
            };
            Status.DataTextField = "Name";
            Status.DataValueField = "Id";
            Status.DataBind();
        }

        protected void UpdateTask_Click(object sender, EventArgs e)
        {
            string taskId = (Request.QueryString["task"]).ToString();
            if (string.IsNullOrEmpty(taskId))
            {
                Response.Redirect("~/UserTask/Index");
            }
            var temp = Status.SelectedValue;
            switch (temp)
            {
                case "0":
                    _taskManagerService.UpdateStatus(int.Parse(taskId), Models.Enums.Status.New);
                    break;

                case "1":
                    _taskManagerService.UpdateStatus(int.Parse(taskId), Models.Enums.Status.InProgress);
                    break;

                case "2":
                    _taskManagerService.UpdateStatus(int.Parse(taskId), Models.Enums.Status.Complete);
                    break;
            }
            Response.Redirect("~/UserTask/Index");
        }
    }
}
