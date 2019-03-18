using System;
using JPS_web.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(JPS_web.Startup))]
namespace JPS_web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);

            // Create Admin
            CreateAdmin();
        }

        private void CreateAdmin()
        {
            var context = new ApplicationDbContext();

            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));


            if (!roleManager.RoleExists("admin"))
            {
                //Create admin role
                var adminRole = new IdentityRole
                {
                    Name = "admin"
                };

                roleManager.Create(adminRole);

                // Create admin user
                var adminUser = new ApplicationUser
                {
                    UserName = "Admin@jps.com",
                    Email = "Admin@jps.com"
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
