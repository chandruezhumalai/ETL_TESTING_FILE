CREATE DATABASE TASK8_clause;
USE TASK8_clause;

/* Scenario 1 – Department Salary Analysis
Scenario
The HR department wants to identify departments where the average employee salary is
greater than the company's salary benchmark is ₹60,000.
Display the Department and its Average Salary.
Sort the result by Average Salary in descending order and display only the top 3 departments.*/

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Experience INT
);

INSERT INTO Employee VALUES
(101,'Arun','IT',75000,5),
(102,'Bala','HR',55000,3),
(103,'Chandru','IT',85000,6),
(104,'Deepak','Finance',90000,8),
(105,'Ezhil','HR',62000,4),
(106,'Farook','Marketing',58000,2),
(107,'Ganesh','Finance',95000,9),
(108,'Hari','IT',65000,4),
(109,'Indhu','Marketing',70000,5),
(110,'John','Sales',45000,2),
(111,'Karthik','Sales',50000,3),
(112,'Lavanya','Finance',88000,7),
(113,'Mani','IT',72000,5),
(114,'Nisha','HR',68000,6),
(115,'Priya','Marketing',75000,7);

SELECT Department,
AVG(Salary) AS Average_Salary
FROM Employee
GROUP BY Department
HAVING AVG(Salary)>60000
ORDER BY Average_Salary DESC
LIMIT 3;

/* Scenario 2 – Top Performing Products
Scenario
An e-commerce company wants to identify the top-selling products.
Display each Product Category along with the total quantity sold.
Only display categories that have sold more than the company's minimum sales requirement 100
units.
Sort the result from highest to lowest quantity sold and display only the top 5 categories. */

CREATE TABLE Sales(
Sale_ID INT PRIMARY KEY,
Product_Name VARCHAR(100),
Category VARCHAR(50),
Quantity INT,
Sale_Date DATE
);

INSERT INTO Sales VALUES
(1,'Laptop','Electronics',30,'2026-07-01'),
(2,'Mobile','Electronics',40,'2026-07-02'),
(3,'TV','Electronics',45,'2026-07-03'),
(4,'Rice','Groceries',60,'2026-07-01'),
(5,'Oil','Groceries',50,'2026-07-04'),
(6,'Sugar','Groceries',35,'2026-07-05'),
(7,'Shirt','Fashion',40,'2026-07-01'),
(8,'Jeans','Fashion',35,'2026-07-03'),
(9,'Shoes','Fashion',50,'2026-07-04'),
(10,'Novel','Books',40,'2026-07-02'),
(11,'Dictionary','Books',30,'2026-07-03'),
(12,'Notebook','Books',45,'2026-07-05'),
(13,'Chair','Furniture',25,'2026-07-01'),
(14,'Table','Furniture',20,'2026-07-03'),
(15,'Sofa','Furniture',30,'2026-07-04'),
(16,'Pen','Stationery',50,'2026-07-02'),
(17,'Pencil','Stationery',45,'2026-07-03'),
(18,'Eraser','Stationery',20,'2026-07-04'),
(19,'Fan','Electronics',35,'2026-07-05'),
(20,'Mixer','Electronics',20,'2026-07-06');

SELECT Category,
SUM(Quantity) AS Total_Quantity
FROM Sales
GROUP BY Category
HAVING SUM(Quantity)>100
ORDER BY Total_Quantity DESC
LIMIT 5;

/* Scenario 3 – Customer Purchase Report
Scenario
A retail company wants to prepare a customer purchase report.
Display only customers whose purchase amount satisfies the company's Purchase_Amount ≥
₹25,000.
Remove duplicate city names in the report and display the customers in ascending alphabetical
order.*/

CREATE TABLE Customer(
Customer_ID INT PRIMARY KEY,
Customer_Name VARCHAR(100),
City VARCHAR(50),
Purchase_Amount DECIMAL(10,2)
);

INSERT INTO Customer VALUES
(1,'Arun','Chennai',30000),
(2,'Bala','Bangalore',22000),
(3,'Chandru','Chennai',45000),
(4,'Deepak','Hyderabad',50000),
(5,'Ezhil','Pune',28000),
(6,'Farook','Delhi',15000),
(7,'Ganesh','Mumbai',35000),
(8,'Hari','Chennai',26000),
(9,'Indhu','Bangalore',32000),
(10,'John','Coimbatore',18000),
(11,'Karthik','Pune',42000),
(12,'Lavanya','Mumbai',29000),
(13,'Mani','Delhi',38000),
(14,'Nisha','Hyderabad',27000),
(15,'Priya','Chennai',55000);

SELECT DISTINCT City,
Customer_Name,
Purchase_Amount
FROM Customer
WHERE Purchase_Amount>=25000
ORDER BY Customer_Name;

/* Scenario 4 – Hospital Department Patient
Analysis
Scenario
A hospital wants to analyze the number of patients treated in each department.
Display the Department Name and Total Patients.
Show only those departments that have treated more than the hospital's required More than 3
patients.
Sort the result based on the total number of patients in descending order.*/

CREATE TABLE Patient(
Patient_ID INT PRIMARY KEY,
Patient_Name VARCHAR(100),
Department VARCHAR(50),
Treatment_Cost DECIMAL(10,2)
);

INSERT INTO Patient VALUES
(1,'A','Cardiology',50000),
(2,'B','Cardiology',45000),
(3,'C','Cardiology',60000),
(4,'D','Cardiology',55000),
(5,'E','Neurology',70000),
(6,'F','Neurology',68000),
(7,'G','Neurology',72000),
(8,'H','Orthopedics',35000),
(9,'I','Orthopedics',40000),
(10,'J','Orthopedics',45000),
(11,'K','Orthopedics',50000),
(12,'L','ENT',25000),
(13,'M','ENT',26000),
(14,'N','ENT',27000),
(15,'O','Pediatrics',30000),
(16,'P','Pediatrics',31000),
(17,'Q','Pediatrics',32000),
(18,'R','Pediatrics',33000),
(19,'S','Dermatology',20000),
(20,'T','Dermatology',21000);

SELECT Department,
COUNT(*) AS Total_Patients
FROM Patient
GROUP BY Department
HAVING COUNT(*)>3
ORDER BY Total_Patients DESC;

/* Scenario 5 – Employee Age and Salary
Report
Scenario
A company wants to prepare a report of employees who satisfy both the company's age criteria
and salary criteria Age ≥ 30 and Salary ≥ ₹60,000.
Display the employee details, arrange the report by Salary in descending order, and return only
the top 5 employees. */

CREATE TABLE Employee_Age(
Emp_ID INT PRIMARY KEY,
Emp_Name VARCHAR(100),
Department VARCHAR(50),
Salary DECIMAL(10,2),
Age INT
);

INSERT INTO Employee_Age VALUES
(101,'Arun','IT',75000,32),
(102,'Bala','HR',55000,28),
(103,'Chandru','IT',85000,35),
(104,'Deepak','Finance',90000,40),
(105,'Ezhil','HR',62000,31),
(106,'Farook','Marketing',58000,29),
(107,'Ganesh','Finance',95000,42),
(108,'Hari','IT',65000,33),
(109,'Indhu','Marketing',70000,34),
(110,'John','Sales',45000,27),
(111,'Karthik','Sales',50000,30),
(112,'Lavanya','Finance',88000,38),
(113,'Mani','IT',72000,36),
(114,'Nisha','HR',68000,31),
(115,'Priya','Marketing',75000,37);

SELECT *
FROM Employee_Age
WHERE Age>=30
AND Salary>=60000
ORDER BY Salary DESC
LIMIT 5;