using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BNS_web.Account.Teller
{
    public partial class Deposit : Page
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
            ddlDeposit.Items.Add(new ListItem("Select Customer Account - (Name Acc# Balance) ", ""));

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
                    ddlDeposit.Items.Add(li);
                }
            }
        }

        protected void btndeposit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Accnum = Convert.ToInt32(ddlDeposit.SelectedValue);

                using (BNS_DBContainer customer = new BNS_DBContainer())
                {
                    Account2 account = customer.Accounts.SingleOrDefault(x => x.AccountNumber == Accnum);
                    account.Balance += Convert.ToDouble(txtamount.Text);

                    // Write Transaction to table
                    Transaction depositTransaction = new Transaction
                    {
                        Amount = Convert.ToDouble(txtamount.Text),
                        Details = "Money was added to account.",
                        Date = Convert.ToString(DateTime.Now),
                        AccountAccountNumber = account.AccountNumber,
                        Type = "Deposit"
                    };
                    customer.Transactions.Add(depositTransaction);
                    customer.SaveChanges();
                }
                lblResult.Visible = true;
                lblResult.Text = "Yay!! Money was deposited successfully.";
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