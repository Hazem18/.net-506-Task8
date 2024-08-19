--•	Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
CREATE TABLE EMPLOYEES
(
 ID INT NOT NULL,
 [NAME] NVARCHAR(50),
 SALARY DEC 
)

--•	Add a new column named "Department" to the "Employees" table with data type varchar(50).
ALTER TABLE EMPLOYEES
ADD DEPARTMENT NVARCHAR(50)


--•	Remove the "Salary" column from the "Employees" table.
ALTER TABLE EMPLOYEES
DROP COLUMN SALARY


--•	Rename the "Department" column in the "Employees" table to "DeptName".
EXEC SP_RENAME 'EMPLOYEES.DEPARTMENT' , 'DeptName' , 'COLUMN'


--•	Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
CREATE TABLE PROJECTS
(
 ID INT NOT NULL,
 PROJECTNAME NVARCHAR(50)
)


--•	Add a primary key constraint to the "Employees" table for the "ID" column.
ALTER TABLE EMPLOYEES ADD CONSTRAINT PK PRIMARY KEY (ID) 


--•	Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").
ALTER TABLE PROJECTS ADD CONSTRAINT PK2 PRIMARY KEY(ID)

ALTER TABLE EMPLOYEES
ADD PROJECTID INT NOT NULL FOREIGN KEY REFERENCES PROJECTS(ID)


--•	Remove the foreign key relationship between "Employees" and "Projects."
ALTER TABLE EMPLOYEES
DROP CONSTRAINT FK__EMPLOYEES__PROJE__412EB0B6


--•	Add a unique constraint to the "Name" column in the "Employees" table.
ALTER TABLE EMPLOYEES ADD CONSTRAINT UQ UNIQUE ([NAME])


--•	Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
CREATE TABLE CUSTOMERS
(
 ID INT NOT NULL,
 FNAME NVARCHAR(50),
 LNAME NVARCHAR(50),
 EMAIL NVARCHAR(50),
 [STATUS] NVARCHAR(50)
)


--•	Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
ALTER TABLE CUSTOMERS
ADD CONSTRAINT UQ2 UNIQUE ( FNAME , LNAME )


--•	Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.
ALTER TABLE CUSTOMERS
ADD CONSTRAINT DEF DEFAULT 'Active' FOR [STATUS]


--•	Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
CREATE TABLE ORDERS
(
 ID INT NOT NULL,
 CUSTOMERID INT NOT NULL,
 ORDERDATE DATETIME NOT NULL,
 AMOUNT DEC NOT NULL
)



--•	Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
ALTER TABLE ORDERS
ADD CONSTRAINT CK CHECK (AMOUNT > 0)


--•	Create a schema named "Sales" and move the "Orders" table into this schema.
CREATE SCHEMA SALES
GO

ALTER SCHEMA SALES TRANSFER ORDERS



--•	Rename the "Orders" table to "SalesOrders."
EXEC SP_RENAME  'SALES.ORDERS' , 'SALESORDERS'


























