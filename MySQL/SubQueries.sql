-- Sub Queries

SELECT * FROM park_and_recreation.employee_demographics
  where employee_id in (select employee_id  from park_and_recreation.employee_salary where dep_id=1);


select first_name,salary ,(select avg(salary) from park_and_recreation.employee_Salary) 
     from park_and_recreation.employee_salary;


SELECT gender,avg(age),max(Age),count(age) FROM park_and_recreation.employee_demographics group by gender;

select gender, avg(`max(Age)`) 
from
 (SELECT gender,avg(age),max(Age),count(age) FROM park_and_recreation.employee_demographics group by gender) 
 as Agg_table group by gender;

select   AVG(max_age) from
 (SELECT gender,avg(age) as avg_age,max(age) as max_age,min(age) as min_age,count(age) 
 FROM park_and_recreation.employee_demographics group by gender) 
 as Agg_table ;

