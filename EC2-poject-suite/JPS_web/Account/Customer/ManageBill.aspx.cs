using JPS_web.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;

namespace JPS_web.Account.Customer
{
    public partial class ManageBill : Page
    {
        private string sqlSyntax;
        private SqlCommand sqlCommand;
        private SqlDataAdapter sqlDataAdapter;
        private DataSet dataSet;

        protected void Page_Load(object sender, EventArgs e)
        {
            GetPendingBills();
        }

        //Get connection string to database
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        }

        //Get Pending Bills by User id and Bill status
        private DataSet GetPendingBills()
        {
            SqlConnection sqlConnection = new SqlConnection(GetConnectionString());
            sqlConnection.Open();

            sqlSyntax = "SELECT * from Bills WHERE CustomerId = '" + User.Identity.Name + "' AND Status = 0";

            sqlCommand = new SqlCommand(sqlSyntax);

            sqlDataAdapter = new SqlDataAdapter(sqlCommand.CommandText, sqlConnection);

            dataSet = new DataSet();

            sqlDataAdapter.Fill(dataSet);


            Console.WriteLine(dataSet);

            sqlConnection.Close();

            return dataSet;
        }
    }
}