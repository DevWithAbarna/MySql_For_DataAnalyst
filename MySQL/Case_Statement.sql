-- Case Statement
select first_name,last_name, age,case 
 when age<=30 then 'Young' 
 when age between 31 and 50 then 'Old'
 when age >=61 then 'Senior Citizen'
 end   as Age_Bracket from park_and_recreation.employee_demographics; 


-- Pay Increase and Bonus 
-- <50000 =5%
-- >50000=7%
-- Finance =10% bonus
 select first_name,last_name, case
     when salary<50000 then salary *1.05
     when salary >50000 then salary *1.07 end as New_Salary ,
     case when dep_id=6 then salary *.10 end as bonus
     from park_and_recreation.employee_salary;
 
 select * from park_and_recreation.employee_salary;
	select * from park_and_recreation.parks_department; 