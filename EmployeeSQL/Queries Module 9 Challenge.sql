--List the employee number, last name, first name, sex, and salary of each employee 
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;






--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)	
SELECT d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name 
FROM departments d
INNER JOIN dept_manager dm
	ON d.dept_no = dm.dept_no
INNER JOIN employees e
	ON e.emp_no = dm.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d. dept_name
FROM employees e
INNER JOIN dept_emp de
	ON e.emp_no = de.emp_no
INNER JOIN departments d
	ON de.dept_no = d.dept_no;
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_emp de
	ON e.emp_no = de.emp_no
INNER JOIN departments d
	ON d.dept_no = de.dept_no
	WHERE d.dept_name = 'Sales';


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)	
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
	ON e.emp_no = de.emp_no
INNER JOIN departments d
	ON d.dept_no = de.dept_no
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';
	
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name,COUNT(*) as count 
FROM employees
GROUP BY last_name 
ORDER BY count DESC;