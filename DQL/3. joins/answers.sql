-- INNER JOIN Examples

-- 1. Show customer names along with their order IDs.
SELECT c.customer_name, o.order_id
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- 2. List the names of products and their prices that have been ordered.
SELECT p.product_name, p.price
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id;

-- LEFT JOIN Examples

-- 3. Show each customer's name and the total amount of their order. Include customers even if they haven't placed an order.
SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 4. Show all products and whether they have been ordered.
SELECT p.product_name, oi.order_id
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id;

-- FULL OUTER JOIN Examples

-- 5. Show a list of all customers and orders. Include customers with no orders and orders with missing customer information.
SELECT c.customer_name, o.order_id
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id;

-- 6. List all products and orders. Include products never ordered and orders with missing products.
SELECT p.product_name, oi.order_id
FROM products p
FULL OUTER JOIN order_items oi ON p.product_id = oi.product_id;

-- SELF JOIN Example

-- 7. Show customers who share the same phone number.
SELECT c1.customer_name AS customer1, c2.customer_name AS customer2, c1.phone
FROM customers c1
INNER JOIN customers c2 ON c1.phone = c2.phone AND c1.customer_id <> c2.customer_id;

-- Remaining Join Practice Questions

-- 8. Show order IDs along with the full name of the customer and the order status.
SELECT o.order_id, c.customer_name, o.status
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- 9. List all products ordered in each order. Show order_id and product_name.
SELECT oi.order_id, p.product_name
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id;

-- 10. Display all order items with product name, quantity, and unit_price.
SELECT p.product_name, oi.quantity, oi.unit_price
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id;

-- 11. Show all customers who have placed an order, along with their email.
SELECT DISTINCT c.customer_name, c.email
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- 12. List all orders that include "Pizza" in the product name. Show order_id and product_name.
SELECT oi.order_id, p.product_name
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
WHERE p.product_name ILIKE '%pizza%';

-- 13. Show all orders with their customer's full name, product name, and quantity.
SELECT o.order_id, c.customer_name, p.product_name, oi.quantity
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

-- 14. Bonus: Show all products that have **never** been ordered.
SELECT p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_id IS NULL;
