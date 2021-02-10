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

namespace MoSalehTask.UserTask
{
    public partial class Index : UserBasePage
    {
        private readonly ITaskManagerService _taskManagerService;
        private ApplicationUserManager manager;

        public Index()
        {
            _taskManagerService = new TaskManagerService();
            manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGrid1();
                FillGrid2();
            }

        }

        private void FillGrid1()
        {
            GridView1.DataSource = _taskManagerService.GetAllUserTasks(Context?.User?.Identity?.GetUserId()).Select(l =>
                new
                {
                    ID = l.Id,
                    Title = l.Title,
                    AssignedDate = l.AssignedDateStr,
                    AssignedTo = l.UserName,
                    Status = l.StatusStr
                });
            GridView1.DataBind();

        }

        private void FillGrid2()
        {
            GridView2.DataSource = _taskManagerService.GetAllUserTasks(Context?.User?.Identity?.GetUserId())
                .Where(l => l.Status == Status.New && l.AssignedDate.AddDays(3) <= DateTime.Now).Select(l => new
                {
                    Id=l.Id,
                    Title = l.Title,
                    AssignedDate = l.AssignedDateStr,
                    AssignedTo = l.UserName,
                    Status = l.StatusStr
                });
            GridView2.DataBind();

        }
    }
}