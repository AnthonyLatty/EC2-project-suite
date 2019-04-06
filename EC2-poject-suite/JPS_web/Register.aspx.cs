using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using JPS_web.Models;
using Microsoft.AspNet.Identity.Owin;

namespace JPS_web.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            // Create role
            var roleStore = new RoleStore<IdentityRole>();
            var roleManager = new RoleManager<IdentityRole>(roleStore);
            if (!roleManager.RoleExists("Customer"))
            {
                roleManager.Create(new IdentityRole("Customer"));
            }

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            // Assign user to role
            if (!manager.IsInRole(manager.FindByEmail(user.Email).Id, "Customer"))
            {
                manager.AddToRole(manager.FindByEmail(user.Email).Id, "Customer");
            }

            if (result.Succeeded)
            {
                Models.Customer customer = new Models.Customer
                {
                    Id = Email.Text,
                    UserName = UserName.Text,
                    PremisesNumber = PremisesNumber.Text
                };

                var jPSContext = new JPSContext();
                jPSContext.Customers.Add(customer);
                jPSContext.SaveChanges();

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }

        }
    }
}