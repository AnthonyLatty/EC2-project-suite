using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCB_web.Teller
{
    public partial class ViewTransactions : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
         DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RepeterData();
            }
        }

        public void RepeterData()
        {
            String strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(strConnString))
            {

                conn.Open();
                cmd = new SqlCommand("Select Customers.FirstName +' '+ Customers.LastName as fullname, Accounts.AccountNumber as accnum, Transactions.Amount as amount, Transactions.Details as details, Transactions.Date as date FROM Transactions INNER JOIN Accounts ON Transactions.AccountAccountNumber = Accounts.AccountNumber INNER JOIN Customers ON Accounts.CustomerCustomerID = Customers.CustomerID", conn);
                DataSet ds = new DataSet();
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                RepterDetails.DataSource = ds;
                RepterDetails.DataBind();
            }
        }
    }
       
   }


