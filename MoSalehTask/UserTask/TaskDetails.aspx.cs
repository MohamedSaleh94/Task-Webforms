using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using MoSalehTask.Services.Task;

namespace MoSalehTask.UserTask
{
    public partial class TaskDetails : UserBasePage
    {
        private readonly ITaskManagerService _taskManagerService;
        private ApplicationUserManager manager;

        public TaskDetails()
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
                if (task == null||task.AssignedToUser!= Context?.User?.Identity?.GetUserId())
                {
                    Response.Redirect("~/UserTask/Index");
                }

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

        protected void EditTask_Click(object sender, EventArgs e)
        {
            string taskId = (Request.QueryString["task"]);
            if (string.IsNullOrEmpty(taskId))
            {
                Response.Redirect("~/UserTask/Index");
            }

            Response.Redirect($"~/UserTask/Edit?task={taskId}");
        }
    }
}