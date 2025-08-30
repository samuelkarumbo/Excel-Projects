-- Inner joins --
select dem. employee_id,dem. first_name, sal.occupation
from employee_demographics as dem
inner join employee_salary as sal
  on dem. employee_id= sal. employee_id
;

-- outter joins
select *
from employee_demographics as dem
left join employee_salary as sal
  on dem. employee_id= sal. employee_id
;

select *
from employee_demographics as dem
right join employee_salary as sal
  on dem. employee_id= sal. employee_id
;

-- self join
select dem1. employee_id, dem1.first_name as fisrt_name_santa, dem1. last_name as last_name_santa,
dem2. employee_id, dem2.first_name , dem2. last_name 
from employee_demographics as dem1
join employee_demographics as dem2
  on dem1. employee_id+2=dem2. employee_id
;

-- joining multiple tables

select *
from employee_demographics as dem
inner join employee_salary as sal
  on dem. employee_id= sal. employee_id
  inner join parks_departments
    on sal. dept_id = department_id
;

select *
from parks_departments