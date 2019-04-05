namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class RemoveCustomerIDField : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Bills", "CustomerId", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "CustomerId" });
            DropPrimaryKey("dbo.Customers");
            AddColumn("dbo.Bills", "Customer_Id", c => c.String(maxLength: 128));
            AlterColumn("dbo.Customers", "Id", c => c.String(nullable: false, maxLength: 128));
            AddPrimaryKey("dbo.Customers", "Id");
            CreateIndex("dbo.Bills", "Customer_Id");
            AddForeignKey("dbo.Bills", "Customer_Id", "dbo.Customers", "Id");
            DropColumn("dbo.Customers", "CustomerId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Customers", "CustomerId", c => c.Int(nullable: false, identity: true));
            DropForeignKey("dbo.Bills", "Customer_Id", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "Customer_Id" });
            DropPrimaryKey("dbo.Customers");
            AlterColumn("dbo.Customers", "Id", c => c.String());
            DropColumn("dbo.Bills", "Customer_Id");
            AddPrimaryKey("dbo.Customers", "CustomerId");
            CreateIndex("dbo.Bills", "CustomerId");
            AddForeignKey("dbo.Bills", "CustomerId", "dbo.Customers", "CustomerId", cascadeDelete: true);
        }
    }
}
