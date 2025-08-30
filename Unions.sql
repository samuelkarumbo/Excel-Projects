-- joins (allows you to combine rows from different tables or same tables)

select first_name, last_name, 'old man' as label
from employee_demographics
where age > 45 and gender = 'male'
union
select first_name, last_name, 'old lady' as label
from employee_demographics
where age > 40 and gender = 'female'
union 
select first_name, last_name, 'Highly paid employee' as Label
from employee_salary
where salary >= 65000 
order by first_name, last_name
;
