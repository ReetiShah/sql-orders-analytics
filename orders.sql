CREATE DATABASE sales;
USE sales;

CREATE TABLE orders (
    order_id INT PRIMARY KEY UNIQUE,
    customer_name VARCHAR(100),
    category VARCHAR(100),
    price INT,
    quantity INT,
    order_date DATE
);

INSERT INTO orders (order_id,customer_name,category,price,quantity,order_date) VALUES
( 1, 'Sam', NULL , 1500, 2, '2025-10-10' ),
( 2, 'Pam', 'Mobile', 1000, 2, '2025-12-14' ),
( 3, 'Tam', 'Laptop', 2000, 1, '2026-06-18' ),     
( 4, 'Lam', 'Tablet', 1800, 1, '2024-09-22' ),              
( 5, 'Ram', 'Tablet', 5400, 3, '2025-11-26' ),        
( 6, 'Dam', 'Mobile', NULL, 1, '2026-05-29' ),
( 7, 'Nam', 'Laptop', 0, 2, '2024-03-01' ),
( 8, 'Yam', 'Earphones', 560, 5, '2025-01-17' );

SELECT * FROM orders 
ORDER BY price DESC;

SELECT COUNT(*) AS totalNoOforders
FROM orders;

SELECT COUNT(price) AS notNullValues
FROM orders;

SELECT DISTINCT category
FROM orders
WHERE category IS NOT NULL;

SELECT customer_name, price,
    CASE
        WHEN price > 500 THEN 'High'
        WHEN price BETWEEN 100 AND 500 THEN 'Medium'
        WHEN price = 0 THEN 'Zero'
        WHEN price IS NULL THEN 'Missing'
    END AS price_level
FROM orders;

SELECT 
    order_id,
    COALESCE(category, 'Unknown') AS category
FROM orders;

SELECT * FROM orders
WHERE price > 100 AND quantity >= 2;

SELECT order_id, customer_name,category, price,quantity,
    price * quantity AS revenue
FROM orders;
