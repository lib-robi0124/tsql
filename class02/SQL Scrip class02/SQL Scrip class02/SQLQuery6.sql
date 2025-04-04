
SELECT c.Name AS CustomerName, p.Name AS ProductName FROM Customers c CROSS JOIN Products p;

SELECT DISTINCT b.Name FROM Orders O INNER JOIN BusinessEntities b ON b.Id = o.BusinessEntityId;

SELECT DISTINCT b.Name FROM BusinessEntities b LEFT JOIN Orders o ON b.Id = o.BusinessEntityId WHERE o.BusinessEntityId is NULL;

SELECT c.* FROM Customers c LEFT JOIN  Orders o ON o.CustomerId = c.Id WHERE o.CustomerId IS NULL;
