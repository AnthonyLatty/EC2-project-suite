namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddTransactionTable : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Transactions",
                c => new
                    {
                        BillId = c.Int(nullable: false),
                        CardNumber = c.String(nullable: false, maxLength: 100),
                        CardType = c.Int(nullable: false),
                        Timestamp = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.BillId)
                .ForeignKey("dbo.Bills", t => t.BillId)
                .Index(t => t.BillId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Transactions", "BillId", "dbo.Bills");
            DropIndex("dbo.Transactions", new[] { "BillId" });
            DropTable("dbo.Transactions");
        }
    }
}
