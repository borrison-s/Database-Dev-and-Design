--List all Teachers without exam Grade
SELECT *
FROM Teacher t
LEFT JOIN Grade g
ON g.TeacherId = t.Id
WHERE g.Grade IS NULL

--Calculate the count of all grades per Teacher in the system
SELECT t.Id, t.FirstName, COUNT(g.Grade) as GradeCount
FROM Teacher t
LEFT JOIN Grade g
ON g.TeacherId = t.Id
GROUP BY t.Id, t.FirstName

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT t.Id, t.FirstName, COUNT(g.Grade) as GradeCount
FROM Teacher t
LEFT JOIN Grade g
ON g.TeacherId  = t.Id
LEFT JOIN Student s
ON s.Id = g.StudentId
WHERE s.Id <= 100
GROUP BY t.Id, t.FirstName

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT g.StudentId, MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGrade
FROM Grade g
GROUP BY g.StudentId;

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.Id, t.FirstName, COUNT(g.Grade) as GradeCount
FROM Teacher t
LEFT JOIN Grade g
ON g.TeacherId  = t.Id
LEFT JOIN Student s
ON s.Id = g.StudentId
GROUP BY t.Id, t.FirstName
HAVING COUNT(g.Grade) > 200

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. 
--Filter only records where Maximal Grade is equal to Average Grade
SELECT
  g.StudentId,
  COUNT(g.Grade) AS GradeCount,
  MAX(g.Grade) AS MaxGrade,
  AVG(g.Grade) AS AvgGrade
FROM Grade g
GROUP BY g.StudentId
HAVING MAX(g.Grade) = AVG(g.Grade);

--List Student First Name and Last Name next to the other details from previous query
SELECT
  s.FirstName,
  s.LastName,
  grades.GradeCount,
  grades.MaxGrade,
  grades.AvgGrade
FROM
  Student s
JOIN
  (
    SELECT
      g.StudentId,
      COUNT(g.Grade) AS GradeCount,
      MAX(g.Grade) AS MaxGrade,
      AVG(g.Grade) AS AvgGrade
    FROM
      Grade g
    GROUP BY
      g.StudentId
    HAVING
      MAX(g.Grade) = AVG(g.Grade)
  ) grades ON s.Id = grades.StudentId;
