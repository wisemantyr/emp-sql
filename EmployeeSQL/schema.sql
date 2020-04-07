create table employees (
emp_no int primary key not null,
birth_date date not null,
first_name varchar not null,
last_name varchar not null,
gender varchar not null,
hire_date date not null
);

create table departments (
dept_no varchar primary key not null,
dept_name varchar not null
);

create table dept_emp (
emp_no int not null,
dept_no varchar not null,
from_date date not null,
to_date date not null,
primary key (emp_no, dept_no),
foreign key (emp_no) references employees(emp_no),
foreign key (dept_no) references departments(dept_no)
);

create table dept_manager (
dept_no varchar not null,
emp_no int not null,
from_date date not null,
to_date date not null,
primary key (dept_no, emp_no),
foreign key (dept_no) references departments (dept_no),
foreign key (emp_no) references employees (emp_no)
);

create table salaries (
emp_no int not null,
salary int not null,
from_date date not null,
to_date date not null,
primary key (emp_no, salary),
foreign key (emp_no) references employees (emp_no)
);

create table titles (
id serial primary key,
emp_no int not null,
title varchar not null,
from_date date not null,
to_date date not null,
foreign key (emp_no) references employees (emp_no)
);

--manually copy titles columns to avoid serial id not null error
COPY titles(emp_no, title, from_date, to_date)
FROM 'D:\Repositories\sql-challenge\data\titles.csv' DELIMITER ',' CSV HEADER;

