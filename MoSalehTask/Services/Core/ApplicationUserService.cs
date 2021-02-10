using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using MoSalehTask.Models;

namespace MoSalehTask.Services.Core
{
    public static class ApplicationUserService
    {
        public static ApplicationUser GetUser()
        {
            return HttpContext.Current.GetOwinContext()
                .GetUserManager<ApplicationUserManager>()
                .FindById(HttpContext.Current.User.Identity.GetUserId());
        }
    }
}