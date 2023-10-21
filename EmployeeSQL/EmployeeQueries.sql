/*
################################################
SQL QUERIES TO ANSWER CHALLENGE QUESTIONS
################################################
*/
--------------------------------------------------------------------------------------
--###########################
--Question 1
--List the employee number, last name, first name, sex, and salary of each employee.
--###########################

--Select/from to see what are in each table
select *
from employees

select *
from salaries

-- Query to output the employee number, last name, first name, sex, and salary of each employee.

--####################
--METHOD 1: JOINS
--####################
select 
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	e.sex,
	s.salary as "Salary"
from 
	employees e
join
	salaries s on s.emp_no = e.emp_no
ORDER BY
	e.emp_no ASC;
	
	
--####################	
-- METHOD 2: SUBQUERY
--####################
select 
	emp_no as "Employee Number",
	last_name as "Last Name",
	first_name as "First Name",
	sex,
	(select 
	 	salary 
	 from 
	 	salaries
	 where
		emp_no = employees.emp_no 
	)
from 
	employees
ORDER BY
	emp_no ASC;
	

--------------------------------------------------------------------------------------
--###########################
--Question 2
--List the first name, last name, and hire date for the employees who were hired in 1986.
--###########################

--Select/from to see what are in each table
select *
from employees

--query to output first name, last name, and hire date for the employees who were hired in 1986.
select
	first_name as "First Name",
	last_name as "Last Name",
	hire_date as "Hire Date"
from
	employees
where
	hire_date LIKE '%1986'
order by
	first_name ASC

--------------------------------------------------------------------------------------
--###########################
--Question 3
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
--###########################

-- join dept.dept_no -> dept_manager.dept_no and dept_manager.emp_no on employees.emp_no
select *
from departments -- department number and department name

select *
from employees -- employee_no, last_name, first_name


select *
from dept_manager -- department number and employee number

select *
from 

select
	m.dept_no as "Department Number",
	d.dept_name as "Department Name",
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name"
from
	employees e
join
	dept_manager m on m.emp_no = e.emp_no
join
	departments d on d.dept_no = m.dept_no

--------------------------------------------------------------------------------------
--Question 4
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
--------------------------------------------------------------------------------------

select *
from departments -- this gives dept_name and dept.dept_no -> dept_emp.dept_no

select *
from dept_emp -- this gives dept_emp.emp_no -> employees.emp_no, first, last name etc

-- requires 2 joins again

select
	d.dept_no as "Department Number",
	de.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department Name"
from
	departments d
join
	dept_emp de on de.dept_no = d.dept_no
join
	employees e on e.emp_no = de.emp_no
order by
	e.emp_no ASC;

--Question 5
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
--------------------------------------------------------------------------------------

select
	first_name as "First Name",
	last_name as "Last Name",
	sex as "Sex"
from
	employees
where
	first_name = 'Hercules'
and
	last_name like 'B%';

--Question 6
--List each employee in the Sales department, including their employee number, last name, and first name.
--------------------------------------------------------------------------------------

select
	d.dept_name as "Department Name",
	de.dept_no as "Department Number",
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name"
from
	employees e
join
	dept_emp de on de.emp_no = e.emp_no
join
	departments d on d.dept_no = de.dept_no
where
	dept_name = 'Sales'
order by
	e.emp_no ASC;

--Question 7
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
--------------------------------------------------------------------------------------

select
	d.dept_name as "Department Name",
	de.dept_no as "Department Number",
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name"
from
	employees e
join
	dept_emp de on de.emp_no = e.emp_no
join
	departments d on d.dept_no = de.dept_no
where
	dept_name = 'Sales' or dept_name = 'Development'
order by
	e.emp_no ASC;


--Question 8
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
--------------------------------------------------------------------------------------

select 
	last_name as "Last Name",
	count(*) as frequency
from 
	employees
group by
	last_name
order by
	frequency desc, last_name; --orders the results based on frequency count; any ties will sort by last_name
