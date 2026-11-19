University Course Management System
Project Overview
The University Course Management System is a MySQL database project designed to manage basic university information. It stores details about students, courses, instructors, enrollments, and departments.
Objectives
- Create a relational database with five related tables.
- Store and retrieve university records.
- Practice CRUD operations (Create, Read, Update, Delete).
- Use filtering, sorting, grouping, aggregate functions, and joins.
- Practice subqueries, string/date functions, CASE statements, and window functions.
Database Tables
Table	Purpose
Students	Stores student personal and enrollment details
Courses	Stores course names, department IDs, and credits
Instructors	Stores instructor details and department
Enrollments	Connects students with the courses they take
Departments	Stores university department names


Relationships
- One department can have many courses.
- One department can have many instructors.
- One student can have many enrollment records.
- One course can have many enrollment records.
- Enrollments connects Students and Courses.
Technologies
- MySQL
- MySQL Workbench
Main SQL Concepts Used
- CREATE DATABASE and CREATE TABLE
- Primary Key and Foreign Key
- INSERT, SELECT, UPDATE, DELETE
- WHERE, DISTINCT, LIMIT
- COUNT, AVG, MAX
- GROUP BY and HAVING
- INNER JOIN and LEFT JOIN
- Subqueries
- YEAR() and CONCAT()
- CASE statement
- COUNT() OVER() window function
How to Run
1. Open MySQL Workbench.
2. Open the University_Course_Management_System.sql file.
3. Connect to your MySQL server.
4. Execute the script from the beginning.
5. Run the SELECT statements to view the tables and query results.
Important Assignment Note
The PDF's Instructor table field list does not include a Salary column, but one of its required queries asks for the maximum instructor salary in the Computer Science department. To make that required query executable, this project adds Salary DECIMAL(10,2) to the Instructors table. This is the only additional field.
Sample Data Note
The project includes sample data beyond the two sample rows shown in the assignment so that conditions such as “more than 5 students” and “more than 10 students” return meaningful results during practice.
Expected Outcome
After running the SQL script, the database contains five related tables with sample records. The assignment queries can be executed to demonstrate CRUD operations, joins, aggregate functions, subqueries, date and string functions, CASE, and a running total.
Author
University Course Management System - SQL Final Project

Explanation Video : https://drive.google.com/file/d/1scsneHrYFFxFykg-iuBcR0yoLgQXq26a/view?usp=sharing
