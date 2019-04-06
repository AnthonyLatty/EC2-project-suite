
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/05/2019 23:03:30
-- Generated from EDMX file: C:\Users\mlatt\Desktop\EC2-project-suite\EC2-poject-suite\JPS_web\JPSModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [JPS_web];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BillBillStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bills] DROP CONSTRAINT [FK_BillBillStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerBill]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bills] DROP CONSTRAINT [FK_CustomerBill];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerTransaction]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [FK_CustomerTransaction];
GO
IF OBJECT_ID(N'[dbo].[FK_BillTransaction]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bills] DROP CONSTRAINT [FK_BillTransaction];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Bills]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Bills];
GO
IF OBJECT_ID(N'[dbo].[BillStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BillStatus];
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
    [Id] int IDENTITY(1,1) NOT NULL,
    [GenerationDate] datetime  NOT NULL,
    [DueDate] datetime  NOT NULL,
    [PremisesNumber] nvarchar(7)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Amount] decimal(18,0)  NOT NULL,
    [CustomerId] nvarchar(max)  NOT NULL,
    [BillStatus_Id] int  NOT NULL,
    [Transaction_Id] int  NOT NULL
);
GO

-- Creating table 'BillStatus'
CREATE TABLE [dbo].[BillStatus] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StatusType] nvarchar(10)  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Id] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [PremisesNumber] nvarchar(7)  NOT NULL
);
GO

-- Creating table 'Transactions'
CREATE TABLE [dbo].[Transactions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Timestamp] datetime  NOT NULL,
    [CustomerId] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Bills'
ALTER TABLE [dbo].[Bills]
ADD CONSTRAINT [PK_Bills]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BillStatus'
ALTER TABLE [dbo].[BillStatus]
ADD CONSTRAINT [PK_BillStatus]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Transactions'
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT [PK_Transactions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [BillStatus_Id] in table 'Bills'
ALTER TABLE [dbo].[Bills]
ADD CONSTRAINT [FK_BillBillStatus]
    FOREIGN KEY ([BillStatus_Id])
    REFERENCES [dbo].[BillStatus]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BillBillStatus'
CREATE INDEX [IX_FK_BillBillStatus]
ON [dbo].[Bills]
    ([BillStatus_Id]);
GO

-- Creating foreign key on [CustomerId] in table 'Bills'
ALTER TABLE [dbo].[Bills]
ADD CONSTRAINT [FK_CustomerBill]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerBill'
CREATE INDEX [IX_FK_CustomerBill]
ON [dbo].[Bills]
    ([CustomerId]);
GO

-- Creating foreign key on [CustomerId] in table 'Transactions'
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT [FK_CustomerTransaction]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerTransaction'
CREATE INDEX [IX_FK_CustomerTransaction]
ON [dbo].[Transactions]
    ([CustomerId]);
GO

-- Creating foreign key on [Transaction_Id] in table 'Bills'
ALTER TABLE [dbo].[Bills]
ADD CONSTRAINT [FK_BillTransaction]
    FOREIGN KEY ([Transaction_Id])
    REFERENCES [dbo].[Transactions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BillTransaction'
CREATE INDEX [IX_FK_BillTransaction]
ON [dbo].[Bills]
    ([Transaction_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------