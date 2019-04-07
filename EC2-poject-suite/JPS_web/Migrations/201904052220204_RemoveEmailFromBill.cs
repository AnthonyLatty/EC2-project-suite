namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class RemoveEmailFromBill : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Bills", "Customer_Id", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "Customer_Id" });
            RenameColumn(table: "dbo.Bills", name: "Customer_Id", newName: "CustomerId");
            AlterColumn("dbo.Bills", "CustomerId", c => c.String(nullable: false, maxLength: 128));
            CreateIndex("dbo.Bills", "CustomerId");
            AddForeignKey("dbo.Bills", "CustomerId", "dbo.Customers", "Id", cascadeDelete: true);
            DropColumn("dbo.Bills", "Email");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Bills", "Email", c => c.String(nullable: false));
            DropForeignKey("dbo.Bills", "CustomerId", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "CustomerId" });
            AlterColumn("dbo.Bills", "CustomerId", c => c.String(maxLength: 128));
            RenameColumn(table: "dbo.Bills", name: "CustomerId", newName: "Customer_Id");
            CreateIndex("dbo.Bills", "Customer_Id");
            AddForeignKey("dbo.Bills", "Customer_Id", "dbo.Customers", "Id");
        }
    }
}
