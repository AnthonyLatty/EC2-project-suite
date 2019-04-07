using JPS_web.Models;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JPS_web.Account.Admin
{
    public partial class AddCustomerBill : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void AddBillForm_InsertItem()
        {
            var item = new Bill();

            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here
                using (JPSContext db = new JPSContext())
                {
                    db.Bills.Add(item);
                    db.SaveChanges();
                }
            }
        }

        protected void AddBillForm_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}