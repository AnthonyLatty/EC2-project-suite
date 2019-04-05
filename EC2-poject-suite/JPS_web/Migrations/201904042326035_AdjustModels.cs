namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AdjustModels : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Bills", "Customer_Id1", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "Customer_Id1" });
            DropColumn("dbo.Bills", "Customer_Id");
            RenameColumn(table: "dbo.Bills", name: "Customer_Id1", newName: "Customer_Id");
            AlterColumn("dbo.Bills", "Customer_Id", c => c.String(nullable: false, maxLength: 128));
            AlterColumn("dbo.Bills", "Customer_Id", c => c.String(nullable: false, maxLength: 128));
            CreateIndex("dbo.Bills", "Customer_Id");
            AddForeignKey("dbo.Bills", "Customer_Id", "dbo.Customers", "Id", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Bills", "Customer_Id", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "Customer_Id" });
            AlterColumn("dbo.Bills", "Customer_Id", c => c.String(maxLength: 128));
            AlterColumn("dbo.Bills", "Customer_Id", c => c.Int(nullable: false));
            RenameColumn(table: "dbo.Bills", name: "Customer_Id", newName: "Customer_Id1");
            AddColumn("dbo.Bills", "Customer_Id", c => c.Int(nullable: false));
            CreateIndex("dbo.Bills", "Customer_Id1");
            AddForeignKey("dbo.Bills", "Customer_Id1", "dbo.Customers", "Id");
        }
    }
}
