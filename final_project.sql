CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;

-- Drop tables in child-to-parent order so the script can be rerun.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Departments;
SET FOREIGN_KEY_CHECKS = 1;

-- 1. DEPARTMENTS
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- 2. STUDENTS
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    BirthDate DATE,
    EnrollmentDate DATE
);

-- 3. INSTRUCTORS
-- Salary is included as an additional field because query 8 in the
-- assignment asks for the maximum instructor salary.
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    DepartmentID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 4. COURSES
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 5. ENROLLMENTS
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- SAMPLE DATA: DEPARTMENTS
INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Mathematics');

-- SAMPLE DATA: STUDENTS
INSERT INTO Students VALUES
(1, 'John', 'Doe', 'john.doe@gmail.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@gmail.com', '1999-05-25', '2021-08-01'),
(3, 'Rahul', 'Shah', 'rahul.shah@gmail.com', '2002-03-10', '2023-01-15'),
(4, 'Riya', 'Patel', 'riya.patel@gmail.com', '2001-07-20', '2023-06-01'),
(5, 'Amit', 'Joshi', 'amit.joshi@gmail.com', '2000-11-12', '2024-01-10'),
(6, 'Neha', 'Sharma', 'neha.sharma@gmail.com', '2002-02-18', '2024-06-01'),
(7, 'Raj', 'Mehta', 'raj.mehta@gmail.com', '2001-09-15', '2022-01-01'),
(8, 'Priya', 'Desai', 'priya.desai@gmail.com', '2003-04-22', '2023-08-01'),
(9, 'Karan', 'Patel', 'karan.patel@gmail.com', '2000-12-05', '2021-07-01'),
(10, 'Meera', 'Joshi', 'meera.joshi@gmail.com', '2002-06-14', '2024-02-01'),
(11, 'Rohan', 'Shah', 'rohan.shah@gmail.com', '2001-08-25', '2025-01-01'),
(12, 'Pooja', 'Dave', 'pooja.dave@gmail.com', '2003-10-10', '2025-06-01');

-- SAMPLE DATA: INSTRUCTORS
INSERT INTO Instructors VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@gmail.com', 1, 50000.00),
(2, 'Bob', 'Lee', 'bob.lee@gmail.com', 2, 60000.00),
(3, 'David', 'Smith', 'david.smith@gmail.com', 1, 75000.00);

-- SAMPLE DATA: COURSES
INSERT INTO Courses VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 1, 4),
(201, 'Mathematics 1', 2, 3),
(202, 'Mathematics 2', 2, 4),
(203, 'Algebra', 2, 3),
(204, 'Statistics', 2, 4),
(205, 'Calculus', 2, 5),
(206, 'Geometry', 2, 3);

-- SAMPLE DATA: ENROLLMENTS
-- Course 101 has 12 students; course 102 has 6 students.
-- This makes the assignment's HAVING and subquery questions demonstrable.
INSERT INTO Enrollments VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 101, '2021-08-01'),
(3, 3, 101, '2023-01-15'),
(4, 4, 101, '2023-06-01'),
(5, 5, 101, '2024-01-10'),
(6, 6, 101, '2024-06-01'),
(7, 7, 101, '2022-01-01'),
(8, 8, 101, '2023-08-01'),
(9, 9, 101, '2021-07-01'),
(10, 10, 101, '2024-02-01'),
(11, 11, 101, '2025-01-01'),
(12, 12, 101, '2025-06-01'),
(13, 1, 102, '2022-08-01'),
(14, 2, 102, '2021-08-01'),
(15, 3, 102, '2023-01-15'),
(16, 4, 102, '2023-06-01'),
(17, 5, 102, '2024-01-10'),
(18, 6, 102, '2024-06-01'),
(19, 7, 201, '2022-01-01'),
(20, 8, 202, '2023-08-01'),
(21, 9, 203, '2021-07-01');

-- CHECK TABLE DATA
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Enrollments;
SELECT * FROM Departments;

-- ASSIGNMENT QUERIES

-- 1. CRUD OPERATIONS (example on all tables)
-- CREATE
INSERT INTO Students VALUES
(13, 'Test', 'Student', 'test.student@gmail.com', '2004-01-01', '2025-08-01');
INSERT INTO Courses VALUES (207, 'Programming Basics', 1, 3);
INSERT INTO Instructors VALUES (4, 'Sara', 'Khan', 'sara.khan@gmail.com', 1, 55000.00);
INSERT INTO Departments VALUES (3, 'Business');
INSERT INTO Enrollments VALUES (22, 13, 207, '2025-08-01');

-- READ
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Departments;
SELECT * FROM Enrollments;

-- UPDATE
UPDATE Students SET FirstName = 'Aarav' WHERE StudentID = 13;
UPDATE Courses SET Credits = 4 WHERE CourseID = 207;
UPDATE Instructors SET Salary = 58000 WHERE InstructorID = 4;
UPDATE Departments SET DepartmentName = 'Business Studies' WHERE DepartmentID = 3;
UPDATE Enrollments SET EnrollmentDate = '2025-08-05' WHERE EnrollmentID = 22;

-- DELETE (delete child record before its referenced parent records)
DELETE FROM Enrollments WHERE EnrollmentID = 22;
DELETE FROM Courses WHERE CourseID = 207;
DELETE FROM Instructors WHERE InstructorID = 4;
DELETE FROM Students WHERE StudentID = 13;
DELETE FROM Departments WHERE DepartmentID = 3;

-- 2. RETRIEVE STUDENTS ENROLLED AFTER 2022
SELECT *
FROM Students
WHERE EnrollmentDate >= '2023-01-01';

-- 3. RETRIEVE MATHEMATICS COURSES WITH A LIMIT OF 5
SELECT C.*
FROM Courses C
JOIN Departments D ON C.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Mathematics'
LIMIT 5;

-- 4. COUNT STUDENTS IN EACH COURSE; SHOW COURSES WITH MORE THAN 5
SELECT C.CourseID, C.CourseName, COUNT(E.StudentID) AS TotalStudents
FROM Courses C
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.CourseID, C.CourseName
HAVING COUNT(E.StudentID) > 5;

-- 5. STUDENTS ENROLLED IN BOTH SQL AND DATA STRUCTURES
SELECT S.StudentID, S.FirstName, S.LastName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
JOIN Courses C ON E.CourseID = C.CourseID
WHERE C.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP BY S.StudentID, S.FirstName, S.LastName
HAVING COUNT(DISTINCT C.CourseName) = 2;

-- 6. STUDENTS ENROLLED IN EITHER SQL OR DATA STRUCTURES
SELECT DISTINCT S.StudentID, S.FirstName, S.LastName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
JOIN Courses C ON E.CourseID = C.CourseID
WHERE C.CourseName IN ('Introduction to SQL', 'Data Structures');

-- 7. AVERAGE CREDITS OFFERED BY THE UNIVERSITY
SELECT AVG(Credits) AS AverageCredits
FROM Courses;

-- 8. MAXIMUM INSTRUCTOR SALARY IN COMPUTER SCIENCE
SELECT MAX(I.Salary) AS MaximumSalary
FROM Instructors I
JOIN Departments D ON I.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Computer Science';

-- 9. COUNT STUDENTS ENROLLED IN EACH DEPARTMENT
SELECT D.DepartmentID, D.DepartmentName,
       COUNT(DISTINCT E.StudentID) AS TotalStudents
FROM Departments D
LEFT JOIN Courses C ON D.DepartmentID = C.DepartmentID
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY D.DepartmentID, D.DepartmentName;

-- 10. INNER JOIN: STUDENTS AND THEIR CORRESPONDING COURSES
SELECT S.StudentID, S.FirstName, S.LastName, C.CourseName
FROM Students S
INNER JOIN Enrollments E ON S.StudentID = E.StudentID
INNER JOIN Courses C ON E.CourseID = C.CourseID;

-- 11. LEFT JOIN: ALL STUDENTS AND THEIR COURSES, IF ANY
SELECT S.StudentID, S.FirstName, S.LastName, C.CourseName
FROM Students S
LEFT JOIN Enrollments E ON S.StudentID = E.StudentID
LEFT JOIN Courses C ON E.CourseID = C.CourseID;

-- 12. SUBQUERY: STUDENTS ENROLLED IN COURSES WITH MORE THAN 10 STUDENTS
SELECT DISTINCT S.StudentID, S.FirstName, S.LastName
FROM Students S
WHERE S.StudentID IN (
    SELECT E.StudentID
    FROM Enrollments E
    WHERE E.CourseID IN (
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 10
    )
);

-- 13. EXTRACT YEAR FROM STUDENTS' ENROLLMENT DATE
SELECT StudentID, FirstName, YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;

-- 14. CONCATENATE INSTRUCTOR FIRST NAME AND LAST NAME
SELECT InstructorID,
       CONCAT(FirstName, ' ', LastName) AS InstructorFullName
FROM Instructors;

-- 15. RUNNING TOTAL OF STUDENTS ENROLLED IN COURSES
SELECT EnrollmentID, StudentID, CourseID,
       COUNT(*) OVER (ORDER BY EnrollmentID) AS RunningTotal
FROM Enrollments;

-- 16. LABEL STUDENTS AS SENIOR OR JUNIOR
-- Senior: enrolled 4 or more years ago; otherwise Junior.
SELECT StudentID, FirstName, EnrollmentDate,
       CASE
           WHEN EnrollmentDate <= DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
               THEN 'Senior'
           ELSE 'Junior'
       END AS StudentStatus
FROM Students;

