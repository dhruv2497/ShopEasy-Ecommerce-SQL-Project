-- Checking first view of the data
select * from customers;
select * from order_items;
select * from orders;
select * from products;
select * from reviews;
 

Business Problems
-- Business Problem 1: Total revenue
SELECT SUM(quantity * unit_price) AS total_revenue
FROM order_items;

-- Business Problem 2: Top Selling Products
SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- Business Problem 3: Average Order Value (AOV)
SELECT 
    ROUND(SUM(oi.quantity * oi.unit_price) / COUNT(DISTINCT oi.order_id), 2) AS average_order_value
FROM order_items oi;

-- Business Problem 4: Customer Lifetime Value (CLV)
SELECT c.first_name, c.last_name, SUM(oi.quantity * oi.unit_price) AS lifetime_value
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id
ORDER BY lifetime_value DESC;

-- Business Problem 5: Customers who have not made a purchase in a while
SELECT c.first_name, c.last_name, MAX(o.order_date) AS last_order_date
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id
HAVING MAX(o.order_date) < '2024-09-08' OR MAX(o.order_date) IS NULL;

-- Business Problem 6: Most recent review for each product
SELECT p.product_name,
       r.review_text, 
       r.rating, 
       r.review_date,
       CASE 
           WHEN r.rating IN (4, 5) THEN 'Positive'
           WHEN r.rating = 3 THEN 'Neutral'
           WHEN r.rating IN (1, 2) THEN 'Negative'
           ELSE 'Unknown'
       END AS rating_label
FROM reviews r
JOIN products p ON r.product_id = p.id
WHERE r.review_date = (
    SELECT MAX(review_date)
    FROM reviews
    WHERE product_id = r.product_id
)
ORDER BY r.review_date DESC;

-- Business Problem 7: Top rated products
SELECT p.product_name, 
       AVG(r.rating)::INT AS average_rating,
       CASE 
           WHEN AVG(r.rating) >= 4 THEN 'Top Rated'
           ELSE 'Regular'
       END AS product_type
FROM products p
JOIN reviews r ON p.id = r.product_id
GROUP BY p.id;

-- Business Problem 8: Discount based on order value
SELECT oi.order_id,
       SUM(oi.quantity * oi.unit_price) AS total_order_value,
       CASE 
           WHEN SUM(oi.quantity * oi.unit_price) > 1000 THEN '20% Discount'
           WHEN SUM(oi.quantity * oi.unit_price) > 500 THEN '10% Discount'
           ELSE 'No Discount'
       END AS discount
FROM order_items oi
GROUP BY oi.order_id;

-- Business Problem 9: Product Performance by Category
SELECT 
    category, 
    COUNT(DISTINCT p.id) AS total_products, 
    SUM(oi.quantity) AS total_units_sold, 
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
GROUP BY category
ORDER BY total_revenue DESC;

-- Business Problem 10: Revenue Contribution by Customer
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    SUM(oi.quantity * oi.unit_price) AS total_revenue_contributed
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id
ORDER BY total_revenue_contributed DESC
LIMIT 10;

-- Business Problem 11: Popular Purchase Time
SELECT 
    EXTRACT(HOUR FROM o.order_date) AS hour_of_day, 
    COUNT(o.id) AS orders_placed
FROM orders o
GROUP BY hour_of_day
ORDER BY orders_placed DESC;

-- Business Problem 12: High Return Rate Products
SELECT 
    p.product_name, 
    COUNT(o.id) AS total_returns
FROM products p
JOIN orders o ON p.id = o.id
WHERE o.status = 'Cancelled'
GROUP BY p.product_name
ORDER BY total_returns DESC
LIMIT 5;

-- Business Problem 13: Customer Segmentation
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    COUNT(o.id) AS total_orders, 
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id
ORDER BY total_spent DESC;

-- Business Problem 14: Seasonal Trends in Sales
SELECT 
    TO_CHAR(o.order_date, 'Month') AS month, 
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
GROUP BY TO_CHAR(o.order_date, 'Month')
ORDER BY SUM(oi.quantity * oi.unit_price) DESC;

-- Business Problem 15: Underperforming Products
SELECT 
    p.product_name, 
    SUM(oi.quantity) AS total_units_sold, 
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.product_name
HAVING SUM(oi.quantity) < 5
ORDER BY total_revenue ASC;

-- Business Problem 16: High Revenue Orders
SELECT 
    o.id AS order_id, 
    SUM(oi.quantity * oi.unit_price) AS total_order_value
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
GROUP BY o.id
HAVING SUM(oi.quantity * oi.unit_price) > 1000
ORDER BY total_order_value DESC;

-- Business Problem 17: Product Cross-Selling Opportunities
SELECT 
    oi1.product_id AS product_a, 
    oi2.product_id AS product_b, 	
    COUNT(*) AS times_bought_together
FROM order_items oi1
JOIN order_items oi2 ON oi1.order_id = oi2.order_id AND oi1.product_id != oi2.product_id
GROUP BY product_a, product_b
ORDER BY times_bought_together DESC
LIMIT 10;
