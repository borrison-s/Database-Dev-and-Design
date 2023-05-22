CREATE TABLE Student(
Id int IDENTITY(1, 1) not null,
FirstName nvarchar(100) not null,
LastName nvarchar(100) not null,
DateOfBirth date not null,
EnrolledDate date not null,
Gender nchar(1) not null,
NationalIdNumber nvarchar(20) null,
StudentCardNumber nvarchar(20) null
)

CREATE TABLE Teacher(
Id int IDENTITY(1, 1) not null,
FirstName nvarchar(100) not null,
LastName nvarchar(100) not null,
DateOfBirth date  null,
AcademicRank nvarchar(100) null,
HireDate date not null
)

CREATE TABLE Grade(
Id int IDENTITY(1, 1) not null,
StudentId int not null,
CourseId int not null,
TeacherId int not null,
Grade int not null,
Comment nvarchar(max) null,
CreatedDate date not null
)

CREATE TABLE Course(
Id int IDENTITY(1, 1) not null,
[Name] nvarchar(100) not null,
Credit int not null,
AcademicYear date not null,
Semester int not null
)

CREATE TABLE AchievementType(
Id int IDENTITY(1, 1) not null,
[Name] nvarchar(100) not null,
[Description] nvarchar(max) null,
ParticipationRate decimal(18, 2) null,
)

CREATE TABLE GradeDetails(
Id int IDENTITY(1, 1) not null,
GradeId int not null,
AchievementTypeId int not null,
AchievementPoints decimal(18, 2) not null,
AchievementMaxPoints decimal(18, 2) not null,
AchievementDate date null
)