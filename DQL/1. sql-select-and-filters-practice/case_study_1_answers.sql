-- 1
SELECT full_name, email FROM customers;

-- 2
SELECT product_name AS Item, price AS Cost FROM products;

-- 3
SELECT * FROM products WHERE category = 'Beverages';

-- 4
SELECT * FROM products WHERE price > 5;

-- 5
SELECT * FROM orders WHERE total_amount >= 10;

-- 6
SELECT * FROM customers WHERE phone IS NULL;

-- 7
SELECT * FROM products WHERE price BETWEEN 3 AND 6;

-- 8
SELECT * FROM products WHERE product_name IN ('French Fries', 'Veg Burger', 'Margherita Pizza');

-- 9
SELECT * FROM customers WHERE full_name LIKE 'A%';

-- 10
SELECT * FROM customers
WHERE customer_id IN (
    SELECT customer_id FROM orders
);

-- 11
SELECT * FROM orders WHERE status != 'Delivered';

-- 12
SELECT * FROM products WHERE price NOT BETWEEN 4 AND 6;

-- 13
SELECT * FROM products WHERE category NOT IN ('Main Course', 'Snacks', 'Beverages');

-- 14
SELECT * FROM customers WHERE full_name NOT LIKE 'S%';

-- 15
SELECT order_id, product_id, quantity, unit_price, (quantity * unit_price) AS total_price
FROM order_items;

-- 16
SELECT * FROM products ORDER BY price DESC LIMIT 10;

-- 17
SELECT * FROM customers ORDER BY full_name ASC;

-- 18
SELECT * FROM customers ORDER BY created_at DESC LIMIT 5;

-- 19

select RANDOM()
SELECT * FROM products ORDER BY RANDOM() LIMIT 3;



-- Additional queries from class
-- 7. Find all products priced between $3 and $6.
Select * 
from products
where price between 3.99 and 4.99

Select * 
from products
where price>= 3 and price <=6

-- 8. Find products named 'French Fries', 'Veg Burger', or 'Margherita Pizza'.
SELECT * 
FROM products 
WHERE product_name IN ('French Fries', 'Veg Burger', 'Margherita Pizza')

SELECT * 
FROM products 
WHERE product_name = 'French Fries'
or product_name = 'Veg Burger'
or product_name = 'Margherita Pizza'

-- 9. Find customers whose name starts with ‘A’.
SELECT * 
FROM customers 
WHERE full_name like 'A%'

SELECT * 
FROM customers 
WHERE full_name like '%A'

SELECT * 
FROM customers 
WHERE full_name like '%A%'

-- if we want to get the customer with second letter as a in their name
SELECT * 
FROM customers 
WHERE full_name like '_a%'

SELECT * 
FROM customers 
WHERE full_name like '__a%'

