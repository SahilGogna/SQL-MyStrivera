
-- SQL Join Practice – Answer Set

-- 1
SELECT e.first_name, e.last_name, r.region, r.country
FROM employees e
JOIN regions r ON e.region_id = r.region_id;

-- 2
SELECT e.first_name, e.last_name, d.department, d.division
FROM employees e
JOIN departments d ON e.department = d.department;

-- 3
SELECT r.region, COUNT(*) AS employee_count
FROM employees e
JOIN regions r ON e.region_id = r.region_id
GROUP BY r.region;

-- 4
SELECT d.division, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department = d.department
GROUP BY d.division;

-- 5
SELECT r.region, COUNT(*) AS employee_count
FROM employees e
JOIN regions r ON e.region_id = r.region_id
GROUP BY r.region
HAVING COUNT(*) > 10;

-- 6
SELECT e.department, AVG(e.salary) AS avg_salary
FROM employees e
GROUP BY e.department
ORDER BY avg_salary DESC
LIMIT 3;

-- 7
SELECT r.region, e.gender, COUNT(*) AS gender_count
FROM employees e
JOIN regions r ON e.region_id = r.region_id
GROUP BY r.region, e.gender;

-- 8
SELECT d.department, d.division, COUNT(e.employee_id) AS num_employees
FROM departments d
LEFT JOIN employees e ON d.department = e.department
GROUP BY d.department, d.division;

-- 9
SELECT r.region, r.country
FROM regions r
LEFT JOIN employees e ON r.region_id = e.region_id
WHERE e.employee_id IS NULL;

SELECT r.region, r.country, e.first_name
FROM regions r
LEFT JOIN employees e ON r.region_id = e.region_id
WHERE e.employee_id IS NULL
order by e.first_name


-- 10

SELECT department ,
avg(case when hire_date < '2010-01-01' THEN salary end) as before_2010,
avg(case when hire_date >= '2010-01-01' THEN salary end) as after_2010
from employees e 
group by department


SELECT department,
       AVG(CASE WHEN hire_date < '2010-01-01' THEN salary END) AS avg_salary_before_2010,
       AVG(CASE WHEN hire_date >= '2010-01-01' THEN salary END) AS avg_salary_after_2010
FROM employees
GROUP BY department;

-- 11
SELECT d.division, COUNT(DISTINCT e.region_id) AS region_count
FROM employees e
JOIN departments d ON e.department = d.department
GROUP BY d.division
HAVING COUNT(DISTINCT e.region_id) > 2;

-- 12
SELECT r.country, d.division, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d ON e.department = d.department
JOIN regions r ON e.region_id = r.region_id
GROUP BY r.country, d.division;

-- 13
SELECT e.department, AVG(e.salary) AS avg_salary, COUNT(*) AS num_employees
FROM employees e
GROUP BY e.department
HAVING AVG(e.salary) < 60000 AND COUNT(*) > 3;
