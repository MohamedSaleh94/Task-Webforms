using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using MoSalehTask.Data;
using MoSalehTask.Models;
using Owin;


[assembly: OwinStartupAttribute(typeof(MoSalehTask.Startup))]

namespace MoSalehTask
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            CreateRoles("admin");
            CreateRoles("user");
            //users
            CreateUser("admin", "admin@gmail.com", "KKsa123+45", "admin");
            CreateUser("user1", "user1@gmail.com", "KKsa123+45", "user");
            CreateUser("user2", "user2@gmail.com", "KKsa123+45", "user");
            CreateUser("user3", "user3@gmail.com", "KKsa123+45", "user");
            CreateUser("user4", "user4@gmail.com", "KKsa123+45", "user");
            CreateUser("user5", "user5@gmail.com", "KKsa123+45", "user");

        }

        private void CreateRoles(string roleName)
        {
            using (var db = new ApplicationDbContext())
            {
                RoleStore<IdentityRole> roleStore = new RoleStore<IdentityRole>(db);
                RoleManager<IdentityRole> roleManager = new RoleManager<IdentityRole>(roleStore);

                IdentityRole role;

                if (!roleManager.RoleExists(roleName))
                {
                    role = new IdentityRole
                    {
                        Name = roleName
                    };
                    roleManager.Create(role);
                }
            }
        }

        private void CreateUser(string username, string email, string password, string role)
        {
            using (var db = new ApplicationDbContext())
            {
                UserStore<ApplicationUser> userStore = new UserStore<ApplicationUser>(db);
                UserManager<ApplicationUser> userManager = new UserManager<ApplicationUser>(userStore);
                ApplicationUser user = new ApplicationUser() {UserName = username, Email = email};
                IdentityResult result = userManager.Create(user, password);
                if (result.Succeeded)
                {
                    userManager.AddToRole(user.Id, role);
                }
            }

        }
    }
}