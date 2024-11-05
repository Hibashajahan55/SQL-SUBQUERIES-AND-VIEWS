-- Subqueries and Views
-- PART 1
-- Consider the Country table and Persons table that you created earlier and perform the following:

use entri;
DESC country;
DESC persons;
select * from country;
select * from persons;

-- 1. Find the number of persons in each country. 
SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name;

-- 2. Find the number of persons in each country sorted from high to low. 
SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name
ORDER BY Number_of_Persons DESC;

-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
SELECT Country_name, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

-- 4. Find the countries with the same rating as the USA. (Use Subqueries) 
SELECT DISTINCT Country_name
FROM Persons
WHERE Rating IN (SELECT Rating FROM Persons WHERE Country_name = 'USA');

-- 5. Select all countries whose population is greater than the average population of all nations. 
SELECT Country_name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

-- -- PART 2 :
/*Create a database named Product and create a table called Customer with the following fields in the Product database
: Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country 
*/
-- Create a database named Product 
CREATE DATABASE Product;
USE Product;

-- create a table called Customer
-- fields in the Product database: Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country 
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);
DESC customer;

-- INSERT VALUES IN TO CUSTOMER TABLE
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
    (1, 'John', 'Jacob', 'johnjacob@example.com', '1234567890', '123 Elm St', 'New York', 'New York', '10001', 'US'),
    (2, 'Annie', 'Smith', 'Anniesmith@example.com', '0987654321', '456 Oak St', 'Los Angeles', 'California', '90001', 'US'),
    (3, 'Michael', 'Johnson', 'mjohnson@example.com', '2345678901', '789 Pine St', 'Chicago', 'Illinois', '60601', 'US'),
    (4, 'Emily', 'Cooper', 'Emilycooper@example.com', '3456789012', '101 Maple Ave', 'Melbourne', 'Victoria', '77001', 'Australia'),
    (5, 'William', 'Joe', 'williamj@example.com', '4567890123', '202 Birch Rd', 'Mumbai', 'Maharashtra', '75201', 'India'),
    (6, 'Linda', 'Wilson', 'lwilson@example.com', '5678901234', '303 street', 'Vancouver', 'British Columbia', '19101', 'Canada'),
    (7, 'Jaime', 'Taylor', 'jtaylor@example.com', '6789012345', '404 Walnut Ln', 'San Diego', 'California', '92101', 'US'),
    (8, 'Basim', 'jass', 'bjass@example.com', '7890123456', '505 Ash Dr', 'Dallas', 'Texas', '75201', 'US'),
    (9, 'Robert', 'Andy', 'robert@example.com', '8901234567', '606 Spruce Ct', 'San Francisco', 'California', '94101', 'US'),
    (10, 'Patty', 'Thomas', 'pthomas@example.com', '9012345678', '707 Redwood St', 'Bangalore', 'Karnataka', '73301', 'India');

SELECT * FROM customer;
-- 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email
FROM Customer;

-- perform the SELECT operation for the customer_info view
SELECT * FROM customer_info;

-- 2. Create a view named US_Customers that displays customers located in the US. 
CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'US';

-- perform the SELECT operation for the US_Customers view
SELECT * FROM US_Customers;

-- 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email,Phone_no,State
FROM Customer;

-- perform the SELECT operation for the Customer_details view
SELECT * FROM Customer_details;

-- 4. Update phone numbers of customers who live in California for Customer_details view. 
set sql_safe_updates =0;

-- Update specific phone numbers based on customer IDs
UPDATE Customer_details
SET phone_no = '1234567890' 
WHERE state = 'California';

-- perform the SELECT operation for the Customer_details view
SELECT * FROM Customer_details;
-- 5. Count the number of customers in each state and show only states with more than 5 customers. 
SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

-- 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer_details
GROUP BY State;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
SELECT *
FROM Customer_details
ORDER BY State ASC;

