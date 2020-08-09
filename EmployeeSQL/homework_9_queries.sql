-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
	-- use tables: (employees) + (salaries) at (emp_no)

SELECT employees.emp_no AS employee_number, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
	-- use tables: (employees)
	
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1/1/1986' 
       AND hire_date < '1/1/1987';

--3. List the manager of each dept w/ this info: dept_no, dept_name, the manager's employee number, last name, first name.
	-- use tables: (departments) + (dept_manager) at dept_no & (dept_manager) + (employees) at emp_no

SELECT departments.dept_no AS department_number, 
	departments.dept_name AS department_name, 
	dept_manager.emp_no AS manager_employee_number, 
	employees.first_name, 
	employees.last_name
  FROM departments
  JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
  JOIN employees ON dept_manager.emp_no = employees.emp_no;

--4. List the dept of each employee with the following information: emp_no, last_name, first_name, and dept_name
	-- use tables: (employees) + (dept_emp) at emp_no & (dept_emp) + (departments) at dept_name
	
SELECT employees.emp_no AS employee_number, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name AS department_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;


--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
	-- use tables: (employees)

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';
	
--6. List all employees in the Sales department, including their emp_no, last_name, first_name, and dept_name.
	-- use tables: (employees) + (dept_emp) at emp_no & (dept_emp) + (departments) at dept_name

SELECT employees.emp_no AS employee_number, 
	employees.last_name, 
	employees.first_name,
	departments.dept_name AS department_name 
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE dept_name = 'Sales';
  
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
	-- use tables: (same as #6)
	
SELECT employees.emp_no AS employee_number, 
	employees.last_name, 
	employees.first_name,
	departments.dept_name AS department_name 
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';
	
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
	-- use tables: (employees)
	
SELECT last_name, COUNT(last_name) AS "count_of_last_names"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
