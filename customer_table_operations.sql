create table Customer_table (
Cust_id int,
First_name varchar,
Last_name varchar,
age int,
email_id varchar);

insert into customer_table values
(1, 'bee', 'cee', 32, 'bc@xyz.com');

insert into customer_table (cust_id,first_name,age,email_id) values
(2, 'dee', 23, 'd@xyz.com');

insert into customer_table values
(3, 'ee', 'ef', 27, 'ef@xyz.com'),
(4, 'gee', 'eh', 35, 'gh@xyz.com');

copy customer_table from 'C:\Users\navee\OneDrive\Documents\Programming Courses from Udemy\SQL Masterclass - SQL for Data Analytics\Section 4\copy.csv' delimiter ',' csv header;

copy customer_table from 'C:\Users\navee\OneDrive\Documents\Programming Courses from Udemy\SQL Masterclass - SQL for Data Analytics\Section 4\copytext.txt' delimiter ',';

select first_name from customer_table;

select first_name, last_name from customer_table;

select * from customer_table;

select distinct first_name from customer_table;
select first_name from customer_table;

select distinct first_name, age from customer_table;

select distinct * from customer_table;

copy customer_table from 'C:\Users\navee\OneDrive\Documents\Programming Courses from Udemy\SQL Masterclass - SQL for Data Analytics\Section 4\copy.csv' delimiter ',' csv header;

select * from customer_table;
select distinct * from customer_table;

select distinct first_name from customer_table where age > 25;

select * from customer_table where first_name = 'Gee';

select first_name, last_name, age from customer_table where age > 20 and age < 30;

select first_name, last_name, age from customer_table where age < 20 or age >= 30;

select * from customer_table where not age = 25;
select * from customer_table where not age = 25 and not first_name = 'Jay';

select * from customer_table where cust_id = 2;
update customer_table set last_name = 'Pe', age = 17 where cust_id = 2;

select * from customer_table;
update customer_table set email_id = 'gee@xyz.com' where first_name = 'Gee' or first_name = 'gee';

delete from customer_table where cust_id = 6;
select * from customer_table;

delete from customer_table where age > 30;

delete from customer_table;

select * from customer_table;

alter table customer_table add test varchar(255);

alter table customer_table drop test;

alter table customer_table drop column test;

alter table customer_table alter column age type varchar(255);

alter table customer_table rename email_id to customer_email;

alter table customer_table alter column cust_id set not null;

insert into customer_table (first_name, last_name, age, customer_email) values
('aa', 'bb', 25, 'ab@xyz.com')

alter table customer_table alter column cust_id drop not null;

alter table customer_table add constraint cust_id check (cust_id > 0);

insert into customer_table values (-1, 'cc', 'dd', 67, 'cd@xyz.com');

alter table customer_table add primary key (cust_id);

delete from customer_table;

insert into customer_table values (1, 'c', 'dd', 67, 'cd@xyz.com');
select * from customer_table;

alter table customer_table add primary key (cust_id);
