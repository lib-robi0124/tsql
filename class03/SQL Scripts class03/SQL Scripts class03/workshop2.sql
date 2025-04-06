/*
Calculate the total amount per BusinessEntity on all orders in the
system and filter only total orders greater than 635558 */

SELECT be.Name, SUM(o.TotalPrice) AS TotalAmount
FROM Orders o
INNER JOIN BusinessEntities be
ON o.BusinessEntityId = be.Id
GROUP BY be.Name
HAVING SUM(o.TotalPrice) > 635558;

/*
Calculate the total amount per BusinessEntity on all orders in the
system from Customers with ID < 20 and filter only total orders
less than 100000 */

SELECT be.Name AS BusinessEntityName, c.Name AS CustomerName, SUM(o.TotalPrice) AS TotalAmount
FROM Orders o
INNER JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
INNER JOIN Customers c ON o.CustomerId = c.Id WHERE c.Id < 20
GROUP BY be.Name, c.Name
HAVING SUM(o.TotalPrice) < 100000;

/*
Find the Maximal Order amount, and the Average Order amount
per BusinessEntity on all orders in the system. Filter only records
where Total order amount is more than 4x bigger than average */

SELECT be.Name, MAX(o.TotalPrice) AS MaximalOrderAmount, AVG(o.TotalPrice) AS AverageOrderAmount
FROM Orders o
INNER JOIN BusinessEntities be
ON o.BusinessEntityId = be.Id
GROUP BY be.Name
HAVING MAX(o.TotalPrice) > (4.3 * AVG(o.TotalPrice));

