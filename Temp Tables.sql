-- Temporary tables are tables that are only avaible during the sessesions they are created on
-- first way of making a Temporary table

create temporary table temp_table
( first_name varchar (50),
       last_name varchar (50),
       gender varchar(50)
);

insert into temp_table
values ('samuel', 'Ndungu', 'male');

select *
from temp_table;
-- Now the most useful way of using temp tables is by creating them of existing tables in order to perform more complex queries on them without affecting the original tables

create temporary table salary_over_50k
select *
from employee_salary
where salary >= 50000;
select *
from salary_over_50k;

