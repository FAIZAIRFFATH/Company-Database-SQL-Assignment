Assignment3_FaizaIrffath.sql

# Assignment 3: Advanced SQL Queries

## 📌 Project Overview
This repository contains advanced T-SQL queries written for Microsoft SQL Server to extract complex insights from a corporate database environment (`company_db`). The assignment demonstrates mastery over intermediate and advanced relational database concepts, including complex joins, subqueries, Common Table Expressions (CTEs), window ranking functions, and conditional workflow logic.

---

## 🗄️ Database Schema Assumptions
The implementation assumes the following structural relationships within the database:
*   **`companies`**: Holds corporate entities (`company_id`, `company_name`).
*   **`departments`**: Holds organizational business units linked to a company (`dept_id`, `dept_name`, `company_id`).
*   **`employees`**: Holds core worker information (`emp_id`, `first_name`, `last_name`, `job_title`, `salary`, `dept_id`, `manager_id`).

---

## 🛠️ Task Breakdowns & Core Concepts

### Task 1: Employee and Manager Self-Join
*   **Concept:** Recursive self-join (`LEFT JOIN`) and fallback value handling.
*   **Objective:** Resolves the management hierarchy by matching an employee's `manager_id` back to the table's primary key (`emp_id`). 
*   **Best Practice:** Uses `ISNULL()` and `CONCAT()` to gracefully capture top-level executives who do not report to anyone, displaying `'No Manager'` instead of an empty value.

### Task 2: Subquery for Above-Average Earners
*   **Concept:** Uncorrelated scalar subqueries.
*   **Objective:** Calculates the aggregate, company-wide dynamic salary average in real time and filters the employee roster to display only individuals whose compensation exceeds that benchmark.

### Task 3: Multi-Level Nested Inner Joins
*   **Concept:** Relational path traversal.
*   **Objective:** Traverses a multi-table hierarchy (`employees` ➔ `departments` ➔ `companies`) using strict inner joins to trace an individual employee directly back to their department and corporate parent entity.

### Task 4: Secondary Rank Identification via CTEs
*   **Concept:** Common Table Expressions (CTEs) combined with Window Functions.
*   **Objective:** Establishes a temporary named result set using `DENSE_RANK()` to sequentially rank all corporate compensation figures. The outer statement queries this execution layer to safely extract the person earning exactly the second-highest salary.

### Task 5: Intra-Departmental Compensation Ranking
*   **Concept:** Segmented Analytic Functions (`PARTITION BY`).
*   **Objective:** Isolates and ranks earners independently *within* their respective business departments. Compensation tiers reset seamlessly whenever transitioning to a new department boundaries.

### Task 6: Custom Salary Stratification
*   **Concept:** Evaluation logic (`CASE WHEN`).
*   **Objective:** Groups employees sequentially into financial performance tiers (`Low Earner`, `Medium Earner`, `High Earner`) by applying standard corporate salary brackets.

---

## 🚀 How to Execute the Script

1. Open **SQL Server Management Studio (SSMS)** or Azure Data Studio.
2. Ensure you have the `company_db` context created or modify the top line statement.
3. Open and run the `Assignment3_faizaIrffath.sql` script file.
4. Execute the script (`F5`). All queries will fire in sequential blocks managed by `GO` sequence separators.

---
**Author:** Faiza Irffath  
**Course Assignment:** Advanced SQL Queries - Assignment 3
