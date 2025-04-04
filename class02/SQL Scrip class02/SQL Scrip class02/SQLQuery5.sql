CREATE DATABASE TEST_SEDC
GO


CREATE TABLE TableA (Id int NOT NULL);
CREATE TABLE Tableb (Id int NOT NULL);
INSERT INTO TableA VALUES (1), (2);
INSERT INTO Tableb VALUES (2), (3);

-- Cross Join
SELECT * FROM TableA CROSS JOIN Tableb;

-- INNER JOIN 
SELECT * 
FROM TableA ta
INNER JOIN Tableb tb ON ta.Id = tb.Id

-- LEFT JOIN
SELECT *
FROM TableA ta
LEFT JOIN Tableb tb ON ta.Id = tb.Id

-- RIGHT JOIN
SELECT *
FROM TableA ta
RIGHT JOIN Tableb tb ON ta.Id = tb.Id


-- FULL JOIN
SELECT *
FROM TableA ta
FULL JOIN Tableb tb ON ta.Id = tb.Id