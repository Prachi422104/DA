CREATE DATABASE online_dataaabase;
USE online_dataaabase;
CREATE TABLE orders (
    transaction_id INT PRIMARY KEY,
    order_date DATE,
    product_category VARCHAR(100),
    product_name VARCHAR(150),
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_revenue DECIMAL(10,2),
	region VARCHAR(100),
    payment_method VARCHAR(50)
);
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'online_dataaabaseorders';

SELECT * FROM orders;
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_revenue) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders
FROM orders
GROUP BY 
    YEAR(order_date),
    MONTH(order_date)
ORDER BY 
    year,
    month;
    
SELECT 
    MONTH(order_date) AS month,
    SUM(total_revenue) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders
FROM orders
WHERE YEAR(order_date) = 2023
GROUP BY 
    MONTH(order_date)
ORDER BY 
    month;
    
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_revenue) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders
FROM orders
GROUP BY 
    YEAR(order_date),
    MONTH(order_date)
ORDER BY 
    year,
    month
LIMIT 6;