using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace BNS_web.Account.Teller
{
    public partial class ViewTransactions : Page
    {
        SqlCommand sqlCommand;
        SqlDataAdapter dataAdapter;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RepeterData();
            }
        }

        public void RepeterData()
        {
            var strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                conn.Open();
                var sqlSyntax = "Select Customers.FirstName +' '+ Customers.LastName as fullname, Accounts.AccountNumber as accnum, Transactions.Amount as amount, Transactions.Details as details, Transactions.Date as date FROM Transactions INNER JOIN Accounts ON Transactions.AccountAccountNumber = Accounts.AccountNumber INNER JOIN Customers ON Accounts.CustomerCustomerID = Customers.CustomerID";
                sqlCommand = new SqlCommand(sqlSyntax, conn);
                DataSet data = new DataSet();
                dataAdapter = new SqlDataAdapter(sqlCommand);
                dataAdapter.Fill(data);
                RepterDetails.DataSource = data;
                RepterDetails.DataBind();
            }
        }
    }
}