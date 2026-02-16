
-- STEP 1: Create Database
CREATE DATABASE ecommerce_db;
USE ecommerce_db;


-- STEP 2: Create Tables


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- STEP 3: Insert Data

INSERT INTO customers VALUES
(1, 'Rahul Sharma', 'rahul@email.com', 'Mumbai'),
(2, 'Priya Verma', 'priya@email.com', 'Delhi'),
(3, 'Aman Gupta', 'aman@email.com', 'Pune'),
(4, 'Sneha Patil', 'sneha@email.com', 'Bangalore');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 60000),
(102, 'Phone', 'Electronics', 30000),
(103, 'Shoes', 'Fashion', 4000),
(104, 'Watch', 'Fashion', 8000),
(105, 'Headphones', 'Electronics', 2000);

INSERT INTO orders VALUES
(1001, 1, '2024-01-10'),
(1002, 2, '2024-01-12'),
(1003, 1, '2024-01-15'),
(1004, 3, '2024-02-01'),
(1005, 4, '2024-02-05');

INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 105, 2),
(3, 1002, 102, 1),
(4, 1003, 103, 3),
(5, 1004, 104, 1),
(6, 1005, 101, 1),
(7, 1005, 103, 2);

-- STEP 4: Data Analysis Queries

-- 1. Total Revenue
SELECT SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- 2. Revenue by Category
SELECT p.category,
       SUM(p.price * oi.quantity) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 3. Top Customers by Spending
SELECT c.name,
       SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- 4. Average Revenue Per User (ARPU)
SELECT 
SUM(p.price * oi.quantity) / COUNT(DISTINCT c.customer_id) AS ARPU
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- 5. Subquery: Customers Spending Above Average
SELECT name
FROM customers
WHERE customer_id IN (
    SELECT o.customer_id
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.customer_id
    HAVING SUM(p.price * oi.quantity) >
        (
         SELECT AVG(total_spent)
         FROM (
            SELECT SUM(p.price * oi.quantity) AS total_spent
            FROM orders o
            JOIN order_items oi ON o.order_id = oi.order_id
            JOIN products p ON oi.product_id = p.product_id
            GROUP BY o.customer_id
         ) AS temp
        )
);

-- 6. Create View
CREATE VIEW customer_revenue AS
SELECT c.name,
       SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.name;

-- 7. View Output
SELECT * FROM customer_revenue;


