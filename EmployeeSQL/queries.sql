--List the following details of each employee: 
--employee number, first name, last name, gender, and salary.
select 
employees.emp_no,
employees.first_name,
employees.last_name,
employees.gender,
salaries.salary
from employees
inner join salaries on salaries.emp_no=employees.emp_no;

--List employees who were hired in 1986.
select *
from employees where(
	select extract 
	(year from hire_date) = 1986
	);
	
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select
departments.dept_no,
departments.dept_name,
dept_manager.emp_no,
employees.first_name as manager_first_name,
employees.last_name as manager_last_name,
dept_emp.from_date,
dept_emp.to_date
from
departments
inner join dept_manager on dept_manager.dept_no = departments.dept_no
inner join employees on employees.emp_no = dept_manager.emp_no
inner join dept_emp on dept_emp.emp_no = dept_manager.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select 
departments.dept_name,
employees.emp_no,
employees.last_name,
employees.first_name
from dept_emp
inner join employees on employees.emp_no = dept_emp.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
select *
from employees
where first_name = 'Hercules' and 
last_name like 'B%';

--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
select 
departments.dept_name,
employees.emp_no,
employees.last_name ,
employees.first_name
from dept_emp
inner join employees on employees.emp_no = dept_emp.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
select 
departments.dept_name,
employees.emp_no,
employees.last_name,
employees.first_name
from dept_emp
inner join employees on employees.emp_no = dept_emp.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no
where dept_name = 'Development' or
dept_name = 'Sales';

--In descending order, list the frequency count of employee last names.
select
employees.last_name,
count(employees.last_name) as frequency
from employees
group by employees.last_name
order by frequency desc;