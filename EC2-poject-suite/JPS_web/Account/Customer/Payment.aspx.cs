using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using JPS_web.Models;

namespace JPS_web.Account.Customer
{
    public partial class Payment : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //var t = Request.QueryString["a"];
            //lblTest.Text = t;
        }

        public void PaymentForm_InsertItem()
        {
            var item = new Transaction();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here
                using (JPSContext context = new JPSContext())
                {
                    context.Transactions.Add(item);
                    context.SaveChanges();
                }
            }
        }

        protected void PaymentForm_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("ManageBill.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageBill.aspx");
        }
    }
}