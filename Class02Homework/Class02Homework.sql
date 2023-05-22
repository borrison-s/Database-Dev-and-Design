--Find all Students with FirstName = Antonio
SELECT *
FROM Student
WHERE FirstName = 'Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT *
FROM Student
WHERE DateOfBirth > '01.01.1999'

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT *
FROM Student
WHERE LastName like 'J%' and (EnrolledDate >= '1998.01.01' and EnrolledDate <= '1998.01.31')

--List all Students ordered by FirstName
SELECT *
FROM Student
ORDER BY FirstName

--List all Teacher Last Names and Student Last Names in single result set.
SELECT LastName
FROM Teacher
UNION
SELECT LastName
FROM Student


