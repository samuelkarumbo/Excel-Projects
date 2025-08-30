-- Group by --



select gender, min(age), max(salary), count(age)
from employee_demographics, employee_salary
group by gender, salary
;


select occupation, salary
from employee_salary
group by occupation, salary
;


-- Order by

select *
from employee_demographics
order by first_name desc
;

select age, max(salary)
from employee_demographics, employee_salary
group by age, salary
order by age desc
;






