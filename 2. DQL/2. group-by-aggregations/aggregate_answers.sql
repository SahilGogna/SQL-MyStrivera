-- Q1
SELECT status, COUNT(*) AS total_orders
FROM orders
GROUP BY status;

-- Q2
SELECT status, AVG(total_amount) AS avg_order_value
FROM orders
GROUP BY status;

-- Q3
SELECT order_date, SUM(total_amount) AS total_revenue
FROM orders
GROUP BY order_date
ORDER BY order_date;

-- Q4
SELECT 
    MAX(total_amount) AS max_order,
    MIN(total_amount) AS min_order,
    AVG(total_amount) AS avg_order
FROM orders;

-- Q5
SELECT category, COUNT(*) AS num_products
FROM products
GROUP BY category;

-- Q6
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;

-- Q7
SELECT 
    MAX(price) AS highest_price,
    MIN(price) AS lowest_price
FROM products;

-- Q8
SELECT product_id, SUM(quantity) AS total_quantity
FROM order_items
GROUP BY product_id;

-- Q9
SELECT product_id, AVG(unit_price) AS avg_unit_price
FROM order_items
GROUP BY product_id;

-- Q10
SELECT product_id, COUNT(*) AS times_ordered
FROM order_items
GROUP BY product_id;
