namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ChangeCustomerDatatype : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Customers", "UserName", c => c.String());
            DropColumn("dbo.Customers", "Email");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Customers", "Email", c => c.String());
            DropColumn("dbo.Customers", "UserName");
        }
    }
}
