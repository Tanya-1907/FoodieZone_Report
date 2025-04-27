CREATE DATABASE FoodieZoneSale;

USE FoodieZoneSale;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    join_date DATE,
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(255),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Insert customers
INSERT INTO customers (customer_id, customer_name, join_date, city) VALUES
(1, 'Amit Sharma', '2023-01-15', 'Delhi'),
(2, 'Neha Verma', '2023-03-10', 'Mumbai'),
(3, 'Rahul Singh', '2023-05-20', 'Bangalore'),
(4, 'Priya Kapoor', '2023-07-01', 'Hyderabad'),
(5, 'Vikas Gupta', '2023-08-12', 'Chennai');

-- Insert orders
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2024-01-01', 500.00),
(102, 2, '2024-01-03', 800.00),
(103, 1, '2024-02-10', 450.00),
(104, 3, '2024-03-15', 900.00),
(105, 4, '2024-03-20', 650.00),
(106, 2, '2024-04-05', 700.00);

-- Insert order items
INSERT INTO order_items (item_id, order_id, product_name, quantity, price_per_unit) VALUES
(1, 101, 'Burger', 2, 100.00),
(2, 101, 'Fries', 1, 50.00),
(3, 102, 'Pizza', 2, 300.00),
(4, 102, 'Soda', 2, 100.00),
(5, 103, 'Sandwich', 3, 150.00),
(6, 104, 'Burger', 3, 100.00),
(7, 105, 'Wrap', 2, 250.00),
(8, 106, 'Pizza', 2, 300.00),
(9, 106, 'Fries', 1, 100.00);


SELECT 
    SUM(total_amount) AS total_revenue
FROM 
    orders;

SELECT 
    c.customer_name,
    SUM(o.total_amount) AS customer_revenue
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_name
ORDER BY 
    customer_revenue DESC
LIMIT 5;

SELECT 
    c.customer_name
FROM 
    customers c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id
HAVING 
    MAX(o.order_date) IS NULL 
    OR MAX(o.order_date) < (CURRENT_DATE - INTERVAL 90 DAY);

 

SELECT 
    c.customer_name
FROM 
    customers c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id
HAVING 
    MAX(o.order_date) IS NULL 
    OR MAX(o.order_date) < (CURRENT_DATE - INTERVAL 90 DAY);

