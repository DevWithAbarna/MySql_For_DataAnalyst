-- String Function

SELECT length('SKYFALL');

SELECT first_name,length(first_name) from park_and_recreation.employee_demographics order by 2 ;

select upper('sky');
SELECT lower('SKYFALL');

SELECT first_name,upper(first_name) from park_and_recreation.employee_demographics ;
SELECT first_name,lower(first_name) from park_and_recreation.employee_demographics ;

select trim('   SKY        ');
select ltrim('   SKY        ');
select rtrim('   SKY        ');

select first_name ,left(first_name,4),last_name,right(last_name,4) ,birth_date,
    substring(birth_date,6,2) as birth_month  from park_and_recreation.employee_demographics ;

select  first_name,replace(first_name,'a','z') from park_and_recreation.employee_demographics;

select locate('x','Alexander');
select  first_name,locate('An',first_name) from park_and_recreation.employee_demographics;

select  first_name,last_name, concat(first_name,' ',last_name) as Full_Name from park_and_recreation.employee_demographics;
