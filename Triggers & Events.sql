-- Triggers & Events- a trigger is a block of code that happens automaticaly when an Event happens. OOh it coded the same way as store procedures

delimiter $$
 create trigger employee_insert
  after insert on employee_salary
  for each row
 begin 
   insert into employee_demographics (employee_id, first_name, last_name)
   value ( new. employee_id, new. first_name, new. last_name );
 end $$
 delimiter ;

-- we now test it
insert into employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
values ( 13, 'Jacob', 'Nganouu', 'Entertainment', '1000000', null);

select *
from employee_salary;

select *
from employee_demographics;

-- Events- this are occurences that are scheduled to happen

delimiter $$
 create event delete_retirees
 on schedule every 30 second
 do
 begin
   delete 
   from employee_demographics
   where age >= 60;
 end $$
 delimiter ;


