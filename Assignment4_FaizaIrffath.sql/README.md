# Assignment 4: Data Modification and Database Integrity

## 📌 Project Overview
This repository contains a T-SQL script developed for Microsoft SQL Server, focusing on **Data Manipulation Language (DML)**, **Data Definition Language (DDL)**, and database object creation. The script demonstrates practical applications of modifying data conditionally, safeguarding data via business rule integrity constraints, optimizing query search paths, and modularizing database logic using structural objects (Views and Stored Procedures).

---

## 🗄️ Database Schema Assumptions
The implementation relies on standard relational tracking fields across the following entities:
*   **`departments`**: Structures company units (`dept_id`, `dept_name`).
*   **`employees`**: Structures workforce files (`emp_id`, `first_name`, `last_name`, `job_title`, `salary`, `dept_id`).

---

## 🛠️ Task Breakdowns & Core Concepts

### Task 1: Cross-Table Conditional Salary Update
*   **Concept:** Relational Multi-Table `UPDATE` expressions.
*   **Objective:** Target updates strictly within isolated groups by joining the `employees` ledger with the `departments` registry, calculating a dynamic 10% raise exclusively for the `'Sales'` department.

### Task 2: Relational Record Eviction
*   **Concept:** Cascading criteria `DELETE` operations.
*   **Objective:** Cleanly purges worker profiles attached to operational business units marked as `'Obsolete'` using a sub-joined lookup.

### Task 3: Security & Layer Separation Views
*   **Concept:** Database Abstracted Virtual Tables (`VIEW`).
*   **Objective:** Materializes a secure data layer (`v_HighEarningEmployees`) focusing on high-tier wage entries above $80,000. This pattern protects column endpoints and abstracts away the raw structural tables from downstream application clients.

### Task 4: Hard Structural Rules Check
*   **Concept:** Domain Data Integrity Constraints (`CHECK`).
*   **Objective:** Injects an active operational safety block (`CHK_Employee_Salary_Positive`) directly into the table system, physically restricting zero or negative values from entering the system during runtime.

### Task 5: Index Searching Performance Enhancements
*   **Concept:** B-Tree Data Storage Acceleration Structure (`NONCLUSTERED INDEX`).
*   **Objective:** Allocates a custom performance index (`IX_Employees_LastName`) targeting employee last names. This layout mitigates the need for costly full-table scans when executing high-frequency search lookups.

### Task 6: Functional Logical Encapsulation
*   **Concept:** Parameterized Compiled Server Modules (`STORED PROCEDURE`).
*   **Objective:** Packages structural extraction routines into a centralized entity (`sp_GetEmployeesByDepartment`). It utilizes dynamic arguments and relies on strict `SET NOCOUNT ON` protocols to increase parsing speeds and drop communication overhead.

---

## 🚀 Script Testing and Execution Guide

### 1. File Implementation
Execute the `Assignment4_faizaIrffath.sql` script context directly within **SQL Server Management Studio (SSMS)** or Azure Data Studio against your existing `company_db` target container.

### 2. Testing Your Database Objects
Once compiled, verify the creation of your custom operational view and procedural blocks by copying and testing these system calls:

```sql
-- Query the newly created High-Earner View
SELECT * FROM v_HighEarningEmployees;

-- Run the Stored Procedure for a specific department
EXEC sp_GetEmployeesByDepartment @DepartmentName = 'Marketing';
```

---
**Author:** Faiza Irffath  
**Course Assignment:** Data Modification and Integrity - Assignment 4
