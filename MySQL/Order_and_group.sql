-- GROUP BY

SELECT * FROM park_and_recreation.employee_demographics ;

SELECT gender FROM park_and_recreation.employee_demographics  Group by gender;

SELECT gender,avg(age), MAX(age) ,MIN(age),count(age) from park_and_recreation.employee_demographics  Group by gender;

select occupation ,salary from park_and_recreation.employee_salary group by occupation,Salary;

--	ORDER BY
SELECT * FROM park_and_recreation.employee_demographics ORDER BY first_name DESC;

SELECT * FROM park_and_recreation.employee_demographics ORDER BY gender ,age DESC;

select * from park_and_recreation.employee_demographics order by 5,4
