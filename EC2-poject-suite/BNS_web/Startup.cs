using System;
using BNS_web.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BNS_web.Startup))]
namespace BNS_web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);

            SeedAdminToDatabase();
        }

        private void SeedAdminToDatabase()
        {
            var context = new ApplicationDbContext();

            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));


            if (!roleManager.RoleExists("Admin"))
            {
                //Create admin role
                var adminRole = new IdentityRole
                {
                    Name = "Admin"
                };

                roleManager.Create(adminRole);

                // Create admin user
                var adminUser = new ApplicationUser
                {
                    UserName = "Admin@scotia.com",
                    Email = "Admin@scotia.com"
                };

                // Use random string for password
                string password = "8fP4MBRRNz3i";

                // Create admin user with password
                var result = UserManager.Create(adminUser, password);

                // Add user to role
                UserManager.AddToRole(adminUser.Id, adminRole.Name);
            }
        }
    }
}
