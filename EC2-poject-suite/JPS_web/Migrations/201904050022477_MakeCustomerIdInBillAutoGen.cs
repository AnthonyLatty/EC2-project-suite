namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MakeCustomerIdInBillAutoGen : DbMigration
    {
        public override void Up()
        {
            DropIndex("dbo.Bills", new[] { "CustomerId" });
            AlterColumn("dbo.Bills", "CustomerId", c => c.Int(nullable: false, identity: true));
            CreateIndex("dbo.Bills", "CustomerId");
        }
        
        public override void Down()
        {
            DropIndex("dbo.Bills", new[] { "CustomerId" });
            AlterColumn("dbo.Bills", "CustomerId", c => c.Int(nullable: false));
            CreateIndex("dbo.Bills", "CustomerId");
        }
    }
}
