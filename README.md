# 🛒 E-Commerce SQL Data Analysis Project

## 📌 Project Overview
This project is a complete SQL-based E-commerce Data Analysis system designed to practice and demonstrate core SQL concepts required for a Data Analyst role.

The project includes database creation, table relationships, joins, aggregations, subqueries, window functions, and business problem-solving queries.

This project is ideal for beginners and aspiring Data Analysts who want hands-on SQL practice using a real-world business scenario.

---

## 🎯 Objectives
- Design a relational database for an E-commerce system
- Practice SQL queries from basic to advanced level
- Perform business-driven data analysis
- Understand relationships using Primary Key & Foreign Key
- Use JOIN, GROUP BY, HAVING, Subqueries, Window Functions

---

## 🗂️ Database Schema

### 1️⃣ Customers Table
- customer_id (Primary Key)
- customer_name
- city
- signup_date

### 2️⃣ Orders Table
- order_id (Primary Key)
- customer_id (Foreign Key)
- order_date
- total_amount

### 3️⃣ Products Table
- product_id (Primary Key)
- product_name
- category
- price

### 4️⃣ Order_Details Table
- order_detail_id (Primary Key)
- order_id (Foreign Key)
- product_id (Foreign Key)
- quantity

---

## 🛠️ SQL Concepts Covered

✔ CREATE DATABASE  
✔ CREATE TABLE  
✔ INSERT INTO  
✔ SELECT  
✔ WHERE  
✔ GROUP BY  
✔ HAVING  
✔ ORDER BY  
✔ LIMIT / TOP  
✔ INNER JOIN  
✔ LEFT JOIN  
✔ Aggregate Functions (SUM, COUNT, AVG)  
✔ Subqueries  
✔ DISTINCT  
✔ Window Functions (RANK)  
✔ CTE (Common Table Expression)  

---

## 📊 Business Problems Solved

1️⃣ Total spending by each customer  
2️⃣ City-wise total revenue  
3️⃣ Category-wise total revenue  
4️⃣ Top 3 customers by spending  
5️⃣ Highest revenue generating product  
6️⃣ Customers who never placed any order  
7️⃣ Monthly revenue analysis  
8️⃣ Second highest revenue product  

---

## 💻 Sample Query Example

```sql
SELECT c.customer_name, SUM(o.total_amount) AS total_spending
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spending DESC;
