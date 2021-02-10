using System;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity.Owin;
using MoSalehTask.Services.Task;

namespace MoSalehTask.Admin
{
    public partial class Index : AdminBasePage
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
                FillGrid();
            }

        }
        private void FillGrid()
        {
            GridView1.DataSource = _taskManagerService.GetAllTasks().Select(l=>new
            {
                Title=l.Title,
                AssignedDate=l.AssignedDateStr,
                AssignedTo=l.UserName,
                Status=l.StatusStr
            });
            GridView1.DataBind();

        }
        
    }
}