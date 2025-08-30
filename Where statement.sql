-- where statement
select * 
from employee_demographics
where first_name = 'April';

select * 
from employee_salary
where salary <=50000;

select * 
from employee_demographics
where gender != 'female';

select * 
from employee_demographics
where birth_date >= '1986-04-03';


-- AND OR NOT LOGICAL OPERATORS--
select * 
from employee_demographics
where birth_date >= '1986-04-03'
or not gender = 'male'
;


-- like statement  we will use %(which means everything after or before) and _ (which specifies teh charcters after or before)--
select *
from employee_demographics
where first_name like 'a%' 
;

select *
from employee_demographics
where first_name like '_er__' 
;

select *
from employee_demographics
where first_name like 'a__%' 
;


