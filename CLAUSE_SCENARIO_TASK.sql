CREATE DATABASE TASK8;
USE TASK8;

/* Scenario 1 – Department Salary Analysis
Scenario
The HR department wants to identify departments where the average employee salary is
greater than the company's salary benchmark.
Display the Department and its Average Salary.
Sort the result by Average Salary in descending order and display only the top 3 departments. */

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Experience INT
);

INSERT INTO Employee VALUES
(1,'John','HR',45000,2),
(2,'Mary','HR',52000,4),
(3,'David','IT',70000,5),
(4,'Steve','IT',85000,8),
(5,'Alice','Finance',65000,6),
(6,'Bob','Finance',60000,4),
(7,'Chris','Sales',55000,3),
(8,'Nancy','Sales',58000,5),
(9,'Kevin','Marketing',48000,2),
(10,'Sara','Marketing',51000,3),
(11,'Tom','Production',75000,7),
(12,'Linda','Production',78000,8),
(13,'James','Support',42000,2),
(14,'Sophia','Support',46000,3),
(15,'Daniel','IT',90000,9);

SELECT Department,
       AVG(Salary) AS Average_Salary
FROM Employee
GROUP BY Department
HAVING AVG(Salary) > 60000
ORDER BY Average_Salary DESC
LIMIT 3;

/* Scenario 2 – Top Performing Products
Scenario
An e-commerce company wants to identify the top-selling products.
Display each Product Category along with the total quantity sold.
Only display categories that have sold more than the company's minimum sales requirement.
Sort the result from highest to lowest quantity sold and display only the top 5 categories. */

CREATE TABLE Sales (
    Sale_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    Sale_Date DATE
);

INSERT INTO Sales VALUES
(1,'Laptop A','Electronics',10,'2026-07-01'),
(2,'Laptop B','Electronics',8,'2026-07-02'),
(3,'TV','Electronics',12,'2026-07-03'),
(4,'Chair','Furniture',20,'2026-07-02'),
(5,'Table','Furniture',15,'2026-07-04'),
(6,'Bed','Furniture',10,'2026-07-05'),
(7,'Shirt','Clothing',25,'2026-07-01'),
(8,'Jeans','Clothing',18,'2026-07-02'),
(9,'Shoes','Footwear',22,'2026-07-03'),
(10,'Sandals','Footwear',12,'2026-07-04'),
(11,'Rice','Grocery',30,'2026-07-01'),
(12,'Oil','Grocery',18,'2026-07-03'),
(13,'Soap','Personal Care',14,'2026-07-02'),
(14,'Shampoo','Personal Care',16,'2026-07-04'),
(15,'Watch','Accessories',8,'2026-07-05'),
(16,'Bag','Accessories',11,'2026-07-06'),
(17,'Notebook','Stationery',20,'2026-07-05'),
(18,'Pen','Stationery',30,'2026-07-06'),
(19,'Mixer','Home Appliances',13,'2026-07-06'),
(20,'Fan','Home Appliances',17,'2026-07-07');

SELECT Category,
       SUM(Quantity) AS Total_Quantity
FROM Sales
GROUP BY Category
HAVING SUM(Quantity) > 25
ORDER BY Total_Quantity DESC
LIMIT 5;

/* Scenario 3 – Customer Purchase Report
Scenario
A retail company wants to prepare a customer purchase report.
Display only customers whose purchase amount satisfies the company's purchase criteria.
Remove duplicate city names in the report and display the customers in ascending alphabetical
order. */

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    City VARCHAR(50),
    Purchase_Amount DECIMAL(10,2)
);

INSERT INTO Customer VALUES
(1,'Arun','Chennai',12000),
(2,'Bala','Madurai',8000),
(3,'Charles','Coimbatore',22000),
(4,'Deepa','Chennai',15000),
(5,'Esha','Salem',9000),
(6,'Farhan','Madurai',25000),
(7,'Gokul','Trichy',17000),
(8,'Hari','Salem',11000),
(9,'Indhu','Erode',18000),
(10,'John','Chennai',26000),
(11,'Kavin','Coimbatore',7000),
(12,'Lavanya','Trichy',14000),
(13,'Manoj','Erode',21000),
(14,'Nisha','Salem',24000),
(15,'Priya','Madurai',16000);

SELECT Customer_Name,
       City,
       Purchase_Amount
FROM Customer
WHERE Purchase_Amount > 15000
ORDER BY Customer_Name ASC;

SELECT DISTINCT City
FROM Customer;

/* Scenario 4 – Hospital Department Patient
Analysis
Scenario
A hospital wants to analyze the number of patients treated in each department.
Display the Department Name and Total Patients.
Show only those departments that have treated more than the hospital's required minimum
number of patients.
Sort the result based on the total number of patients in descending order. */

CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(100),
    Department VARCHAR(50),
    Treatment_Cost DECIMAL(10,2)
);

INSERT INTO Patient VALUES
(1,'Rahul','Cardiology',5000),
(2,'Sneha','Cardiology',7000),
(3,'Vijay','Neurology',9000),
(4,'Anu','Neurology',6500),
(5,'Ravi','Orthopedic',8000),
(6,'Kiran','Orthopedic',8500),
(7,'Divya','ENT',3000),
(8,'Ramesh','ENT',4500),
(9,'Priya','Dermatology',2800),
(10,'Naveen','Dermatology',3500),
(11,'Sathya','Cardiology',6000),
(12,'Arun','Cardiology',5500),
(13,'Meena','Neurology',7200),
(14,'Ajay','Orthopedic',9100),
(15,'Kumar','Orthopedic',8200),
(16,'Rekha','ENT',3900),
(17,'Mohan','ENT',4100),
(18,'Siva','Dermatology',3300),
(19,'Lakshmi','Cardiology',7600),
(20,'Hari','Orthopedic',8700);

SELECT Department,
       COUNT(*) AS Total_Patients
FROM Patient
GROUP BY Department
HAVING COUNT(*) > 3
ORDER BY Total_Patients DESC;

/* Scenario 5 – Employee Age and Salary
Report
Scenario
A company wants to prepare a report of employees who satisfy both the company's age criteria
and salary criteria.
Display the employee details, arrange the report by Salary in descending order, and return only
the top 5 employees. */

CREATE TABLE Employee1 (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Age INT
);

INSERT INTO Employee1 VALUES
(1,'John','HR',45000,24),
(2,'Mary','HR',52000,30),
(3,'David','IT',70000,32),
(4,'Steve','IT',85000,35),
(5,'Alice','Finance',65000,31),
(6,'Bob','Finance',60000,29),
(7,'Chris','Sales',55000,28),
(8,'Nancy','Sales',58000,33),
(9,'Kevin','Marketing',48000,26),
(10,'Sara','Marketing',51000,27),
(11,'Tom','Production',75000,36),
(12,'Linda','Production',78000,34),
(13,'James','Support',42000,23),
(14,'Sophia','Support',46000,25),
(15,'Daniel','IT',90000,38);

SELECT *
FROM Employee1
WHERE Age > 30
  AND Salary > 60000
ORDER BY Salary DESC
LIMIT 5;