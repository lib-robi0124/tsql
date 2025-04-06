/*
Create new view (vv_CustomerOrders) that will List all CustomerIds
and sum of total Orders per customer

CREATE OR ALTER VIEW vv_CustomerOrders
AS
SELECT c.Name AS CustomerName, SUM(o.TotalPrice) AS TotalAmount
FROM Orders o
INNER JOIN Customers c ON o.CustomerId = c.Id WHERE c.Id < 20
GROUP BY c.Name
*/

/*Change the view to show the results ordered by the customer with
biggest total price 

CREATE OR ALTER VIEW vv_CustomerOrdersBP
AS
SELECT c.Name AS CustomerName, MAX(o.TotalPrice) AS BigestAmount
FROM Orders o
INNER JOIN Customers c ON o.CustomerId = c.Id WHERE c.Id < 20
GROUP BY c.Name */

/*
Create new view (vv_EmployeeOrders) that will List all Employees
(FirstName and LastName) , Product name and total quantity sold 

CREATE OR ALTER VIEW vv_EmployeeOrders
AS
SELECT e.FirstName AS EmployeeFirstName, e.LastName AS EmployeeLastName, p.Name AS ProductName, SUM(od.Quantity) AS TotalQuantitySold
FROM OrderDetails od
INNER JOIN Products p ON od.ProductId = p.Id
INNER JOIN Orders o ON od.OrderId = o.Id
INNER JOIN Employees e ON o.EmployeeId = e.Id
GROUP BY e.FirstName, e.LastName, p.Name; */

/*Alter the view to show only sales from Business entities belonging
to region 'Skopski' */

CREATE OR ALTER VIEW vv_EmployeeOrdersSkopski
AS
SELECT e.FirstName AS EmployeeFirstName, e.LastName AS EmployeeLastName, p.Name AS ProductName, 
SUM(od.Quantity) AS TotalQuantitySold, be.Region AS SkopskRegion
FROM OrderDetails od
INNER JOIN Products p ON od.ProductId = p.Id
INNER JOIN Orders o ON od.OrderId = o.Id
INNER JOIN Employees e ON o.EmployeeId = e.Id
INNER JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
GROUP BY e.FirstName, e.LastName, p.Name, be.Region
HAVING be.Region = 'Skopski';


SELECT * FROM Products
SELECT * FROM Employees
SELECT * FROM OrderDetails
SELECT * FROM BusinessEntities

