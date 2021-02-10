using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using MoSalehTask.Data;
using MoSalehTask.Models;

namespace MoSalehTask.Admin
{
    public class AdminBasePage : BasePage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            var currentUserId = Context?.User?.Identity?.GetUserId();
            if (!string.IsNullOrEmpty(currentUserId))
            {
                var userMgr =
                    new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(ApplicationDbContext.Create()));
                if (!userMgr.IsInRole(currentUserId, RoleName.Admin))
                {
                    Response.Redirect("~/Account/NotAuthorized");
                }


            }
            else
            {
                Response.Redirect("~/Account/Login");
            }
        }
    }
}
