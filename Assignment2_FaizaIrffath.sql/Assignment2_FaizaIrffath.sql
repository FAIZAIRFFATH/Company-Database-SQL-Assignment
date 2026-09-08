--Create a database and design tables using SQL.
--Insert sample data into the tables.This database will be used for all upcoming SQL 

--1. Create a New Database
--Create a new database named company_db. After creating the database, switch to it.

CREATE DATABASE company_db;
GO

USE company_db;

--2. Create Tables with Constraints
--Create the following three tables with appropriate columns and constraints:
--a)companies table – stores company details (e.g., company_id, company_name).

CREATE TABLE companies (
    company_id INT IDENTITY(1,1),
    company_name VARCHAR(100) NOT NULL,
    CONSTRAINT PK_companies PRIMARY KEY (company_id)
);


--b)departments table – stores department details (e.g., dept_id, dept_name, company_id).

CREATE TABLE departments (
    dept_id INT IDENTITY(1,1),
    dept_name VARCHAR(100) NOT NULL,
    company_id INT NOT NULL,
    CONSTRAINT PK_departments PRIMARY KEY (dept_id),
    CONSTRAINT FK_departments_companies FOREIGN KEY (company_id) 
        REFERENCES companies(company_id) ON DELETE CASCADE
);

--c)employees table – stores employee details (e.g., emp_id, first_name, last_name, dept_id, salary, hire_date, manager_id, job_title).

CREATE TABLE employees (
    emp_id INT IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dept_id INT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL CONSTRAINT CHK_employee_salary CHECK (salary > 0),
    hire_date DATE NOT NULL CONSTRAINT DF_employee_hire_date DEFAULT GETDATE(),
    manager_id INT NULL,
    job_title VARCHAR(100) NOT NULL,
    CONSTRAINT PK_employees PRIMARY KEY (emp_id),
    CONSTRAINT FK_employees_departments FOREIGN KEY (dept_id) 
        REFERENCES departments(dept_id),
    CONSTRAINT FK_employees_manager FOREIGN KEY (manager_id) 
        REFERENCES employees(emp_id)
);
GO


--3. Insert Sample Data
--Insert the following data into each table.

--a. Insert Data into companies

--INSERT INTO companies VALUES
--(1,'TechNova Pvt Ltd'),
--(2,'DataSphere Solutions'),
--(3,'NextGen Analytics'),
--(4,'CloudMatrix Systems');

--QUERY-A--
USE company_db;
GO

SET IDENTITY_INSERT companies ON;

INSERT INTO companies(company_id, company_name) VALUES
(1,'TechNova Pvt Ltd'),
(2,'DataSphere Solutions'),
(3,'NextGen Analytics'),
(4,'CloudMatrix Systems');
SET IDENTITY_INSERT companies OFF;

--b. Insert Data into departments
--INSERT INTO departments VALUES
--(101,'HR',1),
--(102,'Engineering',1),
--(103,'Sales',1),
--(201,'Marketing',2),
--(202,'Finance',2),
--(203,'Customer Support',2),
--(301,'Data Science',3),
--(302,'AI Research',3),
--(401,'Cloud Engineering',4),
--(402,'Product Management',4);

--QUERY-B--
SET IDENTITY_INSERT departments ON;

INSERT INTO departments (dept_id, dept_name, company_id) VALUES
(101,'HR',1),
(102,'Engineering',1),
(103,'Sales',1),
(201,'Marketing',2),
(202,'Finance',2),
(203,'Customer Support',2),
(301,'Data Science',3),
(302,'AI Research',3),
(401,'Cloud Engineering',4),
(402,'Product Management',4);

SET IDENTITY_INSERT departments OFF;

-- c.Insert Data into employees (this dataset contains 30 employees for better analysis)
--INSERT INTO employees VALUES
--(1,'Amit','Sharma',102,120000,'2019-01-15',NULL,'Engineering Director'),
--(2,'Neha','Verma',101,60000,'2021-03-10',1,'HR Manager'),
--(3,'Rahul','Singh',102,90000,'2022-02-20',1,'Senior Software Engineer'),
--(4,'Priya','Mehta',103,70000,'2021-11-12',1,'Sales Manager'),
--(5,'Karan','Malhotra',201,85000,'2020-07-18',NULL,'Marketing Manager'),
--(6,'Sneha','Kapoor',202,95000,'2018-09-25',NULL,'Finance Director'),
--(7,'Rohit','Agarwal',301,110000,'2021-04-01',NULL,'Lead Data Scientist'),
--(8,'Pooja','Nair',301,80000,'2022-12-10',7,'Data Analyst'),
--(9,'Arjun','Patel',102,75000,'2023-02-14',3,'Backend Developer'),
--(10,'Anjali','Gupta',103,65000,'2022-08-30',4,'Sales Executive'),
--(11,'Vikas','Yadav',102,72000,'2023-03-15',3,'Frontend Developer'),
--(12,'Ritu','Chopra',101,55000,'2022-05-22',2,'HR Executive'),
--(13,'Sanjay','Bansal',202,88000,'2020-06-10',6,'Finance Analyst'),
--(14,'Nisha','Arora',201,62000,'2023-01-05',5,'Marketing Specialist'),
--(15,'Deepak','Joshi',203,50000,'2022-07-19',5,'Support Executive'),
--(16,'Meera','Iyer',301,82000,'2023-04-11',7,'Data Analyst'),
--(17,'Aditya','Shah',302,98000,'2021-10-08',7,'AI Engineer'),
--(18,'Kavita','Rao',302,87000,'2022-09-16',17,'ML Engineer'),
--(19,'Manish','Khanna',103,63000,'2023-06-20',4,'Sales Executive'),
--(20,'Pankaj','Seth',203,48000,'2023-02-01',15,'Support Associate'),
--(21,'Rakesh','Sinha',401,105000,'2021-12-12',NULL,'Cloud Architect'),
--(22,'Divya','Menon',401,88000,'2022-11-14',21,'Cloud Engineer'),
--(23,'Tarun','Goyal',401,76000,'2023-03-17',21,'DevOps Engineer'),
--(24,'Ishita','Kapoor',402,95000,'2021-08-23',NULL,'Product Manager'),
--(25,'Varun','Jain',402,72000,'2022-10-19',24,'Product Analyst'),
--(26,'Shweta','Gupta',201,64000,'2023-05-12',5,'Marketing Executive'),
--(27,'Ankit','Tiwari',102,68000,'2023-07-03',3,'Software Developer'),
--(28,'Preeti','Sharma',301,79000,'2023-06-18',7,'Data Analyst'),
--(29,'Yogesh','Patil',202,91000,'2021-04-21',6,'Senior Finance Analyst'),
--(30,'Simran','Kaur',401,82000,'2022-01-11',21,'Cloud Engineer');

--QUERY-C--
SET IDENTITY_INSERT employees ON;

INSERT INTO employees(emp_id, first_name, last_name, dept_id, salary, hire_date, manager_id, job_title) VALUES
(1,'Amit','Sharma',102,120000,'2019-01-15',NULL,'Engineering Director'),
(2,'Neha','Verma',101,60000,'2021-03-10',1,'HR Manager'),
(3,'Rahul','Singh',102,90000,'2022-02-20',1,'Senior Software Engineer'),
(4,'Priya','Mehta',103,70000,'2021-11-12',1,'Sales Manager'),
(5,'Karan','Malhotra',201,85000,'2020-07-18',NULL,'Marketing Manager'),
(6,'Sneha','Kapoor',202,95000,'2018-09-25',NULL,'Finance Director'),
(7,'Rohit','Agarwal',301,110000,'2021-04-01',NULL,'Lead Data Scientist'),
(8,'Pooja','Nair',301,80000,'2022-12-10',7,'Data Analyst'),
(9,'Arjun','Patel',102,75000,'2023-02-14',3,'Backend Developer'),
(10,'Anjali','Gupta',103,65000,'2022-08-30',4,'Sales Executive'),
(11,'Vikas','Yadav',102,72000,'2023-03-15',3,'Frontend Developer'),
(12,'Ritu','Chopra',101,55000,'2022-05-22',2,'HR Executive'),
(13,'Sanjay','Bansal',202,88000,'2020-06-10',6,'Finance Analyst'),
(14,'Nisha','Arora',201,62000,'2023-01-05',5,'Marketing Specialist'),
(15,'Deepak','Joshi',203,50000,'2022-07-19',5,'Support Executive'),
(16,'Meera','Iyer',301,82000,'2023-04-11',7,'Data Analyst'),
(17,'Aditya','Shah',302,98000,'2021-10-08',7,'AI Engineer'),
(18,'Kavita','Rao',302,87000,'2022-09-16',17,'ML Engineer'),
(19,'Manish','Khanna',103,63000,'2023-06-20',4,'Sales Executive'),
(20,'Pankaj','Seth',203,48000,'2023-02-01',15,'Support Associate'),
(21,'Rakesh','Sinha',401,105000,'2021-12-12',NULL,'Cloud Architect'),
(22,'Divya','Menon',401,88000,'2022-11-14',21,'Cloud Engineer'),
(23,'Tarun','Goyal',401,76000,'2023-03-17',21,'DevOps Engineer'),
(24,'Ishita','Kapoor',402,95000,'2021-08-23',NULL,'Product Manager'),
(25,'Varun','Jain',402,72000,'2022-10-19',24,'Product Analyst'),
(26,'Shweta','Gupta',201,64000,'2023-05-12',5,'Marketing Executive'),
(27,'Ankit','Tiwari',102,68000,'2023-07-03',3,'Software Developer'),
(28,'Preeti','Sharma',301,79000,'2023-06-18',7,'Data Analyst'),
(29,'Yogesh','Patil',202,91000,'2021-04-21',6,'Senior Finance Analyst'),
(30,'Simran','Kaur',401,82000,'2022-01-11',21,'Cloud Engineer');

SET IDENTITY_INSERT employees OFF;
GO

--SQL queries to extract and manipulate data from the database. 

--1. Retrieve all employees from the employees table.

SELECT * FROM employees;

--2. Select employees working in the 'Sales' department.
--To find employees working in the 'Sales' department, you need to link the employees table to the departments table using a JOIN.
--This allows you to filter the data using the actual department name instead of just its numerical ID.

SELECT e.* 
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Sales';

--3. List unique job titles available.
--To list only the unique job titles without any duplicates, you use the DISTINCT keyword on the job_title column.

SELECT DISTINCT job_title 
FROM employees;

--4. Sort employees by salary in descending order.
--To sort your employees by salary from highest to lowest, you use the ORDER BY clause combined with the DESC (descending) keyword.

SELECT * 
FROM employees
ORDER BY salary DESC;

--5. Count the total number of employees.
--To count the total number of records in your table, you use the COUNT() aggregate function.

SELECT COUNT(*) AS total_employees 
FROM employees;

--6. Show the average salary per department
--To show the average salary per department, you need to use the AVG() function combined with a GROUP BY clause.
--Joining with the departments table allows you to display the actual name of the department instead of just its ID number

SELECT 
    d.dept_name, 
    AVG(e.salary) AS average_salary
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

--7. Join employees and departments to show employee name and department.
--To display the employee names alongside their department names, you use an INNER JOIN to connect the two tables on their matching ID column.
--You can also combine the first and last names into a single column for a cleaner presentation.
SELECT 
    e.first_name + ' ' + e.last_name AS employee_name,
    d.dept_name AS department_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;











