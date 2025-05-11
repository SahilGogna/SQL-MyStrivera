-- ------------------------------------------------------
-- ANSWER 1: Subquery in the WHERE Clause
-- ------------------------------------------------------
SELECT * 
FROM flight_details 
WHERE airline IN (
    SELECT DISTINCT airline 
    FROM flight_details 
    WHERE status = 'Cancelled'
);

-- ------------------------------------------------------
-- ANSWER 2: Subquery in the FROM Clause
-- ------------------------------------------------------

SELECT airline, AVG(delay_minutes) AS avg_delay
FROM (
    SELECT airline, EXTRACT(EPOCH FROM (actual_time - scheduled_time)) / 60 AS delay_minutes
    FROM flight_details
    WHERE status = 'Delayed'
) AS delays
GROUP BY airline;

-- ------------------------------------------------------
-- ANSWER 3: Subquery in the SELECT Clause
-- ------------------------------------------------------

SELECT 
    airline,
    COUNT(*) AS total_flights,
    (SELECT COUNT(*) 
     FROM flight_details f2 
     WHERE f2.airline = f1.airline AND status = 'Cancelled') AS cancelled_flights
FROM flight_details f1
GROUP BY airline;

-- ------------------------------------------------------
-- ANSWER 4
-- ------------------------------------------------------

SELECT *
FROM flight_details
WHERE airline IN (
    SELECT DISTINCT airline
    FROM flight_details
    WHERE status = 'Cancelled'
);

-- ------------------------------------------------------
-- ANSWER 5
-- ------------------------------------------------------

SELECT *
FROM flight_details
WHERE destination_or_origin IN (
    SELECT DISTINCT destination_or_origin
    FROM flight_details
    WHERE status = 'Cancelled'
);

-- ------------------------------------------------------
-- ANSWER 6
-- ------------------------------------------------------

SELECT *
FROM flight_details
WHERE status = 'Cancelled'
AND gate IN (
    SELECT DISTINCT gate
    FROM flight_details
    WHERE status = 'On Time'
);

-- ------------------------------------------------------
-- ANSWER 7
-- ------------------------------------------------------

SELECT *
FROM flight_details
WHERE airline NOT IN (
    SELECT DISTINCT airline
    FROM flight_details
    WHERE status = 'Cancelled'
);


-- ------------------------------------------------------
-- ANSWER 8
-- ------------------------------------------------------

SELECT *
FROM flight_details
WHERE destination_or_origin NOT IN (
    SELECT DISTINCT destination_or_origin
    FROM flight_details
    WHERE status = 'On Time'
);

-- ------------------------------------------------------
-- ANSWER 9
-- ------------------------------------------------------

SELECT *
FROM flight_details
WHERE scheduled_time < ANY (
    SELECT scheduled_time
    FROM flight_details
    WHERE status = 'Delayed'
);

-- ------------------------------------------------------
-- ANSWER 10
-- ------------------------------------------------------

SELECT *
FROM flight_details
WHERE scheduled_time > ANY (
    SELECT scheduled_time
    FROM flight_details
    WHERE status = 'Cancelled'
);


-- ------------------------------------------------------
-- ANSWER 11
-- ------------------------------------------------------

SELECT *
FROM flight_details
WHERE scheduled_time > ALL (
    SELECT scheduled_time
    FROM flight_details
    WHERE status = 'Cancelled'
);

-- ------------------------------------------------------
-- ANSWER 12
-- ------------------------------------------------------

SELECT DISTINCT airline
FROM flight_details fd
WHERE 'Cancelled' <> ALL (
    SELECT status
    FROM flight_details
    WHERE airline = fd.airline
);