SELECT employees.first_name
	, employees.last_name
	, departments.dept_name
FROM employees
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Research';

SELECT employees.emp_no
	, employees.last_name
	, employees.first_name
	, employees.sex
	, salaries.salary
FROM salaries
JOIN employees
	ON employees.emp_no = salaries.emp_no LIMIT 1000;
	
SELECT first_name, last_name, hire_date FROM employees
WHERE extract (year FROM hire_date) = '1986' 
ORDER BY hire_date ASC
LIMIT 1000;

SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND
last_name LIKE 'B%'
LIMIT 1000;