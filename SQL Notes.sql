/*[Helpful Note] Relational Databases are databases that contains tables
that are related to one another. Here is an interesting question:
Why shouldn't we store data in multiple locations? For example,
putting a student's name in a table called 'student personal info' and a table
called 'student grad list'?
Answer: because data is subject to change. If their name changes, you would have to 
change it on all the tables it's stored in. This is very redundant.*/

/*TABLE OF CONTENTS-----------------------------------------------------------------------------
1. SELECT Clause
2. WHERE Clause
3. AND, OR, and NOT Operators
4. IN Operator
5. BETWEEN Operator
6. LIKE Operator
7. REGEXP Operator
8. IS NULL Operator
9. ORDER BY Clause
10. LIMIT Clause
11. Inner Joins
12. Joining Across Databases
13. Self Joins **Reviewed** 10/14
14. Joining Multiple Tables
15. Compound Join Conditions
16. Implicit Join Syntax **Reviewed** 10/14
17. Outer Joins
18. Outer Join Between Multiple Tables
19. Self Outer Joins **Reviewed** 10/14
20. USING Clause
21. Natural Joins (not recommended to use)
22. Cross Joins **Reviewed** 10/14
23. UNIONs
24. Column Attributes
25. Inserting a Single Row
26. Inserting Multiple Rows
27. Inserting Hierarchical Rows 
28. Creating a Copy of a Table
29. Updating a Single Row
30. Updating Multiple Rows 
31. Using Subqueries in Updates
32. Deleting Rows
33. Aggregate Functions **REVISED**
34. GROUP BY Clause
35. HAVING Clause
36. WITH ROLLUP Operator
37. Subqueries
38. IN Operator
39. Subqueries vs Joins
40. All Keyword ***needs review  <-checked 9/24
41. ANY Keyword ***needs review  <-checked 9/24
42. Correlated Subqueries ********************
43. EXISTS Operator ***needs review <-checked 9/24 (medium)
44. Subqueries in the SELECT Clause ********************
45. Subqueries in the FROM Clause ********************
46. Numeric Functions
47. String Functions
48. Date Functions in MySQL
49. Formatting Dates and Times
50. Calculating Dates and Times
51. IFNULL and COALESCE Functions **needs review <-checked 9/24
52. IF Functions **needs review <-checked 9/24
53. CASE Operator **needs review <-checked 9/24
54. Creating Views
55. Altering or Droping Views
56. Updatable Views
57. The WITH OPTION CHECK Clause
58. Other Benefits of Views
59. What are Stored Procedures
60. Creating a Stored Procedure
61. Creating Procedures Using MySQL Workbench
62. Dropping Stored Procedures
63. Parameters
64. Parameters with Default Value
65. Parameter Validation
66. Output Parameters
67. Variables
68. Functions
69. Other Conventions
70. Triggers
71. Viewing Triggers
72. Dropping Triggers **
73. Using Triggers for Auditing
74. Events
75. Viewing, Dropping, and Altering Events
76. Transactions
77. Creating Transactions
78. Concurrency and Locking
79. Transaction Isolation Levels
80. READ UNCOMMITED Isolation Level
81. READ COMMITED Isolation Level
82. REPEATABLE READ Isolation Level
83. SERIALIZABLE Isolation Level
84. Deadlocks
85. String Types
86. Integer Types
87. Fixed-point and Floating-point Types
88. Boolean Types
89. Enum and Set Types
90. Date and Time Types
91. Blob Types
92. JSON Type
93. Data Modeling
94. Conceptual Models
95. Logical Models
96. Physical Models
97. Primary Keys
98. Foreign Keys
99. Foreign Key Constraints
100. Normalization
101. 1NF-First Normal Form
102. Link Tables
103. 2NF-Second Normal Form
104. 3NF-Third Normal Form
105. My Pragmatic Advice
106. Don't Model the Universe
107. Forward Engineering a Model
108. Synchronizing a Model with a Database
109. Reverse Engineering a Database
110. Creating and Dropping Databases
111. Creating Tables
112. Altering Tables
113. Creating Relationships
114. Altering Primary and Foreign Key Constraints**
115. Character Sets and Collations
116. Storage Engines
117. Indexes
118. Creating Indexes
119. Viewing Indexes
120. Prefix Indexes
121. Full-text Indexes
122. Composite Indexes
123. Order of Columns in Composite Indexes
124. When Indexes are Ignored
125. Using Indexes for Sorting
126. Covering Indexes
127. Index Maintenance
128. Performance Best Practices
129. Creating a User
130. Viewing Users
131. Dropping Users
132. Changing Passwords
133. Granting Privileges
134. Viewing Privileges
135. Revoking Privileges

/*1. SELECT Clause----------------------------------------------------------------------*/
-- used for querying tables
-- you can also use DISTINCT after SELECT in order to return "distinct" values

/*2. WHERE Clause-----------------------------------------------------------------------*/
-- used to define the conditions you want to apply to a query

/*3. AND, OR, and NOT Operators---------------------------------------------------------*/
-- These are all logical operators that you would usually use after a WHERE clause

/*4. IN Operator------------------------------------------------------------------------*/
-- Let's say we want to find customers who live in either VA, GA, or FL.
SELECT * FROM customers WHERE state IN ('VA', 'FL', 'GA');

/*5. BETWEEN Operator-------------------------------------------------------------------*/
-- this operator is pretty self-explanatory, it is used after a WHERE clause for
-- find things between specified values

/*6. LIKE Operator----------------------------------------------------------------------*/
-- % any number of characters
-- _ single character

/* Let's say we want to get customers who's last name starts with b*/
SELECT * FROM customers
WHERE last_name LIKE 'b%';
/*The % sign represents any number of characters after b*/

/*Let's say we want to get a customer who's last name end with y*/
SELECT * FROM customers
WHERE last_name LIKE '%y';

/*What about fetching customers who's last name is exactly 6 characters and ends with a y?*/
SELECT * FROM customers
WHERE last_name LIKE '_____y';

-- We can also search for certain strings by using..
SELECT * FROM customers WHERE last_name lIKE '%field%';

/*7. REGEXP Operator--------------------------------------------------------------------*/
-- This operator can be also be used to search strings
SELECT * FROM customers WHERE last_name REGEXP 'field';
-- Find customers where their last name ends with 'field' I do ...
-- Find customers where their last name begins with 'field' you put '^' in front of the string
SELECT * FROM customers WHERE last_name REGEXP 'field$';
-- Find customers who may have the words 'field' or 'mac' or 'rose' in their last name
SELECT * FROM customers WHERE last_name REGEXP 'field|mac|rose';
-- Find customers where they have 'ge' or 'ie' or 'me' in their last name
-- You can also use a range of characters by doing [a-h]
SELECT * FROM customers WHERE last_name REGEXP '[gim]e';
/*RECAP for operators
^ beginning
$ end
| Logical or
[abcd]

/*8. IS NULL Operator--------------------------------------------------------------------*/
-- How to look for records with missing attributes/values?
-- How can we find customers whose phone number data is missing from our table?
SELECT * FROM customers WHERE phone IS NULL;
-- How can we find customers where we do have their phone number data?
SELECT * FROM customers WHERE phone IS NOT NULL;

/*9. ORDER BY Operator------------------------------------------------------------------------*/
-- Let's explain why customer_id is the default sort column
-- customer_id is a primary key, which means it uniquely identifies the records in that table
-- In relational databases, every table should have a primary key
-- I want all customer data sorted by first name in ascending order
SELECT * FROM customers ORDER BY first_name;
-- what about descending order?
SELECT * FROM customers ORDER BY first_name DESC;
-- We can also sort our data by multiple columns
-- I want to sort customer's first by state and then by first name in ascending order
SELECT * FROM customers ORDER BY state, first_name;
-- You can also put DESC anywhere if you want to sort the values in descending order
SELECT * FROM customers ORDER BY state DESC, first_name DESC;
/*IMPORTANT INFORMATION: One of the differences between
MYSQL and other database management systems is that you can sort data
using any columns, whether or not, that column is in the select clause*/
-- Example: We can select first name and last name data using birth_date column to sort
SELECT first_name, last_name FROM customers ORDER BY birth_date;
-- You can even sort data using an alias column
SELECT first_name, last_name, 10 AS '10' FROM customers ORDER BY '10';
-- Here is an interesting approach, however, not recommended
-- but anyways, you can select also use numbers to represent columns
-- that were listed in the order it was written the select statement
SELECT first_name, last_name, 10 AS points FROM customers ORDER BY 1, 2;

/*10. LIMIT Clause------------------------------------------------------------*/
-- how to limit the number of records returned from your queries
SELECT * FROM customers;
-- This above shows data for 10 customers
-- We can limit it to 3 customers by using..
SELECT * FROM customers LIMIT 3;
-- Let's say we have a website that shows 3 records per page.
-- page 1: 1-3
-- page 2: 4-6
-- page 3: 7-9
-- write a statement that would return the records on page 3
SELECT * FROM customers LIMIT 6, 3;

/*11. Inner Joins---------------------------------------------------------------*/
-- So far, we have only selected data from single tables. In the real world,
-- we generally select data from multiple tables 
-- For inner joins, "inner" is optional
-- Let's get order_id, first name, and last name from customers and orders tables
SELECT order_id, first_name, last_name FROM orders
JOIN customers ON customers.customer_id = orders.customer_id;
-- I want to see customer_id from a joined table of customers and orders
SELECT orders.customer_id FROM orders
JOIN customers ON customers.customer_id = orders.customer_id;
-- ^^ all this above code is so complicated because of the table calling repetition...
-- we can make this simpler by using an 'Alias'
-- [Helpful Note] You can use declare Aliases right after SELECT clauses and even
-- after FROM clauses by just inserting a space after the column/data you wrote
SELECT o.customer_id FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

SELECT c.customer_id FROM customers c
JOIN orders o ON o.customer_id = c.customer_id;

/*12. Joining Across Databases--------------------------------------------------------*/
-- How to combine tables from multiple databases
-- [Helpful Note] Generally, it's not a good practice to have identical tables
-- stored in multiple databases
-- Let's join the order_items table from the sql_store database
-- with the products table from the sql_inventory database
SELECT * FROM order_items oi
JOIN sql_inventory.products p 
	ON oi.product_id = p.product_id;
    
/*13. Self Joins---------------------------------------------------------------------*/
-- Let's select the name of the employee and their manager
SELECT e.employee_id, e.first_name, m.first_name AS Manager FROM employees e
JOIN employees m ON e.reports_to = m.employee_id;
-- [Takeaway]
-- 		The first table is kept the same, whereas, the joined table is filtered

/*14. Joining Multiple Tables---------------------------------------------------------*/
-- Let's join three tables: customers, orders, order_stasus and return everything
USE sql_store;
SELECT * FROM orders o JOIN customers c ON o.customer_id = c.customer_id
	JOIN order_statuses os ON o.status = os.order_status_id;
-- Let's return order id, order date, first name, last name, order status
SELECT o.order_id, o.order_date, c.first_name, c.last_name, os.name AS status
	FROM orders o JOIN customers c ON o.customer_id = c.customer_id
	JOIN order_statuses os ON o.status = os.order_status_id;

/*15. Compound Join Conditions-----------------------------------------------------------*/
-- a Compound Join, joins two tables using multiple columns that have a primary key
-- In the order items table, order_id has repeated values. So by calling order_id
-- we might not select the correct order_item
-- try the below...
USE sql_store;
SELECT * FROM order_items WHERE order_id = 2;
-- So how do we solve this issue?
-- We will be using a 'Composite Primary Key'!! What is this?
-- In the order_items table, we have two primary keys. order_id and product_id
-- When we have two or more primary keys in a table, we call this a Composite Primary Key
-- Let's join the order_item_notes table with the order_items table!
SELECT * FROM order_items oi 
	JOIN order_item_notes oin
    ON oi.order_id = oin.order_id
    AND oi.product_id = oin.product_id;
-- [Helpful Note] ^^It's a bit complicated to understand what I wrote above so here's a 
-- much simpler explanation. A primary key is used to uniquely identify a record of information
-- In some cases, some tables have primary keys that hold duplicate values. Which 
-- makes each row of information not uniquely identifiable anymore
-- To solve this issue, we can pair two primary keys together to make a unique composite key

/*16. Implicit Join Syntax-------------------------------------------------------------------*/
SELECT * FROM orders o, customers c WHERE o.customer_id = c.customer_id;

/*17. Outer Joins------------------------------------------------------------------------------*/
-- Let's write an inner join first and then convert it to an outer join
-- [Helpful Note] It's better practice to avoid using RIGHT JOINS and just sticking with
-- using only LEFT JOINS. The reason behind this is beceause it is hard to visualize 
-- how you are joining tables if you are using both. It's just better to stick to LEFT JOIN
SELECT c.customer_id, c.first_name, o.order_id
	FROM customers c JOIN orders o ON c.customer_id = o.customer_id
    ORDER BY c.customer_id;
-- Something interesting to notice is that the doesn't show all existing customers
-- It only shows customers who placed an order. The reason for this is because of the
-- 'join' condition. You can check the table to see.
-- What if we want to see all the customers whether they have an order or not?
-- This is when we would use an 'Outer Join'
-- There are 2 types of outer joins: LEFT and RIGHT
-- When we use a LEFT join, all the records from the "left table" will be returned
-- whether the join condition is true or not
SELECT c.customer_id, c.first_name, o.order_id
	FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id
    ORDER BY c.customer_id;
-- ^^LEFT join here means we return 'customers table'
-- ^^RIGHT join here means we return 'orders table'

/*18. Outer Join Between Multiple Tables----------------------------------------------------*/
-- Let's join the above table on lines 204-206 with the shippers table
-- We want to be able to see all the orders, even if the conditions are not true
-- Some orders do not have have shippers so the inner join condition to join shippers
-- is not true.
SELECT c.customer_id, c.first_name, o.order_id, sh.name AS shipper
	FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id
    LEFT JOIN shippers sh ON o.shipper_id = sh.shipper_id
    ORDER BY c.customer_id;
-- We use a LEFT JOIN to join shippers because we want to return orders, whether they
-- have a shipper or not.
-- [Helpful Note] The order of which you do LEFT JOIN is very important. Start with the table
-- from which you want to keep all the records of. If you use a LEFT JOIN, often the 
-- subsequent tables should also be left-joined. 
-- I may need to come back and make my knowledge on this one better...

/*19. Self Outer Joins-----------------------------------------------------------------------*/
-- Earlier above in self joins, we retrieved data on employees and their managers
USE sql_hr;
SELECT e.employee_id, e.first_name, m.first_name AS Manager
	FROM employees e JOIN employees m ON
	e.reports_to = m.employee_id;
-- There is something missing on this table... we don't have a record for 'Yovonnda',
-- the manager himself, because his employee_id is 'null'
-- Let's fix this by doing a Self Outer Join
SELECT e.employee_id, e.first_name, m.first_name AS Manager
	FROM employees e LEFT JOIN employees m ON
    e.reports_to = m.employee_id;
-- [Takeaway] We specify the table we want to keep all values of by using LEFT JOIN. Which is
-- the LEFT Table

/*20. USING Clause---------------------------------------------------------------------------*/
-- Take a look at this inner join statement
USE sql_store;
SELECT o.order_id, c.first_name FROM orders o
	JOIN customers c
		-- ON o.customer_id = c.customer_id;
        USING (customer_id);
-- As join statements become more complex, the conditional phrase makes the statement harder 
-- to read. So that's why we can replace the 'ON Clause with a 'USING' clause to help with this
-- [Helpful Note] This works very well, however, in the case that the foreign key does not
-- match the primary key. You won't be able to use this.
-- What about joining composite keys?
-- Let's test this out joining order_items with order_item_notes:
SELECT * FROM order_items oi
	JOIN order_item_notes oin
    -- ON oi.order_id = oin.order_id AND oi.product_id = oin.product_id;
    USING (order_id, product_id);

/*21. NATURAL JOIN------------------------------------------------------------------------*/
-- This clause joins tables based on common columns. The columns that have the same name.
-- Not recommended to use, because you are letting the database figure out or guess the 
-- join
USE sql_store;
SELECT o.order_id, c.first_name FROM orders o NATURAL JOIN customers c;

/*22. CROSS JOIN----------------------------------------------------------------------------*/
-- This function will generate a paired combination for each row of the first table with
-- each row of the second table. 
-- 		(e.g. 1st table = 2 rows, 2nd table = 3 rows)
-- 		You will produce 6 rows because each row of table 1 is pairing with each row on table 2.
-- EXPLICIT SYNTAX
SELECT * FROM customers c CROSS JOIN products p;
-- IMPLICIT SYNTAX
SELECT * FROM customers c, orders;

/*23. UNION---------------------------------------------------------------------------------*/
-- We learned that we can combine columns using JOINS, what about rows?
-- Yes, we can combine rows using UNIONS
-- Take a look at the following table:
USE sql_store;
SELECT * FROM orders;
-- What if I wanted to add a label next to each order where...
-- 			IF the orders placed in the current year, the label is ACTIVE
-- 			IF the orders placed in previous years, the label is ARCHIVE
SELECT order_id, order_date, 'Active' AS Status FROM orders
	WHERE order_date >= '2019-01-01'
    UNION  -- We can use 'UNION' to combine multiple queries
SELECT order_id, order_date, 'Archived' AS Status FROM orders
	WHERE order_date < '2019-01-01';
-- Here's another example (not a use case, just a demonstration)
SELECT first_name FROM customers
UNION
SELECT name FROM shippers;
-- [IMPORTANT NOTE] The # of columns in each query should be equal otherwise you will get an
-- ERROR
-- [Note] This is something that I figure out myself, but I think that the column
-- name is defined by the first query you use. Precedence for deciding the name is ordinal

/*24. Column Attributes--------------------------------------------------------------------------*/
-- INSERT, UPDATE, and DELETING data. Let's talk about some variable types:
-- Most of the time we use VARCHAR over CHAR because let's say you are using VARCHAR(50)
-- and you insert a variable with 5 characters. MySQL will store only 5 characters and remove
-- the rest of the space. In contrast, CHAR would insert an additional 45 spaces, which is a 
-- waste of space.
-- NN, means not null. If a column is not null, it cannot accept NULL values.
-- AI, means auto increment. For every new record stored, MYSQL will generate a new primary key
-- value, which is the previous primary key value + 1
-- Default / Expression, if you don't supply a value for the column. MYSQL will use a default
-- expression to set the column equal to

/*25. Inserting a Single Row----------------------------------------------------------------------*/
-- You can control which columns to insert values into in whatever order
INSERT INTO customers (first_name, last_name, birth_date, phone, address, city, state, points)
VALUES (
		-- DEFAULT,
        'John',
        'Smith',
        '1990-01-01',
        DEFAULT,
        'address'
        'city',
        'CA',
        DEFAULT);
        
/*26. Inserting Multiple Rows-------------------------------------------------------------------*/
-- All you do is just add another set of parentheses after VALUES
-- [Helpful Note] if you don't specify the column count, then you need to insert exactly
-- the correct amount of data according to the total count of columns.
-- For example: IF there are a total of 5 columns in your table, then you need to insert
-- exactly 5 pieces of data incrementally in order for the insert to work
INSERT INTO shippers(name)
VALUES ('Shipper1'),
	   ('Shipper2'),
       ('Shipper3');

/*27. Inserting Hierarchical Rows----------------------------------------------------------------*/
-- Used for inserting data into multiple tables (related)
-- 		An order can have multiple order_items, this is a parent-child relationship
-- 		orders table is the parent and order_items is the child
-- Let's insert an order that holds 3 order_items
INSERT INTO orders (customer_id, order_date, status)
	VALUES (1, '2019-01-02', 1);
INSERT INTO order_items
	VALUES (LAST_INSERT_ID(), 2, 3, 5),
		   (LAST_INSERT_ID(), 1, 5, 1.99),
           (LAST_INSERT_ID(), 3, 5, 3);
           
/*28. Creating a Copy of a Table-----------------------------------------------------------------*/
-- Let's create a copy of the table orders, called orders_archived
CREATE TABLE orders_archived AS SELECT * FROM orders;
-- Using this technique, we are able to create a copy of the orders table, however,
-- MYSQL does not recognize the orders_id key as a primary key nor is it auto-incremented
-- [Note] The select statement in the above query is known as a "subquery" because it is
-- part of another SQL statement
-- [Helpful Note] We can also use a subquery and an an insert statement! This is super useful:
-- Let's say we want to copy only a subset of records from the 'orders' table into the 
-- 'orders_archived' table. First, let's truncate the table. (meaning delete the records)
-- Let's get all the orders placed before 2019:
SELECT * FROM orders WHERE order_date < '2019-01-01'; 
-- ^^ we can use this subquery as part of an insert statement
INSERT INTO orders_archived
SELECT * FROM orders WHERE order_date < '2019-01-01';
-- [Note] We don't need to specify columns because the subquery provides all the necessary
-- column info already

/*29. Updating a Single Row-------------------------------------------------------------------*/
-- UPDATE 'table'
-- SET column1 = x, column2 = y WHERE column = x;
UPDATE invoices
SET
	payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE invoice_id = 3;
-- for the first SET, the payment_total is truncated

/*30. Updating Multiple Rows-------------------------------------------------------------------*/
-- Syntax is exactly the same as updating a single row, however, the condition that 
-- you typed out after the WHERE statemente needs to be more general
USE sql_invoicing;
UPDATE invoices
SET
	payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE client_id IN (3, 4); -- <there are multiple records with client_id = 3
-- [Helpful Note] MYSQL runs these queries in "safe update" mode. Which means that we are
-- only able to update 1 row at a time. You will not run into this problem with other softwares
-- This is only specific to MYSQL workbench
-- So how to get around this? Go to preferences in MySQL and uncheck 'Safe Updates' in editor

/*31. Using Subqueries in Updates---------------------------------------------------------------*/
-- What if we want to update a table and don't have the ID of a client, where only
-- have their "name"?
-- We can use a subquery in an update statement to fetch the client ID!
USE sql_invoicing;
UPDATE invoices
SET
	payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE client_id = (SELECT client_id FROM clients WHERE name = 'Myworks');
-- What if we needed to update all the clients that lived in CA and NY
SELECT client_id FROM clients WHERE name = 'Myworks';
UPDATE invoices
SET
	payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE client_id IN (SELECT client_id FROM clients WHERE state IN ('CA','NY'));
-- ^the subquery above returns multiple records, we must change the '=' in the conditional to
-- "IN". [Helpful Note] As a good practice, make sure to run your subqueries first so that you
-- won't end up update or inserting mistakes

/*32. Deleting Rows---------------------------------------------------------------------------*/
DELETE FROM invoices -- <this line by itself will delete all the records from the table.
WHERE invoice_id = 1;
-- You can also use subqueries
DELETE FROM invoices
WHERE client_id = (SELECT * FROM clients WHERE name = 'Myworks');

/*33. Aggregate Functions--------------------------------------------------------------------*/
-- takes a series of values and aggreates them to produce a single value.
-- 		~ Except for COUNT(*), these functions ignore null values
-- 		~ Often used with the GROUP BY clause in the SELECT statement
-- 		~ Includes duplicate values by default
-- 		~ All aggregate functions are *deterministic (always give same answer w/ same inputs)
-- [HELPFUL] WHERE CAN YOU USE AGGREGATE FUNCTIONS?
-- 		~ in a SELECT statement
-- 		~ in a HAVING clause of select statement (alias) that includes GROUP BY
-- 	~ You CANNOT use in a *WHERE clause or in a JOIN condition
--  ~ BUT, if you use a subquery it can be in the WHERE Clause
/*=====================================================================*/
USE sql_invoicing;
SELECT 
	MAX(invoice_total) AS highest,
    MIN(invoice_total) AS lowest,
    AVG(invoice_total) AS average,
    SUM(invoice_total) AS total,
    COUNT(*) AS total_records -- Counts all records including NULL values
FROM invoices;
/*=====================================================================*/
-- MYSQL will first do the calculation within the () and then use the outside function
SELECT (invoice_total * 1.1) AS new_value FROM invoices;


/*34. GROUP BY Clause--------------------------------------------------------------------*/
-- Let's take a look at the total sales
SELECT SUM(invoice_total) AS total_sales FROM invoices;
-- What if I want to see the total sales per client?
-- We need to group data by one or more columns
SELECT client_id, SUM(invoice_total) AS total_sales FROM invoices
GROUP BY client_id -- By default, our column is sorted by client_id
ORDER BY total_sales DESC; -- We can use an ORDER BY clause to sort with other columns
-- We can also use a filter in this to get invoice data from dates >= 2019-07-01
SELECT client_id, SUM(invoice_total) AS total_sales
	FROM invoices WHERE invoice_date >= '2019-07-01' 
    GROUP BY client_id ORDER BY total_sales DESC;
-- the syntax order is vital to making this work
-- How to group by Multiple Columns? Let's group the data per state and city
SELECT state, city, client_id, SUM(invoice_total) AS total_sales
	FROM invoices JOIN clients USING (client_id)
    GROUP BY state, city ORDER BY total_sales DESC;

/*35. HAVING Clause--------------------------------------------------------------------*/
-- You use the HAVING Clause after a GROUP BY Clause for filtering
-- Take a look at the following statement's query
SELECT client_id, SUM(invoice_total) AS total_sales
	FROM invoices GROUP BY client_id;
-- What if we to only include clients with a 'total sales > 500'
-- We must use the 'HAVING Clause'. Why can't we use the WHERE Clause?
-- The WHERE Clause is always applied 'before' the GROUP BY Clause. Which means we haven't
-- grouped the data yet, so applying it would not work. Instead:
SELECT client_id, SUM(invoice_total) AS total_sales, COUNT(*) AS number_of_invoices
	FROM invoices
    GROUP BY client_id
    HAVING total_sales > 500 AND number_of_invoices > 5; -- we can use a compound search
-- [KEY TAKEAWAY] We can use the WHERE Clause to filter data "BEFORE" data is grouped
-- Whereas, we can use the HAVING Clause to filter data "AFTER" data is grouped
-- [IMPORTANT] Another big difference between WHERE and HAVING is that the HAVING Clause
-- can only use columns that are explicity stated in the SELECT Clause, regardless, of 
-- whether the column is located inside the same table as the one you are querying from
-- However, you can use aggregate functions for filtering such as COUNT(*) > 2 for filtering
-- records > 2

/*36. WITH ROLLUP Operator----------------------------------------------------------------*/
-- This operator returns the summary values for each group as well as the entire result set
USE sql_invoicing;
SELECT client_id, SUM(invoice_total) AS total_sales
	FROM invoices GROUP BY client_id WITH ROLLUP;
-- [IMPORTANT NOTE] WITH ROLLUP only works with aggregated values 
-- (Meaning there was an aggregate function)
SELECT * FROM payments GROUP BY payment_id WITH ROLLUP;
-- You can double check ^^, it doesn't work unless an aggregate function has been applied
-- in the SELECT statement
SELECT state, city, SUM(invoice_total) AS total_sales
	FROM invoices i JOIN clients c
    USING(client_id)
    GROUP BY state, city WITH ROLLUP;
-- This is function is only available in MySQL. It's not part of the standard language

/*37. Subqueries---------------------------------------------------------------------------------*/
-- Find products that are more expensive than Lettuce (id = 3)
USE sql_inventory;
SELECT * FROM products 
	WHERE unit_price >
    (SELECT unit_price FROM products WHERE product_id = 3);
-- [Note] When MySQL reads this query above^^, it will first evaluate the subquery and then
-- return a value for the original query

-- In sql_hr database:
-- 		Find employees who earns more than average
USE sql_hr;
SELECT * FROM employees
	WHERE salary > (SELECT avg(salary) FROM employees);
    
/*38. IN Operator---------------------------------------------------------------------------*/
-- Find the products that have never been ordered
USE sql_store;
SELECT * FROM products WHERE product_id NOT IN
(SELECT DISTINCT product_id FROM order_items);

-- Find clients without invoices
USE sql_invoicing;
SELECT * FROM clients WHERE client_id
	NOT IN (SELECT DISTINCT(client_id) FROM invoices);
    
/*39. Subqueries vs Joins------------------------------------------------------------------------*/
-- The query below is another way of writing the above query using an OUTER JOIN
SELECT * FROM clients c LEFT JOIN invoices i USING(client_id) WHERE invoice_id IS NULL;
    
/*40. ALL Keyword------------------------------------------------------------------------*/
-- Select invoices larger than all invoices of client 3
USE sql_invoicing;
SELECT * FROM invoices WHERE invoice_total > (
SELECT MAX(invoice_total) FROM invoices WHERE client_id = 3);
-- Another way to solve this problem using the ALL Keyword
SELECT * FROM invoices 
	WHERE invoice_total > ALL (SELECT invoices_total FROM invoices WHERE client_id = 3);
-- The ALL keyword replaces the aggregate function MAX here because it compares 
-- the invoice_total column to 'ALL of the values returned by the select statement'
-- [Key Takeaway] When using a subquery, a lot of the times we are comparing a column
-- to a single returned value. Using the ALL Keyword, we are able to compare a column
-- to 'Multiple Values that are returned'

/*41. ANY or SOME Keyword-------------------------------------------------------------------*/
-- Above we learned that ALL keyword compares a column to "ALL the values returned"
-- ANY or SOME <-- which is equivalent to ANY, will compare a column to "ANY values returned"
-- Select clients with at least two invoices
USE sql_invoicing;
SELECT * FROM clients WHERE client_id = ANY (
SELECT client_id AS number_of_invoices
	FROM invoices GROUP BY client_id HAVING COUNT(*) >= 2);
-- "return clients where client_id is = to any id returned
-- Both queries are the same just written using different operators
    SELECT * FROM clients WHERE client_id IN (
SELECT client_id AS number_of_invoices
	FROM invoices GROUP BY client_id HAVING COUNT(*) >= 2);

/* 42. Correlated Subqueries--------------------------------------------------------------------*/
-- When to use this? When we are dealing with multiple rows of values returned from the 
-- subquery
-- Select employees whose salary is
-- above the average in their office
USE sql_hr;
SELECT * FROM employees e
	WHERE salary > (SELECT AVG(salary)
	FROM employees f WHERE f.office_id = e.office_id);
-- ^This is a correlated subquery because we are using an alias and comparing it in the 
-- filter clause. In all the past subqueries we have done, those were all uncorrelated because
-- they only ran once.
-- In this subquery, however, the subquery gets executed for every row returned
-- for the main query
-- [Helpful Note] To simply explain what's going on:
-- We are select information from table 'e' using a filter condition on table 'f'
-- Here is how this entire thing runs:
-- Let's say the office_id = 1 for the first run through. For wherever office_id = 1
-- on table e, we are running through all the office_id = 1 on table f and calculating
-- the average value, hence returning it.
-- This is iterated through every office_id value
    
/*43. EXISTS Operator------------------------------------------------------------------------*/
-- Select clients that have an invoice
-- We know two ways already, using IN and INNER JOIN
SELECT * FROM clients WHERE client_id IN (SELECT DISTINCT(client_id) FROM invoices);
-- Third way is using EXISTS (also using a correlated subquery):
USE sql_invoicing;
SELECT * FROM clients c
WHERE EXISTS(
	SELECT client_id
    FROM invoices
    WHERE client_id = c.client_id);
    -- What's going on here? The WHERE Clause is not referencing a "column" rather,
    -- the EXISTS clause is just checking if there are rows that match the criteria
    -- (client_id = c.client_id)
    -- [Note] It is much better to use the EXISTS Operator because it is much more efficient
    -- in these situations. If you have millions of records for invoice data, the process
    -- of using IN would be very very slow
    -- The EXISTS Operator is not actually returning a result for the WHERE Clause
    -- It's just checking for records that match the condition is true and the select statement
    -- is just returning the current information that is true
    -- [Key Takeaway] If the subquery we wrote after IN Operator returns a large result set,
    -- it is better to use EXISTS instead

/*44. Subqueries in the SELECT Clause-----------------------------------------------------------*/
-- So far, we have only used subqueries after a WHERE Clause. We can actually use it in
-- the SELECT Clause:
USE sql_invoicing;
SELECT invoice_id, invoice_total, (SELECT AVG(invoice_total) FROM invoices)
AS invoice_average, (invoice_total - invoice_average) FROM invoices; -- this query is wrong
-- [Note] We cannot use the alias 'invoice_average' for calling
-- TWO Solutions: 1) use the long subquery we wrote (not recommended)
			-- 	  2) use another subquery to call it
-- this is the correct way:
SELECT invoice_id, invoice_total, (SELECT AVG(invoice_total) FROM invoices)
AS invoice_average, (invoice_total - (SELECT invoice_average)) FROM invoices;
            
/*45. Subqueries in the FROM Clause--------------------------------------------------------------*/
USE sql_invoicing;
SELECT client_id, name, (SELECT SUM(invoice_total) FROM invoices
	WHERE client_id = c.client_id) AS total_sales,
    (SELECT AVG(invoice_total) FROM invoices) AS average,
    (SELECT total_sales) - (SELECT average) FROM clients c;
-- The above table holds a lot of valuable information. However, we don't actually have a table like this
-- in our database. Wouldn't it be useful to be able to query this data?
-- Of course, we can do this by placing a subquery into the FROM Clause. Treating it like a real table
SELECT * FROM (SELECT client_id, name, (SELECT SUM(invoice_total) FROM invoices
	WHERE client_id = c.client_id) AS total_sales,
    (SELECT AVG(invoice_total) FROM invoices) AS average,
    (SELECT total_sales) - (SELECT average) FROM clients c) AS sales_summary;
-- [IMPORTANT NOTE] When placing a subquery in the FROM Clause, it is 'REQUIRED' to add an alias
-- [Key Takeaway] This is not recommended because it makes our code complicated. It's better to use 'VIEWs'
-- Only use this for simple queries

/*46. Numeric Functions--------------------------------------------------------------------------------------*/
-- These functions are what beginners will use most of the time, there are much more functions
SELECT ROUND (5.12355, 3); -- 3 specifies how many decimal places you want
SELECT TRUNCATE(5.12345, 3); -- 3 specifies how many 'decimal' digits you want to "keep" and it removes the rest
SELECT CEILING(5.7); -- returns smallest integer that is >= to 5.7
SELECT FLOOR(5.7); -- returns the largest number that is <= to 5.7
SELECT ABS(-5.2); -- returns absolute values
SELECT RAND(); -- returns a random value between 0 and 1

/*47. String Functions-----------------------------------------------------------------------------------------*/
-- some of the most useful functions to work with string values
SELECT LENGTH('sky'); -- returns string char length
SELECT UPPER('sky'); -- converts string to uppercase
SELECT LOWER('SKY'); -- converts string to lowercase
SELECT LTRIM('       Sky'); -- left trim, removes unnecessary spaces left of the first word
SELECT RTRIM('Sky       '); -- right trim, removes unnecessary spaces right of the last word
SELECT TRIM('    Sky     '); -- removes any leading/trailing spaces
SELECT LEFT('Kindergarten', 4); -- return 4 characters starting from the left side
SELECT RIGHT('Kindergarten', 4); -- return 4 characters starting from the right side
SELECT SUBSTRING('Kindergarten', 3, 5); -- returns characters from anywhere in the string, 3 is start and 5 is #  of chars
SELECT LOCATE('g', 'Kindergarten'); -- returns the location of the 'search string' which is 'n' here
SELECT REPLACE('Kindergarten', 'garten', 'garden'); -- 3 arguments, replaces the 2nd argument with the 3rd
SELECT CONCAT('first', 'last'); -- Concatenate
USE sql_store;
SELECT CONCAT(first_name, ' ', last_name) FROM customers;

/*48. Date Functions in MySQL-----------------------------------------------------------------------------------------*/
-- some of the most useful functions to work with date and time
SELECT NOW(); -- returns current date & time
SELECT CURDATE(); -- returns current date without time
SELECT CURTIME(); -- returns current time without date
-- we can also extract certain components in the date or time
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT HOUR(NOW());
SELECT MINUTE(NOW());
SELECT SECOND(NOW());
-- all these functions return integer values, but we have two useful functions that return strings
SELECT DAYNAME(NOW());
SELECT MONTHNAME(NOW());
-- Part of the standard SQL language, so if you want to port your code to other database management systems. It is better
-- to use the EXTRACT function
SELECT EXTRACT(DAY FROM NOW()); -- returns the day of the month
SELECT EXTRACT(YEAR FROM NOW()); -- returns the year

/*49. Formatting Dates and Times--------------------------------------------------------------*/
-- Formatting dates and times in a user-friendly way
SELECT DATE_FORMAT(NOW(), '%m %d %y'); -- use lowercase and uppercase for different cases

/*50. Calculating Dates and Times--------------------------------------------------------------*/
SELECT DATE_ADD(NOW(), INTERVAL -1 DAY); 
SELECT DATE_SUB(NOW(), INTERVAL 1 DAY); -- same result as above
-- We can also calculate difference between 2 dates
SELECT DATEDIFF('2019-01-05', '2019-01-01');
-- or diff between time
SELECT TIME_TO_SEC('09:00') - TIME_TO_SEC('09:02');

/*51. IFNULL and COALESCE Functions--------------------------------------------------------*/
USE sql_store;
SELECT * FROM orders;
-- let's display the label 'Not assigned' for null values of shipper_id
SELECT order_id, IFNULL(shipper_id, 'Not assigned') FROM orders;
-- Here is a similar function that is also more flexible
SELECT order_id,
COALESCE(shipper_id, comments, 'Not assigned')
FROM orders;
-- The above statement for COALESCE is saying: 
-- 		if shipper_id is null, return the comments value
-- 		if comments is also null, then return 'Not assigned'
-- [Key Takeaway] IFNULL substitutes Null values, whereas,
-- COALESCE returns the first 'non NULL' value

/*52. IF Function--------------------------------------------------------------------------*/
-- if order is in current year, label it active.
-- if order is in previous years, label it archived
-- we used union to do this before, but we can use IF to do the same with less code
-- syntax: IF(expression, true_return_first, else_return_second);
SELECT order_id, order_date, 'Active' AS Category FROM orders WHERE YEAR(order_date) = 2019
UNION
SELECT order_id, order_date, 'Archived' FROM orders WHERE YEAR(order_date) < 2019;
-- this below does the same thing
USE sql_store;
SELECT order_id, order_date,
    IF(YEAR(order_date)=2019, 'Active','Archived') AS Category 
    FROM orders;
    

/*53. CASE Operator-----------------------------------------------------------------------*/
-- [Summary] CASE Operator is used in the select statement:
-- This operator is similar to IF function, but allows testing of multiple conditions
-- CASE, WHEN {condition}, THEN {return value}, ELSE {return value}, END AS {alias}
-- IF functions only allows 1 testing expression
-- Let's write a query that return:
-- 		orders in current year as 'active'
-- 		orders last year as last 'year'
-- 		orders earlier than this as 'archived'
-- [Note] Each WHEN Clause tests an expression
SELECT order_id,
CASE WHEN YEAR(order_date) = YEAR(NOW()) THEN 'Active'
WHEN YEAR(order_date) = YEAR(NOW()) - 1 THEN 'Last Year'
WHEN YEAR(order_date) < YEAR(NOW()) - 1 THEN 'Archived'
ELSE 'Future' END AS category
FROM orders;

/*54. Creating Views----------------------------------------------------------------------*/
-- We can save queries or subqueries in a view and simplify statements
USE sql_invoicing;
CREATE VIEW sales_by_client AS
SELECT c.client_id,
	c.name,
    SUM(invoice_total) AS total_sales FROM clients c JOIN invoices i USING (client_id)
    GROUP BY client_id, name;
-- the select statement shows us sales by client, we created a view for it!
-- We can view the 'View' in our Schemas just like a table. 
-- As well as use the 'View' just like a table
SELECT * FROM sales_by_client;
-- even join it with other tables
SELECT * FROM sales_by_client JOIN clients USING(client_id);
-- Views behaves like a virtual table, however, REMEMBER Views do not store data like tables. 

/*55. Altering or Dropping Views----------------------------------------------------------*/
DROP VIEW sales_by_client;
CREATE OR REPLACE VIEW sales_by_client AS -- Using OR REPLACE is preferred way
SELECT c.client_id,
	c.name,
    SUM(invoice_total) AS total_sales FROM clients c JOIN invoices i USING (client_id)
    GROUP BY client_id, name;

/*56. Updatable Views---------------------------------------------------------------------*/
-- an updatable view, is a view that we can update through. (INSERT, DELETE, UPDATE)
-- If a view contains any of the following operators, it is not updatable:
-- DISTINCT, Aggregate Functions, GROUP BY / HAVING, UNION
-- These views are considered complex views, which is a view based on multiple tables
CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT invoice_id,
number, client_id, invoice_total,
payment_total,
invoice_date,
due_date, payment_date, invoice_total - payment_total AS balance FROM invoices
WHERE (invoice_total - payment_total) > 0;

SELECT invoice_total, sum(invoice_total - 50) AS new_total FROM invoices
WHERE new_total > 100;
-- [NOTE] This above statement won't work because MySQL cannot detect the column
-- 'new_total' in the WHERE Clause. The HAVING Clause can detect the column, but the
-- WHERE Clause cannot. 

DELETE FROM invoices_with_balance WHERE invoice_id = 1;
-- this removes the first record where invoice_id = 1

-- We can move the due_date of an invoice in our view:
UPDATE invoices_with_balance
SET due_date = DATE_ADD(due_date, INTERVAL 2 DAY)
WHERE invoice_id = 2;

/*57. The WITH OPTION CHECK Clause---------------------------------------------------------------*/
-- [Summary] Basically, this Clause is added after with the CREATE VIEW statement at the end
-- It generates an error whenever you try to update the view in a way where it removes
-- a record.
-- When we update views, for example like this:
UPDATE invoices_with_balance
SET invoice_total = 0 WHERE invoice_id = 2;
-- The record for this will be removed. WHY? Because when we created this specific view
-- We have a WHERE Clause saying (invoice_total - payment_total) > 0
-- SO it got removed. Damn.. I wish I had some warning that would've told me so I didn't
-- remove the record from my precious view:(
-- Oh I know, Let's add the WITH OPTION CHECK to our view....
CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT invoice_id,
number, client_id, invoice_total,
payment_total,
invoice_date,
due_date, payment_date, invoice_total - payment_total AS balance FROM invoices
WHERE (invoice_total - payment_total) > 0 WITH CHECK OPTION;
-- now let's try this again..
/*UPDATE invoices_with_balance
SET invoice_total = 0 WHERE invoice_id = 3;*/ -- this is supposed to remove... but let's see
-- OH damn, I got an error cool. It warned me telling me that it would've removed my record
-- This is very useful to protect my records in my view

/*58. Other Benefits of Views----------------------------------------------------------------*/
-- Simplify Queries
-- Reduce the impact of changes to your database design.... let me explain:
-- Let's say your write 10 queries using the table 'invoices'
-- What if you want made a change to the table 'invoices', for example:
-- you want to move a column in this table to another table, or you change it's name
-- this would be very frustrating because now you have to change all the queries you wrote
-- because they no longer reference the correct table or possibly the correct column
-- If you make changes to the underlying table invoices, we can modify our view code and
-- use an alias for the changed columns to bring back their 'original name'
-- If you move a column from this table to another table, we can join invoices table
-- with the other table and bring back that column
-- We can also use views to restrict access to data: like excluding data using WHERE Clause
-- or excluding columns (removing direct access to certain columns)

/*59. What are Stored Procedures-------------------------------------------------------------*/
-- Let's say you are building an application that has a database, where are you going to
-- write these sql statements? Not in the application, why? because it will be messy and hard
-- to maintain. Also, some programming languages like C# or Java require a compilation step.
-- So if you find out you need to change a query, you need to recompile and redeploy the
-- application code. SQL code should not be in application code. You should store it in a 
-- database. WHERE?
-- A stored procedure, a database object that contains a block of SQL code
-- in application code, we simply call these "stored procedures" to get or save the data
-- Advantages: 
-- 1) Store and organize SQL
-- 2) Faster execution (sometimes) because database management systems optimize it
-- 3) Data security (user control)

/*60. Creating a Stored Procedure----------------------------------------------------------------*/
USE sql_invoicing;
DELIMITER $$ -- Here we are telling MySQL that '$$' is the new delimiter. We can use anything tbh as long as it's not in the block
CREATE PROCEDURE get_clients()
BEGIN
	SELECT * FROM clients; -- the semicolon is required here cuz mysql demands it
END $$
-- the delimiter and end tells mysql to take all the statements as 1 unit
DELIMITER ; -- we need to change the default delimiter back to a semi-colon
-- [Note] In other database management systems, you don't have to change the default delimiter
-- this is unique to MySQL
-- [Note] Also, keep in mind, usually these are used for multiple lines of SELECT statements.

DELIMITER $$
CREATE PROCEDURE get_clients()
BEGIN
	SELECT * FROM clients;
END $$
DELIMITER ;
-- this executes the get_clients() stored procedure
CALL get_clients();
-- [Helpful Note] most of the time, calling a stored procedure is something we do in our
-- application code

/*61. Creating Procedures Using MySQLWorkbench------------------------------------------------*/
-- You can right-click stored procedures to create it
-- MySQL uses back ticks (') around the names you make to prevent clashes with SQL keywords

/*62. Dropping Stored Procedures-------------------------------------------------------------*/
DROP PROCEDURE IF EXISTS get_clients; -- better and safer way to drop procedures
-- just like views, it's good to keep your stored procedures in a separate SQL file
-- keeping it in source control (like git)

/*63. Parameters-----------------------------------------------------------------------------*/
-- Adding parameters to your stored procedere. We typically pass values through parameters
-- to your stored procedure. We can also use parameters to send values the calling program (we will cover this later)
-- Let's create a stored procedure that 'receives the name of a state' and return the clients
-- in that state:
USE sql_invoicing;
DROP PROCEDURE IF EXISTS get_clients_by_state;
DELIMITER $$
CREATE PROCEDURE get_clients_by_state(P_state CHAR(2)) -- <- The name should be unique fetchable
BEGIN
	SELECT * FROM clients WHERE state = P_state; -- see? now we can call it
END $$
DELIMITER ;
-- [Note] What if we don't supply a parameter when calling? We get an error. It's required
-- Also, instead of using P_state, we could leave it as state in the parameter and 
-- just use an alias for the WHERE clause: C.state instead = state

/* 64. Parameters with Default Value-------------------------------------------------------------*/
-- How to assign a Default Value to a parameter:
-- Let's say if the caller of this stored procedure did not specify a state.
-- Let's return all states by DEFAULT
USE sql_invoicing;
DELIMITER $$
CREATE PROCEDURE get_clients_by_state(state CHAR(2))
BEGIN
	SELECT * FROM clients c
    WHERE c.state = IFNULL(state, c.state);
END $$
DELIMITER ;
CALL get_clients_by_state(NULL);
-- Let's write default value being CA
DELIMITER $$
CREATE PROCEDURE get_clients_by_state(state CHAR(2))
BEGIN
	IF state IS NULL THEN
    SET state = 'CA';
    END IF;
	SELECT * FROM clients c
    WHERE c.state = state;
END $$
DELIMITER ;

/*65. Parameter Validation--------------------------------------------------------------------*/
-- We can use procedures to update, delete, and insert data
-- Let's create a procedure to update data and use parameter validation to avoid storing
-- bad data:
DROP PROCEDURE IF EXISTS make_payment;
DELIMITER $$
CREATE PROCEDURE make_payment
(
	invoice_id INT,
    payment_amount DECIMAL (9, 2), -- <--('digits, 'decimal places')
    payment_date DATE
)
BEGIN
	IF payment_amount <= 0 THEN
    SIGNAL SQLSTATE '22003'-- the string contains error code: google search 'sqlstate errors'
		SET MESSAGE_TEXT = 'Invalid payment amount'; -- optional
	END IF;
	UPDATE invoices i
    SET
		i.payment_total = payment_amount,
        i.payment_date = payment_date
        WHERE i.invoice_id = invoice_id;
END $$
DELIMITER ;
-- What if we pass a negative number for payment_total? That's not good because
-- how can payments be negative? We need to prevent this by using parameter validation

/*66. Output Parameters------------------------------------------------------------------*/
-- We can use parameters to return values to the calling program.
DROP PROCEDURE IF EXISTS get_unpaid_invoices_for_client;
DELIMITER $$
CREATE PROCEDURE get_unpaid_invoices_for_client
(
	client_id INT, -- By default, this is a input parameter
    OUT invoices_count INT, -- We use OUT to make it output parameter
    OUT invoices_total DECIMAL(9,2)
)
BEGIN 
	SELECT COUNT(*), SUM(invoice_total) -- WE are selecting these values
    INTO invoices_count, invoices_total -- and returning it to the output parameters
    FROM invoices i
    WHERE i.client_id = client_id
		AND payment_total = 0;
END $$
DELIMITER ;
-- Mosh says: 'Avoid using output parameters unless you have a valid reason to do so'

/*67. Variables----------------------------------------------------------------------------*/
-- User or session variables, these variables are stored in memory for the client's entire
-- session until they close out of MySQL
SET @invoices_count = 0;
-- Local Variable, these variables are defined inside a stored procedure or function.
-- as soon as a stored procedure finishes execution, these variables are freed up.
-- These are usually used to perform calculations inside a stored procedure.
-- Let's make this:
-- risk_factor = invoices_total / invoices_count * 5
SELECT COUNT(*), SUM(invoice_total) FROM invoices;

USE sql_invoicing;
DROP PROCEDURE IF EXISTS get_risk_factor;
DELIMITER $$
CREATE PROCEDURE get_risk_factor()
BEGIN
	DECLARE risk_factor DECIMAL(9,2) DEFAULT 0; -- optional default value, otherwise NULL
    DECLARE invoices_total DECIMAL(9,2);
    DECLARE invoices_count INT;
    SELECT COUNT(*), SUM(invoice_total)
    INTO invoices_count, invoices_total
    FROM invoices;
    -- risk_factor = invoices_total / invoices_count * 5
    SET risk_factor = invoices_total / invoices_count * 5;
    SELECT risk_factor;
END $$
DELIMITER ;
CALL get_risk_factor;

/*68. Functions---------------------------------------------------------------------------*/
-- a function can only return a single value, whereas, stored procedures can return multiple
-- Attribute List:
-- DETERMINISTIC ~ always returns same value if given the same values e.g. calculating tax
-- READS SQL DATA ~ select statement in function to read data
-- MODIFIES SQL DATA ~ insert, update, delete statement in function
-- Let's create function for calculating the risk factor 'per client'
DROP FUNCTION IF EXISTS get_risk_factor_for_client;
DELIMITER $$
CREATE FUNCTION get_risk_factor_for_client
(
client_id INT
)
RETURNS INTEGER -- main difference between functions and stored procedure
READS SQL DATA -- not deterministic cuz if we give same client_id, it may return different
BEGIN			-- different values
	DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
    DECLARE invoices_total DECIMAL(9,2);
    DECLARE invoices_count INT;
    
    SELECT COUNT(*), SUM(invoice_total)
    INTO invoices_count, invoices_total
    FROM invoices i WHERE i.client_id = client_id; -- for parameter

    SET risk_factor = invoices_total / invoices_count * 5;

RETURN IFNULL(risk_factor, 0);
END $$
DELIMITER ;
-- We can use this function just like built-in functions
SELECT client_id, name,
		get_risk_factor_for_client(client_id)
FROM clients;
-- WE can use DROP function to drop
DROP FUNCTION get_risk_factor_for_client;
/*69. Other Conventions----------------------------------------------------------------------*/
-- prefixing stored procedures, functions is a good way to organize them
/*70. Triggers-------------------------------------------------------------------------------*/
-- Trigger, a block of SQL code that automatically gets executed before or after an
-- insert, update or delete statement.
-- Here is a good example of use case:
-- In the payments table, the payment_total column should always be equal to
-- all the payments made for that specific invoice. So everytime we add a payment,
-- we can use a trigger to update this column automatically
-- [IMPORTANT] the naming convention for triggers should be like this:
-- 				(column name)_(before/after)_(type of statement)
DELIMITER $$
CREATE TRIGGER payments_after_insert
	AFTER INSERT ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices -- table name
    SET payment_total = payment_total + NEW.amount-- OLD <- used for returning old row/values
    WHERE invoice_id = NEW.invoice_id;
END $$
DELIMITER ;
-- [Note] In this trigger, we can modify data in any table except the table that this
-- trigger is for. Otherwise, we will end up with an infinite loop.
-- Let's test it out:

/*71. Viewing Triggers-------------------------------------------------------------------------*/
SHOW TRIGGERS LIKE 'payments%';

/*72. Dropping Triggers------------------------------------------------------------------------*/
DROP Trigger IF EXISTS payments_after_insert;

/*73. Using Triggers for Auditing------------------------------------------------------------------*/
-- You can use triggers for auditing!
-- We need this table first tho....
USE sql_invoicing; 
CREATE TABLE payments_audit
(
	client_id 		INT 			NOT NULL, 
    date 			DATE 			NOT NULL,
    amount 			DECIMAL(9, 2) 	NOT NULL,
    action_type 	VARCHAR(50) 	NOT NULL,
    action_date 	DATETIME 		NOT NULL
);
-- Start here:
-- this trigger gets executed after payments inserted and inserts into payment_audit table
DROP TRIGGER IF EXISTS payments_after_insert;
DELIMITER $$
CREATE TRIGGER payments_after_insert
	AFTER INSERT ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total + NEW.amount
    WHERE invoice_id = NEW.invoice_id;
    
    INSERT INTO payments_audit
    VALUES (NEW.client_id, NEW.date, NEW.amount, 'Insert', NOW());
END $$
DELIMITER ;
-- this trigger executes after delete on payments and inserts deleted rows into payment_audit table
DROP TRIGGER IF EXISTS payments_after_delete;
DELIMITER $$
CREATE TRIGGER payments_after_delete
	AFTER DELETE ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total = OLD.amount
    WHERE invoice_id = OLD.invoice_id;
    
    INSERT INTO payments_audit
    VALUES (OLD.client_id, OLD.date, OLD.amount, 'Delete', NOW());
END $$
DELIMITER ;
SHOW TRIGGERS;
-- Let's test out the triggers....
-- Run this first:
INSERT INTO payments
VALUES (DEFAULT, 5, 3, '2019-01-01', 200, 1);

DELETE FROM payments
WHERE payment_id IN (10,11);

/*74. Events--------------------------------------------------------------------------------------*/
-- A task (or block of SQL code) that gets executed according to a schedule. You can:
-- 		Copy data into another table, aggregate data, delete, etc.
-- [IMPORTANT]In order to run events, you must turn on MYSQL event scheduler
SHOW VARIABLES LIKE 'event%';
SET GLOBAL event_scheduler = ON;
DELIMITER $$
CREATE EVENT yearly_delete_stale_audit_rows
ON SCHEDULE
	-- AT '2019-05-01' <-- if you want to schedule 1 time, otherwise...
    EVERY 1 YEAR STARTS '2019-01-01' ENDS '2029-01-01'
DO BEGIN
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$
DELIMITER ;

/*75. Viewing, Dropping and Altering Events------------------------------------------------------*/
SHOW EVENTS;
DROP EVENT IF EXISTS yearly_delete_stale_audit_rows;
ALTER EVENT yearly_date_stale_audit_rows DISABLE; -- we can disable and enable events!
-- ALTER can be used to update/change events

/*76. Transactions------------------------------------------------------------------------------*/
-- A group of SQL statements that represent a single unit of work
-- Example:
-- 		What if? We insert an order and the database crashes? The order needs to also 
-- 		be inserted into the order_items table as well.. It will be incomplete 

-- Transaction Properties (ACID properties)
-- Atomicity, transactions are like atoms 'unbreakable' each transaction either...
			-- all executes successfuly or all fails together and rollback (undone)
-- Consistency, always consistent state
-- Isolation, transactions are isolated from each other. If they try to modify same data, the data 
			-- is locked and only one transaction can modify at a time.
-- Durability, once a transaction is committed the changes made are permanent.

/*77. Creating Transactions------------------------------------------------------------------------*/
USE sql_store;

START TRANSACTION;
INSERT INTO orders (customer_id, order_date, status)
VALUES (1, '2019-01-01', 1);
INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1, 1, 1);
COMMIT; -- when MYSQL sees this, it will write all the changes. If one of the changes fails
-- it will undo the changes which is rolled back

ROLLBACK; -- for transactions
SHOW VARIABLES LIKE 'autocommit'; -- when running a transaction, MySQL autocommits!

/*78. Concurrency and Locking----------------------------------------------------------------------*/
-- When two or more users try to access the same data at the same time. 
-- Execute line by line.
USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = points + 10
WHERE customer_id = 1;
-- MySQL will lock the data that you are accessing from other users until you commit
-- This is how it prevents other users from concurrently accessing the same data
-- it waits until it's done being accessed, it's like waiting in line.
COMMIT;
-- Default behavior is Lock until rows are not being accsesed.

/*79. Concurrency Problems------------------------------------------------------------------------*/
# Solved by using transaction isolation levels
-- 1) Lost Updates, when two transactions update the same wrong and the last one executed overrides
					-- the other one.
-- 2) Dirty Reads, transaction reads data that haven't been commited yet. For example:
			-- Trasact A updates customer's points to 20, Transact B reads the points to be 20.
            -- However, transact A rolledback. Which means transact B read data that wasn't true.
            -- Isolation is needed to solve this
            -- Isolation level (Read Committed)
-- 3) Non-Repeating Reads, when transact A's values get updated by Transact B, and data is read
			-- differently. We use isolation level (Repeatable Reads) to solve this
            -- Where the initial data is read the same regardless of updates.
-- 4) Phantom Reads, example: transact A is selecting customers that only have points 
			-- above 10 to be eligible for a discount. Transact B updates people's points
            -- to be higher than 10. This is a problem because now there are random customers
            -- all of a sudden to be qualified for the discount when they should not be at 
            -- the present time.
		-- Serializable Isolation Level (highest level) <- Can hurt performance tho
        
/*80. Transaction Isolation Levels----------------------------------------------------------------*/
-- Lowest Level (less locks)
-- 		Read Uncommitted
-- 		Read Committed
-- 		Repeatable Read
-- 		Serializable
-- Highest Level (more locks)
-- *The lower the level, the more access to concurrent users but more concurrency problems (better performance)
-- *The higher the level, the less concurrency but also less scalable (decreased performance)

SHOW VARIABLES LIKE 'transaction_isolation';
-- this shows the current isolation level
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; 
-- this will set the isolation level for the next transaction
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- this is setting for the session/connection
SET GLOBAL TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- this sets it for good.


/*85. Deadlocks--------------------------------------------------------------------------------------*/
-- A deadlock happens when different transactions cannot complete because each transaction holds
-- a lock that the other needs. SO they keep waiting for the other transaction.




/**DESIGNING DATABASES**/
/*93. Data Modeling---------------------------------------------------------------------------------*/
 # Analyze requirements
 # Build a Conceptual Model
		-- identifying relationships between entities
 # Build a Logical Model
		-- come up with a data structure for storing data (shows database and columns you need)
 # Build a Physical Model
		-- exact data types, default values of columns
        -- very specific

/*94. Conceptual Model---------------------------------------------------------------------------------*/
-- Represents the entities and relationships
-- 		1. ERD (Entity Relationship Diagram)
-- 		2. UML (Unified Modeling Language)

-- We will use ERD, tools are:
-- 		Microsoft Visio
-- 		Draw.io (mosh uses this)
-- 		LucidCharts

/*95. Logical Models---------------------------------------------------------------------------------*/
-- Refining the conceptual model to be more detailed (decide datastructure and columns)
		-- showing attributes datatypes like 'string'
        -- making columns more specific
        
/*96. Physical Models--------------------------------------------------------------------------------*/
-- You can build it in MySQL, it is not independent of database technology

/*97. Primary Keys-----------------------------------------------------------------------------------*/
-- used to uniquely identify a table
-- a composite primary key is using multiple columns to identify a table
-- A primary key should...
		-- not change
        -- be unique

/*101. 1NF-First Normal Form----------------------------------------------------------------------*/
-- Each cell should have a single value and we cannot have repeated columns
/* 102. Link Tables----------------------------------------------------------------------*/
/*103. 2NF-Second Normal Form----------------------------------------------------------------------*/
/*104. 3NF-Third Normal Form----------------------------------------------------------------------*/
