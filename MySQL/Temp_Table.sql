--- Temporary TABLE

CREATE temporary table 	Temp_table(first_name varchar(50),last_name varchar(50),Favourite_Movie varchar(50));

select * from temp_table;

insert into temp_table values('Alex','Freberg','Lord of the Rings:The Two Towers');

select * from employee_salary;

create temporary table salary_over_50k
select * from employee_salary where salary>=50000;

select * from salary_over_50k;