USE [master]
GO

DROP DATABASE IF EXISTS [PizzaDB]
GO

CREATE DATABASE [PizzaDB]
GO

USE [PizzaDB]
GO

DROP TABLE IF EXISTS [dbo].[Users]
DROP TABLE IF EXISTS [dbo].[Pizzas]
DROP TABLE IF EXISTS [dbo].[Orders]
DROP TABLE IF EXISTS [dbo].[PizzaSizes]
DROP TABLE IF EXISTS [dbo].[Toppings]
DROP TABLE IF EXISTS [dbo].[PizzaToppings]
GO

CREATE TABLE Users (
	[Id] int IDENTITY(1,1) NOT NULL,
	[FirstName] nvarchar(255) NOT NULL,
	[LastName] nvarchar(255) NOT NULL,
	[Address] nvarchar(255) NOT NULL,
	[PhoneNumber] nvarchar(20) NOT NULL,
	CONSTRAINT [PK_Users] PRIMARY KEY (Id)
)
GO

CREATE TABLE Pizzas (
	[Id] int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(255) NOT NULL,
	[PizzaPrice] decimal(4, 2) NOT NULL,
	[SizeID] int NOT NULL,
	[OrderID] int NOT NULL,
	CONSTRAINT [PK_Pizzas] PRIMARY KEY (Id)
)
GO

CREATE TABLE Orders (
	[Id] int IDENTITY(1,1) NOT NULL,
	[IsDelivered] bit NOT NULL,
	[OrderPrice] decimal(4, 2) NOT NULL,
	[UserID] int NOT NULL,
	CONSTRAINT [PK_Orders] PRIMARY KEY (Id)
)
GO

 CREATE TABLE Toppings (
	[Id] int IDENTITY(1,1) NOT NULL,
	[ToppingName] nvarchar(255) NOT NULL,
	[ToppingPrice] decimal(4, 2) NOT NULL,
	CONSTRAINT [PK_Toppings] PRIMARY KEY (Id)
)
GO

 CREATE TABLE PizzaSizes (
	[Id] int IDENTITY(1,1) NOT NULL,
	[PizzaSizeName] nvarchar(255) NOT NULL,
	CONSTRAINT [PK_PizzaSizes] PRIMARY KEY (Id)
)
GO
 CREATE TABLE PizzaToppings (
	[Id] int IDENTITY(1,1) NOT NULL,
	[PizzaID] int NOT NULL,
	[ToppingsID] int NOT NULL,
	CONSTRAINT [PK_PizzaToppings] PRIMARY KEY (Id)
)
GO

ALTER TABLE Pizzas
ADD CONSTRAINT [FK_Pizzas_Orders]
FOREIGN KEY ([OrderID])
REFERENCES Orders ([ID]);
GO
ALTER TABLE Pizzas
ADD CONSTRAINT [FK_Pizzas_Sizes]
FOREIGN KEY ([SizeID])
REFERENCES PizzaSizes ([ID]);
GO
ALTER TABLE Orders
ADD CONSTRAINT [FK_Orders_Users]
FOREIGN KEY ([UserID])
REFERENCES Users ([ID]);
GO
ALTER TABLE PizzaToppings
ADD CONSTRAINT [FK_PizzaToppings_Pizza]
FOREIGN KEY ([PizzaID])
REFERENCES Pizzas ([ID]);
GO
ALTER TABLE PizzaToppings
ADD CONSTRAINT [FK_PizzaToppings_Toppings]
FOREIGN KEY ([ToppingsID])
REFERENCES Toppings ([ID]);
GO

select FIrstName + ' ' + LastName AS NameOfUser from Users
select * from Orders
select * from Pizzas

CREATE OR ALTER VIEW vv_DeliveryPizzzaStatus
AS
SELECT u.FirstName + ' ' + u.Lastname AS FullName
from Orders o
inner join Users u ON o.UserID = u.ID
where o.IsDelivered = 0;



SELECT * FROM vv_DeliveryPizzzaStatus

