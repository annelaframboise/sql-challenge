-- titles table
DROP TABLE IF EXISTS titles;
CREATE TABLE titles (title_id VARCHAR PRIMARY KEY,
					 title VARCHAR);

-- employees table
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (emp_no INTEGER PRIMARY KEY,
						emp_title_id VARCHAR REFERENCES titles(title_id),
						birth_date DATE,
						first_name VARCHAR,
					    last_name VARCHAR,
					    sex VARCHAR,
					    hire_date DATE);

-- salaries table
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (emp_no INT PRIMARY KEY REFERENCES employees(emp_no),
					   salary INTEGER);

-- departments table
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (dept_no VARCHAR PRIMARY KEY,
						  dept_name VARCHAR);

-- dept_emp table
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (emp_no INTEGER PRIMARY KEY REFERENCES employees(emp_no),
					   dept_no VARCHAR REFERENCES departments(dept_no));
					   
-- dept_manager table
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (dept_no VARCHAR,
						   emp_no	INTEGER,
						   PRIMARY KEY(emp_no, dept_no),
						   FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
						   FOREIGN KEY(emp_no) REFERENCES employees(emp_no));
