namespace JPS_web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdateCustomerProperties : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Customers", "PremisesNumber", c => c.String(nullable: false, maxLength: 7));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Customers", "PremisesNumber", c => c.String(nullable: false));
        }
    }
}
