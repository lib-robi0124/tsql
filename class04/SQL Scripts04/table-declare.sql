DECLARE @FemaleEmloyeeList TABLE
(EmployeeID INT NOT NULL, FirstName VARCHAR(50) NULL, LastName VARCHAR(50) NULL)


--INSERT INTO @FemaleEmloyeeList (EmployeeID, FirstName, LastName)
--VALUES (1, 'Frosina', 'Stamenkovska'),		(2, 'Ana', 'Marjanovic')



INSERT INTO @FemaleEmloyeeList (EmployeeID, FirstName, LastName)
SELECT Id, FirstName, LastName
FROM Employees
WHERE Gender = 'F'

SELECT * FROM @FemaleEmloyeeList