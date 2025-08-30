
-- WE will check out the differnce btwn Group by and Windows
-- grouop by
select gender, avg(salary) as avg_salary
from employee_demographics dem
join employee_salary sal
    on dem.employee_id = sal.employee_id
group by gender
;

-- window 
select dem.first_name, dem.last_name, gender, salary,
sum(salary) over(partition by gender order by dem.employee_id) as Rolling_Total
from employee_demographics dem
join employee_salary sal
    on dem.employee_id = sal.employee_id
;    

-- some fun uses of windows is with row num, rank, and dense rank, the diffence is in  how they present this rows.
select dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary asc) row_num,
rank() over(partition by gender order by salary asc) ranl_num,
dense_rank () over(partition by gender order by salary asc) dense_num
from employee_demographics dem
join employee_salary sal
    on dem.employee_id = sal.employee_id
;    
