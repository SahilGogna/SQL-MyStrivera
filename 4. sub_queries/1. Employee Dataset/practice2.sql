
-- Q1: Find the most senior (earliest hired) employee in each region using subqueries only.

-- Q2: List departments where all employees earn more than the average salary of the entire company.

-- Q3: List employees whose salary is more than 1.5 times the average salary of their department.

-- Q4: Find the highest paid employee in each division using only subqueries.

-- Q5: Identify regions that have the most departments with average salary greater than 100000.

-- Q6: What will the following query return? Why?
-- SELECT * FROM employees
-- WHERE department NOT IN (
--     SELECT department FROM employees WHERE salary > 200000
-- );