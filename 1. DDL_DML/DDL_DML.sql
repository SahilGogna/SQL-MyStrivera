-- ======================================
-- Business Problem:
-- A small food delivery startup wants to build a simple CRM (Customer Relationship Management) system to manage
-- their food menu, customer details, and orders. They want to track which customer buys which food item,
-- at what price, and when. They also want to be able to update pricing and track changes in order info.
-- ======================================

-- Step 1: Create the CRM database
CREATE DATABASE mini_crm;

-- Step 2: Connect to the new database

-- Step 3: Create the 'customers' table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 4: Create the 'products' table (food items)
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price NUMERIC(10,2) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

-- Step 5: Create the 'orders' table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE DEFAULT CURRENT_DATE,
    total_amount NUMERIC(10,2),
    status VARCHAR(20) DEFAULT 'Pending'
);

-- Step 6: Create the 'order_items' table
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT CHECK (quantity > 0),
    unit_price NUMERIC(10,2) NOT NULL
);

-- Step 7: Insert data into 'customers'
INSERT INTO customers (full_name, email, phone)
VALUES 
('Aditi Sharma', 'aditi@example.com', '9876543210'),
('Rohan Mehta', 'rohan@example.com', '9123456789'),
('Priya Verma', 'priya@example.com', '9988776655'),
('Karan Patel', 'karan@example.com', '8877665544'),
('Neha Joshi', 'neha@example.com', '9765432101'),
('Siddharth Roy', 'siddharth@example.com', '9654321870'),
('Tanvi Desai', 'tanvi@example.com', '9543218765'),
('Vikram Singh', 'vikram@example.com', '9432109876'),
('Meera Iyer', 'meera@example.com', '9321098765'),
('Aman Khan', 'aman@example.com', '9210987654');

-- Step 8: Insert data into 'products' (food items)
INSERT INTO products (product_name, category, price)
VALUES 
('Margherita Pizza', 'Main Course', 499.99),
('Veg Burger', 'Snacks', 199.99),
('French Fries', 'Sides', 149.99),
('Chocolate Milkshake', 'Beverages', 299.99),
('Caesar Salad', 'Starters', 249.99);

-- Step 9: Insert orders for various customers
INSERT INTO orders (customer_id, total_amount, status) VALUES 
(1, 699.98, 'Confirmed'),
(3, 499.99, 'Shipped'),
(4, 449.98, 'Pending'),
(5, 149.99, 'Delivered'),
(7, 549.98, 'Confirmed');

-- Step 10: Insert order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
(1, 1, 1, 499.99),
(1, 2, 1, 199.99),
(2, 1, 1, 499.99),
(3, 4, 1, 299.99),
(3, 5, 1, 149.99),
(4, 3, 1, 149.99),
(5, 1, 1, 499.99),
(5, 2, 1, 50.00);

-- Step 11: Run a SELECT to check customer orders
SELECT c.full_name, o.order_id, o.total_amount, o.status, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- Step 12: Update product price
UPDATE products SET price = 179.99 WHERE product_id = 2;

-- Step 13: Delete a customer (for demo)
DELETE FROM customers WHERE customer_id = 2;