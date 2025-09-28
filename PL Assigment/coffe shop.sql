--creating tables
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    phone VARCHAR2(20),
    email VARCHAR2(50)
);
CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(50),
    category VARCHAR2(30),
    price NUMBER(6,2)
);
CREATE TABLE staff (
    staff_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    role VARCHAR2(30)
);
CREATE TABLE sales (
    sale_id NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    product_id NUMBER REFERENCES products(product_id),
    staff_id NUMBER REFERENCES staff(staff_id),
    sale_date DATE,
    quantity NUMBER,
    total_amount NUMBER(8,2)
);
--insertion of data
- Customers
INSERT INTO customers VALUES (1, 'Alice Johnson', '0788001122', 'alice@email.com');
INSERT INTO customers VALUES (2, 'Brian Smith', '0788112233', 'brian@email.com');
INSERT INTO customers VALUES (3, 'Clara Mutesi', '0788223344', 'clara@email.com');

-- Products
INSERT INTO products VALUES (101, 'Espresso', 'Beverage', 2.50);
INSERT INTO products VALUES (102, 'Cappuccino', 'Beverage', 3.50);
INSERT INTO products VALUES (103, 'Croissant', 'Snack', 1.80);
INSERT INTO products VALUES (104, 'Muffin', 'Snack', 2.00);

-- Staff
INSERT INTO staff VALUES (201, 'David Kamanzi', 'Barista');
INSERT INTO staff VALUES (202, 'Emma Uwase', 'Cashier');

-- Sales
INSERT INTO sales VALUES (1001, 1, 101, 201, TO_DATE('2025-09-25','YYYY-MM-DD'), 2, 5.00);
INSERT INTO sales VALUES (1002, 2, 102, 202, TO_DATE('2025-09-26','YYYY-MM-DD'), 1, 3.50);
INSERT INTO sales VALUES (1003, 3, 103, 201, TO_DATE('2025-09-26','YYYY-MM-DD'), 3, 5.40);
INSERT INTO sales VALUES (1004, 1, 104, 202, TO_DATE('2025-09-27','YYYY-MM-DD'), 2, 4.00);

--Get all customers and their purchases

SELECT c.name, p.product_name, s.quantity, s.total_amount
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id;

--Find total sales per product

SELECT p.product_name, SUM(s.total_amount) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;

--Find best-selling product

SELECT p.product_name, SUM(s.quantity) AS total_qty
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_qty DESC;

--Check staff performance (sales handled)

SELECT st.name, COUNT(s.sale_id) AS total_transactions, SUM(s.total_amount) AS total_sales
FROM sales s
JOIN staff st ON s.staff_id = st.staff_id
GROUP BY st.name;

--Rank Products by Total Sales (Revenue)
SELECT 
    p.product_name,
    SUM(s.total_amount) AS total_sales,
    RANK() OVER (ORDER BY SUM(s.total_amount) DESC) AS sales_rank
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;

--Rank Customers by Spending
SELECT 
    c.name AS customer_name,
    SUM(s.total_amount) AS total_spent,
    DENSE_RANK() OVER (ORDER BY SUM(s.total_amount) DESC) AS customer_rank
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.name;

--Rank Staff by Sales Handled
SELECT 
    st.name AS staff_name,
    SUM(s.total_amount) AS total_sales,
    ROW_NUMBER() OVER (ORDER BY SUM(s.total_amount) DESC) AS staff_rank
FROM sales s
JOIN staff st ON s.staff_id = st.staff_id
GROUP BY st.name;

--View All Customers
SELECT * FROM customers;

--View All Products
SELECT * FROM products;

--View All Staff
SELECT * FROM staff;

--View All Sales
SELECT * FROM sales;











select * from sale;
select * from sales;

--INNER JOIN – Sales with Customers and Products
SELECT 
    s.sale_id,
    c.name AS customer_name,
    p.product_name,
    s.quantity,
    s.total_amount
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN products p ON s.product_id = p.product_id;

--LEFT JOIN – All Customers and Their Purchases
SELECT 
    c.name AS customer_name,
    s.sale_id,
    p.product_name,
    s.total_amount
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
LEFT JOIN products p ON s.product_id = p.product_id;


--RIGHT JOIN – All Products and Sales Records
SELECT 
    p.product_name,
    s.sale_id,
    c.name AS customer_name,
    s.total_amount
FROM sales s
RIGHT JOIN products p ON s.product_id = p.product_id
RIGHT JOIN customers c ON s.customer_id = c.customer_id;

--GROUP BY – Total Sales per Product
SELECT 
    p.product_name,
    SUM(s.total_amount) AS total_sales,
    COUNT(s.sale_id) AS transactions
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

SELECT 
    TO_CHAR(sale_date, 'YYYY-MM') AS month,
    SUM(total_amount) AS monthly_sales,
    LAG(SUM(total_amount), 1) OVER (ORDER BY TO_CHAR(sale_date, 'YYYY-MM')) AS prev_month,
    ROUND(((SUM(total_amount) - 
           LAG(SUM(total_amount), 1) OVER (ORDER BY TO_CHAR(sale_date, 'YYYY-MM'))) * 100 / 
           NULLIF(LAG(SUM(total_amount), 1) OVER (ORDER BY TO_CHAR(sale_date, 'YYYY-MM')), 0)), 2) AS growth_pct
FROM sales
GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
ORDER BY month;

SELECT 
    c.name AS customer_name,
    SUM(s.total_amount) AS total_spent,
    NTILE(4) OVER (ORDER BY SUM(s.total_amount) DESC) AS spending_quartile
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.name;


