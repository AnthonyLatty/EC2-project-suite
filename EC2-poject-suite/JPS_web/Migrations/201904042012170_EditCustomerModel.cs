namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class EditCustomerModel : DbMigration
    {
        public override void Up()
        {
            RenameTable(name: "dbo.CustomerBills", newName: "Bills");
            CreateTable(
                "dbo.Customers",
                c => new
                    {
                        Id = c.String(nullable: false, maxLength: 128),
                        CustomerId = c.Int(nullable: false, identity: true),
                        PremisesNumber = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.Bills", "Customer_Id", c => c.String(maxLength: 128));
            CreateIndex("dbo.Bills", "Customer_Id");
            AddForeignKey("dbo.Bills", "Customer_Id", "dbo.Customers", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Bills", "Customer_Id", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "Customer_Id" });
            DropColumn("dbo.Bills", "Customer_Id");
            DropTable("dbo.Customers");
            RenameTable(name: "dbo.Bills", newName: "CustomerBills");
        }
    }
}
