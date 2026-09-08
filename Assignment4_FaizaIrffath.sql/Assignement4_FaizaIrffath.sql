Assignement4_FaizaIrffath.sql
-- ====================================================================
-- Assignment 4: Data Modification and Integrity
-- ====================================================================

USE company_db;
GO

-- ================================================================= --
-- Task 1: Update the Salary of Employees in the 'Sales' Department by 10%
-- ================================================================= --
-- Modifies existing records by joining the employees table with departments
-- to target only workers in the 'Sales' team.
UPDATE e
SET e.salary = e.salary * 1.10
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Sales';
GO

-- ================================================================= --
-- Task 2: Delete Employees Working in a Department Named 'Obsolete'
-- ================================================================= --
-- Removes employee records linked to decommissioned organizational units.
DELETE e
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Obsolete';
GO

-- ================================================================= --
-- Task 3: Create a View Showing High-Earning Employees (Salary > 80,000)
-- ================================================================= --
-- Establishes a virtual table that simplifies access to high-earner data
-- and abstracts the underlying table structure.
CREATE OR ALTER VIEW v_HighEarningEmployees AS
SELECT 
    e.emp_id, 
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name, 
    e.job_title, 
    e.salary
FROM employees e
WHERE e.salary > 80000;
GO

-- ================================================================= --
-- Task 4: Add a CHECK Constraint to Ensure Salary > 0
-- ================================================================= --
-- Enforces data integrity at the database layer by physically blocking 
-- zero or negative entries in the salary column.
ALTER TABLE employees
ADD CONSTRAINT CHK_Employee_Salary_Positive 
CHECK (salary > 0);
GO

-- ================================================================= --
-- Task 5: Create an Index on Employee Last Names for Faster Searching
-- ================================================================= --
-- Optimizes query performance and search speeds for frequent lookups
-- filtered by employee surnames.
CREATE NONCLUSTERED INDEX IX_Employees_LastName
ON employees (last_name);
GO

-- ================================================================= --
-- Task 6: Create a Stored Procedure to Retrieve Employees of a Given Department
-- ================================================================= --
-- Encapsulates query logic into a reusable unit that accepts a dynamic 
-- input parameter for the department name.
CREATE OR ALTER PROCEDURE sp_GetEmployeesByDepartment
    @DepartmentName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON; -- Prevents extra 'rows affected' messages for cleaner performance

    SELECT 
        e.emp_id, 
        CONCAT(e.first_name, ' ', e.last_name) AS employee_name, 
        e.job_title, 
        e.salary
    FROM employees e
    INNER JOIN departments d ON e.dept_id = d.dept_id
    WHERE d.dept_name = @DepartmentName;
END;
GO
