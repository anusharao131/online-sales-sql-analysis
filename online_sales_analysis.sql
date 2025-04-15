
CREATE DATABASE online_sales;
USE online_sales;
####################################################################################################
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id INT
);
INSERT INTO orders (order_date, amount, product_id) VALUES

('2024-01-01', 49.99, 101),
('2024-01-02', 89.50, 102),
('2024-01-03', 120.00, 103),
('2024-01-04', 35.75, 104),
('2024-01-05', 150.00, 105),
('2024-01-06', 77.99, 101),
('2024-01-07', 63.00, 102),
('2024-01-08', 99.95, 103),
('2024-01-09', 25.50, 104),
('2024-01-10', 200.00, 105),
('2024-01-11', 45.99, 106),
('2024-01-12', 84.00, 107),
('2024-01-13', 130.00, 108),
('2024-01-14', 33.33, 109),
('2024-01-15', 98.00, 110),
('2024-01-16', 55.50, 106),
('2024-01-17', 70.00, 107),
('2024-01-18', 60.25, 108),
('2024-01-19', 40.40, 109),
('2024-01-20', 180.00, 110),
('2024-01-21', 47.50, 101),
('2024-01-22', 91.00, 102),
('2024-01-23', 110.10, 103),
('2024-01-24', 29.99, 104),
('2024-01-25', 160.00, 105),
('2024-01-26', 73.25, 106),
('2024-01-27', 88.00, 107),
('2024-01-28', 119.99, 108),
('2024-01-29', 31.00, 109),
('2024-01-30', 140.00, 110),
('2024-02-01', 49.49, 101),
('2024-02-02', 93.00, 102),
('2024-02-03', 125.00, 103),
('2024-02-04', 39.00, 104),
('2024-02-05', 155.00, 105),
('2024-02-06', 78.89, 106),
('2024-02-07', 64.20, 107),
('2024-02-08', 98.90, 108),
('2024-02-09', 27.45, 109),
('2024-02-10', 210.00, 110),
('2024-02-11', 46.75, 101),
('2024-02-12', 85.60, 102),
('2024-02-13', 134.25, 103),
('2024-02-14', 30.00, 104),
('2024-02-15', 170.00, 105),
('2024-02-16', 75.35, 106),
('2024-02-17', 95.00, 107),
('2024-02-18', 112.10, 108),
('2024-02-19', 28.50, 109),
('2024-02-20', 190.00, 110);

select * from orders;
###################################################################################################
#1. What was the total revenue per month in 2024? 

SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM orders
WHERE YEAR(order_date) = 2024
GROUP BY month
ORDER BY month;
####################################################################################################
#2.What is the total revenue on January 5th, 2024? 

SELECT 
    SUM(amount) AS total_revenue
FROM orders
WHERE order_date = '2024-01-05';
####################################################################################################
#3.How much revenue did each product generate in February 2024?

SELECT 
    product_id,
    SUM(amount) AS total_revenue
FROM orders
WHERE order_date BETWEEN '2024-02-01' AND '2024-02-29'
GROUP BY product_id
ORDER BY total_revenue DESC;
####################################################################################################
#4. Which year had the highest total revenue?

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY year
ORDER BY total_revenue DESC
LIMIT 1;
####################################################################################################
#5. What is the monthly trend of order volume in 2024? 
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
WHERE YEAR(order_date) = 2024
GROUP BY month
ORDER BY month;
####################################################################################################
#6.What was the total revenue on the last recorded date?
SELECT 
    order_date,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY order_date
ORDER BY order_date DESC
LIMIT 1;
####################################################################################################
#7. Which product had the highest total sales in January 2024?
SELECT 
    product_id,
    SUM(amount) AS total_revenue
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 1;
#####################################################################################################
#8.How many unique orders were placed per year?
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY year
ORDER BY year;
#####################################################################################################
#9. Show total revenue for February regardless of year.
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    SUM(amount) AS february_revenue
FROM orders
WHERE EXTRACT(MONTH FROM order_date) = 2
GROUP BY year
ORDER BY year;
#####################################################################################################
#10. Which exact date had the highest revenue? 
SELECT 
    order_date,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY order_date
ORDER BY total_revenue DESC
LIMIT 1;





