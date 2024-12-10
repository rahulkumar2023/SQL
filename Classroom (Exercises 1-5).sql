create table science_class (
Enrollment_no int,
Name varchar,
Science_Marks int);

insert into science_class values 
(1, 'Popeye', 33),
(2, 'Olive', 54),
(3, 'Brutus', 98);

copy science_class from 'C:\Users\navee\OneDrive\Documents\Programming Courses from Udemy\SQL Masterclass - SQL for Data Analytics\Section 4\Student.csv' delimiter ',' csv header;

select * from science_class;
select name from science_class where science_marks > 60;
select * from science_class where science_marks between 35 and 60;
select name from science_class where science_marks not between 35 and 60;

update science_class set science_marks = 45 where name = 'Popeye';
delete from science_class where name = 'Robb'
alter table science_class rename column name to student_name;

drop table science_class;