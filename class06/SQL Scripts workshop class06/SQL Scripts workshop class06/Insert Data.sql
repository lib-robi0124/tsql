INSERT INTO Users(FirstName, LastName, Address, PhoneNumber)
VALUES('Bob', 'Bobsky', 'Bob Street 22', '070111222')

INSERT INTO Users(FirstName, LastName, Address, PhoneNumber)
VALUES('Jill', 'Wayne', 'Jill Street 22', '070222333')

INSERT INTO Users(FirstName, LastName, Address, PhoneNumber)
VALUES('Greg', 'Gregsky', 'Greg Street 22', '070333444')

GO

/* ------------------------------------------------------------------------ */

USE PizzaDB
GO

INSERT INTO PizzaSizes(PizzaSizeName)
VALUES('Small')

INSERT INTO PizzaSizes(PizzaSizeName)
VALUES('Medium')

INSERT INTO PizzaSizes(PizzaSizeName)
VALUES('Large')

INSERT INTO PizzaSizes(PizzaSizeName)
VALUES('Family')

GO
select * from PizzaSizes
/* ------------------------------------------------------------------------ */

INSERT INTO Orders(OrderPrice, IsDelivered, UserID)
VALUES(0.5, 1, 1)

INSERT INTO Orders(OrderPrice, IsDelivered, UserID)
VALUES(0.5, 1, 1)

INSERT INTO Orders(OrderPrice, IsDelivered, UserID)
VALUES(0.6, 0, 1)

INSERT INTO Orders(OrderPrice, IsDelivered, UserID)
VALUES(0.3, 0, 2)

INSERT INTO Orders(OrderPrice, IsDelivered, UserID)
VALUES(0.5, 1, 3)


/* ------------------------------------------------------------------------ */

USE PizzaDB
GO


/* Order 1 */
INSERT INTO Pizzas(Name, PizzaPrice, SizeId, OrderId)
VALUES('Capricciosa', 2, 1, 1)

INSERT INTO Pizzas(Name, PizzaPrice, SizeId, OrderId)
VALUES('Pepperoni', 3.7, 3, 1)

/* Order 2 */

INSERT INTO Pizzas(Name, PizzaPrice, SizeId, OrderId)
VALUES('Margarita', 1.6, 1, 2)

INSERT INTO Pizzas(Name, PizzaPrice, SizeId, OrderId)
VALUES('Seafood', 2.9, 2, 2)

INSERT INTO Pizzas(Name, PizzaPrice, SizeId, OrderId)
VALUES('Hawaiian', 2.7, 2, 2)

/* Order 3 */

INSERT INTO Pizzas(Name, PizzaPrice, SizeId, OrderId)
VALUES('Capricciosa', 2.5, 2, 3)

INSERT INTO Pizzas(Name, PizzaPrice, SizeId, OrderId)
VALUES('Pepperoni', 4.8, 4, 3)

INSERT INTO Pizzas(Name, PizzaPrice, SizeId, OrderId)
VALUES('Capricciosa', 3.2, 3, 3)

INSERT INTO Pizzas(Name, PizzaPrice, SizeId, OrderId)
VALUES('Hawaiian', 5.2, 4, 3)

/* Order 4 */

INSERT INTO Pizzas(Name, PizzaPrice, SizeId, OrderId)
VALUES('Capricciosa', 3, 3, 4)

/* Order 5 */

INSERT INTO Pizzas(Name, PizzaPrice, SizeId, OrderId)
VALUES('Margarita', 4, 4, 5)

INSERT INTO Pizzas(Name, PizzaPrice, SizeId, OrderId)
VALUES('Seafood', 4.5, 3, 5)

INSERT INTO Pizzas(Name, PizzaPrice, SizeId, OrderId)
VALUES('Pepperoni', 4.2, 3, 5)

INSERT INTO Pizzas(Name, PizzaPrice, SizeId, OrderId)
VALUES('Capricciosa', 3.7, 4, 5)

GO

/* ------------------------------------------------------------------------ */

INSERT INTO Toppings(ToppingName, ToppingPrice)
VALUES('Cheese', 0.4)

INSERT INTO Toppings(ToppingName, ToppingPrice)
VALUES('Mushrooms', 0.8)

INSERT INTO Toppings(ToppingName, ToppingPrice)
VALUES('Bacon', 1)

INSERT INTO Toppings(ToppingName, ToppingPrice)
VALUES('Onions', 0.2)

INSERT INTO Toppings(ToppingName, ToppingPrice)
VALUES('Garlic', 0.3)

select * from Toppings

/* ------------------------------------------------------------------------ */

USE PizzaDB
GO

select * from PizzaToppings

INSERT INTO PizzaToppings(PizzaId, ToppingsID)
VALUES(1, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingsID)
VALUES(1, 3)

INSERT INTO PizzaToppings(PizzaId, ToppingsID)
VALUES(2, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingsID)
VALUES(4, 3)

INSERT INTO PizzaToppings(PizzaId, ToppingsID)
VALUES(4, 5)

INSERT INTO PizzaToppings(PizzaId, ToppingsID)
VALUES(6, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingsID)
VALUES(7, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingsID)
VALUES(9, 2)

INSERT INTO PizzaToppings(PizzaId, ToppingsID)
VALUES(10, 4)

INSERT INTO PizzaToppings(PizzaId, ToppingsID)
VALUES(11, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingsID)
VALUES(11, 5)

INSERT INTO PizzaToppings(PizzaId, ToppingsID)
VALUES(12, 4)

INSERT INTO PizzaToppings(PizzaId, ToppingsID)
VALUES(14, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingsID)
VALUES(14, 2)