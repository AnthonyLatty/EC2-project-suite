namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdateRelationshipBetweenModels : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Bills", "Customer_Id", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "Customer_Id" });
            RenameColumn(table: "dbo.Bills", name: "Customer_Id", newName: "CustomerId");
            DropPrimaryKey("dbo.Customers");
            AlterColumn("dbo.Bills", "CustomerId", c => c.Int(nullable: false));
            AlterColumn("dbo.Customers", "Id", c => c.String());
            AddPrimaryKey("dbo.Customers", "CustomerId");
            CreateIndex("dbo.Bills", "CustomerId");
            AddForeignKey("dbo.Bills", "CustomerId", "dbo.Customers", "CustomerId", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Bills", "CustomerId", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "CustomerId" });
            DropPrimaryKey("dbo.Customers");
            AlterColumn("dbo.Customers", "Id", c => c.String(nullable: false, maxLength: 128));
            AlterColumn("dbo.Bills", "CustomerId", c => c.String(nullable: false, maxLength: 128));
            AddPrimaryKey("dbo.Customers", "Id");
            RenameColumn(table: "dbo.Bills", name: "CustomerId", newName: "Customer_Id");
            CreateIndex("dbo.Bills", "Customer_Id");
            AddForeignKey("dbo.Bills", "Customer_Id", "dbo.Customers", "Id", cascadeDelete: true);
        }
    }
}
