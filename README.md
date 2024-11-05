# SUBQUERIES AND VIEWS
## Database Project: Country, Persons, and Customer Tables
## INTRODUCTION
This project aims to design and manage a relational database using SQL, featuring three main tables (Country, Persons, and Customer) along with several views and queries to manipulate and retrieve data efficiently. The project helps reinforce key SQL concepts such as creating tables, using foreign keys, performing aggregate functions, creating views, and running subqueries.
## TABLE STRUCTURE
#### Country Table:
##### Fields:
* Id: Integer, Primary Key
* Country_name: VARCHAR(50)
* Population: BIGINT
* Area: Integer
#### Persons Table:
##### Fields:
* Id: Integer, Primary Key
* Fname: VARCHAR(50)
* Lname: VARCHAR(50)
* Population: BIGINT
* Rating: DECIMAL(3, 2)
* Country_Id: Integer, Foreign Key (references Country.Id)
* Country_name: VARCHAR(50)
#### Customer Table (in Product database):
##### Fields:
* Customer_Id: Integer, Primary Key
* First_name: VARCHAR(50)
* Last_name: VARCHAR(50)
* Email: VARCHAR(100)
* Phone_no: VARCHAR(15)
* Address: VARCHAR(100)
* City: VARCHAR(50)
* State: VARCHAR(50)
* Zip_code: VARCHAR(10)
* Country: VARCHAR(50)
## TASKS
### PART 1 :Querying Country and Persons Tables
1. Find the number of persons in each country.
2. Find the number of persons in each country sorted from high to low.
3. Find out an average rating for Persons in respective countries if the average is greater than 3.0
4. Find the countries with the same rating as the USA. (Use Subqueries)
5. Select all countries whose population is greater than the average population of all nations
### PART2 :Working with the Customer Table and Views
1. Create Views:

* customer_info: Displays customer’s full name (combining First_name and Last_name) and Email.
* US_Customers: Shows all customers located in the US.
* Customer_details: Displays full name, email, phone number, and state of each customer.

 2. Perform Queries Using Views:
* Update California Customers' Phone Numbers
* Count Customers by State (Filter States with >5 Customers):
* Count Customers by State in Customer_details
* Sort Customer_details by State in Ascending Order:

## CONCLUSION
This project illustrates the power of relational databases and SQL in organizing and analyzing complex data sets. Through designing tables, implementing foreign keys, and creating views, the project demonstrates efficient ways to manage demographic and customer data. The SQL queries cover various operations like counting, sorting, filtering, and subqueries, making this project a comprehensive example of essential database operations for real-world applications.
