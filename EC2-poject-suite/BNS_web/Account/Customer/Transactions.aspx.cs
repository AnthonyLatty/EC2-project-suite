using BNS_web.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BNS_web.Account.Customers
{
    public partial class Transactions : Page
    {
        public static int transid;
        readonly string strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        SqlCommand sqlCommand;
        SqlDataAdapter sqlDataAdapter;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RepeterData();
            }
        }
        public void RepeterData()
        {
            ApplicationDbContext context = new ApplicationDbContext();
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            ApplicationUser currentUser = UserManager.FindById(User.Identity.GetUserId());
            String strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            if (currentUser != null)
            {
                string id = Convert.ToString(currentUser.Id);
                using (SqlConnection conn = new SqlConnection(strConnString))
                {
                    conn.Open();
                    sqlCommand = new SqlCommand("SELECT Accounts.AccountNumber AS acc, Accounts.Balance as balance, AccountTypes.AccountName as actype, Accounts.CustomerCustomerID FROM Accounts INNER JOIN Customers ON Accounts.CustomerCustomerID = Customers.CustomerID INNER JOIN AccountTypes ON Accounts.AccountType_AccountTID = AccountTypes.AccountTID WHERE(Customers.CustomerID = '" + id + "')", conn);
                    DataSet ds = new DataSet();
                    sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                    sqlDataAdapter.Fill(ds);
                    RepterDetails.DataSource = ds;
                    RepterDetails.DataBind();
                }
            }
        }

        protected void RepterDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "cmd_trans")
            {
                transid = Convert.ToInt32(e.CommandArgument);
                RepeaterData();
            }
        }
        public void RepeaterData()
        {
            String strConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                conn.Open();
                sqlCommand = new SqlCommand("Select Customers.FirstName +' '+ Customers.LastName as fullname, Accounts.AccountNumber as accnum, Transactions.Amount as amount, Transactions.Details as details,Transactions.Type as Type, Transactions.Date as date FROM Transactions INNER JOIN Accounts ON Transactions.AccountAccountNumber = Accounts.AccountNumber INNER JOIN Customers ON Accounts.CustomerCustomerID = Customers.CustomerID where( Transactions.AccountAccountNumber='" + transid + "')", conn);
                DataSet ds = new DataSet();
                sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                sqlDataAdapter.Fill(ds);
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
            }
        }

        protected string FormatColorRow(string accountType)
        {
            if (accountType.TrimEnd() == "Deposit")
            {
                return "style = 'background-color:green' ";
            }
            else
            {
                return "style = 'background-color:red' ";
            }
        }
    }
}