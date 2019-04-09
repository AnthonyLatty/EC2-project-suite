
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/08/2019 03:32:55
-- Generated from EDMX file: C:\Users\Kaheem\Documents\EC2-project-suite\EC2-poject-suite\JPS_web\JPSmodel.edmx
-- --------------------------------------------------

CREATE DATABASE JPS_web
SET QUOTED_IDENTIFIER OFF;
GO
USE [JPS_web];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_Bills_dbo_Customers_Id]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bills] DROP CONSTRAINT [FK_dbo_Bills_dbo_Customers_Id];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Transactions_dbo_Bills_BillId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [FK_dbo_Transactions_dbo_Bills_BillId];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Bills]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Bills];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[Transactions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Transactions];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Bills'
CREATE TABLE [dbo].[Bills] (
    [BillId] int IDENTITY(1,1) NOT NULL,
    [Id] nvarchar(128)  NOT NULL,
    [BillGenerationDate] datetime  NOT NULL,
    [BillDueDate] datetime  NOT NULL,
    [PremisesNumber] int  NOT NULL,
    [BillStatus] int  NOT NULL,
    [Address] nvarchar(100)  NOT NULL,
    [Amount] decimal(18,2)  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Id] nvarchar(128)  NOT NULL,
    [PremisesNumber] nvarchar(7)  NOT NULL,
    [UserName] nvarchar(max)  NULL,
    [FirstName] nvarchar(50)  NULL,
    [LastName] nvarchar(50)  NULL
);
GO
CREATE TABLE [dbo].[BillStatus] (
    StatusID int not null primary key,
	StatusName nvarchar(50) not null

);
GO

-- Creating table 'Transactions'
CREATE TABLE [dbo].[Transactions] (
    [BillId] int  NOT NULL,
    [CardNumber] nvarchar(100)  NOT NULL,
    [CardType] int  NOT NULL,
    [Timestamp] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [BillId] in table 'Bills'
ALTER TABLE [dbo].[Bills]
ADD CONSTRAINT [PK_Bills]
    PRIMARY KEY CLUSTERED ([BillId] ASC);
GO

-- Creating primary key on [Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [BillId] in table 'Transactions'
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT [PK_Transactions]
    PRIMARY KEY CLUSTERED ([BillId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Id] in table 'Bills'
ALTER TABLE [dbo].[Bills]
ADD CONSTRAINT [FK_dbo_Bills_dbo_Customers_Id]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Bills_dbo_Customers_Id'
CREATE INDEX [IX_FK_dbo_Bills_dbo_Customers_Id]
ON [dbo].[Bills]
    ([Id]);
GO

-- Creating foreign key on [BillId] in table 'Transactions'
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT [FK_dbo_Transactions_dbo_Bills_BillId]
    FOREIGN KEY ([BillId])
    REFERENCES [dbo].[Bills]
        ([BillId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------