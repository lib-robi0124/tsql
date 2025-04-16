DECLARE @FirstName NVARCHAR(100)
DECLARE @LastName NVARCHAR(100)
DECLARE @FullName NVARCHAR(100)


SET @FirstName = 'Robert'
SET @LastName = 'Ristovski'

SELECT @FirstName + ' ' + @LastName AS [FULL NAME WITHOUT CONCAT]
SELECT CONCAT(@FirstName, @LastName)AS [FULL NAME WITH CONCAT]
SET @FullName = CONCAT(@FirstName, @LastName)
SELECT @FullName AS [FULLNAME VARIABLE]

