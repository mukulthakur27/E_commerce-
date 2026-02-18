# 🛒 E-Commerce SQL Data Analysis Project

## 📌 Project Overview

This project is a SQL-based E-commerce Data Analysis system built to demonstrate practical database design and business analysis skills using SQL.

The project simulates a real-world E-commerce business scenario where we analyze:

- Revenue performance
- Customer spending behavior
- City-wise revenue distribution
- Category-wise sales
- Top customers ranking

This project is ideal for aspiring Data Analysts and students preparing for SQL interviews.

---

# 🗄️ Database Setup

## Step 1: Create Database

```sql
CREATE DATABASE ecommerce_db;
USE ecommerce_db;
```

---

# 🧱 Database Schema

## 1️⃣ Customers Table

```sql
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    signup_date DATE
);
```

---

## 2️⃣ Orders Table

```sql
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
```

---

## 3️⃣ Products Table

```sql
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
```

---

## 4️⃣ Order_Items Table

```sql
CREATE TABLE Order_Items (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
```

---

# 📥 Sample Data Inserted

### Customers

```sql
INSERT INTO Customers VALUES
(1, 'Amit Sharma', 'Delhi', '2024-01-10'),
(2, 'Priya Singh', 'Mumbai', '2024-02-15'),
(3, 'Rahul Verma', 'Delhi', '2024-03-12'),
(4, 'Sneha Gupta', 'Bangalore', '2024-04-20'),
(5, 'Arjun Mehta', 'Mumbai', '2024-05-25'),
(6, 'Kavya Jain', 'Chennai', '2024-06-10');
```

### Products

```sql
INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 50000),
(102, 'Smartphone', 'Electronics', 20000),
(103, 'Shoes', 'Fashion', 3000),
(104, 'Watch', 'Fashion', 5000),
(105, 'Headphones', 'Electronics', 2500);
```

### Orders

```sql
INSERT INTO Orders VALUES
(1001, 1, '2024-07-01', 50000),
(1002, 2, '2024-07-05', 23000),
(1003, 1, '2024-07-10', 2500),
(1004, 3, '2024-07-12', 3000),
(1005, 4, '2024-07-15', 5000),
(1006, 5, '2024-07-18', 20000);
```

### Order Items

```sql
INSERT INTO Order_Items VALUES
(1001, 101, 1),
(1002, 102, 1),
(1002, 103, 1),
(1003, 105, 1),
(1004, 103, 1),
(1005, 104, 1),
(1006, 102, 1);
```

---

# 📊 Business Analysis Queries

---

## 1️⃣ Total Revenue

```sql
SELECT SUM(total_amount) AS total_revenue
FROM Orders;
```

✔ Calculates overall revenue generated.

---

## 2️⃣ City-wise Revenue

```sql
SELECT c.city,
       SUM(o.total_amount) AS city_revenue
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY city_revenue DESC;
```

✔ Shows revenue generated from each city.

---

## 3️⃣ Category-wise Revenue

```sql
SELECT p.category,
       SUM(p.price * oi.quantity) AS category_revenue
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;
```

✔ Revenue distribution by product category.

---

## 4️⃣ Top 3 Customers (Using Window Function)

```sql
SELECT *
FROM (
    SELECT c.customer_name,
           SUM(o.total_amount) AS total_spending,
           RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS rank_position
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_name
) ranked
WHERE rank_position <= 3;
```

✔ Identifies highest spending customers.

---

## 5️⃣ Customers Who Never Ordered (LEFT JOIN)

```sql
SELECT c.customer_name
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

✔ Finds inactive customers.

---

## 6️⃣ Second Highest Spending Customer

```sql
SELECT *
FROM (
    SELECT c.customer_name,
           SUM(o.total_amount) AS total_spending,
           DENSE_RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS rnk
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_name
) t
WHERE rnk = 2;
```

✔ Identifies second highest spender.

---

# 🧠 SQL Concepts Used

- Database Creation
- Table Relationships
- Primary Key & Foreign Key
- INNER JOIN
- LEFT JOIN
- GROUP BY
- ORDER BY
- Aggregate Functions (SUM)
- Subqueries
- Window Functions (RANK, DENSE_RANK)

---

# 🎯 Skills Demonstrated

- Business Revenue Analysis
- Customer Segmentation
- SQL Query Writing
- Relational Database Design
- Data Aggregation
- Analytical Thinking

---

# 🚀 How to Use

1. Install MySQL / SQL Server
2. Run database creation query
3. Create tables
4. Insert sample data
5. Execute analysis queries
6. Modify queries for practice

---

# 📈 Future Enhancements

- Monthly Revenue Trend Analysis
- Index Optimization
- Stored Procedures
- Power BI Dashboard Integration
- Python + SQL Integration

---

# 👨‍💻 Author

**Mukul Singh**  
BCA Student | Aspiring Data Analyst  
Skilled in SQL, Excel & Data Analytics  

---

⭐ If you found this project useful, consider giving it a star!
