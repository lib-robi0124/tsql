CREATE DATABASE [SEDC_ACADEMY_HOMEWORK]
GO

CREATE TABLE [Student] (
  [ID] int IDENTITY(1, 1) NOT NULL,
  [FirstName] nvarchar(100) NULL,
  [LastName] nvarchar(100) NULL,
  [DateOfBirth] date NULL,
  [EnrolledDate] date NULL,
  [Gender] nchar(1) NULL,
  [NationalIDNumber] BIGINT NULL,
  [StudentCardNumber] nvarchar(100) NULL,
  CONSTRAINT [PK_Student] PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Teacher] (
  [ID] int IDENTITY(1, 1) NOT NULL,
  [FirstName] nvarchar(100) NULL,
  [LastName] nvarchar(100) NULL,
  [DateOfBirth] date NULL,
  [AcademicRank] nvarchar(100) NULL,
  [HireDate] date NULL,
  CONSTRAINT [PK_Teacher] PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Course] (
  [ID] int IDENTITY(1, 1) NOT NULL,
  [Name] nvarchar(255) NULL,
  [Credit] TINYINT NULL,
  [AcademicYear] TINYINT NULL,
  [Semester] TINYINT NULL,
  CONSTRAINT [PK_Course] PRIMARY KEY ([ID])
)
GO

CREATE TABLE [Grade] (
  [ID] int IDENTITY(1, 1) NOT NULL,
  [StudentID] int NULL,
  [CourseID] int NULL,
  [TeacherID] int NULL,
  [Grade] TINYINT NULL,
  [Comment] nvarchar(255) NULL,
  [CreatedDate] datetime NULL,
  CONSTRAINT [PK_Grade] PRIMARY KEY ([ID])
)
GO

CREATE TABLE [AchievementType] (
  [ID] int IDENTITY(1, 1) NOT NULL,
  [Name] nvarchar(150) NULL,
  [Description] nvarchar(255) NULL,
  [ParticipationRate] int NULL,
  CONSTRAINT [PK_AchievementType] PRIMARY KEY ([ID])
)
GO

CREATE TABLE [GradeDetails] (
  [ID] int IDENTITY(1, 1) NOT NULL,
  [GradeID] int NULL,
  [AchievementTypeID] int NULL,
  [AchievementPoints] SMALLINT NULL,
  [AchievementMaxPoints] SMALLINT NULL,
  [AchievementDate] date NULL,
  CONSTRAINT [PK_GradeDetails] PRIMARY KEY ([ID])
)
GO
/*ALTER TABLE Grade
DROP CONSTRAINT FK_Grade_Teacher;*/

ALTER TABLE Grade
ADD CONSTRAINT [FK_Grade_Student]
FOREIGN KEY ([StudentID])
REFERENCES Student ([ID]);
GO
ALTER TABLE Grade
ADD CONSTRAINT [FK_Grade_Course]
FOREIGN KEY ([CourseID])
REFERENCES Course ([ID]);
GO
ALTER TABLE Grade
ADD CONSTRAINT [FK_Grade_Teacher]
FOREIGN KEY ([TeacherID])
REFERENCES Teacher ([ID]);
GO
ALTER TABLE GradeDetails
ADD CONSTRAINT [FK_GradeDetalis_Grade]
FOREIGN KEY ([GradeID])
REFERENCES Grade ([ID]);
GO

ALTER TABLE GradeDetails
ADD CONSTRAINT [FK_GradeDetalis_AchievementType]
FOREIGN KEY ([AchievementTypeID])
REFERENCES AchievementType ([ID]);
GO



