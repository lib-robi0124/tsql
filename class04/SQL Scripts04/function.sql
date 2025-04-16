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

SELECT * FROM Employees

CREATE FUNCTION fn_GetEmpoyeesByGender(@Gender NCHAR)
RETURNS @EmployeesByGender TABLE (FirstName VARCHAR(50), LastName VARCHAR(50), Gender NCHAR)
AS
	BEGIN
		IF @Gender = 'M'
		begin
			insert into @EmployeesByGender
			select FirstName, LastName, Gender
			from Employees
			where Gender = 'M'
		end
		else
		begin
			insert into @EmployeesByGender
			select FirstName, LastName, Gender
			from Employees
			where Gender = 'F'
		end
		return 
	END

	select * from dbo.fn_EmployesByGender('M') 