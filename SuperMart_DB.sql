select * from customer;
select * from product;
select * from sales;

select * from customer where city in ('Philadelphia', 'Seattle');
select * from customer where city = 'Philadelphia' or city = 'Seattle';

\* Between */
select * from customer where age between 20 and 30;
select * from customer where age >= 20 and age <= 30;
select * from customer where age not between 20 and 30;
select * from sales where ship_date between '2015-04-01' and '2016-04-01';

/* Multi
Line Comments
*/
--Single Line Comments
/* Like Commands */
select * from customer where customer_name like 'J%';
select * from customer where customer_name like '%Nelson%';
select * from customer where customer_name like '____ %';
select distinct city from customer where city not like 'S%';

select distinct city from customer where region in ('North', 'East');
select * from sales where sales between 100 and 500;
select customer_name from customer where customer_name like '% ____';

/* Multi
Line Comments
*/
-- Single Line Comment
/* Order by Commands */

select * from customer where state = 'California' order by customer_name;
select * from customer where state = 'California' order by customer_name desc;
select * from customer order by city asc, customer_name desc;
select * from customer order by 2 asc;
select * from customer order by age desc;

/*LIMIT*/
select * from customer where age > 25 order by age desc limit 8;
select * from customer where age > 25 order by age asc limit 10;

select * from sales where discount > 0 order by discount desc;
select * from sales where discount > 0 order by discount desc limit 10;

/*AS*/
select customer_id as "Serial Number", customer_name as name, age as customer_age from customer;

/* Count */
select * from sales;

select count(*) from sales;
select count(order_id) as "Number of PRoducts ordered", count(distinct order_id) as "Number of Orders" from sales where customer_id = 'CG-12520';

/* Sum */
select sum(profit) as "Total_Profit" from sales;
select sum(quantity) as "Total_Quantity" from sales where product_id = 'FUR-TA-10000577';

/* Average */
select avg(age) as "Average Customer age" from Customer;
select avg(sales * .10) as "Average Commision Value" from Sales;

/* Min - Max*/
select min(sales) as "Minimum sales value june 15" 
from sales 
where order_date between '2015-06-01' and '2015-06-30';
select sales
from sales 
where order_date between '2015-06-01' and '2015-06-30' order by sales desc;
select max(sales) as "Maximum sales value june 15" 
from sales 
where order_date between '2015-06-01' and '2015-06-30';

select sum(sales) from sales;
select count(*) from customer where age between 20 and 30;
select avg(age) from customer where region = 'East';
select min(age) as min_age, max(age) as max_age from customer where city = 'Philadelphia';

/*Group By*/
select * from customer;

select region, state, avg(age) as age, count(customer_id) as customer_count from customer group by region, state;
select product_id, sum(quantity) as quantity_sold from sales group by product_id order by quantity_sold desc;
select customer_id, min(sales) as minimum_sales, max(sales) as max_sales, avg(sales) as average_sales, sum(sales) as total_sales
from sales group by customer_id
order by total_sales desc
limit 5;

/* Having */
select region, count(customer_id) as customer_count from customer group by region having count(customer_id) > 200;
select region, count(customer_id) as customer_count from customer where customer_name like 'A%' group by region;
select region, count(customer_id) as customer_count from customer where customer_name like 'A%' group by region having count(customer_id) > 15;

select product_id, sum(sales) as Total_sales, sum(quantity) as total_quantity, count(order_id) as total_order, max(sales) as max_sales, min(sales) as min_sales, avg(sales) as avg_sales from sales group by product_id order by total_sales desc;
select product_id, sum(quantity) as total_quantity from sales group by product_id having sum(quantity) > 10;

select *, case
when age < 30 then 'Young'
when age > 60 then 'Senior Citizen'
else 'Middle Aged'
end as Age_category
from customer;

/*Joins*/
/* Creating sales table of year 2015 */
create table sales_2015 as select * from sales where ship_date between '2015-01-01' and '2015-12-31';
select count(*) from sales_2015; --2131
select count(distinct customer_id) from sales_2015;--578
/* Customers with age between 20 and 60 */
create table customer_20_60 as select * from customer where age between 20 and 60;
select customer * from customer_20_60;-- 597

/* Inner Joins*/
select customer_id from sales_2015 order by customer_id;
select customer_id from customer_20_60 order by customer_id;

select
a.order_line,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
from sales_2015 as a
inner join customer_20_60 as b
on a.customer_id = b.customer_id
order by customer_id;

/* Left Join*/
select customer_id from sales_2015 order by customer_id;
select customer_id order by customer_20_60 order by customer_id;
/* AA-10315 not present in customer_20_60 table
AA-10375 present in both
AA-10480 not present in sales_2015 table */

select a.order_line,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
from sales_2015 as a
left join customer_20_60 as b
on
a.customer_id = b.customer_id
order by customer_id;

/*Right Join*/
select customer_id from sales_2015 order by customer_id;
select customer_id order by customer_20_60 order by customer_id;
/* AA-10315 not present in customer_20_60 table
AA-10375 present in both
AA-10480 not present in sales_2015 table */

select a.order_line,
a.product_id,
b.customer_id,
a.sales,
b.customer_name,
b.age
from sales_2015 as a
right join customer_20_60 as b
on
a.customer_id = b.customer_id
order by customer_id;

/* Full Outer Join*/
select customer_id from sales_2015 order by customer_id;
select customer_id order by customer_20_60 order by customer_id;
/* AA-10315 not present in customer_20_60 table
AA-10375 present in both
AA-10480 not present in sales_2015 table */

select a.order_line,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age,
b.customer_id
from sales_2015 as a
full join customer_20_60 as b
on
a.customer_id = b.customer_id
order by a.customer_id, b.customer_id;

/* Cross Join */
create table month_values (MM integer);
create table year_values (YYYY integer);
insert into month_values values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12);
insert into year_values values (2011), (2012), (2013), (2014), (2015), (2016), (2017), (2018), (2019);
select * from month_values;
select * from year_values;

select a.YYYY, b.MM
from year_values as a, month_values as b
order by a.YYYY, b.MM;

select customer_id from sales_2015
intersect
select customer_id from customer_20_60;

/* Except*/
select customer_id from sales_2015 order by customer_id;
select customer_id order by customer_20_60 order by customer_id;
/* AA-10315 not present in customer_20_60 table
AA-10375 present in both
AA-10480 not present in sales_2015 table */

select customer_id from sales_2015
except
select customer_id from customer_20_60
order by customer_id;

/* Union*/
/* AA-10315 not present in customer_20_60 table
AA-10375 present in both
AA-10480 not present in sales_2015 table */

select customer_id from sales_2015
union
select customer_id from customer_20_60
order by customer_id;

select b.state,
sum(sales) as total_sales
from sales_2015 as a
left join customer_20_60 as b
on
a.customer_id = b.customer_id
group by b.state;

select a.*,
sum(b.sales) as total_sales,
sum(quantity) as total_quantity
from product as a
left join sales as b
on
a.product_id = b.product_id
group by a.product_id;

/* Subquery */
select * from sales
where customer_id in (select customer_id from customer where age > 60);
select a.product_id,
a.product_name,
a.category,
b.quantity
from product as a
left join (select product_id, sum(quantity) as quantity from sales group by product_id) as b
on
a.product_id = b.product_id
order by b.quantity desc;
select customer_id, order_line, (select customer_name from customer where customer.customer_id = sales.customer_id)
from sales
order by customer_id;

select c.customer_name, c.age, sp.* 
from customer as c
right join (select s.*, p.product_name, p.category
from sales as s
left join product as p
on
s.product_id = p.product_id) as sp
on
c.customer_id = sp.customer_id;

/* Views */
create view logistics as
select a.order_line, a.order_id, b.customer_id, b.city, b.state, b.country
from sales as a
left join customer as b
on
a.customer_id = b.customer_id
order by a.order_line;
select * from logistics;
drop view logistics;

/* Index */
create index mon_idx
on month_values(MM);
drop index if exists mon_idx;

create view Daily_Billing as
select order_line, product_id, sales, discount
from sales as a
where order_date in (select max(order_date) from sales);
drop view Daily_Billing;

/* String functions */
select customer_name, length(customer_name) as characters_num
from customer
where length(customer_name) > 15;

select upper('Start-Tech Academy');
select lower('Start-Tech Academy');

select customer_name, country,
replace (lower(country), 'united states', 'US') as country_new
from customer;

select trim(leading ' ' from '   Start-Tech Academy    ');
select trim(trailing ' ' from '   Start-Tech Academy    ');
select trim(both ' ' from '   Start-Tech Academy    ');
select trim( '   Start-Tech Academy    ');
select rtrim( '   Start-Tech Academy    ', ' ');
select ltrim( '   Start-Tech Academy    ', ' ');

select customer_name, city||' , '||state||' , '||country as address
from customer;

select customer_id, customer_name,
substring(customer_id for 2) as cust_group
from customer
where substring(customer_id for 2) = 'AB';
select customer_id, customer_name,
substring(customer_id from 4 for 5) as customer_num
from customer
where substring(customer_id for 2) = 'AB';

select * from sales order by order_id;
select order_id, string_agg(product_id, ', ')
from sales
group by order_id
order by order_id;

select max(length(product_name)) from product;
select product_name, sub_category, category, (product_name||','||sub_category||','||category) as product_details
from product;
select product_id,
substring(product_id for 3) as category_short,
substring(product_id for 2 from 5) as sub_short,
substring(product_id from 8) as id
from product;
select string_agg(product_name,',')
from product
where sub_category in ('Chairs','Tables');

/* Mathematical functions */
select * from sales;

select order_line, sales, ceil(sales), floor(sales) from sales;

/* Random */
/* a = 10
   b = 50 */
select random(), random() * 40 + 10, floor(random() * 40) + 10;

select setseed(0.5);
select random(); -- 0.520928
select random(); -- 0.235656
select setseed(0.5);
select random();
select random();

/* Round */
select order_line, sales, round(sales) from sales order by sales desc;

/* Power */
select power(age, 2), age from customer;

select customer_id, random() as rand_n from customer order by rand_n limit 5;
select sum(ceil(sales)) as higher_int_sales, sum(floor(sales)) as lower_int_sales, sum(round(sales)) as round_int_sales from sales;

/* Date */
select current_date, current_time, current_time(1), current_time(3), current_timestamp;

select age('2018-12-27', '2017-06-03');
select order_line, ship_date, order_date, age(ship_date,order_date) as time_taken
from sales
order by time_taken desc;

select extract(day from current_date);
select current_timestamp, extract(hour from current_timestamp);
select order_date, ship_date, extract (epoch from (ship_date-order_date)) 
from sales;
select order_date, ship_date, (extract (epoch from ship_date)) - (extract (epoch from order_date)) as sec_taken 
from sales;

select age(current_date, '1939-04-06');
select extract(month from order_date) as month_n, sum(sales) as total_sales
from sales
where product_id in (select product_id from product where sub_category = 'Chairs')
group by month_n
order by month_n;

create table users(id serial primary key, name character varying);
insert into users (name) VALUES ('Alex'), ('Jon Snow'), ('Christopher'), ('Arya'),('Sandip Debnath'), ('Lakshmi'),('alex@gmail.com'),('@sandip5004'), ('lakshmi@gmail.com');

/* Pattern matching using Regular Expressions */
select * from customer
where customer_name ~* '^a([a-z\s]+)$';
select * from customer
where customer_name ~* '^(a|b|c|d)[a-z\s]+$'
select * from customer
where customer_name ~* '^(a|b|c|d)[a-z]{3}\s[a-z]{4}$';
select * from users;
select * from users
where name ~* '[a-z0-9\.\-\_]+@[a-z0-9\-]+\.[a-z]{2,5}';

select * from customer
where customer_name ~* '^[a-z]{5}\s(a|b|c|d)[a-z]{5}';
create table zipcode(zip varchar);
insert into zipcode values('234432'), ('23345'), ('sdfe4'), ('123&3'), ('67424'), ('7895432'), ('12312');
select * from zipcode
where zip ~* '^[1-9]{5,6}';

select * from customer limit 10;
select * from sales limit 10;
select a.*, b.order_num, b.quantity_tot, b.profit_tot
from customer as a
left join (select customer_id, count(distinct order_id) as order_num, sum(sales) as sales_tot, sum(quantity) as quantity_tot, sum(profit) as profit_tot
		   from sales
		   group by customer_id)
as b
on a.customer_id = b.customer_id;
create table customer_order as (select a.*, b.order_num, b.quantity_tot, b.profit_tot
from customer as a
left join (select customer_id, count(distinct order_id) as order_num, sum(sales) as sales_tot, sum(quantity) as quantity_tot, sum(profit) as profit_tot
		   from sales
		   group by customer_id)
as b
on a.customer_id = b.customer_id);
select * from customer_order;
select * from 
(select customer_id, customer_name, state, order_num, 
row_number() over (partition by state
order by order_num desc)
as row_n
from customer_order)
as a
where a.row_n <= 3;

select customer_id, customer_name, state, order_num, 
row_number() over (partition by state order by order_num desc) as row_n,
rank() over (partition by state order by order_num desc) as rank_n,
dense_rank() over (partition by state order by order_num desc) as d_rank_n
from customer_order;

select * from
(select customer_id, customer_name, state, order_num, 
row_number() over (partition by state order by order_num desc) as row_n,
rank() over (partition by state order by order_num desc) as rank_n,
dense_rank() over (partition by state order by order_num desc) as d_rank_n,
ntile(5) over (partition by state order by order_num desc) as tile_n
from customer_order)
as a
where a.tile_n = 5;

select * from customer_order;
select customer_id, customer_name, state, profit_tot as profit,
avg(profit_tot) over (partition by state) as avg_profit
from customer_order;
-- Customer with less than avg profit
select * from
(select customer_id, customer_name, state, profit_tot as profit,
avg(profit_tot) over (partition by state) as avg_profit
from customer_order)
as a 
where a.profit < a.avg_profit;

-- Count
select Customer_id, customer_name, state,
count(customer_id) over (partition by state) as count_cust
from customer_order;

--- Total
select * from sales;
create table order_rollup as
select order_id, 
max(order_date) as order_date,
max(customer_id) as customer_id,
sum(sales) as sales
from sales
group by order_id;
create table order_rollup_state as
select a.*, b.state
from order_rollup as a
left join customer as b
on a.customer_id = b.customer_id;
select * from order_rollup_state;
select *,
sum(sales) over (partition by state) as sales_state_total
from order_rollup_state;

select *,
sum(sales) over (partition by state) as sales_state_total,
sum(sales) over (partition by state order by order_date) as running_total
from order_rollup_state;

select customer_id, order_date, order_id, sales,
lead(sales, 1) over(partition by customer_id order by order_date) as previous_sales,
lead(order_id, 1) over(partition by customer_id order by order_date) as previous_order_id
from order_rollup_state;

create table emp_name (
S_no int,
First_name varchar(255),
Middle_name varchar(255),
Last_name varchar(255));
insert into emp_name (S_No, First_name, Middle_name, Last_name) values (1, 'Paul', 'Van',  'Hugh');
insert into emp_name (S_No, First_name,              Last_name) values (2, 'David',         'Flashing');
insert into emp_name (S_No,             Middle_name, Last_name) values (3,          'Lena', 'Radford');
insert into emp_name (S_No, First_name,              Last_name) values (4, 'Henry',         'Goldwyn');
insert into emp_name (S_No,                          Last_name) values (5,                  'Holden');
insert into emp_name (S_No, First_name, Middle_name, Last_name) values (6, 'Erin',  'T',    'Mull');
select * from emp_name;
select *, 
coalesce(first_name,middle_name,last_name) as name_corr,
concat(first_name,middle_name,last_name) from emp_name;

select order_date, ship_date, (extract(epoch from ship_date) - (extract(epoch from order_date))) as sec_taken
from sales;
/* Conversion */
select sales, 'Total sales value for this order is  '|| to_char(sales, '$9,999.99') as message
from sales;
select order_date, to_char(order_date, 'MONTH DAY YY')
from sales;

select to_date('2019\01\15', 'YYYY\MM\DD');
select to_date('20122018', 'DDMMYYYY')
select to_number('2845.876', '9999.999');
select to_number('$2,845.876', 'L9,999.999');

from sales,
group by order_id,
order by order_id;
/* Access Control */
create user startech
with password 'academy';
grant select, update, insert, delete on product to startech;
revoke delete on product from startech;
drop user startech;
revoke all on product from startech;
select * from pg_user;
select distinct * from pg_stat_activity;

create tablespace newspace location 'C:\Users\navee\OneDrive\Documents\Programming Courses from Udemy\SQL Masterclass - SQL for Data Analytics\Section 24';
create table customer_test (f int) tablespace NewSpace;
select * from pg_tablespace;

select * from customer_20_60;
truncate table customer_20_60;

explain select * from customer;
explain select distinct * from customer;

create schema test;
create table test.customer as select * from customer;