namespace JPS_web.Migrations
{
    using JPS_web.Models;
    using System;
    using System.Data.Entity.Migrations;

    internal sealed class Configuration : DbMigrationsConfiguration<JPSContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(JPSContext context)
        {
            // Seed data into database
        }
    }
}
