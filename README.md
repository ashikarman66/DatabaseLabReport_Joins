This project is developed as part of the **Database Lab (CSE 210)** course at **Green University of Bangladesh**.  
It demonstrates the design and implementation of a relational database using **SQL JOIN operations and aggregate functions**.

---

## 📌 Lab Objective

The main objectives of this lab are:
- To design a relational database with multiple related tables  
- To implement **Primary Key** and **Foreign Key** relationships  
- To perform **JOIN operations (INNER JOIN, LEFT JOIN)**  
- To retrieve meaningful data from multiple tables  
- To use **aggregate functions** for analysis  
- To apply **GROUP BY, HAVING, ORDER BY, and LIMIT**  

---

## 🗂️ Database Overview

Database Name: **`university_join_lab`**

The system consists of four tables:

---

### 📄 1. DEPARTMENT

| Field      | Type         | Description |
|------------|--------------|------------|
| DeptID     | INT (PK)     | Unique department ID |
| DeptName   | VARCHAR      | Unique department name |
| Building   | VARCHAR      | Building name |

---

### 📄 2. STUDENT

| Field      | Type         | Description |
|------------|--------------|------------|
| StudentID  | INT (PK)     | Unique student ID |
| FullName   | VARCHAR      | Student name |
| DeptID     | INT (FK)     | References DEPARTMENT |
| Batch      | VARCHAR      | Student batch |
| CGPA       | DECIMAL      | Academic performance |

---

### 📄 3. COURSE

| Field        | Type        | Description |
|--------------|------------|------------|
| CourseID     | INT (PK)   | Unique course ID |
| CourseTitle  | VARCHAR    | Course name |
| Credit       | INT        | Credit (must be > 0) |
| DeptID       | INT (FK)   | References DEPARTMENT |

---

### 📄 4. ENROLLMENT

| Field       | Type        | Description |
|------------|------------|------------|
| EnrollID   | INT (PK)   | Unique enrollment ID |
| StudentID  | INT (FK)   | References STUDENT |
| CourseID   | INT (FK)   | References COURSE |
| Semester   | VARCHAR    | Semester name |
| Marks      | INT        | Marks (0–100) |

---

## 🔗 Entity Relationships

- One **Department** has many **Students**  
- One **Department** offers many **Courses**  
- One **Student** can enroll in multiple **Courses**  
- **Enrollment** table connects Students and Courses  

---

## ⚙️ Key SQL Concepts Used

### 🔹 JOIN Operations
- **INNER JOIN** → Returns matching records from multiple tables  
- **LEFT JOIN** → Returns all records from left table and matched records  

---

### 🔹 Aggregate Functions
- `COUNT()` → Total records  
- `AVG()` → Average marks  
- `MAX()` → Highest marks  
- `MIN()` → Lowest marks  

---

### 🔹 Filtering & Conditions
- `WHERE` → Filter records  
- `LIKE` → Pattern matching  
- `BETWEEN` → Range filtering  

---

### 🔹 Grouping & Sorting
- `GROUP BY` → Group data  
- `HAVING` → Filter grouped data  
- `ORDER BY` → Sort results  
- `LIMIT` → Restrict output size  

---
## 📖 Discussion

This project demonstrates the practical implementation of a relational database system using SQL. The database was designed with multiple interconnected tables (DEPARTMENT, STUDENT, COURSE, and ENROLLMENT), ensuring proper normalization and data integrity through the use of primary and foreign keys.

The use of **JOIN operations** played a crucial role in retrieving meaningful information from multiple tables. INNER JOIN helped to display only matching records, while LEFT JOIN ensured that unmatched data (such as students without enrollment or courses without students) could also be identified.

Additionally, **aggregate functions** such as COUNT(), AVG(), MIN(), and MAX() were used to analyze academic performance and enrollment statistics. The GROUP BY and HAVING clauses made it possible to summarize and filter grouped data effectively.

Different filtering techniques using WHERE, LIKE, and BETWEEN allowed precise data extraction based on conditions. Sorting and limiting results using ORDER BY and LIMIT further enhanced data analysis capabilities.

Overall, this lab provided a strong understanding of how relational databases operate and how complex queries can be written to extract valuable insights from structured data.

---

## 📌 Summary

In this project, a university database named `university_join_lab` was successfully designed and implemented using SQL. Four related tables—DEPARTMENT, STUDENT, COURSE, and ENROLLMENT—were created with proper constraints to maintain data consistency and relationships.

Various SQL operations were performed, including JOIN queries, filtering, grouping, and aggregation. These operations enabled efficient retrieval and analysis of data such as student performance, course enrollment, and departmental statistics.

This lab significantly improved knowledge of relational database design, SQL JOIN operations, and data analysis techniques. It also strengthened the ability to work with real-world database scenarios and write optimized SQL queries.

---
