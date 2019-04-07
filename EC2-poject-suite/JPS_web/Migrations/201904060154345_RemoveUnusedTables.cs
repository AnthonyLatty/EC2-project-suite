namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class RemoveUnusedTables : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Bills", "CustomerId", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "CustomerId" });
            DropTable("dbo.Bills");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.Bills",
                c => new
                    {
                        BillId = c.Int(nullable: false, identity: true),
                        BillGenerationDate = c.DateTime(nullable: false),
                        BillDueDate = c.DateTime(nullable: false),
                        CustomerId = c.String(nullable: false, maxLength: 128),
                        PremisesNumber = c.Int(nullable: false),
                        Status = c.Int(nullable: false),
                        Address = c.String(nullable: false, maxLength: 100),
                        Amount = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.BillId);
            
            CreateIndex("dbo.Bills", "CustomerId");
            AddForeignKey("dbo.Bills", "CustomerId", "dbo.Customers", "Id", cascadeDelete: true);
        }
    }
}
