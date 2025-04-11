create procedure NewCustomer
(
	@Name NVARCHAR(100),
	@AccountNumber NVARCHAR(20),
	@City NVARCHAR(100),
	@RegionName NVARCHAR(100),
	@CustomerSize NVARCHAR(10),
	@PhoneNumber NVARCHAR(20),
	@IsActive bit
)
AS
Begin
	INSERT INTO Customers(Name, AccountNumber, City, RegionName, CustomerSize, PhoneNumber, IsActive)
	VALUEs (@Name, @AccountNumber, @City, @RegionName, @CustomerSize, @PhoneNumber, @IsActive)
	select count(*) as TotalCustomersWithSameFirstLetter
	from Customers
	where SUBSTRING(Name, 1, 1) = SUBSTRING(@Name, 1, 1)

	select COUNT(*) as CustomersInRegion
	from Customers
	where RegionName = @RegionName

END

EXEC NewCustomer
	@Name = 'Viva',
	@AccountNumber = '12345678',
	@City = 'Skopje',
	@RegionName = 'Skopski',
	@CustomerSize = 'Big',
	@PhoneNumber = '070/222-333',
	@IsActive = 1

