SELECT * FROM Employees WHERE FirstName = 'Goran';
SELECT * FROM Employees WHERE LastName LIKE 'S%';
SELECT * FROM Employees WHERE DateOfBirth > '01.01.1988';
SELECT * FROM Employees WHERE Gender = 'M';
SELECT * FROM Employees WHERE HireDate BETWEEN '01.01.1998' AND '01.31.1998';
SELECT * FROM Employees WHERE LastName LIKE 'S%' AND HireDate BETWEEN '01.01.1999' AND '01.31.2019';

SELECT * FROM Employees WHERE FirstName = 'Aleksandar' ORDER BY LastName;
SELECT * FROM Employees ORDER BY FirstName;

SELECT * FROM Employees WHERE Gender = 'M' ORDER BY HireDate DESC;

