namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddBillTable : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Bills",
                c => new
                    {
                        BillId = c.Int(nullable: false, identity: true),
                        Id = c.String(nullable: false, maxLength: 128),
                        BillGenerationDate = c.DateTime(nullable: false),
                        BillDueDate = c.DateTime(nullable: false),
                        PremisesNumber = c.Int(nullable: false),
                        BillStatus = c.Int(nullable: false),
                        Address = c.String(nullable: false, maxLength: 100),
                        Amount = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.BillId)
                .ForeignKey("dbo.Customers", t => t.Id, cascadeDelete: true)
                .Index(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Bills", "Id", "dbo.Customers");
            DropIndex("dbo.Bills", new[] { "Id" });
            DropTable("dbo.Bills");
        }
    }
}
