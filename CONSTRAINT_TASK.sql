USE ETL_TESTING;


-- Drop tables if they already exist
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS BankAccount;
DROP TABLE IF EXISTS Assets;


/* 1) Scenario
A company is developing an Employee Registration System. Every employee should have a
unique Employee ID and Email ID. During testing, one employee tries to register using an Email
ID that already exists in the database.
Interview Question
Which SQL Constraint should be implemented to prevent duplicate Email IDs, and why?
*/

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    PhoneNo VARCHAR(15),
    Department VARCHAR(30)
);

-- Valid Records
INSERT INTO Employee VALUES
(101,'Ravi','ravi@gmail.com','9876543210','IT'),
(102,'Meena','meena@gmail.com','9876543211','HR');


SELECT * FROM Employee;

/* 2) Scenario
An order can be created only if the Customer already exists in the Customer table. During
testing, a developer attempts to insert an order for a Customer ID that is not available in the
Customer table.
Interview Question
Which SQL Constraint should be used to enforce this business rule?
*/



CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID VARCHAR(10),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Insert Customer
INSERT INTO Customer VALUES
(1,'Chandru'),
(2,'Arun');

-- Valid Orders
INSERT INTO Orders VALUES
(1001,201,'P101','2026-07-01'),
(1002,202,'P102','2026-07-02');



SELECT * FROM Customer;
SELECT * FROM Orders;


/* 3) Scenario
The college has decided that every student must provide their name during admission. While
entering records, a staff member leaves the Student Name field empty.
Interview Question
Which SQL Constraint should be applied to ensure that every student record contains a
Student Name?
*/


CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    Age INT,
    Course VARCHAR(30)
);

-- Valid Record
INSERT INTO Student VALUES
(101,'Arjun',20,'BCA'),
(102,'Dhiya',19,'B.Sc');


SELECT * FROM Student;

/* 4) Scenario
The bank allows only two account types: Savings and Current. During data entry, an employee
enters the Account Type as "Personal".

Interview Question
Which SQL Constraint should be used to restrict invalid account types from being stored
in the database?
*/

CREATE TABLE BankAccount (
    AccountNo INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    AccountType VARCHAR(20)
        CHECK(AccountType IN ('Savings','Current')),
    Balance DECIMAL(10,2)
);

-- Valid Records
INSERT INTO BankAccount VALUES
(5001,'John','Savings',25000),
(5002,'Priya','Current',80000);


SELECT * FROM BankAccount;

/* 5) Scenario
Whenever a new asset is added to the system, if the user does not specify the Status, it should
automatically be stored as 'Active'.
Interview Question
Which SQL Constraint can automatically assign a value when no value is provided during
insertion?
*/

CREATE TABLE Assets (
    AssetID VARCHAR(10) PRIMARY KEY,
    AssetName VARCHAR(50),
    Status VARCHAR(20) DEFAULT 'Active',
    PurchaseDate DATE
);

-- Status will automatically become 'Active'
INSERT INTO Assets (AssetID,AssetName,PurchaseDate)
VALUES
('A101','Laptop','2026-01-15'),
('A102','Monitor',2026-02-10);

-- Status given manually
INSERT INTO Assets
VALUES
('A102','Printer','Inactive','2026-07-01');

SELECT * FROM Assets;