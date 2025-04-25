-- 1. Delete duplicate data

select * from cars

delete from cars
where model_id not in (
		select min(model_id)
		from cars
		group by model_name, color, brand)
		
-- 2. Display highest and lowest salary
SELECT dept, MAX(salary)
FROM employee
GROUP BY dept;


SELECT name, 
dept, 
salary, 
MIN(salary) OVER (PARTITION BY dept) AS min_salary_in_dept,
MAX(salary) OVER (PARTITION BY dept) AS max_salary_in_dept
FROM employee;

-- 3. Find actual distance
select cars,
days,
cumulative_distance,
cumulative_distance - lag(cumulative_distance,1,0) over(partition by cars order by days) as actual_dist
from car_travels;

