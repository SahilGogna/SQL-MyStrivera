INSERT INTO customers (full_name, email, phone)
VALUES 
('Divya Nair', 'divya@example.com', '9112233445'),
('Arjun Kapoor', 'arjun@example.com', '9223344556'),
('Sneha Mishra', 'sneha@example.com', '9334455667'),
('Rahul Sinha', 'rahul@example.com', '9445566778'),
('Isha Jain', 'isha@example.com', '9556677889');

INSERT INTO products (product_name, category, price)
VALUES 
('Paneer Tikka', 'Starters', 4.99),
('Garlic Bread', 'Sides', 2.49),
('Cheese Burger', 'Snacks', 3.99),
('Pasta Alfredo', 'Main Course', 7.99),
('Mojito', 'Beverages', 3.49),
('Tandoori Chicken', 'Main Course', 8.99),
('Greek Salad', 'Starters', 4.49),
('Cold Coffee', 'Beverages', 3.29),
('Veg Sandwich', 'Snacks', 2.99),
('Brownie Sundae', 'Desserts', 4.49),
('Butter Chicken', 'Main Course', 9.49),
('Lemonade', 'Beverages', 2.49),
('Spring Rolls', 'Starters', 3.49),
('Onion Rings', 'Sides', 2.99),
('Mushroom Soup', 'Starters', 3.29),
('Peach Iced Tea', 'Beverages', 2.99),
('Falafel Wrap', 'Snacks', 3.99),
('Chicken Nuggets', 'Sides', 4.29),
('Chocolate Lava Cake', 'Desserts', 4.99),
('Chicken Biryani', 'Main Course', 8.49),
('Schezwan Noodles', 'Main Course', 6.99),
('Masala Dosa', 'Main Course', 3.99),
('Vanilla Milkshake', 'Beverages', 2.99),
('Veg Thali', 'Main Course', 7.49),
('Fruit Salad', 'Desserts', 3.99);


UPDATE products
SET price = CASE product_name
    WHEN 'Margherita Pizza' THEN 4.99
    WHEN 'Veg Burger' THEN 2.99
    WHEN 'French Fries' THEN 2.49
    WHEN 'Chocolate Milkshake' THEN 3.99
    WHEN 'Caesar Salad' THEN 3.49
END
WHERE product_name IN (
    'Margherita Pizza',
    'Veg Burger',
    'French Fries',
    'Chocolate Milkshake',
    'Caesar Salad'
);

-- Orders from ID 6 to 30 (assuming existing 5 orders)
INSERT INTO orders (customer_id, total_amount, status) VALUES
(11, 9.97, 'Confirmed'),
(12, 14.47, 'Delivered'),
(13, 12.48, 'Shipped'),
(14, 6.98, 'Pending'),
(15, 8.98, 'Confirmed'),
(16, 16.47, 'Delivered'),
(17, 13.97, 'Pending'),
(18, 7.48, 'Confirmed'),
(19, 10.98, 'Shipped'),
(20, 12.97, 'Delivered'),
(21, 15.96, 'Delivered'),
(22, 11.97, 'Shipped'),
(23, 8.48, 'Pending'),
(24, 10.48, 'Confirmed'),
(25, 7.48, 'Delivered'),
(11, 11.98, 'Confirmed'),
(13, 9.47, 'Shipped'),
(14, 10.98, 'Delivered'),
(15, 13.47, 'Pending'),
(17, 9.99, 'Delivered'),
(19, 12.96, 'Confirmed'),
(20, 11.97, 'Delivered'),
(21, 8.49, 'Shipped'),
(23, 7.98, 'Confirmed'),
(25, 6.49, 'Delivered');


-- Order 6
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(6, 3, 1, 2.49),
(6, 4, 1, 3.99),
(6, 5, 1, 3.49);

-- Order 7
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(7, 1, 1, 4.99),
(7, 10, 1, 4.49),
(7, 8, 1, 4.99);

-- Order 8
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(8, 6, 1, 3.49),
(8, 14, 1, 2.99);

-- Order 9
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(9, 13, 1, 3.49),
(9, 7, 1, 3.49);

-- Order 10
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(10, 17, 1, 3.99),
(10, 18, 1, 4.49);

-- Order 11
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(11, 12, 1, 2.49),
(11, 20, 1, 8.49),
(11, 28, 1, 4.99);

-- Order 12
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(12, 23, 1, 2.99),
(12, 9, 1, 2.99);

-- Order 13
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(13, 16, 1, 2.99),
(13, 24, 1, 5.49);

-- Order 14
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(14, 21, 1, 6.99),
(14, 19, 1, 3.49);

-- Order 15
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(15, 25, 1, 3.99),
(15, 2, 1, 2.99);

-- Order 16
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(16, 11, 1, 4.99),
(16, 30, 1, 6.99);

-- Order 17
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(17, 22, 1, 3.99),
(17, 26, 1, 3.99),
(17, 8, 1, 1.49);

-- Order 18
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(18, 10, 1, 4.49),
(18, 6, 1, 3.49);

-- Order 19
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(19, 1, 1, 4.99),
(19, 27, 1, 3.49),
(19, 5, 1, 4.99);

-- Order 20
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(20, 29, 1, 4.99),
(20, 30, 1, 4.99);

-- Order 21
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(21, 4, 1, 3.99),
(21, 12, 1, 2.49),
(21, 13, 1, 3.49);

-- Order 22
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(22, 17, 1, 3.99),
(22, 7, 1, 3.49),
(22, 23, 1, 2.99);

-- Order 23
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(23, 6, 1, 3.49),
(23, 14, 1, 2.99);

-- Order 24
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(24, 19, 1, 3.49),
(24, 2, 1, 2.99),
(24, 8, 1, 1.49);

-- Order 25
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(25, 15, 1, 3.49),
(25, 18, 1, 2.99);

-- Order 26
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(26, 9, 1, 2.99),
(26, 30, 1, 5.99);

-- Order 27
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(27, 21, 1, 6.99),
(27, 3, 1, 2.49);

-- Order 28
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(28, 20, 1, 8.49);

-- Order 29
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(29, 5, 1, 3.49),
(29, 6, 1, 3.49);

-- Order 30
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(30, 27, 1, 2.99),
(30, 29, 1, 3.49);


