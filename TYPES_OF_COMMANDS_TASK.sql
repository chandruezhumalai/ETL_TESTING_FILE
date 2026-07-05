-- Create Database (Optional)
CREATE DATABASE TaskDatabase;

-- Select Database
USE TaskDatabase;

/* Scenario 1 - Employee Management System 
Scenario
You have joined an IT company as a Database Developer.
The HR team wants to maintain employee information.
Create an Employee table and insert the given records.
Later, HR asks you to display all employee details.
DQL */

-- Create Employee Table
CREATE TABLE Employee (
    EmpID INT,
    EmpName VARCHAR(50),
    Department VARCHAR(30),
    Salary INT
);

-- Insert Records
INSERT INTO Employee (EmpID, EmpName, Department, Salary)
VALUES
(101, 'John', 'IT', 45000),
(102, 'Mary', 'HR', 35000),
(103, 'David', 'Finance', 55000),
(104, 'Sam', 'IT', 40000),
(105, 'Priya', 'HR', 38000);

-- Display All Employee Records (DQL)
SELECT * FROM Employee;

/*Scenario 2 - College Student Database
Scenario
A college wants to maintain student details.
Create a Student table and insert the following records.
Later, the college decides to add an Email column.
DDL */

-- Create Student Table
CREATE TABLE Student (
    StudentID INT,
    StudentName VARCHAR(50),
    Course VARCHAR(30)
);

-- Insert Records
INSERT INTO Student (StudentID, StudentName, Course)
VALUES
(1, 'Rahul', 'SQL'),
(2, 'Priya', 'Python'),
(3, 'Arun', 'Power BI'),
(4, 'Sneha', 'Java'),
(5, 'Karthik', 'SQL');

-- Display Records Before Altering
SELECT * FROM Student;

-- Add a New Column (DDL)
ALTER TABLE Student
ADD Email VARCHAR(100);

-- Display Table Structure
DESCRIBE Student;

-- Display Records After Altering
SELECT * FROM Student;

/*Scenario 3 - Online Shopping System
Scenario
An online shopping company stores product information.
Create a Product table and insert the following records.
Later, the manager wants to increase the price of Product ID 103.
DML */

-- Create Product Table
CREATE TABLE Product (
    ProductID INT,
    ProductName VARCHAR(50),
    Price INT
);

-- Insert Records
INSERT INTO Product (ProductID, ProductName, Price)
VALUES
(101, 'Laptop', 60000),
(102, 'Mouse', 800),
(103, 'Keyboard', 1200),
(104, 'Monitor', 15000),
(105, 'Printer', 9000);

-- Display Records Before Update
SELECT * FROM Product;

-- Update Price of Product ID 103 (DML)
UPDATE Product
SET Price = 1500
WHERE ProductID = 103;

-- Display Records After Update
SELECT * FROM Product;


/* Scenario 4 - Hospital Database
Scenario
A hospital stores patient details.
Create a Patient table and insert the following records.
Later, Patient ID 2 requests that their record be removed from the system.
DML */

-- Create Patient Table
CREATE TABLE Patient (
    PatientID INT,
    PatientName VARCHAR(50),
    Disease VARCHAR(50)
);

-- Insert Records
INSERT INTO Patient (PatientID, PatientName, Disease)
VALUES
(1, 'Ramesh', 'Fever'),
(2, 'Suresh', 'Cold'),
(3, 'Anitha', 'Diabetes'),
(4, 'Meena', 'Asthma'),
(5, 'Kumar', 'Typhoid');

-- Display Records Before Delete
SELECT * FROM Patient;

-- Delete Patient ID 2 (DML)
DELETE FROM Patient
WHERE PatientID = 2;

-- Display Records After Delete
SELECT * FROM Patient;

/*Scenario 5 - School Management System
Scenario
A school created a temporary table for annual event registration.
After the event, the school wants to remove all records but keep the table for next year.
DDL */

-- Create EventRegistration Table
CREATE TABLE EventRegistration (
    StudentID INT,
    StudentName VARCHAR(50),
    EventName VARCHAR(50)
);

-- Insert Records
INSERT INTO EventRegistration (StudentID, StudentName, EventName)
VALUES
(1, 'Rahul', 'Dance'),
(2, 'Priya', 'Singing'),
(3, 'Arun', 'Drawing'),
(4, 'Sneha', 'Quiz'),
(5, 'Karthik', 'Drama');

-- Display Records Before Removing
SELECT * FROM EventRegistration;

-- Remove All Records but Keep the Table Structure (DDL)
TRUNCATE TABLE EventRegistration;

-- Display Records After TRUNCATE
SELECT * FROM EventRegistration;

-- Verify the Table Structure Still Exists
DESCRIBE EventRegistration;


/*Scenario 6 - Company Database
Scenario
The company wants to rename its existing Employee table to Staff.
DDL */

-- Create Employee Table
CREATE TABLE Employee_data (
    EmpID INT,
    EmpName VARCHAR(50),
    Salary INT
);

-- Insert Records
INSERT INTO Employee_data (EmpID, EmpName, Salary)
VALUES
(101, 'John', 45000),
(102, 'Mary', 35000),
(103, 'David', 50000),
(104, 'Sam', 42000),
(105, 'Priya', 39000);

-- Display Employee Table
SELECT * FROM Employee_data;

-- Rename Employee Table to Staff (DDL)
RENAME TABLE Employee_data TO Staff;

-- Display Records from the Renamed Table
SELECT * FROM Staff;

-- Verify the Table Name
SHOW TABLES;

/* Scenario 7 - Banking System
Scenario
A bank manager updates a customer's account balance.
The manager wants the changes to be permanently saved in the database.
TCL */


-- Create Account Table
CREATE TABLE Account (
    AccountNo INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Balance INT
);

-- Insert Records
INSERT INTO Account (AccountNo, CustomerName, Balance)
VALUES
(1001, 'John', 50000),
(1002, 'Mary', 30000),
(1003, 'David', 70000),
(1004, 'Sam', 45000),
(1005, 'Priya', 60000);

-- Display Records Before Update
SELECT * FROM Account;

-- Start Transaction
START TRANSACTION;

SET SQL_SAFE_UPDATES = 0;

-- Update Balance
UPDATE Account
SET Balance = 35000
WHERE AccountNo = 1002;

SET SQL_SAFE_UPDATES = 1;
-- Permanently Save the Changes (TCL)
COMMIT;

-- Display Records After Update
SELECT * FROM Account;

/* Scenario 8 - Library Management System
Scenario
A librarian accidentally deletes one book record.
Before committing the transaction, they realize the mistake and want to restore the deleted
record.
TCL */

-- Create Book Table
CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    BookName VARCHAR(50),
    Author VARCHAR(50)
);

-- Insert Records
INSERT INTO Book (BookID, BookName, Author)
VALUES
(1, 'SQL Basics', 'James'),
(2, 'Python Guide', 'Robert'),
(3, 'Java Programming', 'John'),
(4, 'Power BI', 'David'),
(5, 'Data Science', 'Peter');

-- Display Records Before Delete
SELECT * FROM Book;

-- Start Transaction
START TRANSACTION;

-- Delete Book ID 3
DELETE FROM Book
WHERE BookID = 3;

-- Check the Table After Delete
SELECT * FROM Book;

-- Restore the Deleted Record
ROLLBACK;

-- Display Records After Rollback
SELECT * FROM Book;

/*Scenario 9 - Company Security
Scenario
A new employee named Student1 has joined the reporting team.
The manager wants the employee to view employee details but should not modify any records.
DCL */

-- Create Employee Table
CREATE TABLE Employee_Table (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(30),
    Salary INT
);

-- Insert Records
INSERT INTO Employee_Table (EmpID, EmpName, Department, Salary)
VALUES
(101, 'John', 'IT', 45000),
(102, 'Mary', 'HR', 35000),
(103, 'David', 'Finance', 50000),
(104, 'Sam', 'IT', 42000),
(105, 'Priya', 'HR', 38000);

-- Display Employee Records
SELECT * FROM Employee_Table;

-- Create User (Run if Student1 does not already exist)
CREATE USER 'Student1'@'localhost' IDENTIFIED BY 'Student123';

-- Grant View Permission Only (DCL)
GRANT SELECT
ON CompanyDB.Employee
TO 'Student1'@'localhost';

-- Apply the Privileges
FLUSH PRIVILEGES;

-- Verify the Granted Permissions
SHOW GRANTS FOR 'Student1'@'localhost';

/* Scenario 10 - E-Commerce Database
Scenario
A junior developer accidentally creates a table called CustomerDetails2026.
The company decides to delete the entire table because it is no longer required.
DDL */
-- Create CustomerDetails2026 Table
CREATE TABLE CustomerDetails2026 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

-- Insert Records
INSERT INTO CustomerDetails2026 (CustomerID, CustomerName, City)
VALUES
(1, 'John', 'Chennai'),
(2, 'Mary', 'Bangalore'),
(3, 'David', 'Hyderabad'),
(4, 'Sam', 'Coimbatore'),
(5, 'Priya', 'Madurai');

-- Display Records Before Dropping the Table
SELECT * FROM CustomerDetails2026;

-- Delete the Entire Table Permanently (DDL)
DROP TABLE CustomerDetails2026;

-- Verify the Table Has Been Deleted
SHOW TABLES;
