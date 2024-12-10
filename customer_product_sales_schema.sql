create table customer (
customer_id varchar primary key,
customer_name varchar,
segment varchar,
age int,
country varchar,
city varchar,
state varchar,
postal_code bigint,
region varchar);
	
create table product (
product_id varchar primary key,
category varchar,
sub_category varchar,
product_name varchar);
	
create table sales (
order_line int primary key,
order_id varchar,
order_date date,
ship_date date,
ship_mode varchar,
customer_id varchar,
product_id varchar,
sales numeric,
quantity int,
discount numeric,
profit numeric);

select * from customer;

copy customer from 'C:\Users\navee\OneDrive\Documents\Programming Courses from Udemy\SQL Masterclass - SQL for Data Analytics\Section 2\SQL Masterclass_ SQL for Data Analytics\Data\Customer.csv' CSV header ;

copy product from 'C:\Users\navee\OneDrive\Documents\Programming Courses from Udemy\SQL Masterclass - SQL for Data Analytics\Section 2\SQL Masterclass_ SQL for Data Analytics\Data\Product.csv' CSV header ;

copy sales from 'C:\Users\navee\OneDrive\Documents\Programming Courses from Udemy\SQL Masterclass - SQL for Data Analytics\Section 2\SQL Masterclass_ SQL for Data Analytics\Data\Sales.csv' CSV header ;
