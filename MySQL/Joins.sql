-- JOINS

select * from park_and_recreation.employee_demographics;

select * from park_and_recreation.employee_salary;


select * from park_and_recreation.employee_demographics  AS a inner join park_and_recreation.employee_salary AS b
    on  a.employee_id=b.employee_id;
    
 select a.employee_id ,age, occupation from park_and_recreation.employee_demographics as a inner join 
          park_and_recreation.employee_salary as b on a.employee_id= b.employee_id;
          
--- OUTER JOINS
select * from park_and_recreation.employee_demographics as a right OUTER join 
          park_and_recreation.employee_salary as b on a.employee_id= b.employee_id;
          
          
select * from park_and_recreation.employee_demographics as a left OUTER join 
          park_and_recreation.employee_salary as b on a.employee_id= b.employee_id;
          
-- SELF JOIN

SELECT * FROM park_and_recreation.employee_salary  emp1 JOIN park_and_recreation.employee_salary emp2
 ON emp1.employee_id=emp2.employee_id;       
 
 SELECT emp1.employee_id as Emp_santa, emp1.first_name as first_name_santa,emp1.last_name as last_name_santa,
		emp2.employee_id as emp_name, emp2.first_name first_name_emp , emp2.last_name as last_name_emp
 FROM park_and_recreation.employee_salary  emp1 JOIN 
            park_and_recreation.employee_salary emp2 ON emp1.employee_id+1=emp2.employee_id;      
            
            
-- Joining Multiple Tables together
      
select * from park_and_recreation.employee_demographics as dem inner join 
          park_and_recreation.employee_salary as sal on dem.employee_id= sal.employee_id 
          inner join park_and_recreation.parks_department pd 
          on  sal.dep_id=pd.department_id;
          
          
select *  from park_and_recreation.parks_department;
     