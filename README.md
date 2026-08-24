# Company Database System (company_db)
**Author:** Faiza Irffath  
**Assignment:** Basic & Intermediate Queries (Approved - Score: 92/100)

## 📋 Assignment Objectives & Tasks
This project addresses the following data manipulation and extraction tasks:
1. **Retrieve all employees** from the employees table.
2. **Select employees** working specifically in the 'Sales' department.
3. **List unique job titles** available across the organization.
4. **Sort employees** by salary metrics in descending order.
5. **Count the total number** of employees currently registered.
6. **Show the average salary** distributed per department.
7. **Join employees and departments** to show employee names side-by-side with their department names.

## 1. Database Architecture & Design Rationale
This database is structured utilizing relational principles optimized to meet Third Normal Form (3NF) requirements:
* **First Normal Form (1NF):** All columns contain atomic values; there are no repeating groups.
* **Second Normal Form (2NF):** Every table possesses a dedicated Primary Key, and all non-key attributes are fully dependent on that key.
* **Third Normal Form (3NF):** Transitive dependencies have been eliminated. Department names rely on department IDs, which in turn map back to companies.

### Schema Relationships
1. **Companies to Departments (1:M):** A parent company can contain multiple departmental branches.
2. **Departments to Employees (1:M):** Each department can house multiple employees.
3. **Manager self-reference (1:M):** Employees map to their specific direct manager inside the same table.

## 2. Optimization & Performance Strategies
* **Foreign Key Indexing:** Explicit non-clustered indexes are assigned to `dept_id` and `company_id` to speed up relational `INNER JOIN` operations.
* **Query Attribute Indexing:** Non-clustered indexes are assigned to high-frequency query targets (`salary`, `job_title`) to prevent costly full-table scans.

## 3. Data Integrity & Constraints
* **CHECK Constraints:** Enforces that employee salaries must always strictly exceed zero (`salary > 0`).
* **UNIQUE Constraints:** Prevents duplicate corporate naming conventions within the marketplace.
* **DEFAULT Timestamps:** Automatically records system date parameters when new records are written.
