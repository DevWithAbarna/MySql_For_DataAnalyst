-- Unions
select first_name ,last_name from park_and_recreation.employee_demographics union  
   select first_name ,last_name from park_and_recreation.employee_salary;
   
select first_name ,last_name from park_and_recreation.employee_demographics union distinct  
   select first_name ,last_name from park_and_recreation.employee_salary;

select first_name ,last_name from park_and_recreation.employee_demographics union  all
   select first_name ,last_name from park_and_recreation.employee_salary;
   
select first_name,last_name ,'Old Lady' as Label from park_and_recreation.employee_demographics where age>40  and gender='Female'
  union
  select first_name,last_name ,'Old Men' as Label from park_and_recreation.employee_demographics where age>40 and gender='Male'
  union
  select first_name,last_name ,'Hihgly Paid EMployee' as Label from park_and_recreation.employee_salary where salary>70000 order by first_name,last_name;




