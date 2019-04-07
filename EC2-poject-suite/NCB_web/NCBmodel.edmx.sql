
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/04/2019 14:31:15
-- Generated from EDMX file: C:\Users\Kaheem\Source\Repos\EC2-project-suite\EC2-poject-suite\NCB_web\NCBmodel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [NCB_DB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AccountAccountType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Accounts] DROP CONSTRAINT [FK_AccountAccountType];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountCardNumber]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CardNumbers] DROP CONSTRAINT [FK_AccountCardNumber];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountTransaction]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [FK_AccountTransaction];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerAccount]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Accounts] DROP CONSTRAINT [FK_CustomerAccount];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Accounts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Accounts];
GO
IF OBJECT_ID(N'[dbo].[AccountTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AccountTypes];
GO
IF OBJECT_ID(N'[dbo].[CardNumbers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CardNumbers];
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

-- Creating table 'Accounts'

CREATE TABLE [dbo].[Accounts] (
    [AccountNumber] int IDENTITY(9190000,1) NOT NULL,
    [Balance] float  NOT NULL,
    [CustomerCustomerID] nvarchar(128)  NOT NULL,
    [AccountType_AccountTID] int  NOT NULL
);
GO

-- Creating table 'AccountTypes'
CREATE TABLE [dbo].[AccountTypes] (
    [AccountTID] int IDENTITY(1,1) NOT NULL,
    [AccountName] nvarchar(max)  NOT NULL
);
GO
CREATE SEQUENCE dbo.Sequence1 
    AS integer 
    START WITH 1 
    INCREMENT BY 1 
    MAXVALUE 1000000 
    CYCLE 
    CACHE 100;
-- Creating table 'CardNumbers'
drop table CardNumbers
CREATE TABLE [dbo].[CardNumbers] (
    
    [CardNum] bigint IDENTITY(950500001000,1) NOT NULL,
    [AccountAccountNumber] int  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerID] nvarchar(128)  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
	[Role] VARCHAR(50)
);
GO

-- Creating table 'Transactions'
CREATE TABLE [dbo].[Transactions] (
    [TransID] int IDENTITY(1,1) NOT NULL,
    [Date] nvarchar(50)  NOT NULL,
    [Type] nvarchar(50)  NOT NULL,
    [Details] nvarchar(max)  NOT NULL,
    [Amount] nvarchar(50)NOT NULL,
    [AccountAccountNumber] int  NOT NULL
);
GO

/*ALTER TABLE [dbo.Transactions]
Alter Column [Amount] nvarchar(50)
GO
ALTER TABLE [dbo.Transactions] 
Alter Column [Date] nvarchar(50)
GO
ALTER TABLE [dbo.Transactions] 
Alter Column [Type] nvarchar(50)
GO
ALTER TABLE [dbo.Customers]
  ADD [Role] VARCHAR(50);
GO*/
-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AccountNumber] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [PK_Accounts]
    PRIMARY KEY CLUSTERED ([AccountNumber] ASC);
GO

-- Creating primary key on [AccountTID] in table 'AccountTypes'
ALTER TABLE [dbo].[AccountTypes]
ADD CONSTRAINT [PK_AccountTypes]
    PRIMARY KEY CLUSTERED ([AccountTID] ASC);
GO

-- Creating primary key on [CardID] in table 'CardNumbers'
ALTER TABLE [dbo].[CardNumbers]
ADD CONSTRAINT [PK_CardNumbers]
    PRIMARY KEY CLUSTERED ([CardNum] ASC);
GO

create procedure cardInsert
(
@card int
)
as
insert into [dbo].[CardNumbers]([AccountAccountNumber]) values(@card) 
-- Creating primary key on [CustomerID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- Creating primary key on [TransID] in table 'Transactions'
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT [PK_Transactions]
    PRIMARY KEY CLUSTERED ([TransID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AccountType_AccountTID] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [FK_AccountAccountType]
    FOREIGN KEY ([AccountType_AccountTID])
    REFERENCES [dbo].[AccountTypes]
        ([AccountTID])
      ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountAccountType'
CREATE INDEX [IX_FK_AccountAccountType]
ON [dbo].[Accounts]
    ([AccountType_AccountTID]);
GO

-- Creating foreign key on [AccountAccountNumber] in table 'CardNumbers'
ALTER TABLE [dbo].[CardNumbers]
ADD CONSTRAINT [FK_AccountCardNumber1]
    FOREIGN KEY ([AccountAccountNumber])
    REFERENCES [dbo].[Accounts]
        ([AccountNumber])
     ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountCardNumber'
CREATE INDEX [IX_FK_AccountCardNumber]
ON [dbo].[CardNumbers]
    ([AccountAccountNumber]);
GO

-- Creating foreign key on [AccountAccountNumber] in table 'Transactions'
ALTER TABLE [dbo].[Transactions]
ADD CONSTRAINT [FK_AccountTransaction]
    FOREIGN KEY ([AccountAccountNumber])
    REFERENCES [dbo].[Accounts]
        ([AccountNumber])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountTransaction'
CREATE INDEX [IX_FK_AccountTransaction]
ON [dbo].[Transactions]
    ([AccountAccountNumber]);
GO

-- Creating foreign key on [CustomerCustomerID] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [FK_CustomerAccount]
    FOREIGN KEY ([CustomerCustomerID])
    REFERENCES [dbo].[Customers]
        ([CustomerID])
     ON DELETE CASCADE  ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerAccount'
CREATE INDEX [IX_FK_CustomerAccount]
ON [dbo].[Accounts]
    ([CustomerCustomerID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------