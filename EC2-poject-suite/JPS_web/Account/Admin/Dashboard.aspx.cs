using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web.ModelBinding;
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
        public IQueryable<Bill> CustomerBill_GetData([Control] BillStatus? displayBillStatus)
        {
            JPSContext db = new JPSContext();
            IQueryable<Bill> query = db.Bills.Include("Customer").OrderBy(s => s.BillId);

            if (displayBillStatus != null)
            {
                query = query.Where(s => s.Status == displayBillStatus);
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
    }
}