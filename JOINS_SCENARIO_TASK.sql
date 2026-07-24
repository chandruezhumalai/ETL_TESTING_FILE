CREATE DATABASE TASK9;
USE TASK9;

/* Scenario 1 – Employee Department Report
Scenario
The HR department wants to generate a report showing employee details along with their
department names.
Display the Employee ID, Employee Name, Department Name, and Salary for employees
who are assigned to a valid department.
Sort the report by Salary in descending order. */

CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50)
);

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department_ID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

INSERT INTO Department VALUES
(101,'HR'),
(102,'IT'),
(103,'Finance'),
(104,'Sales'),
(105,'Marketing'),
(106,'Admin');

INSERT INTO Employee VALUES
(1,'Arun',101,45000),
(2,'Bala',102,60000),
(3,'Charan',103,55000),
(4,'David',104,40000),
(5,'Elan',105,35000),
(6,'Farhan',101,50000),
(7,'Ganesh',102,70000),
(8,'Hari',103,65000),
(9,'Irfan',104,38000),
(10,'John',105,45000),
(11,'Karthik',106,30000),
(12,'Lokesh',101,47000),
(13,'Manoj',102,80000),
(14,'Naveen',103,72000),
(15,'Praveen',104,52000);


SELECT
E.Emp_ID,
E.Emp_Name,
D.Department_Name,
E.Salary
FROM Employee E
INNER JOIN Department D
ON E.Department_ID=D.Department_ID
ORDER BY Salary DESC;

/* Scenario 2 – Customers Without Orders
Scenario
An online shopping company wants to identify customers who have registered on the website but
have not placed any orders.
Display the Customer ID, Customer Name, City, and Order ID.
Arrange the result in ascending order of Customer Name. */ 

CREATE TABLE Customer(
Customer_ID INT PRIMARY KEY,
Customer_Name VARCHAR(100),
City VARCHAR(50)
);

CREATE TABLE Orders(
Order_ID INT PRIMARY KEY,
Customer_ID INT,
Order_Date DATE,
Order_Amount DECIMAL(10,2),
FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID)
);

INSERT INTO Customer VALUES
(1,'Ajay','Chennai'),
(2,'Bharath','Bangalore'),
(3,'Charles','Hyderabad'),
(4,'Deepak','Delhi'),
(5,'Eswar','Pune'),
(6,'Farooq','Mumbai'),
(7,'Gokul','Coimbatore'),
(8,'Hari','Madurai'),
(9,'Indhu','Salem'),
(10,'Jaya','Trichy'),
(11,'Kiran','Goa'),
(12,'Lavanya','Erode'),
(13,'Meena','Vellore'),
(14,'Nisha','Tirunelveli'),
(15,'Prakash','Chennai');

INSERT INTO Orders VALUES
(101,1,'2025-01-05',5000),
(102,2,'2025-01-10',3500),
(103,3,'2025-01-15',8000),
(104,5,'2025-02-01',2500),
(105,6,'2025-02-05',9000),
(106,8,'2025-02-10',1500),
(107,9,'2025-02-12',4500),
(108,10,'2025-02-18',1000),
(109,11,'2025-02-20',6000),
(110,12,'2025-02-22',3200),
(111,14,'2025-02-25',7800),
(112,15,'2025-03-01',4000);

SELECT
C.Customer_ID,
C.Customer_Name,
C.City,
O.Order_ID
FROM Customer C
LEFT JOIN Orders O
ON C.Customer_ID=O.Customer_ID
WHERE O.Order_ID IS NULL
ORDER BY Customer_Name;

/* Scenario 3 – Departments Without
Employees
Scenario
The management wants to identify departments that currently have no employees assigned.
Display the Department ID, Department Name, Employee ID, and Employee Name.
Sort the result by Department Name. */ 

SELECT
    D.Department_ID,
    D.Department_Name,
    E.Emp_ID,
    E.Emp_Name
FROM Employee E
RIGHT JOIN Department D
ON E.Department_ID = D.Department_ID
WHERE E.Emp_ID IS NULL
ORDER BY D.Department_Name;

/* Scenario 4 – Product Inventory Verification
Scenario
An inventory management team wants to compare the Product Master table with the
Warehouse Stock table.
Generate a report containing:
• Products available in both tables
• Products available only in the Product Master
• Products available only in the Warehouse Stock
Display the Product ID, Product Name, Warehouse Quantity.
Sort the report by Product ID. */

CREATE TABLE Product_Master(
Product_ID INT PRIMARY KEY,
Product_Name VARCHAR(100)
);

CREATE TABLE Warehouse_Stock(
Product_ID INT PRIMARY KEY,
Quantity INT
);

INSERT INTO Product_Master VALUES
(1,'Laptop'),
(2,'Mouse'),
(3,'Keyboard'),
(4,'Monitor'),
(5,'Printer'),
(6,'Scanner'),
(7,'Tablet'),
(8,'Speaker'),
(9,'Camera'),
(10,'Pendrive'),
(11,'Hard Disk'),
(12,'Router'),
(13,'Projector'),
(14,'UPS'),
(15,'Webcam');

INSERT INTO Warehouse_Stock VALUES
(1,50),
(2,120),
(3,80),
(4,40),
(5,25),
(7,70),
(8,45),
(10,150),
(11,90),
(13,20),
(16,35),
(17,60);

SELECT
P.Product_ID,
P.Product_Name,
W.Quantity
FROM Product_Master P
LEFT JOIN Warehouse_Stock W
ON P.Product_ID=W.Product_ID

UNION

SELECT
W.Product_ID,
P.Product_Name,
W.Quantity
FROM Product_Master P
RIGHT JOIN Warehouse_Stock W
ON P.Product_ID=W.Product_ID
ORDER BY Product_ID;

/* Scenario 5 – Employee Reporting Hierarchy
Scenario
A company wants to generate an organization hierarchy report.
Display each Employee Name along with their Reporting Manager Name.
Include employees even if they do not have a manager.
Sort the report alphabetically by Employee Name. */

CREATE TABLE Employee_Hierarchy(
Emp_ID INT PRIMARY KEY,
Emp_Name VARCHAR(100),
Manager_ID INT,
Department VARCHAR(50)
);

INSERT INTO Employee_Hierarchy VALUES
(1,'Ramesh',NULL,'Management'),
(2,'Suresh',1,'HR'),
(3,'Ganesh',1,'IT'),
(4,'Vignesh',2,'HR'),
(5,'Ajith',2,'HR'),
(6,'Bharath',3,'IT'),
(7,'Charles',3,'IT'),
(8,'Deepak',3,'IT'),
(9,'Elan',4,'HR'),
(10,'Farhan',4,'HR'),
(11,'Hari',6,'IT'),
(12,'Imran',6,'IT'),
(13,'John',7,'IT'),
(14,'Karthik',7,'IT'),
(15,'Lokesh',8,'IT');

SELECT
E.Emp_Name AS Employee_Name,
M.Emp_Name AS Manager_Name
FROM Employee_Hierarchy E
LEFT JOIN Employee_Hierarchy M
ON E.Manager_ID=M.Emp_ID
ORDER BY Employee_Name;