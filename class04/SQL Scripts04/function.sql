CREATE FUNCTION fn_EmployeeFullName(@EmployeeID INT)
RETURNS NVARCHAR(100)
AS
BEGIN
	DECLARE @Result NVARCHAR(100)

	SELECT @Result = FirstName + ' ' + LastName
	from Employees
	where Id = @EmployeeID
	return @Result


END

select dbo.fn_EmployeeFullName(40)