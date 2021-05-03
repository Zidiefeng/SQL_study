-- ---------------------------------
-- identify primary key constraint
use Sales;
CREATE TABLE IF NOT EXISTS sales (
    purchase_number INT NOT NULL AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (purchase_number),
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
        ON DELETE CASCADE
);

-- can alter the table after create the table, for example
alter table Sales
add foreign key (customer_id) references customers(customer_id) on delete cascade;
-- to set foreign key, can right click table and do it without code

alter table sales
drop foreign key sales_ibfk_1;
drop table customers;

-- ---------------------------------
-- unique key constraint
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    firstname VARCHAR(225),
    email VARCHAR(225),
    UNIQUE KEY (email)
);

-- create unique key by alter
alter table customers
add unique key (email);

-- when remove unique key, must use "drop index", not "drop" 
-- since sql has no index, and unique column can use as index
alter table customers
drop index email;


-- ---------------------------------
-- default constraint
drop table customers;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    firstname VARCHAR(225),
    email VARCHAR(225),
    number_of_complaints INT DEFAULT 0,
    UNIQUE KEY (email)
);

-- by alter
alter table customers
change column number_of_complaints number_of_complaints int default 0;

-- to check table
insert into customers (customer_id,firstname,email)
values (31,'Jessy','ksun.com');

SELECT 
    *
FROM
    Sales.customers;




-- ---------------------------------
-- not null constraint
drop table customers;
CREATE TABLE companies (
    companies_id INT PRIMARY KEY,
    firstname VARCHAR(225),
    email VARCHAR(225) NOT NULL,
    number_of_complaints INT DEFAULT 0,
    UNIQUE KEY (email)
);

-- or by alter, this time not "change" but "modify" because it's not delete the constraint, but change the constraint
alter table companies 
modify email varchar(25) null;

-- or by alter, change 
alter table companies 
change  email email varchar(25) not null;

-- error for email is null
insert into companies (companies_id,firstname)
values (1,'microsoft');

-- none: entered by customer, null: returned by computer






