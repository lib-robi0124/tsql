--Calculate the count of all grades per Teacher in the system
select * from Teacher
select * from Grade
Select * from Student


select t.FirstName AS Teacher, count(g.Grade) AS NumberOfGradesPerTeacher 
from Grade g 
INNER JOIN Teacher t ON g.TeacherID = t.ID 
Group by t.FirstName;
--Calculate the count of all grades per Teacher in the system for first 100 students (ID < 100)
select t.FirstName AS Teacher, count(g.Grade) AS NumberOfGradesPerTeacher 
from Grade g 
INNER JOIN Teacher t ON g.TeacherID = t.ID 
WHERE g.StudentID < 100 
Group by t.FirstName

--? Find the Maximal Grade, and the Average Grade per Student on all grades in the system
Select s.FirstName AS Student , MAX(g.Grade) AS MaximalGrade, AVG(g.Grade) AS AverageGrade from Grade g
INNER JOIN Student s ON g.StudentID = s.ID
Group by s.FirstName

--? Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
select t.FirstName AS Teacher, count(g.Grade) AS NumberOfGradesPerTeacher 
from Grade g 
INNER JOIN Teacher t ON g.TeacherID = t.ID 
Group by t.FirstName
Having count(g.Grade) > 200;
--? Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. 
--Filter only records where Maximal Grade is equal to Average Grade
Select s.FirstName AS Student , MAX(g.Grade) AS MaximalGrade, AVG(g.Grade) AS AverageGrade from Grade g
INNER JOIN Student s ON g.StudentID = s.ID
Group by s.FirstName
Having MAX(g.Grade) = AVG(g.Grade) + 1
--? List Student First Name and Last Name next to the other details from previous query
Select s.FirstName AS Student , s.LastName AS StudentLastName, MAX(g.Grade) AS MaximalGrade, AVG(g.Grade) AS AverageGrade from Grade g
INNER JOIN Student s ON g.StudentID = s.ID
Group by s.FirstName, s.LastName
Having MAX(g.Grade) = AVG(g.Grade) + 1
--? Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
create or alter view vv_StudentGrades 
AS
Select s.FirstName AS Student , s.LastName AS StudentLastName, count(g.Grade) AS CountOfGrade 
from Grade g
INNER JOIN Student s ON g.StudentID = s.ID
Group by s.FirstName, s.LastName
--? Change the view to show Student First and Last Names instead of StudentID
--? List all rows from view ordered by biggest Grade Count
select * from vv_StudentGrades order by CountOfGrade DESC