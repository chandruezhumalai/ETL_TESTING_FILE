-- Create Database
CREATE DATABASE SELECT_TASK;

-- Select Database
USE SELECT_TASK;

/*Scenario 1: Employee Directory Report
Interview Question
The HR department wants a complete employee directory containing every column for all
employees.
*/

-- Create Employee Table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(30),
    Salary INT,
    City VARCHAR(30)
);

-- Insert Records
INSERT INTO Employee (EmpID, EmpName, Department, Salary, City)
VALUES
(101, 'John', 'IT', 50000, 'Chennai'),
(102, 'Mary', 'HR', 35000, 'Bangalore'),
(103, 'David', 'Finance', 60000, 'Hyderabad'),
(104, 'Sam', 'IT', 45000, 'Chennai'),
(105, 'Priya', 'HR', 40000, 'Madurai');

-- Display All Records
SELECT * FROM Employee;

/*Scenario 2: Finance Salary Report
Interview Question
The Finance Manager needs a report showing only employee names and their salaries.
*/

-- Display Only Employee Name and Salary
SELECT EmpName, Salary
FROM Employee;

/*Scenario 3: Unique Department List
Interview Question
The Administration team wants to know how many different departments exist in the company
without repeating department names. */

-- Display Unique Department Names
SELECT DISTINCT Department
FROM Employee;

/* Scenario 4: Unique Employee Cities
Interview Question
The company is planning new branch offices and wants a list of all unique cities where
employees are currently located. */

-- SDisplay Unique Cities
SELECT DISTINCT City
FROM Employee;


/* Scenario 5: Dashboard Preview Report
Interview Question
A dashboard should initially show only a small preview of employee records instead of loading
the entire table. */

-- Display the First Three Employee Records
SELECT * FROM Employee
LIMIT 3;
