using JPS_web.Models;
using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web.ModelBinding;
using System.Web.UI;

namespace JPS_web.Account.Admin
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
        public IQueryable<Bill> CustomerBill_GetData([Control] BillStatus? displayBillStatus)
        {
            JPSContext db = new JPSContext();
            IQueryable<Bill> query = db.Bills.OrderBy(a => a.BillId);

            if (displayBillStatus != null)
            {
                query = query.Where(s => s.BillStatus == displayBillStatus);
            }

            return query;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void CustomerBill_UpdateItem(int billId)
        {
            var db = new JPSContext();
            Bill item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            item = db.Bills.Find(billId);
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

            var item = new Bill { BillId = billId };
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

       
        public IQueryable<Models.Customer> CurrentCustomersGridView_GetData()
        {
            JPSContext context = new JPSContext();
            IQueryable<Models.Customer> customers = context.Customers;

            return customers;
        }
    }
}