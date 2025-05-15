
-- Filename: subquery_practice_answers.sql

-- Q1
SELECT * FROM employees AS e;

-- Q2
SELECT * FROM employees
WHERE department NOT IN (
    SELECT department FROM departments WHERE division = 'Health'
);

-- Q3
SELECT * FROM (
    SELECT * FROM employees
) AS emp
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Q4
SELECT e.first_name, e.last_name, e.salary,
       (SELECT AVG(salary) FROM employees e2 WHERE e2.department = e.department) AS avg_dept_salary
FROM employees e;

-- Q5
SELECT * FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e2.department = e.department
);

-- Q6
SELECT * FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees);

-- Q7
SELECT * FROM employees
WHERE department IN (
    SELECT department FROM departments WHERE division = 'Electronics'
);

-- Q8
SELECT * FROM employees
WHERE salary > ALL (
    SELECT salary FROM employees WHERE department = 'Books'
);

-- Q9
SELECT * FROM employees
WHERE salary > ANY (
    SELECT salary FROM employees WHERE department = 'Tools'
);

-- Q10
SELECT department FROM employees
GROUP BY department
HAVING AVG(salary) > (SELECT AVG(salary) FROM employees);

-- Q11
SELECT department FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

-- Q12
SELECT * FROM employees e
WHERE salary = (
    SELECT MAX(salary) FROM employees e2 WHERE e2.department = e.department
);

-- Q13
SELECT DISTINCT region_id FROM employees
WHERE salary > 150000;

-- Q14
SELECT * FROM employees
WHERE department NOT IN (
    SELECT department FROM departments
);

-- Q15
SELECT * FROM employees
WHERE hire_date = (
    SELECT MIN(hire_date) FROM employees
);
