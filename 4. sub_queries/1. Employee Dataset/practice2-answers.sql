answers.sql

-- Q1: Most senior employee in each region
SELECT * FROM employees e
WHERE hire_date = (
    SELECT MIN(hire_date)
    FROM employees e2
    WHERE e2.region_id = e.region_id
);

-- Q2: Departments where all employees earn more than company avg
SELECT DISTINCT department FROM employees e1
WHERE NOT EXISTS (
    SELECT * FROM employees e2
    WHERE e1.department = e2.department
    AND e2.salary <= (SELECT AVG(salary) FROM employees)
);

-- Q3: Employees earning >1.5x department avg
SELECT * FROM employees e
WHERE salary > 1.5 * (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e2.department = e.department
);

-- Q4: Highest paid employee in each division
SELECT * FROM employees e
WHERE salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department IN (
        SELECT d.department FROM departments d
        WHERE d.division = (
            SELECT d2.division FROM departments d2
            WHERE d2.department = e.department
        )
    )
);

-- Q5: Regions with the most departments where avg salary > 100000
-- Returns region_id(s) with max count
SELECT region_id FROM (
    SELECT region_id, COUNT(DISTINCT department) AS high_pay_dept_count
    FROM employees
    WHERE department IN (
        SELECT department FROM employees
        GROUP BY department
        HAVING AVG(salary) > 100000
    )
    GROUP BY region_id
) AS region_stats
WHERE high_pay_dept_count = (
    SELECT MAX(dept_count) FROM (
        SELECT COUNT(DISTINCT department) AS dept_count
        FROM employees
        WHERE department IN (
            SELECT department FROM employees
            GROUP BY department
            HAVING AVG(salary) > 100000
        )
        GROUP BY region_id
    ) AS dept_counts
);

-- Q6: Behavior of NOT IN with NULLs
-- This query will return 0 rows if any salary > 200000 returns NULL department
-- Because NOT IN with NULL in subquery results in UNKNOWN (filters out all rows)
