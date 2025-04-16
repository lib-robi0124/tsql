create procedure TestPrint
(
	@First as INT = 0,
	@Second as INT = 1
)
AS 
BEGIN
	Print 'First'
	Print @First
	Print '_________'
	Print 'Second'
	Print @Second
END

EXEC TestPrint

EXEC TestPrint @First = 10

EXEC TestPrint @second = 20

EXEC TestPrint 10, 20

EXEC TestPrint @second = 10, @first = 20

DECLARE @ReturnValue INT
EXEC @ReturnValue = TestPrint