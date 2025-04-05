SELECT MAX(iD) FROM Orders;
select count(Id) from Orders;

SELECT * FROM BusinessEntities  

SELECT be.Name, SUM(o.TotalPrice) AS TotalOrderPrice 
FROM Orders O JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
GROUP BY be.Name;

SELECT o.CustomerId, be.Name, SUM(o.TotalPrice) AS TotalOrderPrice FROM Orders O JOIN BusinessEntities be ON o.BusinessEntityId = be.Id 
GROUP BY o.CustomerId, be.Name
HAVING o.CustomerId < 20;

SELECT be.Name, SUM(o.TotalPrice) / COUNT(o.Id) AS AverageOrderAmount, MAX(o.TotalPrice) AS MaxOrderAmount
FROM Orders O JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
GROUP BY be.Name;



