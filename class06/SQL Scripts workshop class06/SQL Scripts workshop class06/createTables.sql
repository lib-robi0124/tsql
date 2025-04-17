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

/* There should be a function that concatenates First and Last Name of a user? */
select FIrstName + ' ' + LastName AS NameOfUser from Users
-- CREATE FUNCTION ---
CREATE FUNCTION GetFullName(
-- variabli --
	@firstName nvarchar(255),
	@lastName nvarchar(255)
)
RETURNS nvarchar(255)
AS
BEGIN
	RETURN @firstName + ' ' + @lastName
END
GO
-- call FUNCTION --
SELECT dbo.GetFullName('Robert', 'Ristovski');

select * from Orders
select * from Pizzas

/* There should be a view to show all pizzas that are not delivered yet and the full names of the users waiting for them? */
-- CREATE VIEW --
CREATE OR ALTER VIEW vv_DeliveryPizzzaStatus
AS
SELECT p.Name, p.SizeID, p.OrderID, dbo.GetFullName(u.FirstName, u.LastName) AS UserFullName
FROM Pizzas AS p
-- JOIN TABLE --
JOIN Orders AS o ON o.Id = p.OrderID
JOIN Users AS u ON u.Id = o.UserID 
-- CONDITION --
WHERE o.IsDelivered = 0
GO
-- call VIEW -- 
SELECT * FROM vv_DeliveryPizzzaStatus

/* There should be a stored procedure that when provided an OrderId, can return the full price of a whole order ( Delivery + All Pizza + All Toppings )? */
-- CREATE PROCEDURE -- 
CREATE PROCEDURE GetFullPriceOfOrder
-- variabli --
(
@OrderID int
)
AS
BEGIN
	DECLARE @pizzasPrice DECIMAL(4, 2)
	DECLARE @toppingsPrice DECIMAL(4, 2)
	DECLARE @orderPrice DECIMAL(4, 2)

	SELECT @pizzasPrice = SUM(p.PizzaPrice), @toppingsPrice = SUM(t.ToppingPrice)
	FROM Orders AS o
	INNER JOIN Pizzas AS p ON p.OrderID = o.Id
	JOIN PizzaToppings AS pt ON p.Id = pt.PizzaID
	JOIN Toppings AS t ON t.Id = pt.ToppingsID
	WHERE o.Id = @OrderID

	SELECT @orderPrice = OrderPrice FROM Orders
	WHERE Id = @OrderID


END