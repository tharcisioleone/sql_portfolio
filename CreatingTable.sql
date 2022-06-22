/* Author: Tharcisio Leone */
/* Database: sales */


/* 1. CREATING TABLES */
-- Creating a new table
CREATE TABLE product_table (
product_id SERIAL PRIMARY KEY, -- Column must contain UNIQUE values and cannot contain NULL values.
product_name VARCHAR(50) UNIQUE NOT NULL, -- Column cannot accept NULL values.
price NUMERIC(5,2) NOT NULL CHECK(price>0), -- Price should be higher than 0
quantity INT,
storage_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP) -- Holding the combination of date and time.

-- Inserting the values into the new table
INSERT INTO product_table (
product_name, price, quantity)
VALUES
('Laptop',599,10),
('Deak',299,5),
('Chair',150,3)
	
-- Showing the new table with the values
SELECT * FROM product_table




/* 2. IMPORTING TABLES */

-- Creating Table
CREATE TABLE sales (
id int,
quantity int,
price numeric(5,2))

-- Showing Table (with no values)
SELECT * FROM sales

-- Importing .csv file with the values
--> Schemas - Table - sales - Import/Export --> Import
SELECT * FROM sales
