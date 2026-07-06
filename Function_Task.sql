CREATE DATABASE Function_Task;

USE Function_Task;

/*Scenario 1 – Employee Name Standardization
Scenario
A company stores employee names in different formats such as lowercase, uppercase, and mixed
case. The HR department wants a report where all employee names are displayed in uppercase.
Write a SQL query to generate the required report. */

CREATE TABLE Employees (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(101,'john','IT',50000),
(102,'MARY','HR',45000),
(103,'RaVi','Finance',60000),
(104,'kumar','Sales',42000),
(105,'ANITHA','Testing',55000),
(106,'Priya','Support',40000);

SELECT
Emp_ID,
UPPER(Emp_Name) AS Employee_Name,
Department,
Salary
FROM Employees;

/*Scenario 2 – Product Price Calculation
Scenario
An online shopping company stores product prices with decimal values.
The finance team wants to generate a report showing:
• Original Price
• Rounded Price
• Ceiling Price
• Floor Price
Write a SQL query to generate the report. */

CREATE TABLE Product (
    Product_ID INT,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Category VARCHAR(50)
);

INSERT INTO Product VALUES
(1,'Laptop',58999.45,'Electronics'),
(2,'Phone',18999.75,'Electronics'),
(3,'Chair',2599.30,'Furniture'),
(4,'Table',6499.95,'Furniture'),
(5,'Bag',899.60,'Fashion'),
(6,'Watch',3499.20,'Accessories'),
(7,'Shoes',2999.99,'Fashion'),
(8,'Mouse',799.49,'Electronics');

SELECT
Product_Name,
Price AS Original_Price,
ROUND(Price) AS Rounded_Price,
CEIL(Price) AS Ceiling_Price,
FLOOR(Price) AS Floor_Price
FROM Product;

/* Scenario 3 – Employee Joining Date Report
Scenario
The HR department wants to analyze employee joining details.
Generate a report displaying:
• Employee Name
• Joining Date
• Joining Year
• Joining Month
• Joining Day
Write a SQL query to produce the report. */

CREATE TABLE Employee_Details (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Join_Date DATE,
    Department VARCHAR(50)
);

INSERT INTO Employee_Details VALUES
(101,'John','2020-01-15','IT'),
(102,'Mary','2019-07-10','HR'),
(103,'David','2021-11-22','Finance'),
(104,'Sam','2022-03-18','Sales'),
(105,'Priya','2023-05-30','Testing'),
(106,'Arun','2024-02-12','Support'),
(107,'Divya','2021-09-25','IT');

SELECT
Emp_Name,
Join_Date,
YEAR(Join_Date) AS Joining_Year,
MONTH(Join_Date) AS Joining_Month,
DAY(Join_Date) AS Joining_Day
FROM Employee_Details;

/* Scenario 4 – Customer Information Cleanup
Scenario
A customer database contains NULL values in mobile numbers and email addresses.
The customer support team wants a report where NULL values are replaced with appropriate
display values without modifying the original data.
Write a SQL query to generate the report. */

CREATE TABLE Customer (
Customer_ID INT,
Customer_Name VARCHAR(100),
Mobile_No VARCHAR(15),
Email VARCHAR(100)
);

INSERT INTO Customer VALUES
(1,'John','9876543210','john@gmail.com'),
(2,'Mary',NULL,'mary@gmail.com'),
(3,'David','9123456780',NULL),
(4,'Sam',NULL,NULL),
(5,'Priya','9988776655','priya@gmail.com'),
(6,'Arun',NULL,'arun@gmail.com'),
(7,'Divya','9011223344',NULL),
(8,'Kumar',NULL,NULL);

SELECT
Customer_Name,
IFNULL(Mobile_No,'Mobile Not Available') AS Mobile_Number,
IFNULL(Email,'Email Not Available') AS Email_Address
FROM Customer;

/* Scenario 5 – Student Performance Report
Scenario
A training institute wants to categorize students based on their marks.
Generate a report that displays:
• Student Name
• Marks
• Performance Status based on a condition
The report should classify students according to the business rule provided by the trainer.
Write a SQL query to generate the report */

CREATE TABLE Student (
Student_ID INT,
Student_Name VARCHAR(100),
Marks INT,
Course VARCHAR(50)
);

INSERT INTO Student VALUES
(1,'John',92,'SQL'),
(2,'Mary',81,'Python'),
(3,'David',72,'Java'),
(4,'Sam',65,'Testing'),
(5,'Priya',58,'SQL'),
(6,'Arun',45,'Python'),
(7,'Divya',35,'Java'),
(8,'Kumar',88,'Testing'),
(9,'Anitha',76,'SQL'),
(10,'Ravi',95,'Python');

SELECT
Student_Name,
Marks,
CASE
WHEN Marks >= 90 THEN 'Outstanding'
WHEN Marks >= 75 THEN 'Excellent'
WHEN Marks >= 60 THEN 'Good'
WHEN Marks >= 40 THEN 'Average'
ELSE 'Needs Improvement'
END AS Performance_Status
FROM Student;