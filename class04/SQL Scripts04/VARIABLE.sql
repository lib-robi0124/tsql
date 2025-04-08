SELECT FirstName,
LEFT(FirstName, 4) AS LEFTFUNCTION,
RIGHT(LastName, 4) AS RightFunction,
LEN(CONCAT(FirstName, LastName)) AS FulNameLength,
SUBSTRING(FirstName, 0, 5) AS SubstringFromFirstName,
CONCAT(FirstName, CAST(DateOfBirth AS datetime)) AS EmployeeNameWithBirthDate
FROM Employees

SELECT CAST(Quantity AS VARCHAR) ,
CAST(Price AS VARCHAR)
FROM OrderDetails

SELECT * FROM OrderDetails
