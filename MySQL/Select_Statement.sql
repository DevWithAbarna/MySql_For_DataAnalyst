select * from park_and_recreation.employee_demographics;

select first_name,last_name,birth_date, age,age+10 from park_and_recreation.employee_demographics;

#PEMDAS
select first_name,last_name,birth_date, age,(age+10)*10 from park_and_recreation.employee_demographics;

select gender from park_and_recreation.employee_demographics;

select  distinct gender from park_and_recreation.employee_demographics;