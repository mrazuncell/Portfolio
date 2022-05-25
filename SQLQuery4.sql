CREATE TABLE Departments
(
 DepartmentId int IDENTITY NOT NULL PRIMARY KEY,
 DepartmentName varchar(40) NOT NULL,
 FoundationYear int,
 StudentsAmount int NOT NULL
 )

 CREATE TABLE Teachers
(
 TeacherId int IDENTITY NOT NULL PRIMARY KEY,
 TeacherFirstName varchar(15) NOT NULL,
 TeacherLastName varchar(15) NOT NULL,
 Experiance int,
 DepartmentId int NOT NULL FOREIGN KEY REFERENCES Departments (DepartmentId),
 StudentsAmount int
)

CREATE TABLE GROUPS
(
 GroupId int IDENTITY NOT NULL PRIMARY KEY,
 GroupName varchar(15) NOT NULL,
 StudentsAmount int NOT NULL,
 DepartmentId int NOT NULL FOREIGN KEY REFERENCES Departments (DepartmentId),
 TeacherId int NOT NULL FOREIGN KEY REFERENCES Teachers (TeacherId)
)

CREATE TABLE Students
(
 StudentId int IDENTITY NOT NULL PRIMARY KEY,
 StudentFistName varchar(15) NOT NULL,
 StudentLastName varchar(15) NOT NULL,
 StudentAge int NOT NULL,
 DepartmentId int NOT NULL FOREIGN KEY REFERENCES Departments (DepartmentId),
 GroupId int NOT NULL FOREIGN KEY REFERENCES Groups (GroupId),
 FirstYear int NOT NULL
)

INSERT INTO Departments (DepartmentName, FoundationYear, StudentsAmount) VALUES
('Факультет иностранных дел', 2004, 156),
('Факультет почтовой связи', 1998, 93),
('Факультет философии', 1991, 218),
('Факультет английской филологии', 2008, 455)

INSERT INTO Teachers (TeacherFirstName, TeacherLastName, Experiance, DepartmentId, StudentsAmount) VALUES
('Василий', 'Андросов', 13, 1, 777),
('Павел', 'Маразли', 7, 1, 356),
('Анатолий', 'Карлсон', 25, 1, 1863),
('Кирилл', 'Короленко', 6, 1, 253),
('Анна', 'Олегова', 13, 3, 778),
('Карина', 'Полтавенко', 18, 3, 1011),
('Василий', 'Петренко', 2, 3, 223),
('Ирина', 'Сучкова', 24, 2, 898),
('Римма', 'Васильева', 14, 4, 1567),
('Ян', 'Антонов', 5, 4, 757),
('Алла', 'Рябушко', 8, 4, 1018),
('Марина', 'Погарская', 10, 4, 1256)

INSERT INTO GROUPS(GroupName, StudentsAmount, DepartmentId, TeacherId) VALUES
('FirstGroup', 18, 1, 2),
('SecondGroup', 11, 2, 8),
('ThirdGroup', 22, 4, 9)

INSERT INTO Students (StudentFistName, StudentLastName, StudentAge, DepartmentId, GroupId, FirstYear) VALUES
('Анатолий','Шаврин', 19, 2, 2, 2020),
('Дмитрий','Ставицкий', 21, 2, 2, 2018),
('Дмитрий','Степанов', 21, 2, 2, 2018),
('Марина','Мурадова', 23, 1, 1, 2016),
('Татьяна','Вильховик', 18, 1, 1, 2021),
('Анна','Самойлюк', 20, 3, 3, 2019),
('Виктория','Кузнецова', 22, 2, 2, 2017),
('Алла','Романова', 17, 3, 3, 2022),
('Кристина','Олешина', 19, 3, 3, 2020),
('Валерий','Шевченко', 17, 1, 1, 2022)

SELECT * FROM Departments
SELECT * FROM Teachers
SELECT * FROM GROUPS
SELECT * FROM Students

SELECT TeacherId, TeacherLastName, Experiance FROM Teachers WHERE Experiance LIKE '%2%'
SELECT * FROM GROUPS WHERE StudentsAmount < 22
SELECT * FROM Students WHERE StudentLastName LIKE 'С%'
SELECT DepartmentId, DepartmentName, FoundationYear FROM Departments WHERE FoundationYear LIKE '%8'

SELECT * FROM Students ORDER BY StudentLastName 
SELECT * FROM Teachers ORDER BY Experiance DESC

SELECT Count(StudentsAmount) as StudentsCount FROM Departments WHERE StudentsAmount>100
SELECT SUM(StudentsAmount) as GroupsTotalAmount FROM GROUPS
SELECT AVG(StudentAge) as AverageStudentsAge FROM Students WHERE GroupId=2
SELECT MAX(FirstYear) FROM Students
SELECT MIN(StudentsAmount) as TeacherCapacity FROM Teachers 

SELECT * FROM Students JOIN GROUPS on Students.GroupId = GROUPS.GroupId 