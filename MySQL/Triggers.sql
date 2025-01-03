-- Triggers  and Events

select * from employee_demographics;

select * from employee_salary;

delimiter $$
create trigger employee_insert
  after insert on employee_salary
  for each row
begin
 insert into employee_demographics(employee_id,first_name,last_name)
 values (new.employee_id,new.first_name,new.last_name);
end $$
delimiter ;


insert into employee_salary(employee_id,first_name,last_name,occupation,salary,dep_id) values
  (13,'Jean-Ralphio','Saperstein','Exntertainment 720 CEO',1000000,null);


-- EVENTS


select * from employee_demographics;

delimiter $$
create event delete_retirees on schedule every 30 second
do 
begin
delete  from employee_demographics where age>=60;
end $$
delimiter ;

show variables like 'event%';