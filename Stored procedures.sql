-- stored procedures- this is ode/queries we can store and call over and over. Really ysefull stuff

create procedure large_salaries ()
select *
from employee_salary
where salary >= 50000
;

call large_salaries();
-- Inoreder to use this better so that it can handle more than one query in it. We introduce our ow delimeter(tell sql we are ending aquery here like ;)
delimiter $$
create procedure large_salaries3 ()
begin
select *
from employee_salary
where salary >= 50000;

select *
from employee_salary
where salary >= 10000;
end $$
delimiter ;

call large_salaries3 ()

-- we can also add parameters to it
delimiter $$
create procedure large_salaries4 (employee_id_param int)
begin
select *
from employee_salary
where employee_id = employee_id_param;
end $$
delimiter ;

call large_salaries4 (1);


