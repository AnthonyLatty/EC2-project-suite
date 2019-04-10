using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace NCB_web.WCF_Service
{
    public class NCB_Service : INCB_Service
    {
        static int accountNum;
        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;


        public void getPayment(float amount, long cardNumber, string billID)
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

                Transaction customerTransaction = new Transaction
                {
                    AccountAccountNumber = account.AccountNumber,
                    Amount = amount,
                    Details = "Payment for JPS Bill " + billID,
                    Type = "",
                    Date = DateTime.Now.ToString()
                };

                TransferFunds(amount, billID);
                customer.SaveChanges();
               
            }
        }

        public void TransferFunds(float amount,string billID)
        {
            using (BNS_webEntities1 jpsAccount = new BNS_webEntities1())
            {
                AccountInfo accountInfo = jpsAccount.AccountInfoes.SingleOrDefault(a => a.AccountNumber == 9190002);
                accountInfo.Balance = accountInfo.Balance + amount;


                Transaction jpsTransaction = new Transaction
                {
                    AccountAccountNumber = accountInfo.AccountNumber,
                    Amount = amount,
                    Details = $"Payment for JPS Bill {billID}",
                    Type = "Deposit",
                    Date = DateTime.Now.ToString()
                };
                jpsAccount.Transactions.Add(jpsTransaction);
                jpsAccount.SaveChanges();
            }
        }
    }
}
