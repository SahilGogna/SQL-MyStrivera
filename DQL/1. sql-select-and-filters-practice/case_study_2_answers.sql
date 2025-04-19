-- 1
SELECT DISTINCT category FROM products;

-- 2
SELECT UPPER(product_name) FROM products;

-- 3
SELECT * FROM customers WHERE phone IS NULL;

-- 4
SELECT * FROM customers ORDER BY full_name ASC LIMIT 5;

-- 5
SELECT * FROM customers ORDER BY full_name ASC LIMIT 5 OFFSET 5;

-- 6
SELECT * FROM products WHERE price BETWEEN 5 AND 15;

-- 7
SELECT order_id, total_amount,
  CASE 
    WHEN total_amount > 50 THEN 'High'
    WHEN total_amount BETWEEN 20 AND 50 THEN 'Medium'
    ELSE 'Low'
  END AS priority
FROM orders;

-- 8
SELECT order_id, COALESCE(total_amount, 0) AS total_amount FROM orders;

-- 9
SELECT full_name, SPLIT_PART(full_name, ' ', 1) AS first_name FROM customers;

-- 10
SELECT * FROM orders WHERE order_date = CURRENT_DATE;

-- 11
SELECT * FROM orders
ORDER BY 
  CASE 
    WHEN status = 'Delivered' THEN 1
    WHEN status = 'Confirmed' THEN 2
    WHEN status = 'Shipped' THEN 3
    ELSE 4
  END;

-- 12
SELECT order_id, 
order_date, 
CURRENT_DATE AS today, 
AGE(CURRENT_DATE, order_date) AS days_ago 
from orders

SELECT order_id, 
order_date, 
CURRENT_DATE AS today, 
AGE(order_date) AS days_ago 
from orders

FROM orders;

-- 13
SELECT full_name, COALESCE(phone, 'Missing') AS phone FROM customers;

-- 14
SELECT * FROM products WHERE product_name LIKE '%Pizza%';
SELECT * FROM products WHERE product_name ILIKE '%pizza%';


-- 15
SELECT product_name, LENGTH(product_name) AS name_length FROM products;