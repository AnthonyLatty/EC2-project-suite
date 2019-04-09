using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace NCB_web.WCF_Service
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "NCB_Service" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select NCB_Service.svc or NCB_Service.svc.cs at the Solution Explorer and start debugging.
    public class NCB_Service : INCB_Service
    {
        static int accountNum;
        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        
        public void getPayment(float amount, long cardNumber)
        {



            SqlConnection sqlConnection = new SqlConnection(ConnectionString);

            string qry = "Select AccountAccountNumber from CardNumbers where CardNum='" + cardNumber + "'";

            sqlConnection.Open();

            SqlCommand cmd = new SqlCommand(qry, sqlConnection);

            SqlDataReader reader;

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                accountNum = reader.GetInt32(0);
            }

          
           
           using (BNS_webEntities1 customer = new BNS_webEntities1())

            {
                AccountInfo account = customer.AccountInfoes.SingleOrDefault(x => x.AccountNumber == accountNum);
                account.Balance = account.Balance - amount;
                customer.SaveChanges();
            }



            }

    }
}
