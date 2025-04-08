DECLARE @FirstName NVARCHAR(100)

SET @FirstName = 'Aleksandar'

SELECT * FROM Employees WHERE FirstName = @FirstName

DECLARE @FemaleEmloyeeList TABLE
(EmployeeID INT NOT NULL, FirtsName VARCHAR(50), DateOfBirth date NOT NULL )

INSERT INTO @FemaleEmloyeeList ---(EmployeeID, FirtsName, DateOfBirth)
SELECT Id, FirstName, DateOfBirth
FROM Employees
WHERE Gender = 'F'

SELECT * FROM @FemaleEmloyeeList

DROP TABLE IF EXISTs #TempmALElist

CREATE TABLE #TempmALElist
(LastName VARCHAR(50), HireDate date)

INSERT INTO #TempmALElist 
SELECT LastName, HireDate
FROM Employees
WHERE Gender = 'M' AND FirstName LIKE 'A%'

SELECT * FROM #TempmALElist
WHERE LEN(LastName) = 7