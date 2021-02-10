using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity.Owin;
using MoSalehTask.Services.Task;
using MoSalehTask.ViewModels;

namespace MoSalehTask.Admin
{
    public partial class Search : AdminBasePage
    {
        private readonly ITaskManagerService _taskManagerService;
        private ApplicationUserManager manager;

        public Search()
        {
            _taskManagerService = new TaskManagerService();
            manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillStatusDropDownList();
                FillUserDropDownList();

            }
        }

        private void FillUserDropDownList()
        {
            AssignedTo.DataSource = manager.Users.ToList();
            AssignedTo.DataTextField = "UserName";
            AssignedTo.DataValueField = "Id";
            AssignedTo.DataBind();
        }

        private void FillStatusDropDownList()
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

        protected void Search_Click(object sender, EventArgs e)
        {
            FillGrid(Status.SelectedValue, AssignedTo.SelectedValue);
        }

        private void FillGrid(string statusSelectedValue, string assignedToSelectedValue)
        {
            Enum.TryParse<Models.Enums.Status>(statusSelectedValue, out var status);
            GridView1.DataSource = _taskManagerService
                .GetAllTasksByStatusOrAssignedTo(status,
                    assignedToSelectedValue).Select(l => new
                {
                    ID = l.Id,
                    Title = l.Title,
                    AssignedDate = l.AssignedDateStr,
                    AssignedTo = l.UserName,
                    Status = l.StatusStr
                });
            GridView1.DataBind();
        }
    }
}
