USE [master] 
GO
DROP DATABASE IF EXISTS [SEDC_NEW]
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'SEDC')
	ALTER DATABASE [SEDC] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

CREATE DATABASE [SEDC]
GO
USE [SEDC]
GO

-- CREATE TABLE
DROP TABLE IF EXISTS Customers

CREATE TABLE [Customers] (
[Id] [int] IDENTITY (1, 1) NOT NULL,
[Name] [nvarchar] (100) NOT NULL,
[City] [nvarchar] (100) NULL,
CONSTRAINT [PK_Customers] PRIMARY KEY ([Id])
)
GO
-- INSERT COMMAND
INSERT INTO [Customers] ([Name], [City])
VALUES ('Vero Skopje', 'Skopje')

INSERT INTO [Customers] ([Name], [City])
VALUES ('Tineks Skopje', 'Skopje')

INSERT INTO [Customers] ([Name], [City])
VALUES ('Vero Strumica', 'Strumica')

INSERT INTO [Customers] ([Name], [City])
VALUES ('Vero Bitola', 'Bitola'), 
	   ('Vero Tetovo', 'Tetovo'),
	   ('Vero Ohrid', 'Skopje')


INSERT INTO [Customers] ([Name], [City])
VALUES ('Kam-Market Skopje', 'Skopje')

-- SELECT COMMAND

SELECT *
FROM Customers

SELECT Id, [Name] 
FROM Customers


SELECT * 
FROM Customers
WHERE City = 'Skopje'


-- UPDATE COMMAND
UPDATE Customers
SET City = 'Ohrid'
WHERE Id = 6


UPDATE Customers
SET Name = 'Vero Kumanovo', City = 'Kumanovo'
WHERE Id = 2

-- DELETE COMMAND - Delete one/all records from a table
DELETE 
FROM Customers
WHERE Id = 3


-- DROP COMMAND - Deletes whole table 
DROP TABLE Customers

DROP TABLE IF EXISTS [dbo].[OrderDetails]
DROP TABLE IF EXISTS [dbo].[Orders]
DROP TABLE IF EXISTS [dbo].[BusinessEntities]
DROP TABLE IF EXISTS [dbo].[Customers]
DROP TABLE IF EXISTS [dbo].[Employees]
DROP TABLE IF EXISTS [dbo].[Products]
GO

CREATE TABLE Customers (
	[Id] int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(100) NOT NULL,
	[AccountNumber] nvarchar(100) NULL,
	[City] nvarchar(100) NULL,
	[RegionName] nvarchar(100) NULL,
	[CustomerSize] nvarchar(10) NULL,
	[PhoneNumber] nvarchar(20) NULL,
	[IsActive] bit NOT NULL,
CONSTRAINT [PK_Customers] PRIMARY KEY (Id)
)
GO

CREATE TABLE Employees (
	[Id] int IDENTITY(1,1) NOT NULL,
	[FirstName] nvarchar(100) NOT NULL,
	[LastName] nvarchar(100) NOT NULL,
	[DateOfBirth] date NULL, 
	[Gender] nchar(1) NULL, -- 'F' / 'M'
	[HireDate] date NULL,
	[NationalIdNumber] nvarchar(20) NULL
CONSTRAINT [PK_Employees] PRIMARY KEY (Id)
)
GO
CREATE TABLE Products (
	[Id] int IDENTITY(1,1) NOT NULL,
	[Code] nvarchar(50) NULL,
	[Name] nvarchar(100) NULL,
	[Description] nvarchar(max) NULL,
	[Weight] decimal(18, 2) NULL,
	[Price] decimal(18,2) NULL,
	[Cost] decimal(18,2) NULL,
CONSTRAINT [PK_Products] PRIMARY KEY (Id)
)
GO
CREATE TABLE Orders(
	[Id] bigint IDENTITY(1,1) NOT NULL,
	[OrderDate] date NULL,
	[Status] smallint NULL,
	[BusinessEntityId] int NULL,
	[CustomerId] int NULL,
	[EmployeeId] int NULL,
	[TotalPrice] decimal(18,2) NULL,
	[Comment] nvarchar(max) NULL
CONSTRAINT [PK_Orders] PRIMARY KEY (Id)
)
GO

CREATE TABLE OrderDetails(
	[Id] int IDENTITY(1,1) NOT NULL,
	[OrderId] bigint NULL,
	[ProductId] int NULL,
	[Quantity] int NULL,
	[Price] decimal(18,2) NULL,
CONSTRAINT [PK_OrderDetails] PRIMARY KEY (Id)
)
GO
CREATE TABLE BusinessEntities(
	[Id] int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(100) NULL,
	[Region] nvarchar(1000) NULL,
	[Zipcode] nvarchar(10) NULL,
	[Size] nvarchar(10) NULL,
CONSTRAINT [PK_BusinessEntities] PRIMARY KEY (Id)
)
GO