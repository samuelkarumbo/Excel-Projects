-- we use the function WITH to create a CTE(Common Table Expression)

with CTE_example as (
 select gender, avg (salary) avg_salary, max(salary) max_salarary, min(salary) min_salary, count(salary) count_salary
  from employee_demographics dem
  join employee_salary sal
     on dem.employee_id= sal.employee_id
  group by gender
)
select avg (avg_salary)
from CTE_example
;