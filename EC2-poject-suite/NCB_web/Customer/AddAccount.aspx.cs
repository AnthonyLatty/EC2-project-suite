using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using NCB_web.Models;
using System;
using System.Configuration;
using System.Data;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Web.UI;

namespace NCB_web.Customer
{
    public partial class AddAccount : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ApplicationDbContext context = new ApplicationDbContext();
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            ApplicationUser currentUser = UserManager.FindById(User.Identity.GetUserId());

            AccountInfo account = new AccountInfo
            {
                AccountType_AccountTID = Convert.ToInt32(DDacc.SelectedValue),
                Balance = 0.00,
                CustomerCustomerID = currentUser.Id
            };
            BNS_webEntities1 customer = new BNS_webEntities1();
            customer.AccountInfoes.Add(account);

            try
            {
                // Your code...
                // Could also be before try if you know the exception occurs in SaveChanges
                customer.SaveChanges();
                String strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(@strConnString);
                SqlCommand cmd = new SqlCommand("cardInsert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("card", account.AccountNumber);
                
                con.Open();
                int k = cmd.ExecuteNonQuery();
                
                con.Close();
            }
            catch (DbEntityValidationException x)
            {
                foreach (var eve in x.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }
            Response.Redirect("Transactions.aspx");
        }
    }
}