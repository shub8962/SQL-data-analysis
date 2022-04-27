---                                                          SQL Assignment  HR DATABASE                                                           ---

-- Q1 Write a query to display the names(first_name, last_name) using alias name “First Name","Last_Name" --
SELECT first_name as "First Name", last_name as "Last Name" from hr.employees;

-- Q2. Write a query to get unique department ID from employee table--
select distinct department_name, department_id from hr.departments;

-- Q3. Write a query to get all employee details from the employee table order by first name, descending--
select * FROM hr.employees order by first_name desc ;

-- Q4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary)--
select first_name, last_name, salary, (salary*15/100) as pf from hr.employees;

-- Q5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary--
select first_name, last_name,employee_id, salary from hr.employees order by salary ;

-- Q6. Write a query to get the total salaries payable to employees--
select sum(salary) as 'Total salaries' from hr.employees;

-- Q7. Write a query to get the maximum and minimum salary from employees table--
select first_name,last_name,max(salary), min(salary) from hr.employees;

-- Q8. Write a query to get the average salary and number of employees in the employees table--
select count(employee_id) as count , avg(salary) from hr.employees; 

-- Q9. Write a query to get the number of employees working with the company--
select count(*) as total from hr.employees;

-- Q10. Write a query to get the number of jobs available in the employees table--
select count(job_id) from hr.employees;

-- Q11. Write a query get all first name from employees table in upper case--
select upper(first_name) from hr.employees;

-- Q12. Write a query to get the first 3 characters of first name from employees table--
select mid(first_name,1,3) from hr.employees;

-- Q13. Write a query to get first name from employees table after removing white spaces from both side--
select trim(both ' ' from first_name) as 'first name' from hr.employees;
select trim(first_name) as 'first name' from hr.employees;

-- Q14. Write a query to get the length of the employee names (first_name, last_name) from employees table--
select length(first_name), length(last_name) from hr.employees;

-- Q15*. Write a query to check if the first_name fields of the employees table contains numbers--
select * from hr.employees where first_name like '%0-9%';
select * from hr.employees where first_name regexp '[0-9]';
select * from hr.employees where concat('',first_name * 1)=first_name;

-- Q16.Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000--
Select first_name, last_name, salary 
from hr.employees 
where salary not between 10000 and 15000;

-- Q17. Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order--
select first_name, last_name, department_id from hr.employees where department_id= 30 or department_id=100 order by department_id;
select first_name, last_name, department_id from hr.employees where department_id in (30,100) order by department_id;

-- Q18. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100--
Select first_name, last_name, salary department_id 
from hr.employees where salary not between 10000 and 15000 and department_id in (30, 100);

-- Q19*. Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987--
select first_name, last_name, hire_date from hr.employees where year(hire_date) like '%1987';
select first_name, last_name, hire_date from hr.employees where year(hire_date) = 1987;

-- Q20. Write a query to display the first_name of all employees who have both "b" and "c" in their first name--
select first_name from hr.employees where first_name like '%b%C%' ;

-- Q21. Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000--
select last_name, job_id, salary 
from hr.employees 
where salary not in(4500,10000,15000) and job_id in ('it_prog' , 'sh_clerk');

-- Q22. Write a query to display the last name of employees whose names have exactly 6 characters--
select last_name from hr.employees where length(last_name)=6;
select last_name from hr.employees where last_name like '______';

-- Q23. Write a query to display the last name of employees having 'e' as the third character--
select last_name from hr.employees where last_name like '__e%';

/* Q24. Write a query to get the job_id and related employee's id
Partial output of the query : 
job_id Employees ID
AC_ACCOUNT206
AC_MGR 205
AD_ASST 200
AD_PRES 100
AD_VP 101 ,102
FI_ACCOUNT 110 ,113 ,111 ,109 ,112*/
select job_id, group_concat(employee_id) 'employee id' 
from hr.employees group by job_id;

-- Q25*. Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'--
update hr.employees a set a.phone_number = replace(a.phone_number,'124','999') where a.phone_number like '%124%';

-- Q26. Write a query to get the details of the employees where the length of the first name greater than or equal to 8--
select * from hr.employees where length(first_name)>= 8;

-- Q27. Write a query to append '@example.com' to email field--
select concat(email,"@example.com") as 'email_id' from hr.employees;

-- Q28. Write a query to extract the last 4 character of phone numbers--
select phone_number, substr(phone_number,-4,4) from hr.employees;
select phone_number, right(phone_number,4) from hr.employees;

-- Q29. Write a query to get the last word of the street address--
select street_address,mid(street_address,-1,1) from hr.locations;
select street_address,right(street_address,1) from hr.locations;

-- Q30*. Write a query to get the locations that have minimum street length--
select * from hr.locations
where length(street_address) <= (select min(length(street_address)) from hr.locations);
select *,length(street_address) 'minimum street length' from hr.locations order by length(street_address);

-- Q31*. Write a query to display the first word from those job titles which contains more than one words--  /* mid as can we use instead of substr */
select job_title, substr(job_title,1,instr(job_title,' ')-1)  from hr.jobs;

-- Q32. Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position
select  first_name, last_name,length(first_name) from hr.employees where last_name like '__c%';

/*Q33. Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. 
Sort the results by the employees' first names*/
select first_name "name" , length(first_name) "length" from hr.employees where first_name like 'A%' or  first_name like 'J%' or first_name like 'M%'
order by first_name;

-- Q34*. Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY--
select first_name, LPAD(salary,10,'$') "SALARY" from hr.employees;

/*Q35. Write a query to display the first eight characters of the employees' first names and indicates the 
amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary(two times '$' is mandate)*/
select salary, left(first_name,8) "LENGTH", lpad('$',salary/1000,'$') salary_$ from hr.employees order by salary desc;

/*Q36*. Write a query to display the employees with their code, first name, last name and hire date who hired 
either on seventh day of any month or seventh month in any year*/
-- 3 diffrent way to excute this query--
select first_name,last_name,employee_id,hire_date from hr.employees where day(hire_date)=7 or month(hire_date)=7;
select first_name,last_name,employee_id,hire_date from hr.employees where hire_date like '%-%-07' or hire_date like '%-07-%';
select first_name,last_name,employee_id,hire_date from hr.employees where position("07" in date_format(hire_date, '%d %m %y'))>0;
