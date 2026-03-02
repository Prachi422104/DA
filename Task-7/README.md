# Task 7 – Basic Sales Summary using SQLite and Python

##  Objective
The objective of this task is to use SQL inside Python to extract basic sales information such as total quantity sold and total revenue, and visualize the results using a simple bar chart.

---

##  Tools Used
- Python
- SQLite (sqlite3 module – built into Python)
- Pandas
- Matplotlib
- Jupyter Notebook

---

##  Project Files
- Task7_Sales.ipynb – Jupyter Notebook containing the full implementation
- sales_data.db – SQLite database file created using Python
- sales_chart.png – Bar chart showing revenue by product
- README.md – Project documentation

---

##  Database Details
A SQLite database file named `sales_data.db` was created using Python.

A table named `sales` was created with the following structure:

- id (Primary Key)
- product (Text)
- quantity (Integer)
- price (Real)

Sample sales data was inserted into this table.

---

## SQL Query Used

```sql
SELECT product,
       SUM(quantity) AS total_qty,
       SUM(quantity * price) AS revenue
FROM sales
GROUP BY product;
