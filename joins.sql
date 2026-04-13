CREATE DATABASE university_join_lab;
USE university_join_lab;

CREATE TABLE DEPARTMENT (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL UNIQUE,
    Building VARCHAR(100) NOT NULL
);

CREATE TABLE STUDENT (
    StudentID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    DeptID INT,
    Batch VARCHAR(20) NOT NULL,
    CGPA DECIMAL(3,2),
    FOREIGN KEY (DeptID) REFERENCES DEPARTMENT(DeptID)
);

CREATE TABLE COURSE (
    CourseID INT PRIMARY KEY,
    CourseTitle VARCHAR(100) NOT NULL,
    Credit INT CHECK (Credit > 0),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES DEPARTMENT(DeptID)
);

CREATE TABLE ENROLLMENT (
    EnrollID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Semester VARCHAR(20) NOT NULL,
    Marks INT CHECK (Marks >= 0 AND Marks <= 100),
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
    FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID)
);

INSERT INTO DEPARTMENT VALUES
(1, 'CSE', 'A Building'),
(2, 'EEE', 'B Building'),
(3, 'BBA', 'C Building'),
(4, 'ENG', 'D Building');

INSERT INTO STUDENT VALUES
(1, 'Sakib Hasan', 1, '2021', 3.75),
(2, 'Arif Hossain', 2, '2020', 3.50),
(3, 'Sumaiya Akter', 1, '2022', 3.90),
(4, 'Nusrat Jahan', 3, '2021', 3.20),
(5, 'Shanto Das', 4, '2019', 3.10),
(6, 'Tanvir Ahmed', 2, '2020', 3.60),
(7, 'Salman Khan', 1, '2021', 3.80),
(8, 'Rafiul Islam', 3, '2022', 3.30);

INSERT INTO COURSE VALUES
(1, 'Database Systems', 3, 1),
(2, 'Circuit Theory', 3, 2),
(3, 'Marketing', 3, 3),
(4, 'English Literature', 3, 4),
(5, 'Data Structures', 3, 1),
(6, 'Digital Electronics', 3, 2);

INSERT INTO ENROLLMENT VALUES
(1, 1, 1, 'Spring 2024', 85),
(2, 1, 5, 'Spring 2024', 78),
(3, 2, 2, 'Spring 2024', 65),
(4, 2, 6, 'Spring 2024', 70),
(5, 3, 1, 'Spring 2024', 92),
(6, 3, 5, 'Spring 2024', 88),
(7, 4, 3, 'Spring 2024', 75),
(8, 5, 4, 'Spring 2024', 60),
(9, 6, 2, 'Spring 2024', 82),
(10, 7, 5, 'Spring 2024', 90),
(11, 8, 3, 'Spring 2024', 68),
(12, 7, 1, 'Spring 2024', 87);

SELECT s.FullName, d.DeptName
FROM STUDENT s
INNER JOIN DEPARTMENT d ON s.DeptID = d.DeptID;

SELECT s.FullName, c.CourseTitle, e.Semester, e.Marks
FROM ENROLLMENT e
INNER JOIN STUDENT s ON e.StudentID = s.StudentID
INNER JOIN COURSE c ON e.CourseID = c.CourseID;

SELECT s.FullName, e.CourseID
FROM STUDENT s
LEFT JOIN ENROLLMENT e ON s.StudentID = e.StudentID;

SELECT c.CourseTitle, e.StudentID
FROM COURSE c
LEFT JOIN ENROLLMENT e ON c.CourseID = e.CourseID;

SELECT d.DeptName, COUNT(s.StudentID) AS TotalStudents
FROM DEPARTMENT d
LEFT JOIN STUDENT s ON d.DeptID = s.DeptID
GROUP BY d.DeptName;

SELECT c.CourseTitle, COUNT(e.StudentID) AS TotalEnrolled
FROM COURSE c
LEFT JOIN ENROLLMENT e ON c.CourseID = e.CourseID
GROUP BY c.CourseTitle;

SELECT c.CourseTitle,
       AVG(e.Marks) AS AvgMarks,
       MAX(e.Marks) AS MaxMarks,
       MIN(e.Marks) AS MinMarks
FROM COURSE c
JOIN ENROLLMENT e ON c.CourseID = e.CourseID
GROUP BY c.CourseTitle;

SELECT s.FullName,
       COUNT(e.CourseID) AS TotalCourses,
       AVG(e.Marks) AS AvgMarks
FROM STUDENT s
LEFT JOIN ENROLLMENT e ON s.StudentID = e.StudentID
GROUP BY s.FullName;

SELECT s.FullName, AVG(e.Marks) AS AvgMarks
FROM STUDENT s
JOIN ENROLLMENT e ON s.StudentID = e.StudentID
GROUP BY s.FullName
ORDER BY AvgMarks DESC
LIMIT 3;

SELECT d.DeptName, COUNT(s.StudentID) AS TotalStudents
FROM DEPARTMENT d
JOIN STUDENT s ON d.DeptID = s.DeptID
GROUP BY d.DeptName
HAVING COUNT(s.StudentID) > 2;

SELECT s.FullName, e.Marks
FROM STUDENT s
JOIN ENROLLMENT e ON s.StudentID = e.StudentID
WHERE e.Marks BETWEEN 60 AND 85;

SELECT FullName
FROM STUDENT
WHERE FullName LIKE 'S%' OR FullName LIKE '%a%';