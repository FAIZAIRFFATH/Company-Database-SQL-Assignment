Assignment3_faizaIrffath.sql
====================================================================
Assignment 3: Advanced SQL Queries
====================================================================
USE company_db;
GO
-- =================================================================
-- Task 1: Use LEFT JOIN to List Employees and Their Managers
-- =================================================================
-- Lists all employees along with their managers, including those without one.
SELECT 
    e.emp_id AS employee_id,
    e.first_name + ' ' + e.last_name AS employee_name,
    e.job_title AS employee_title,
    ISNULL(m.first_name + ' ' + m.last_name, 'No Manager') AS manager_name,
    m.job_title AS manager_title
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;


-- =================================================================
-- Task 2: Subquery for Employees Earning Above Average Salary
-- =================================================================
-- Finds all employees whose salaries are above the company-wide average.
SELECT 
    emp_id,
    first_name + ' ' + last_name AS employee_name,
    job_title,
    salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;


-- =================================================================
-- Task 3: Nested JOIN to Get Employee Name, Department, and Company
-- =================================================================
-- Joins multiple tables together to find department and company origins.
SELECT 
    e.first_name + ' ' + e.last_name AS employee_name,
    e.job_title,
    d.dept_name AS department_name,
    c.company_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id
INNER JOIN companies c ON d.company_id = c.company_id;


-- =================================================================
-- Task 4: Use a CTE to Find the Second-Highest Salary
-- =================================================================
-- Uses a CTE and DENSE_RANK to find the exact second-highest earner.
WITH SalaryRanking AS (
    SELECT 
        emp_id,
        first_name + ' ' + last_name AS employee_name,
        job_title,
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT 
    employee_name,
    job_title,
    salary
FROM SalaryRanking
WHERE salary_rank = 2;


-- =================================================================
-- Task 5: Rank Employees by Salary Within Departments
-- =================================================================
-- Partitions and ranks earners individually within their respective departments.
SELECT 
    d.dept_name AS department_name,
    e.first_name + ' ' + e.last_name AS employee_name,
    e.job_title,
    e.salary,
    DENSE_RANK() OVER (PARTITION BY e.dept_id ORDER BY e.salary DESC) AS salary_rank_in_dept
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id
ORDER BY department_name, salary_rank_in_dept;


-- =================================================================
-- Task 6: Categorise Employees as 'Low', 'Medium', or 'High' Earners
-- =================================================================
-- Evaluates salary metrics sequentially to establish baseline pay tiers.
SELECT 
    emp_id,
    first_name + ' ' + last_name AS employee_name,
    job_title,
    salary,
    CASE 
        WHEN salary < 65000 THEN 'Low Earner'
        WHEN salary BETWEEN 65000 AND 95000 THEN 'Medium Earner'
        ELSE 'High Earner'
    END AS salary_tier
FROM employees
ORDER BY salary DESC;
GO