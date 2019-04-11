using System;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Services;

namespace BNS_web.WebService
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class BNS_Service : System.Web.Services.WebService
    {
        static int accountNum;
        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;


        [WebMethod]
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

            using (BNS_DBContainer customer = new BNS_DBContainer())
            {
                Account2 account = customer.Accounts.SingleOrDefault(x => x.AccountNumber == accountNum);
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

        [WebMethod]
        private void TransferFunds(float amount, string billID)
        {
            using (BNS_DBContainer jpsAccount = new BNS_DBContainer())
            {
                Account2 accountInfo = jpsAccount.Accounts.SingleOrDefault(a => a.AccountNumber == 9190002);
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
