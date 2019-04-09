using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCB_web.Teller
{
    public partial class Withdraw : Page
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
            ddlWithdraw.Items.Add(new ListItem("Select Customer Account - (Name Acc# Balance) ", ""));

            var strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                var sqlSyntax = "SELECT CAST(Accounts.AccountNumber AS VARCHAR(50)) as ACC, Customers.FirstName +' '+ Customers.LastName + '                 ' +  CAST(Accounts.AccountNumber AS VARCHAR(50))  + '                '+'$'+CAST(Accounts.Balance  AS VARCHAR(25)) as Account FROM Customers INNER JOIN Accounts ON Customers.CustomerID = Accounts.CustomerCustomerID";
                SqlCommand cmd = new SqlCommand(sqlSyntax, conn);
                conn.Open();

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    ListItem li = new ListItem(Convert.ToString(rdr["Account"]), Convert.ToString(rdr["ACC"]));
                    ddlWithdraw.Items.Add(li);
                }
            }
        }

        protected void btndeposit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Accnum = Convert.ToInt32(ddlWithdraw.SelectedValue);

                using (BNS_webEntities1 customer = new BNS_webEntities1())
                {
                    AccountInfo account = customer.AccountInfoes.SingleOrDefault(x => x.AccountNumber == Accnum);
                    account.Balance = account.Balance - Convert.ToDouble(txtamount.Text);

                    //Transaction transaction = customer.Transactions.SingleOrDefault(a => a.TransID == Accnum);

                    customer.SaveChanges();


                }

                lblResult.Visible = true;
                lblResult.Text = "Yay!! Money was withdrawed successfully.";
                ClearControls();
            }
        }

        private void ClearControls()
        {
            ddlWithdraw.SelectedValue = "";
            txtamount.Text = string.Empty;
        }
    }
}