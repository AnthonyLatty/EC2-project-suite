using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web.UI;
using JPS_web.Models;

namespace JPS_web.Account.Admin
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void CustomerBill_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<CustomerBill> CustomerBill_GetData()
        {
            JPSContext db = new JPSContext();
            var query = db.CustomerBills;
            return query;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void CustomerBill_UpdateItem(int billId)
        {
            var db = new JPSContext();
            CustomerBill item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            item = db.CustomerBills.Find(billId);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", string.Format("Item with id {0} was not found", billId));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes
                db.SaveChanges();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void CustomerBill_DeleteItem(int billId)
        {
            var db = new JPSContext();

            var item = new CustomerBill { BillId = billId };
            db.Entry(item).State = EntityState.Deleted;
            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                ModelState.AddModelError("", string.Format("Item with id {0} no longer exists in the database.", billId));
            }
        }
    }
}