-- Insert data into customers table
INSERT INTO customers (first_name, last_name, email)
VALUES
    ('Emily', 'Davis', 'emily.davis@example.com'),
    ('Jin', 'Lee', 'jin.lee@example.com'),
    ('Raj', 'Sharma', 'raj.sharma@example.com'),
    ('Fatima', 'Al-Hassan', 'fatima.alhassan@example.com'),
    ('Luis', 'Martinez', 'luis.martinez@example.com'),
    ('Amara', 'Ndiaye', 'amara.ndiaye@example.com'),
    ('Yuki', 'Tanaka', 'yuki.tanaka@example.com'),
    ('Ivan', 'Petrov', 'ivan.petrov@example.com'),
    ('Zara', 'Khan', 'zara.khan@example.com'),
    ('Carlos', 'Silva', 'carlos.silva@example.com');

-- Insert data into orders table
INSERT INTO orders (customer_id, order_date, status)
VALUES
    (1, '2024-09-01 10:00:00', 'Delivered'),
    (2, '2024-09-02 12:30:00', 'Shipped'),
    (3, '2024-09-03 14:15:00', 'Pending'),
    (1, '2024-09-05 16:00:00', 'Delivered'),
    (4, '2024-09-06 10:30:00', 'Cancelled'),
    (5, '2024-09-07 18:00:00', 'Shipped'),
    (6, '2024-09-08 09:45:00', 'Delivered'),
    (7, '2024-09-10 11:30:00', 'Shipped'),
    (8, '2024-09-12 13:00:00', 'Pending'),
    (9, '2024-09-14 15:00:00', 'Shipped'),
    (2, '2024-09-16 17:00:00', 'Shipped');

-- Insert data into products table
INSERT INTO products (product_name, category, price)
VALUES 
    ('Laptop', 'Electronics', 1200.00),
    ('Smartphone', 'Electronics', 800.00),
    ('Headphones', 'Electronics', 150.00),
    ('T-Shirt', 'Clothing', 20.00),
    ('Jeans', 'Clothing', 45.00),
    ('Blender', 'Appliances', 60.00),
    ('Toaster', 'Appliances', 30.00),
    ('Cookware Set', 'Appliances', 100.00),
    ('Sneakers', 'Footwear', 75.00),
    ('Gaming Console', 'Electronics', 300.00);

-- Insert data into order_items table
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
    (1, 1, 1, 1200.00),
    (1, 2, 2, 800.00),
    (2, 3, 1, 150.00),
    (3, 4, 3, 20.00),
    (4, 5, 2, 45.00),
    (5, 6, 1, 60.00),
    (6, 7, 1, 30.00),
    (7, 8, 1, 100.00),
    (8, 9, 2, 75.00),
    (9, 10, 1, 300.00),
    (10, 1, 1, 1200.00),
    (11, 2, 1, 800.00);

-- Insert data into reviews table
INSERT INTO reviews (product_id, customer_id, review_text, rating, review_date)
VALUES
    (1, 1, 'Great laptop! Worth every penny.', 5, '2024-09-01 11:00:00'),
    (2, 1, 'The smartphone is good but could be faster.', 4, '2024-09-01 11:15:00'),
    (3, 2, 'Headphones are decent for the price.', 3, '2024-09-02 13:00:00'),
    (4, 3, 'T-shirt material is soft and comfortable.', 4, '2024-09-03 15:30:00'),
    (5, 4, 'Jeans fit well and are of good quality.', 4, '2024-09-06 17:00:00'),
    (6, 5, 'Blender works fine for smoothies, easy to use.', 4, '2024-09-07 18:30:00'),
    (7, 6, 'Toaster is a bit slow but works fine.', 3, '2024-09-08 10:00:00'),
    (8, 7, 'Cookware set is of good quality and perfect for my kitchen.', 5, '2024-09-10 12:00:00'),
    (9, 8, 'Sneakers are comfortable and stylish.', 5, '2024-09-12 13:30:00'),
    (10, 9, 'Gaming console is amazing, totally worth the buy.', 5, '2024-09-14 14:30:00'),
    (1, 10, 'Laptop is very fast and sleek. Totally recommend.', 5, '2024-09-15 16:00:00'),
    (2, 2, 'Smartphone works great, but camera could be better.', 4, '2024-09-16 17:30:00');
