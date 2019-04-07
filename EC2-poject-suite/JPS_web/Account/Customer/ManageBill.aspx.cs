using System;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JPS_web.Account.Customer
{
    public partial class ManageBill : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PendingBillsSqlDataSource.ConnectionString = GetConnectionString();
                PendingBillsSqlDataSource.SelectCommand = "SELECT * FROM Bills WHERE Id = '" + User.Identity.Name + "' AND BillStatus = 0";
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
                case "Redirect":
                    //foreach (RepeaterItem item in PendingBillsRepeater.Items)
                    //{
                    //    var lblBill = (Label)PendingBillsRepeater.FindControl("lblAddress");
                    //    var a = lblBill.Text.ToString();

                    //    Response.Redirect("Payment.aspx?BillId=" + a);
                    //}

                    Session.Abandon();
                    Session.Clear();
                    Response.Redirect("Payment.aspx");
                    break;
            }
        }
    }
}