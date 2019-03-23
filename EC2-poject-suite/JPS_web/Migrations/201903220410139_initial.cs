namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CustomerBills",
                c => new
                    {
                        BillId = c.Int(nullable: false, identity: true),
                        BillGenerationDate = c.DateTime(nullable: false),
                        BillDueDate = c.DateTime(nullable: false),
                        PremisesNumber = c.Int(nullable: false),
                        CustomerId = c.Int(nullable: false),
                        Address = c.String(nullable: false, maxLength: 100),
                        Amount = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.BillId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.CustomerBills");
        }
    }
}
