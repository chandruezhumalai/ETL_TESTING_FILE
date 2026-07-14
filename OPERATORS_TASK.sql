CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Age INT
);
SELECT * FROM employee;
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101,'Arun','HR',35000,25),
(102,'Bala',NULL,42000,28),
(103,'Anand','IT',50000,30),
(104,'Deepan','Sales',48000,27),
(105,'Akash','Sales',55000,24),
(106,'Farhan',NULL,45000,31),
(107,'Kiran','IT',60000,29),
(108,'Rohan','Marketing',41000,26),
(109,'Ajith','Finance',47000,32),
(110,'Mohan',NULL,46000,27),
(111,'Aravind','HR',52000,30),
(112,'Balan','Sales',49000,28);

/* Scenario 1 – Employee Salary Revision
Report
Scenario
A company is planning to provide a fixed salary increment of ₹5,000 to every employee. The HR
department wants to generate a report showing both the current salary and the revised salary after
the increment.
Write a SQL query to generate the report. */

SELECT
Emp_ID,
Emp_Name,
Salary AS Current_Salary,
Salary + 5000 AS Revised_Salary
FROM Employee;

/* Scenario
The HR department wants to identify employees who belong to the Sales department and
whose salary is greater than ₹45,000.
Generate a report containing only employees who satisfy both conditions. */

SELECT *
FROM Employee
WHERE Department='Sales'
AND Salary > 45000;

/* Scenario 3 – Department-wise Employee
Search
Scenario
The management wants to retrieve employees who are working in either the HR department or
the IT department.
Generate a report displaying all matching employees. */

SELECT *
FROM Employee
WHERE Department='HR'
OR Department='IT';

/* Scenario 4 – Employee Name Pattern Search
Scenario
The recruitment team wants to identify employees whose names start with the letter 'A' and
employees whose names end with the letter 'n'.
Write the required SQL queries to generate both reports. */
-- Scenario 4(a) – Names Starting with 'A
SELECT *
FROM Employee
WHERE Emp_Name LIKE 'A%';

-- Scenario 4(b) – Names Ending with 'n'
SELECT *
FROM Employee
WHERE Emp_Name LIKE '%n';

/* Scenario 5 – Employee Data Validation
Report
Scenario
A company has migrated employee records from another system. During migration, some
employees were assigned a department, while others were left without one.
Generate the following reports:
• Employees whose department information is missing.
• Employees whose department information is available. */

-- Scenario 5(a) – Department is NULL
SELECT *
FROM Employee
WHERE Department IS NULL;

-- Scenario 5(b) – Department is NOT NULL

SELECT *
FROM Employee
WHERE Department IS NOT NULL;