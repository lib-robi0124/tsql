DECLARE @FirstName VARCHAR(100)
SET @FirstName = 'Antonio'

SELECT *
FROM Student
WHERE FirstName = @FirstName

DECLARE @FemaleStudents TABLE
(StudentID INT NOT NULL, StudentName VARCHAR(100), DateOfBirth datetime)

INSERT INTO @FemaleStudents
SELECT ID, FirstName, DateOfBirth
FROM Student
WHERE Gender = 'F'

SELECT * FROM @FemaleStudents

 CREATE TABLE #MaleStudentsTempTable
 (LastName NVARCHAR(100), EnrolledDate DATETIME)

 INSERT INTO #MaleStudentsTempTable
 SELECT LastName, EnrolledDate
 FROM Student
 WHERE Gender = 'M' AND FirstName LIKE 'A%'

 SELECT * 
 FROM #MaleStudentsTempTable
 WHERE LEN(LastName) = 7

 select FirstName From Teacher
 WHERE LEN(LastName) = 5 and (left(FirstName, 3) = left(LastName, 3))