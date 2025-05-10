-- ------------------------------------------------------
-- LESSON: Introduction to Window Functions in SQL
-- ------------------------------------------------------

-- Window functions are powerful tools in SQL that allow you to perform calculations across sets of rows
-- that are related to the current row, without collapsing the rows into a single output like GROUP BY does.

-- Two key components of window functions:
-- 1. OVER(): Defines the window or set of rows the function operates on.
-- 2. PARTITION BY: Divides the data into partitions (groups) to apply the window function separately.

-- In this lesson, we’ll explore:
-- - Why we need window functions.
-- - Solving problems with and without window functions.
-- - Examples using PARTITION BY and ORDER BY within OVER().

-- Let’s begin by setting up our sample tables.


-- ------------------------------------------------------
-- QUESTION 1: What is the average performance score per department?
-- (Without Window Functions)
-- ------------------------------------------------------
SELECT department, AVG(score) AS avg_perf
FROM employee_performance
GROUP BY department;

-- ------------------------------------------------------
-- show each employee’s name, department, score, and the average score of their department 
-- ------------------------------------------------------
select 
	name, 
	department,
	score,
	(select 
	 	round(avg(score),1)
	 	from employee_performance ep2
	 	where ep1.department = ep2.department
	) as avg_score
from employee_performance ep1

-- ------------------------------------------------------
-- (With Window Function)
-- ------------------------------------------------------
select 
	name,
	department,
	score,
	round(AVG(score) over(partition by department),1) as avg_score
from employee_performance

-- Advantage: We get both individual performance and the department average side by side.

-- what happens when we don't specify partition by? Answer it yourself

-- ------------------------------------------------------
-- QUESTION 2: How much higher or lower is each employee’s score compared to their department’s average?
-- (Without Window Functions)
-- ------------------------------------------------------

SELECT 
    name,
    department,
    score,
    ROUND(score - (
        SELECT AVG(score)
        FROM employee_performance ep2
        WHERE ep1.department = ep2.department
    ), 1) AS diff_from_avg
FROM employee_performance ep1;

-- ------------------------------------------------------
-- (With Window Function)
-- ------------------------------------------------------

SELECT 
    name,
    department,
    score,
    ROUND(score - AVG(score) OVER (PARTITION BY department), 1) AS diff_from_avg
FROM employee_performance;

-- ------------------------------------------------------
-- QUESTION 3: For each terminal, how many flights were scheduled from each gate? 
-- Show the flight_number, gate, terminal, and total gate flights within that terminal.
-- (Without Window Functions)
-- ------------------------------------------------------

SELECT 
    flight_number,
    terminal,
    gate,
    (
        SELECT COUNT(*) 
        FROM flight_details fd2
        WHERE fd1.terminal = fd2.terminal AND fd1.gate = fd2.gate
    ) AS gate_flight_count
FROM flight_details fd1
order by terminal, gate;

-- ------------------------------------------------------
-- (With Window Function)
-- ------------------------------------------------------

SELECT 
    flight_number,
    terminal,
    gate,
    COUNT(*) OVER (PARTITION BY terminal, gate) AS gate_flight_count
FROM flight_details;


-- ------------------------------------------------------
-- QUESTION 4:How many minutes early or late was each flight compared to the average delay of its airline?
-- (Without Window Functions)
-- ------------------------------------------------------

SELECT 
    flight_number,
    airline,
    EXTRACT(EPOCH FROM actual_time - scheduled_time)/60 AS delay_minutes,
    ROUND(
        EXTRACT(EPOCH FROM actual_time - scheduled_time)/60 -
        (
            SELECT AVG(EXTRACT(EPOCH FROM actual_time - scheduled_time)/60)
            FROM flight_details fd2
            WHERE fd1.airline = fd2.airline
        ), 1
    ) AS deviation_from_avg
FROM flight_details fd1;

-- ------------------------------------------------------
-- (With Window Function)
-- ------------------------------------------------------

SELECT 
    flight_number,
    airline,
    EXTRACT(EPOCH FROM actual_time - scheduled_time)/60 AS delay_minutes,
    ROUND(
        EXTRACT(EPOCH FROM actual_time - scheduled_time)/60 -
        AVG(EXTRACT(EPOCH FROM actual_time - scheduled_time)/60) 
            OVER (PARTITION BY airline), 1
    ) AS deviation_from_avg
FROM flight_details;