create procedure CreateOrder
(
	@OrderDate date,
	@Status smallint,
	@BusinessEntityId int,
	@CustomerId int,
	@EmployeeId int,
	@TotalPrice decimal(18, 2),
	@Comment nvarchar(255)
)
AS
BEGIN
	INSERT INTO Orders(OrderDate, Status, BusinessEntityId, CustomerId, EmployeeId, TotalPrice, Comment)
	VALUES (@OrderDate, @Status, @BusinessEntityId, @CustomerId, @EmployeeId, @TotalPrice, @Comment)

	select COUNT(*) AS TotalNumberOfOrders
	from Orders
	where CustomerId = @CustomerId

	select SUM(TotalPrice)
	from Orders
	where CustomerId = @CustomerId AND BusinessEntityId = @BusinessEntityId

END

EXEC CreateOrder 
		@OrderDate = '20190430',
		@Status = 0,
		@BusinessEntityId = 6,
		@CustomerId = 18,
		@EmployeeId = 65,
		@TotalPrice = 1234.56,
	    @Comment = 'test'


select * from Orders