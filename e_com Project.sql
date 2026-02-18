-- CREATE DATABASE ecommerce_db;
-- USE ecommerce_db;
-- CREATE TABLE Customers (
--     customer_id INT PRIMARY KEY,
--     customer_name VARCHAR(50),
--     city VARCHAR(50),
--     signup_date DATE
-- );
-- CREATE TABLE Orders (
--     order_id INT PRIMARY KEY,
--     customer_id INT,
--     order_date DATE,
--     total_amount DECIMAL(10,2),
--     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
-- );
-- CREATE TABLE Products (
--     product_id INT PRIMARY KEY,
--     product_name VARCHAR(50),
--     category VARCHAR(50),
--     price DECIMAL(10,2)
-- );
-- CREATE TABLE Order_Items (
--     order_id INT,
--     product_id INT,
--     quantity INT,
--     FOREIGN KEY (order_id) REFERENCES Orders(order_id),
--     FOREIGN KEY (product_id) REFERENCES Products(product_id)
-- );
-- INSERT INTO Customers VALUES
-- (1, 'Amit Sharma', 'Delhi', '2024-01-10'),
-- (2, 'Priya Singh', 'Mumbai', '2024-02-15'),
-- (3, 'Rahul Verma', 'Delhi', '2024-03-12'),
-- (4, 'Sneha Gupta', 'Bangalore', '2024-04-20'),
-- (5, 'Arjun Mehta', 'Mumbai', '2024-05-25'),
-- (6, 'Kavya Jain', 'Chennai', '2024-06-10');
-- INSERT INTO Products VALUES
-- (101, 'Laptop', 'Electronics', 50000),
-- (102, 'Smartphone', 'Electronics', 20000),
-- (103, 'Shoes', 'Fashion', 3000),
-- (104, 'Watch', 'Fashion', 5000),
-- (105, 'Headphones', 'Electronics', 2500);
-- INSERT INTO Orders VALUES
-- (1001, 1, '2024-07-01', 50000),
-- (1002, 2, '2024-07-05', 23000),
-- (1003, 1, '2024-07-10', 2500),
-- (1004, 3, '2024-07-12', 3000),
-- (1005, 4, '2024-07-15', 5000),
-- (1006, 5, '2024-07-18', 20000);
-- INSERT INTO Order_Items VALUES
-- (1001, 101, 1),
-- (1002, 102, 1),
-- (1002, 103, 1),
-- (1003, 105, 1),
-- (1004, 103, 1),
-- (1005, 104, 1),
-- (1006, 102, 1);



-- Total Revenue
-- SELECT SUM(total_amount) AS total_revenue
-- FROM Orders;

-- City-wise Revenue
-- SELECT c.city,
--        SUM(o.total_amount) AS city_revenue
-- FROM Customers c
-- JOIN Orders o ON c.customer_id = o.customer_id
-- GROUP BY c.city
-- ORDER BY city_revenue DESC;

-- Category-wise Revenue

-- SELECT p.category,
--        SUM(p.price * oi.quantity) AS category_revenue
-- FROM Products p
-- JOIN Order_Items oi ON p.product_id = oi.product_id
-- GROUP BY p.category
-- ORDER BY category_revenue DESC;

-- Top 3 Customers (Window Function)

-- SELECT *
-- FROM (
--     SELECT c.customer_name,
--            SUM(o.total_amount) AS total_spending,
--            RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS rank_position
--     FROM Customers c
--     JOIN Orders o ON c.customer_id = o.customer_id
--     GROUP BY c.customer_name
-- ) ranked
-- WHERE rank_position <= 3;

-- Customers Who Never Ordered (LEFT JOIN)

-- SELECT c.customer_name
-- FROM Customers c
-- LEFT JOIN Orders o
-- ON c.customer_id = o.customer_id
-- WHERE o.order_id IS NULL;

-- Second Highest Spending Customer

-- SELECT *
-- FROM (
--     SELECT c.customer_name,
--            SUM(o.total_amount) AS total_spending,
--            DENSE_RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS rnk
--     FROM Customers c
--     JOIN Orders o ON c.customer_id = o.customer_id
--     GROUP BY c.customer_name
-- ) t
-- WHERE rnk = 2;









