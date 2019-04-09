using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace NCB_web.Teller
{
    public partial class View_Customers : Page
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
                var sqlSyntax = "SELECT CAST(Accounts.AccountNumber AS VARCHAR(50)) as ACC,AccountTypes.AccountName as Atype, Customers.FirstName  +'  '+ Customers.LastName as fullname, Accounts.Balance as balance FROM AccountTypes INNER JOIN Accounts ON AccountTypes.AccountTID = Accounts.AccountType_AccountTID INNER JOIN  Customers ON Accounts.CustomerCustomerID = Customers.CustomerID";
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
