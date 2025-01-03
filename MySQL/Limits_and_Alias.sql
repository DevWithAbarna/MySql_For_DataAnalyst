-- LIMIT & ALIASING

select * from park_and_recreation.employee_demographics order by age desc limit 2,1;

-- ALIASING

select gender,avg(age) as ave_age from park_and_recreation.employee_demographics group by gender having ave_age <40;

