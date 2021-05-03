-- two ways to create a schema (=database)
create schema if not exists b;
create database if not exists Sales;

-- tell sql what schema to use
use Sales;
-- or directly use Sales.customers each time

-- create a table
-- must have at least one column inside table
create table if not exists sales
( #INT #NOT NULL #PRIMARY KEY # AUTO_INCREMENT:automatically create 1,2,3,4,5……
	purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    #as foreign key, identify whether 1 to money, or 1 to 1, or many to many by "not null"
    item_code VARCHAR(10) NOT NULL);
    
-- delete entire table
drop table sales;


    

