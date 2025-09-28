## Names:UMUTONI Uwase Sonia
## ID: 28352
## DEPARTMENT: Software Engineering
## COURSES: DATABASE DEVELOPMENT WITH PL/SQL(INSY 8311)
## INSTRUCTOR: Eric MANIRAGUHA
## DATE:28/09/2025
## PROJECT TOPIC:PL/SQL(WINDOW FUNCTIONS MASTERY PROJECT)

# Coffee Shop Sales Management -- Window Functions Analysis

## Step 1: Problem Definition

### Business Context

-   **Company**: Daily Brew Coffee Shop -- A single-location café in
    Kigali\
-   **Department**: Sales & Operations Team\
-   **Industry**: Food & Beverage -- Coffee Retail

### Data Challenge

Daily Brew wants to analyze its daily sales to find out which products
are most popular, which customers spend the most, and which staff handle
the most transactions. The management also wants to track revenue growth
over time and create customer loyalty segments.

### Expected Outcome

Build a small database system to identify best-selling products,
top-spending customers, staff performance, and sales growth trends using
SQL window functions.

------------------------------------------------------------------------

## Step 2: Success Criteria (5 Measurable Goals)

1.  **Top Products by Sales** → `RANK()`\
2.  **Running Sales Totals by Date** → `SUM() OVER()`\
3.  **Month-to-Month Growth** → `LAG()`\
4.  **Customer Segmentation** → `NTILE(4)`\
5.  **3-Day Moving Average** → `AVG() OVER()`

------------------------------------------------------------------------

## Step 3: Database Schema & Sample Data

### Tables

 sql 
## create customer table with columns (customer_id ,name,phone and email)
![ALT TEXT](./Images/create%20customer%20table.png)
Defines a table to store customer details such as ID, name, phone, and email.

## create product table(product_id,product name ,category and price)
![alt text](./Images/create%20product%20table.png)
Defines a table to store product information including ID, name, category, and price.


## create staff table with columns(staff_id,names,and roles)
 ![alt text](./Images/create%20staff%20table.png)
 
 Defines a table to store staff details like ID, name, and role.

## create  sales table with column (sales_id,cuctomer_id,product_id,staff_id,sales_date,quantity number,and total_amount number)
  ![alt text](./Images/create%20sales%20table.png)

  Defines a table to record transactions, linking customers, products, staff, date, quantity, and total amount.


## Inserted Data

sql
## insert data into customer table(id,first name ,last name,phone,email)
![alt text](./Images/insertion%20customer%20table.png)

Adds customer details like name, phone, and email into the customers table.

## insert   data into product table(id ,product name,category,price)
![alt text](./Images/insertion%20product%20table.png)

Adds product details such as name, category, and price into the products table.

## insert data into staff table(staff_id,name,and role)
![alt text](./Images/insertion%20staff%20table.png)

Adds staff information including name and role into the staff table.

## insert data into sales table(sales_id,customer_id, product_id,staff_id,sale_date,quantity,total_ amount number)
![alt text](./Images/create%20sales%20table.png)

Records each transaction, linking customers, products, staff, and total amount into the sales table.


------------------------------------------------------------------------

## Step 4: Window Functions Implementation

### Query 1: Rank Products by Total Sales

 sql
![alt text](./Images/rank%20product%20by%20total%20sales.png)

This query ranks products by total sales revenue, assigning the highest-selling product a rank of 1.
 


### Query 2: Rank Customers by Spending

sql
![alt text](./Images/rank%20customer%20by%20spending.png)

This query ranks customers by their total spending, giving equal ranks to those with the same amount spent.

### Query 3: Ranking staff by sale handled

 sql
![alt text](./Images/rank%20staff%20by%20sales%20handled.png)

This query calculates daily sales and a running total of sales over time.

### Query 4: Month-to-Month Growth (using LAG)

 sql
![alt text](./Images/month%20to%20%20Month%20grow%20using%20LAG.png)

This query calculates monthly sales, compares them with the previous month, and shows the percentage growth.

other used term explanation:
LAG → Retrieves the value from the previous row in the result set for comparison.

LEAD → Retrieves the value from the next row in the result set for comparison.

CASE → Provides conditional logic in SQL, similar to IF-THEN-ELSE.

ORDER BY → Sorts the query results in ascending or descending order based on specified columns.


### Query 5: Customer Segmentation (Quartiles)

 sql
![alt text](./Images/segmentation(quartiles).png)

This query ranks customers into four quartiles based on their total spending, helping identify top spenders and low spenders for targeted strategies.

## query 6: select all customers
![alt text](./Images/view%20all%20customers.png) 

This query retrieves and displays all customer records from the customers table.
## query 7: select all products
![atl text](Images/view%20all%20products.png)

This query retrieves and display all product record from product table.
## querry 8: select all staff
![alt text](./Images/view%20all%20staff.png) 

This query retrieves and display all staff record from staff table.
## query 9: select all sales
![alt text](./Images/view%20all%20sales.png) 

This query retrieves and display all sales record from sales table.
## query 10:inner join
![alt text](./Images/inner%20join.png)Returns only the matching rows that exist in both tables.
## querry 11: right join
![alt text](./Images/right%20join.png)
Returns all rows from the right table and matching rows from the left table (NULL if no match).
## querry 12: lefft join
![alt text](./Images/lefft%20join.png)Returns all rows from the left table and matching rows from the right table (NULL if no match).
## query 13:error
! [alt text](./Images/error.png)A mistake in SQL code (like wrong keywords, missing commas, or unmatched columns) that prevents execution.
## query 14 :fixed error
![alt text](./Images/fixed%20error.png)The corrected SQL code after identifying and resolving the mistake (e.g., changing LECT to SELECT).
## query 15: grouped by
![alt text](./Images/grouped%20by.png)

The GROUP BY clause groups rows with the same values in specified columns so aggregate functions (like SUM, COUNT, AVG) can be applied to each group.
## ER Diagram
![alt text](./Images/ER%20Diagram.png)

A visual representation of tables, their attributes, and relationships using primary and foreign keys.

------------------------------------------------------------------------
## Step 5: GitHub Repository
 - `Done`
## Step 6: Results Analysis

-   **Descriptive**: Alice Johnson spent the most; Espresso and
    Croissants are the top sellers.

-   **Diagnostic**: Sales peak on weekends; repeat customers drive most
    revenue.

-   **Prescriptive**: Create loyalty discounts for frequent buyers and
    bundle espresso with pastries.

------------------------------------------------------------------------

## Step 7: References  

1. [Oracle Docs – Analytic Functions](https://docs.oracle.com/cd/B28359_01/server.111/b28286/functions004.htm)  
2. [GeeksforGeeks – SQL Window Functions](https://www.geeksforgeeks.org/sql-window-functions/)  
3. [Food & Wine – Kigali’s Coffee Culture](https://www.foodandwine.com/global-tastemakers-plus-one-best-international-cities-for-coffee-2024-8620149)  
4. [Mode Analytics – SQL Window Functions Tutorial](https://mode.com/sql-tutorial/sql-window-functions/)  
5. [Oracletutorial – Oracle Analytic Functions](https://www.oracletutorial.com/oracle-analytic-functions/)  
6. [DBVis – Beginner’s Guide to SQL Window Functions](https://www.dbvis.com/thetable/a-beginners-guide-to-sql-window-functions/)  
7. [World Coffee Research – Rwanda Country Profile](https://worldcoffeeresearch.org/countries/rwanda)  
8. [Starbucks Stories – Coffee Lessons from Rwanda](https://stories.starbucks.com/emea/stories/2025/journey-to-origin-coffee-lessons-from-rwanda/)  
9. [Financial Times – Coffee Futures Market](https://www.ft.com/content/02ed448b-7205-40c9-b4fd-2e56b8b1e4db)  
10. [W3Schools – SQL Window Functions](https://www.w3schools.com/sql/sql_window_functions.asp)  
11. [TutorialsPoint – SQL Analytic Functions](https://www.tutorialspoint.com/sql/sql-analytic-functions.htm)  
12. [CEVA Logistics – Rwanda Coffee Exports](https://www.cevalogistics.com/en/news-and-media/newsroom/navigating-rwanda-coffee-exports)  

