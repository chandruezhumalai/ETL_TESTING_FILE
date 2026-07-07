CREATE DATABASE Aggregate_Function;

USE Aggregate_Function;

/* Scenario 1 – Employee Salary Summary
Scenario
A company's HR department wants to know the total salary expense paid to all employees
every month.
Write a SQL query to generate the required report. */

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee VALUES
(101,'John','IT',50000),
(102,'Mary','HR',40000),
(103,'David','Finance',65000),
(104,'Sam','IT',55000),
(105,'Priya','HR',45000),
(106,'Arun','Sales',38000),
(107,'Kavin','Finance',70000),
(108,'Divya','Marketing',42000);

SELECT SUM(Salary) AS Total_Salary
FROM Employee;

/* Scenario 2 – Student Average Marks Report
Scenario
A training institute wants to calculate the average marks scored by all students in the SQL
course.
Write a SQL query to display the average marks. */

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(100),
    Course VARCHAR(50),
    Marks INT
);

INSERT INTO Student VALUES
(1,'Asha','SQL',85),
(2,'Rahul','SQL',76),
(3,'Kumar','SQL',90),
(4,'Priya','SQL',88),
(5,'John','SQL',67),
(6,'Mary','SQL',92),
(7,'David','SQL',81),
(8,'Arun','SQL',74),
(9,'Divya','SQL',95),
(10,'Kavin','SQL',84);

SELECT AVG(Marks) AS Average_Marks
FROM Student;

/* Scenario 3 – Product Price Analysis
Scenario
An e-commerce company wants to identify the most expensive product and the least expensive
product available in its inventory.
Write a SQL query to generate the report. */

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Product VALUES
(101,'Laptop','Electronics',65000),
(102,'Mouse','Electronics',800),
(103,'Keyboard','Electronics',1500),
(104,'Monitor','Electronics',12000),
(105,'Printer','Electronics',9500),
(106,'Tablet','Electronics',28000),
(107,'Speaker','Electronics',3000),
(108,'Smart Watch','Electronics',8500);

SELECT
MAX(Price) AS Highest_Price,
MIN(Price) AS Lowest_Price
FROM Product;

/* Scenario 4 – Customer Registration Report
Scenario
A banking application needs to know how many customers have registered in the system.
Write a SQL query to display the total number of customer records. */

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Mobile_No VARCHAR(15),
    City VARCHAR(50)
);

INSERT INTO Customer VALUES
(1,'John','9876543210','Chennai'),
(2,'Mary','9876543211','Bangalore'),
(3,'David','9876543212','Hyderabad'),
(4,'Priya','9876543213','Madurai'),
(5,'Arun','9876543214','Coimbatore'),
(6,'Kavin','9876543215','Salem'),
(7,'Divya','9876543216','Trichy'),
(8,'Rahul','9876543217','Erode'),
(9,'Asha','9876543218','Chennai'),
(10,'Ravi','9876543219','Bangalore'),
(11,'Sneha','9876543220','Madurai'),
(12,'Vijay','9876543221','Hyderabad');

SELECT COUNT(*) AS Total_Customers
FROM Customer;

/* Scenario 5 – Company Salary Dashboard
Scenario
The management team wants a salary summary dashboard that displays the following
information:
• Total number of employees
• Total salary paid
• Average salary
• Highest salary
• Lowest salary
Write a single SQL query to generate the dashboard. */

CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(101,'John','IT',50000),
(102,'Mary','HR',40000),
(103,'David','Finance',65000),
(104,'Sam','IT',55000),
(105,'Priya','HR',45000),
(106,'Arun','Sales',38000),
(107,'Kavin','Finance',70000),
(108,'Divya','Marketing',42000),
(109,'Ravi','Sales',48000),
(110,'Sneha','IT',60000);

SELECT
COUNT(*) AS Total_Employees,
SUM(Salary) AS Total_Salary,
AVG(Salary) AS Average_Salary,
MAX(Salary) AS Highest_Salary,
MIN(Salary) AS Lowest_Salary
FROM Employees;