using System;
using System.Configuration;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JPS_web.Account.Customer
{
    public partial class ManageBill : Page
    {
        static private float amount;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Pending Bills
                PendingBillsSqlDataSource.ConnectionString = GetConnectionString();
                PendingBillsSqlDataSource.SelectCommand = "SELECT * FROM Bills WHERE Id = '" + User.Identity.Name + "' AND BillStatus = 0";

                // Paid Bills
                BillPaymentHistorySqlDataSource.ConnectionString = GetConnectionString();
                BillPaymentHistorySqlDataSource.SelectCommand = "SELECT * FROM Bills WHERE Id = '" + User.Identity.Name + "' AND BillStatus = 1";
            }
        }
        protected void cusCustom_ServerValidate(object sender, ServerValidateEventArgs e)
        {
            string first_four = e.Value.ToString().Substring(0, 4);

            if ((string.Compare(first_four, "4001") == 0) || (string.Compare(first_four, "9505") == 0))
            {
                e.IsValid = true;
            }
            else
            {
                e.IsValid = false;
            }
        }

        //Get connection string to database
        private string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        }


        protected void PendingBillsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Paybill":
                    if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
                    {
                        string BillAmount = (e.Item.FindControl("LblAmount") as Label).Text;

                        string BillID = (e.Item.FindControl("lblBillID") as Label).Text;

                        lblBillAmount.Text = BillAmount.Substring(0, BillAmount.Length - 7);
                        String val = lblBillAmount.Text.Replace(",", string.Empty);
                        val = val.Replace("$", string.Empty);

                        amount = float.Parse(val);

                        lblBillId.Text = BillID;

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                    }
                    break;
            }
        }

        protected void btnPaybill_Click(object sender, EventArgs e)
        {
            int billID = Convert.ToInt32(lblBillId.Text);
            if (IsValid)
            {
                var first_four_digit = tbcardnum.Text.Substring(0, 4);

                if (first_four_digit == "9505")
                {
                    NCBServiceReference.NCB_ServiceClient client = new NCBServiceReference.NCB_ServiceClient();
                    client.getPayment(amount, Convert.ToInt64(tbcardnum.Text), Convert.ToString(billID));



                    using (JPS_webEntities customer = new JPS_webEntities())
                    {
                        Bill bill = customer.Bills.SingleOrDefault(x => x.BillId == billID);

                        bill.BillStatus = 1;

                        customer.SaveChanges();
                    }
                    Response.Redirect("ManageBill.aspx");
                }
                else if (first_four_digit == "4001")
                {
                    // ASMX Service call here...
                }
            }
        }

        protected void btnCancelPayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageBill.aspx");
        }
    }
}