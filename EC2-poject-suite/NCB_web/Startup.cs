using System;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using NCB_web.Models;
using Owin;

[assembly: OwinStartupAttribute(typeof(NCB_web.Startup))]
namespace NCB_web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);

            CreateNCBAdmin();
        }

        private void CreateNCBAdmin()
        {
            var context = new ApplicationDbContext();

            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));


            if (!roleManager.RoleExists("Administrator"))
            {
                //Create admin role
                var adminRole = new IdentityRole
                {
                    Name = "Administrator"
                };

                roleManager.Create(adminRole);

                // Create admin user
                var adminUser = new ApplicationUser
                {
                    UserName = "Admin@ncb.com",
                    Email = "Admin@ncb.com"
                };

                // Use random string for password
                string password = "KsemwQf765UO";

                // Create admin user with password
                var result = UserManager.Create(adminUser, password);

                // Add user to role
                UserManager.AddToRole(adminUser.Id, adminRole.Name);
            }
        }
    }
}
