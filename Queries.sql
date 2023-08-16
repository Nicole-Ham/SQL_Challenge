-- 1. Employee number, last name, first name, sex, salary of each employee
SELECT employees.emp_no
	, employees.last_name
	, employees.first_name
	, employees.sex
	, salaries.salary
FROM salaries
JOIN employees
	ON employees.emp_no = salaries.emp_no LIMIT 1000;

-- 2. First name, last name, hire date hired in 1986. 	
SELECT first_name, last_name, hire_date FROM employees
WHERE extract (year FROM hire_date) = '1986' 
ORDER BY hire_date ASC
LIMIT 1000;

-- 3. Manager of each department along with department number, dept name, employee number, last and first name
SELECT employees.last_name
	, employees.first_name
	, dept_manager.dept_no
	, departments.dept_name
	, dept_manager.emp_no
FROM employees
JOIN dept_manager
	ON employees.emp_no = dept_manager.emp_no
JOIN departments
	ON dept_manager.dept_no = dept_manager.dept_no;

-- 4. Department number for each employee with emp number, first/last name, and dept name. 
SELECT dept_emp.dept_no
	, dept_emp.emp_no
	, employees.first_name
	, employees.last_name
	, departments.dept_name
FROM employees
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
LIMIT 1000; 

-- 5. first/last name, sex, Hercules B. 
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND
last_name LIKE 'B%'
LIMIT 1000;

-- 6. Each employee in Sales dept, emp number, last/first name. 
SELECT departments.dept_name
	, dept_emp.emp_no
	, employees.last_name
	, employees.first_name
FROM departments
JOIN dept_emp
	ON departments.dept_no = dept_emp.dept_no
JOIN employees
	ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales'
LIMIT 1000; 

-- 7. List each employee in Sales and Development, employee number, last/first name. 
SELECT departments.dept_name
	, dept_emp.emp_no
	, employees.last_name
	, employees.first_name
FROM departments
JOIN dept_emp
	ON departments.dept_no = dept_emp.dept_no
JOIN employees
	ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development'
LIMIT 1000;

-- 8. List frequency counts, in descending order, of all employees with same last name. 
SELECT COUNT(last_name) as frequency, last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC; 
