namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddBillStatusColumn : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.CustomerBills", "Status", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.CustomerBills", "Status");
        }
    }
}
