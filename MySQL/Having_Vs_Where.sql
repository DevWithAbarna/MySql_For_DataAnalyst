-- HAVING Vs WHERE

Select gender, avg(age) from park_and_recreation.employee_demographics group by gender  having avg(age)< 40 ;

 select occupation ,avg(salary)  from park_and_recreation.employee_salary  where occupation like'%manager%' 
 group by occupation having avg(Salary)>75000;
 
 
 