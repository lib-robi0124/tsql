use database sedc_academy_homework
go

create or alter procedure sp_CreateGradeDetail
(
	@AchievementTypeID int, 
	@Points smallint, 
	@MaxPoints smallint, 
	@Date date
)
AS
Begin

	DECLARE @ParticipationRate decimal(10, 2)
	DECLARE @GradePoints decimal(18, 2)
	
	SELECT @ParticipationRate = ParticipationRate
		FROM AchievementType
		WHERE ID = @AchievementTypeID

	insert into GradeDetails(AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate )
	values (@AchievementTypeID , @Points, @MaxPoints, @Date )

	select @GradePoints = (AchievementPoints / AchievementMaxPoints) * ParticipationRate
	from GradeDetails gd
	INNER JOIN  AchievementType ac ON  ac.ID = gd.AchievementTypeID
	

	SELECT gd.AchievementTypeID, SUM(@GradePoints) AS TotalGradePoints
	FROM GradeDetails gd
	INNER JOIN  AchievementType ac ON  ac.ID = gd.AchievementTypeID
	GROUP BY gd.AchievementTypeID;
End

select * from GradeDetails
select * from AchievementType

EXEC sp_CreateGradeDetail
		@AchievementTypeID = 1, 
	@Points = 78, 
	@MaxPoints = 100, 
	@Date = '19990118'