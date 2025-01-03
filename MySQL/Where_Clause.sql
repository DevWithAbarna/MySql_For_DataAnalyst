-- WHERE CLAUSE

SELECT * FROM park_and_recreation.EMPLOYEE_SALARY WHERE first_name='Leslie';

SELECT * FROM park_and_recreation.EMPLOYEE_SALARY WHERE salary>=50000;

SELECT * FROM park_and_recreation.EMPLOYEE_SALARY WHERE salary<=25000;

select * from park_and_recreation.employee_demographics where gender!='Female';

SELECT * FROM park_and_recreation.employee_demographics  where birth_date >'1985-01-01';

-- AND OR NOT --Logical Operators
SELECT * FROM park_and_recreation.employee_demographics  where birth_date >'1985-01-01' and gender='Female';

SELECT * FROM park_and_recreation.employee_demographics  where birth_date >'1985-01-01' or not gender='male' ;

SELECT * FROM park_and_recreation.employee_demographics  where (first_name='Leslie' and age=44) or age> 55 ;

-- LIKE STATEMENT 
-- % AND _
SELECT * FROM park_and_recreation.employee_demographics where first_name like'Jer%';

SELECT * FROM park_and_recreation.employee_demographics WHERE first_name LIKE'a%';

SELECT * FROM park_and_recreation.employee_demographics WHERE first_name LIKE'a__%';

SELECT * FROM park_and_recreation.employee_demographics WHERE birth_date LIKE '1985%' ;