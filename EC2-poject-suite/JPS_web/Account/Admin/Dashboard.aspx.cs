using JPS_web.Models;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;

namespace JPS_web.Account.Admin
{
    public partial class Dashboard : Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RepeaterData();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control

        public IQueryable<Models.Customer> CurrentCustomersGridView_GetData()
        {
            JPSContext context = new JPSContext();
            IQueryable<Models.Customer> customers = context.Customers;

            return customers;
        }

        public void RepeaterData()
        {
            String strConnString = ConfigurationManager.ConnectionStrings["JPSContext"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                conn.Open();
                cmd = new SqlCommand("Select * from Customers", conn);
                DataSet ds = new DataSet();
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                RepeaterDetails.DataSource = ds;
                RepeaterDetails.DataBind();
            }
        }
    }
}