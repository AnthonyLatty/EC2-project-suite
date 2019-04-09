using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCB_web.Teller
{
    public partial class Depsit : System.Web.UI.Page
    {
        public int Accnum;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Binddatareader();
            }
        }
        private void Binddatareader()
        {
            ddlDeposit.Items.Add(new ListItem("--Select Customer Account--(Name Acc# Balance) ", ""));
            ddlDeposit.Items[0].Attributes.CssStyle.Add("font-weight", "bold");
            ddlDeposit.Items[0].Attributes.CssStyle.Add("style", "color:Red");

            String strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                SqlCommand cmd = new SqlCommand("SELECT CAST(Accounts.AccountNumber AS VARCHAR(50)) as ACC, Customers.FirstName +' '+ Customers.LastName + '                 ' +  CAST(Accounts.AccountNumber AS VARCHAR(50))  + '                '+'$'+CAST(Accounts.Balance  AS VARCHAR(25)) as Account FROM Customers INNER JOIN Accounts ON Customers.CustomerID = Accounts.CustomerCustomerID", conn);
                conn.Open();

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    ListItem li = new ListItem(Convert.ToString(rdr["Account"]), Convert.ToString(rdr["ACC"]));
                    ddlDeposit.Items.Add(li);
                }
            }
        }

        protected void btndeposit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Accnum = Convert.ToInt32(ddlDeposit.SelectedValue);

                using (BNS_webEntities1 customer = new BNS_webEntities1())
                {
                    AccountInfo account = customer.AccountInfoes.SingleOrDefault(x => x.AccountNumber == Accnum);

                    account.Balance += Convert.ToDouble(txtamount.Text);

                    customer.SaveChanges();
                }

                lblResult.Text = "Yay!! Money deposited successfully.";
                ClearControls();
            }
        }

        private void ClearControls()
        {
            ddlDeposit.SelectedValue = "";
            txtamount.Text = string.Empty;
        }
    }
}