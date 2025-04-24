SHOW TABLES;
DESCRIBE employees;

-- List the first 10 employees:
SELECT * FROM employees LIMIT 10;

-- Find employees hired after the year 2000:
SELECT * FROM employees WHERE hire_date > '2000-01-01';

-- Get the number of employees per gender:
SELECT gender, COUNT(*) FROM employees GROUP BY gender;

-- Find the average salary of all employees:
SELECT AVG(salary) FROM salaries;

-- Find the top 5 highest-paid employees:
SELECT emp_no, salary FROM salaries ORDER BY salary DESC LIMIT 5;

-- Join Tables
SELECT e.first_name, e.last_name, t.title
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no
LIMIT 10;

-- Count Employees by Job Title
SELECT title, COUNT(*) AS num_employees
FROM titles
GROUP BY title;

-- Average Salary by Gender
SELECT e.gender, AVG(s.salary) AS avg_salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender;

-- Most Common First Names
SELECT first_name, COUNT(*) AS occurrences
FROM employees
GROUP BY first_name
ORDER BY occurrences DESC
LIMIT 10;

-- Highest-Paid Employee with Name
SELECT e.first_name, e.last_name, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY s.salary DESC
LIMIT 1;

-- Employees per Department
SELECT d.dept_name, COUNT(*) AS num_employees
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
GROUP BY d.dept_name;
