namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ResetDatabase : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.CustomerBills", "Status");
        }
        
        public override void Down()
        {
            AddColumn("dbo.CustomerBills", "Status", c => c.Int(nullable: false));
        }
    }
}
