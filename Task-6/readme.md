# Online Sales Data Analysis (MySQL Project)

## Project Overview

This project analyzes an Online Sales dataset using MySQL.\
The dataset contains transaction details such as product category,
revenue, region, and payment methods.

The objective of this project is to: - Import CSV data into MySQL -
Perform data cleaning - Execute analytical SQL queries - Generate
business insights

------------------------------------------------------------------------

## Dataset Columns

-   transaction_id (INT, Primary Key)
-   order_date (DATE)
-   product_category (VARCHAR)
-   product_name (VARCHAR)
-   units_sold (INT)
-   unit_price (DECIMAL)
-   total_revenue (DECIMAL)
-   region (VARCHAR)
-   payment_method (VARCHAR)

------------------------------------------------------------------------

## Tools & Technologies

-   MySQL Server 8.0
-   MySQL Workbench
-   Microsoft Excel (for CSV conversion)
-   SQL

------------------------------------------------------------------------

## Database Setup

### 1. Create Database

CREATE DATABASE sales_db; USE sales_db;

### 2. Create Table

CREATE TABLE orders ( transaction_id INT PRIMARY KEY, order_date DATE,
product_category VARCHAR(100), product_name VARCHAR(150), units_sold
INT, unit_price DECIMAL(10,2), total_revenue DECIMAL(10,2), region
VARCHAR(100), payment_method VARCHAR(50) );

### 3. Import CSV Data

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server
8.0/Uploads/sales.csv' INTO TABLE orders FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '`\r\n`{=tex}' IGNORE 1 ROWS;

------------------------------------------------------------------------

## Sample Analysis Queries

### Total Revenue

SELECT SUM(total_revenue) AS total_sales FROM orders;

### Revenue by Region

SELECT region, SUM(total_revenue) AS revenue FROM orders GROUP BY region
ORDER BY revenue DESC;

### Top 5 Selling Products

SELECT product_name, SUM(units_sold) AS total_units FROM orders GROUP BY
product_name ORDER BY total_units DESC LIMIT 5;

------------------------------------------------------------------------

## Key Insights

-   Identified top-performing regions by revenue
-   Determined best-selling products
-   Analyzed sales distribution by payment method
-   Evaluated overall business performance

------------------------------------------------------------------------

## Conclusion

This project demonstrates practical knowledge of: - Data import in
MySQL - SQL aggregations and grouping - Business data analysis -
Database management fundamentals

---------------------------------------------------------------------