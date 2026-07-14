CREATE DATABASE TASK7;
USE TASK7;

/* Scenario 1 – Student Result Report
Scenario
A training institute wants to generate a student result report.
Students who score 50 or above should be displayed as "Pass", and students scoring below 50
should be displayed as "Fail".
Write a SQL query to generate the report. */

CREATE TABLE Student (
    Student_ID INT,
    Student_Name VARCHAR(100),
    Course VARCHAR(50),
    Marks INT
);

INSERT INTO Student VALUES
(1,'Arun','SQL',85),
(2,'Priya','Python',42),
(3,'Rahul','Java',67),
(4,'Meena','SQL',49),
(5,'Kiran','Python',90),
(6,'Sneha','Java',55),
(7,'Vijay','SQL',30),
(8,'Anu','Python',72),
(9,'Ravi','Java',50),
(10,'Divya','SQL',46);

SELECT Student_ID,
       Student_Name,
       Course,
       Marks,
       CASE
           WHEN Marks >= 50 THEN 'Pass'
           ELSE 'Fail'
       END AS Result
FROM Student;

/* Scenario 2 – Employee Bonus Eligibility
Scenario
The HR department wants to identify employees eligible for a yearly bonus.
Employees with a salary of ₹60,000 or more should be displayed as "Bonus Eligible"; all
others should be displayed as "Not Eligible". */

CREATE TABLE Employee (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee VALUES
(101,'John','HR',65000),
(102,'Peter','IT',45000),
(103,'David','Sales',70000),
(104,'Mary','Finance',55000),
(105,'Riya','IT',90000),
(106,'Kumar','HR',62000),
(107,'Anil','Sales',50000),
(108,'Neha','IT',80000),
(109,'Ramesh','Finance',58000),
(110,'Priya','HR',61000);

SELECT *,
CASE
    WHEN Salary>=60000 THEN 'Bonus Eligible'
    ELSE 'Not Eligible'
END AS Bonus_Status
FROM Employee;

/* Scenario 3 – Customer Premium Status
Scenario
An online shopping company wants to classify customers based on their total purchase amount.
Customers meeting the company's purchase criteria should be displayed as "Premium
Customer", otherwise display "Regular Customer". */

CREATE TABLE Customer(
Customer_ID INT,
Customer_Name VARCHAR(100),
City VARCHAR(50),
Purchase_Amount DECIMAL(10,2)
);

INSERT INTO Customer VALUES
(1,'Ajay','Chennai',120000),
(2,'Ravi','Madurai',45000),
(3,'Divya','Coimbatore',85000),
(4,'Priya','Salem',35000),
(5,'Arun','Trichy',150000),
(6,'Meena','Erode',50000),
(7,'John','Vellore',99000),
(8,'Sneha','Chennai',70000),
(9,'Kiran','Madurai',40000),
(10,'Rahul','Salem',115000),
(11,'Anu','Trichy',80000),
(12,'Deepa','Chennai',30000);

SELECT *,
CASE
    WHEN Purchase_Amount>=100000 THEN 'Premium Customer'
    ELSE 'Regular Customer'
END AS Customer_Status
FROM Customer;

/* Scenario 4 – Product Availability Report
Scenario
An inventory management system wants to display the stock status of every product.
Products satisfying the company's stock condition should display "In Stock", otherwise display
"Out of Stock". */

CREATE TABLE Product(
Product_ID INT,
Product_Name VARCHAR(100),
Category VARCHAR(50),
Stock_Quantity INT
);

INSERT INTO Product VALUES
(1,'Laptop','Electronics',25),
(2,'Mouse','Electronics',0),
(3,'Keyboard','Electronics',40),
(4,'Chair','Furniture',3),
(5,'Table','Furniture',0),
(6,'Fan','Appliances',15),
(7,'TV','Electronics',7),
(8,'Mobile','Electronics',0),
(9,'Printer','Electronics',9),
(10,'Speaker','Electronics',18);

SELECT *,
CASE
    WHEN Stock_Quantity>0 THEN 'In Stock'
    ELSE 'Out of Stock'
END AS Stock_Status
FROM Product;

/* Scenario 5 – Employee Performance Rating
Scenario
The HR department wants to classify employee performance into multiple levels based on their
performance score.
Generate the report according to the company's performance policy. */

CREATE TABLE Employee_Performance(
Emp_ID INT,
Emp_Name VARCHAR(100),
Performance_Score INT,
Department VARCHAR(50)
);

INSERT INTO Employee_Performance VALUES
(1,'John',95,'IT'),
(2,'Mary',82,'HR'),
(3,'David',75,'Finance'),
(4,'Ravi',68,'Sales'),
(5,'Kiran',90,'IT'),
(6,'Sneha',55,'HR'),
(7,'Arun',40,'Finance'),
(8,'Priya',88,'Sales'),
(9,'Anu',60,'IT'),
(10,'Rahul',79,'HR'),
(11,'Divya',98,'Finance'),
(12,'Meena',50,'Sales');

SELECT *,
CASE
    WHEN Performance_Score>=90 THEN 'Excellent'
    WHEN Performance_Score>=75 THEN 'Good'
    WHEN Performance_Score>=50 THEN 'Average'
    ELSE 'Needs Improvement'
END AS Rating
FROM Employee_Performance;

/* Scenario 6 – Student Scholarship Report
Scenario
A university wants to classify students into different scholarship categories based on their
semester marks.
Generate the scholarship report according to the university's scholarship rules. */

CREATE TABLE Student(
Student_ID INT,
Student_Name VARCHAR(100),
Course VARCHAR(50),
Marks INT
);

INSERT INTO Student VALUES
(1,'Arun','BCA',96),
(2,'Priya','BSc',82),
(3,'Rahul','BCom',74),
(4,'Anu','BCA',65),
(5,'Divya','BSc',91),
(6,'John','BCom',48),
(7,'Ravi','BCA',88),
(8,'Sneha','BSc',79),
(9,'Kiran','BCom',59),
(10,'Meena','BCA',69),
(11,'Deepa','BSc',94),
(12,'Ajay','BCom',84);

SELECT *,
CASE
    WHEN Marks>=90 THEN 'Full Scholarship'
    WHEN Marks>=75 THEN 'Half Scholarship'
    WHEN Marks>=60 THEN 'Quarter Scholarship'
    ELSE 'No Scholarship'
END AS Scholarship
FROM Student;

/* Scenario 7 – Loan Approval Status
Scenario
A bank wants to classify loan applications into different approval categories based on the
applicant's monthly income.
Generate the loan approval report according to the bank's business policy.*/

CREATE TABLE Loan_Application(
Application_ID INT,
Customer_Name VARCHAR(100),
Monthly_Income DECIMAL(10,2),
Loan_Amount DECIMAL(10,2)
);

INSERT INTO Loan_Application VALUES
(1,'Ravi',120000,1000000),
(2,'John',45000,500000),
(3,'Priya',85000,600000),
(4,'Kiran',30000,200000),
(5,'Arun',150000,1500000),
(6,'Sneha',60000,400000),
(7,'Rahul',70000,800000),
(8,'Divya',50000,300000),
(9,'Anu',100000,900000),
(10,'Meena',25000,150000);

SELECT *,
CASE
    WHEN Monthly_Income>=100000 THEN 'Approved'
    WHEN Monthly_Income>=60000 THEN 'Review Required'
    ELSE 'Rejected'
END AS Loan_Status
FROM Loan_Application;

/*Scenario 8 – Product Discount Category
Scenario
An e-commerce company wants to classify products into different discount categories based on
their selling price.
Generate the discount category report according to the company's pricing policy.*/

DROP TABLE IF EXISTS Product;

CREATE TABLE Product (
    Product_ID INT,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Product VALUES
(1,'Laptop','Electronics',75000),
(2,'Mouse','Electronics',900),
(3,'Keyboard','Electronics',1800),
(4,'TV','Electronics',45000),
(5,'Fan','Appliances',3200),
(6,'Chair','Furniture',6000),
(7,'Table','Furniture',8500),
(8,'Mobile','Electronics',28000),
(9,'Printer','Electronics',15000),
(10,'Speaker','Electronics',2500),
(11,'Watch','Accessories',12000),
(12,'Bag','Accessories',3000),
(13,'Headset','Electronics',4500),
(14,'Monitor','Electronics',17000),
(15,'AC','Appliances',55000);

SELECT *,
CASE
    WHEN Price >= 50000 THEN '10% Discount'
    WHEN Price >= 20000 THEN '7% Discount'
    WHEN Price >= 5000 THEN '5% Discount'
    ELSE 'No Discount'
END AS Discount_Category
FROM Product;

/* Scenario 9 – Hospital Patient Priority Report
Scenario
A hospital wants to categorize patients based on their health score into different treatment
priority levels.
Generate the patient priority report according to the hospital's treatment policy.*/

CREATE TABLE Patient(
Patient_ID INT,
Patient_Name VARCHAR(100),
Age INT,
Health_Score INT
);

INSERT INTO Patient VALUES
(1,'Ravi',65,30),
(2,'John',40,75),
(3,'Mary',58,50),
(4,'Priya',25,90),
(5,'Arun',72,20),
(6,'Sneha',34,65),
(7,'Rahul',48,45),
(8,'Anu',60,35),
(9,'Deepa',55,82),
(10,'Kiran',29,95),
(11,'Divya',50,55),
(12,'Ajay',70,28);

SELECT *,
CASE
    WHEN Health_Score<40 THEN 'Critical'
    WHEN Health_Score<=70 THEN 'High Priority'
    ELSE 'Normal'
END AS Treatment_Priority
FROM Patient;

/* Scenario 10 – Employee Salary Band
Classification
Scenario
The Finance department wants to classify employees into different salary bands based on their
monthly salary.
Generate the salary band report according to the company's salary classification policy.*/

CREATE TABLE Employee(
Emp_ID INT,
Emp_Name VARCHAR(100),
Department VARCHAR(50),
Salary DECIMAL(10,2)
);

INSERT INTO Employee VALUES
(1,'John','HR',28000),
(2,'Mary','IT',42000),
(3,'David','Finance',65000),
(4,'Priya','Sales',85000),
(5,'Ravi','IT',52000),
(6,'Anu','HR',32000),
(7,'Kiran','Finance',98000),
(8,'Sneha','Sales',45000),
(9,'Rahul','IT',70000),
(10,'Divya','HR',39000),
(11,'Arun','Finance',120000),
(12,'Meena','Sales',56000),
(13,'Ajay','IT',76000),
(14,'Deepa','HR',34000),
(15,'Vijay','Finance',48000);

SELECT *,
CASE
    WHEN Salary>=80000 THEN 'High Salary'
    WHEN Salary>=50000 THEN 'Medium Salary'
    ELSE 'Low Salary'
END AS Salary_Band
FROM Employee;
