-- Store Procedure

select * from employee_salary where salary>=50000;

create procedure large_salary()
 select * from employee_salary where Salary>=50000;
 
 call large_salary2();
 
 call park_and_recreation.large_salary();
 
 delimiter $$
 create procedure large_salary2()
 begin
 select * from employee_salary where Salary>=50000;
 select * from employee_salary where Salary>=10000;
 end $$
 delimiter ;
 
  delimiter $$
 create procedure large_salary3(e_id int)
 begin
 select Salary from employee_salary where employee_id=e_id;
 end $$
 delimiter ;
 
 call large_salary3(1)
 
 
 