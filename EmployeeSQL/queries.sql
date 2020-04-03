select 
employees.emp_no,
employees.first_name,
employees.last_name,
employees.gender,
salaries.salary
from employees
inner join salaries on salaries.emp_no=employees.emp_no;

select *
from employees where(
	select extract 
	(year from hire_date) = 1986
	);
	

select
departments.dept_no,
departments.dept_name,
dept_manager.emp_no,
employees.first_name,
employees.last_name,
dept_emp.from_date,
dept_emp.to_date
from
departments
inner join dept_manager on dept_manager.dept_no = departments.dept_no
inner join employees on employees.emp_no = dept_manager.emp_no
inner join dept_emp on dept_emp.emp_no = dept_manager.emp_no;

select 
departments.dept_name,
employees.emp_no,
employees.last_name,
employees.first_name
from dept_emp
inner join employees on employees.emp_no = dept_emp.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no;
