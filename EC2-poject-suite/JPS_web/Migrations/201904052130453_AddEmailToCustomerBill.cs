namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddEmailToCustomerBill : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Bills", "CustomerId", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "CustomerId" });
            RenameColumn(table: "dbo.Bills", name: "CustomerId", newName: "Customer_Id");
            AddColumn("dbo.Bills", "Email", c => c.String(nullable: false));
            AlterColumn("dbo.Bills", "Customer_Id", c => c.String(maxLength: 128));
            CreateIndex("dbo.Bills", "Customer_Id");
            AddForeignKey("dbo.Bills", "Customer_Id", "dbo.Customers", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Bills", "Customer_Id", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "Customer_Id" });
            AlterColumn("dbo.Bills", "Customer_Id", c => c.String(nullable: false, maxLength: 128));
            DropColumn("dbo.Bills", "Email");
            RenameColumn(table: "dbo.Bills", name: "Customer_Id", newName: "CustomerId");
            CreateIndex("dbo.Bills", "CustomerId");
            AddForeignKey("dbo.Bills", "CustomerId", "dbo.Customers", "Id", cascadeDelete: true);
        }
    }
}
