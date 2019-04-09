using JPS_web.Models;
using System;
using System.Data;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JPS_web.Account.Admin
{
    public partial class AddCustomerBill : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void AddBillForm_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }



        protected void Submit_Click(object sender, EventArgs e)
        {
            DateTime dateTime = DateTime.UtcNow.Date;
            string ConnectionString;
            SqlConnection cnn;

            ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["JPSContext"].ConnectionString;

            cnn = new SqlConnection(ConnectionString);

            cnn.Open();

            SqlCommand command;
            SqlDataAdapter adapter = new SqlDataAdapter();
            String sql = "";

            sql = "Insert into bills(BillStatus,BillGenerationDate,BillDueDate,Amount,Address,Id,PremisesNumber) values('" + Convert.ToInt32(billStatus.SelectedValue) + "','" + DateTime.Today + "','" + Convert.ToDateTime(DatePicker.MyText) + "','" + Convert.ToDecimal(tbamount.Text) + "','" + tbAddress.Text + "','" + CusEmail.SelectedItem.Text + "', '" + CusEmail.SelectedValue + "')";


        command = new SqlCommand(sql, cnn);
            adapter.InsertCommand = new SqlCommand(sql, cnn);
            adapter.InsertCommand.ExecuteNonQuery();

         command.Dispose(); 
		cnn.Close();
    
           Response.Redirect("Dashboard.aspx");
        }
    }
}