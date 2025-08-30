-- Limit 
select *
from employee_demographics
order by age desc
limit 5, 2
;

-- Aliasing
select gender, avg(age) as avg_age
from employee_demographics
group by gender
having avg_age >= 40
;
