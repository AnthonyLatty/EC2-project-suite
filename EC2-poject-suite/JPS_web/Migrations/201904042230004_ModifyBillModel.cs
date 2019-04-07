namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModifyBillModel : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Bills", "Customer_Id", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "Customer_Id" });
            AddColumn("dbo.Bills", "Customer_Id1", c => c.String(maxLength: 128));
            AlterColumn("dbo.Bills", "Customer_Id", c => c.Int(nullable: false));
            CreateIndex("dbo.Bills", "Customer_Id1");
            AddForeignKey("dbo.Bills", "Customer_Id1", "dbo.Customers", "Id");
            DropColumn("dbo.Bills", "CustomerId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Bills", "CustomerId", c => c.Int(nullable: false));
            DropForeignKey("dbo.Bills", "Customer_Id1", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "Customer_Id1" });
            AlterColumn("dbo.Bills", "Customer_Id", c => c.String(maxLength: 128));
            DropColumn("dbo.Bills", "Customer_Id1");
            CreateIndex("dbo.Bills", "Customer_Id");
            AddForeignKey("dbo.Bills", "Customer_Id", "dbo.Customers", "Id");
        }
    }
}
