-- report 1 How many rows do we have in each table in the employees database?
SELECT COUNT(*) FROM employees

-- report 2 How many employees with the first name "Mark" do we have in our company?
SELECT * FROM `employees` 
WHERE first_name='Mark'
-- here you just get starting with Mark so it can be also Marko for.example WHERE first_name LIKE 'Mark%'   ;


-- report 3 How many employees with the first name "Eric" and the last name beginning with "A" do we have in our company?
SELECT * FROM `employees` 
WHERE first_name='Eric' AND last_name LIKE "A%"

-- report 4  How many employees do we have that are working for us since 1985 and who are they?
SELECT first_name, last_name, hire_date FROM employees 
WHERE hire_date > '1985-01-01'
ORDER BY hire_date  ASC



/* tu som sa zamotal trosku myslel som si ze hire_date patri k dept_emp.
SELECT e.first_name, e.last_name, d.from_date FROM employees e
JOIN dept_emp d ON e.hire_date = d.dept_emp.from_date
WHERE d.dept_emp.from_date = 1985;*/

-- here i had extra space between cast and () so it was cast () and not cast()
SELECT * FROM `dept_emp` 
WHERE from_date BETWEEN CAST('1990-01-01' AS DATE) AND CAST('1997-01-01' AS DATE);

-- 5 report How many employees got hired from 1990 until 1997 and who are they?
SELECT first_name, last_name, hire_date FROM employees 
WHERE hire_date > '1990-01-01' and hire_date < '1997-01-01'
ORDER BY hire_date  DESC

-- 6 report   How many employees have salaries higher than EUR 70 000,00 and who are they? 
SELECT s.salary, e.first_name, e.last_name FROM salaries s 
JOIN employees e on s.emp_no = e.emp_no
WHERE s.salary > 70000 
ORDER by s.salary ASC;

-- 7 Report:How many employees do we have in the Research Department, who are working for us since 1992 and who are they?
SELECT d.dept_no, d.emp_no , de.dept_name , e.first_name , e.last_name ,d.from_date FROM dept_emp d
JOIN departments de on d.dept_no = de.dept_no
JOIN employees e on d.emp_no = e.emp_no
WHERE dept_name ='Research' and from_date > '1992-01-01'
ORDER by from_date ASC ;
 
-- 8. Report: How many employees do we have in the Finance Department, who are working for us since 1985 until now and who have salaries higher than EUR 75 000,00 - who are they?
SELECT  CURRENT_TIME() as "current time" ,d.dept_no, d.emp_no , de.dept_name , e.first_name , e.last_name ,d.from_date, s.salary FROM dept_emp d
JOIN departments de on d.dept_no = de.dept_no
JOIN employees e on d.emp_no = e.emp_no
JOIN salaries s on e.emp_no = s.emp_no
WHERE de.dept_name ='Finance' and d.from_date > '1985-01-01' and s.salary > 75000
ORDER by s.salary DESC;

-- 9. Report:  We need a table with employees, who are working for us at this moment: first and last name, date of birth, gender, hire_date, title and salary.
SELECT t.title, t.emp_no,  e.first_name , e.last_name,e.gender,e.hire_date , s.salary FROM titles t
JOIN employees e on t.emp_no = e.emp_no
JOIN salaries s on e.emp_no = s.emp_no

-- 10. Report  We need a table with managers, who are working for us at this moment: first and last name, date of birth, gender, hire_date, title, department name and salary.
SELECT t.title, d.dept_no ,d.emp_no ,e.first_name, e.last_name ,s.salary ,de.dept_name FROM dept_manager d
join employees e on d.emp_no = e.emp_no
JOIN salaries s on e.emp_no = s.emp_no
JOIN departments de on d.dept_no = de.dept_no
JOIN titles t on e.emp_no = t.emp_no
WHERE t.title ='Manager';

-- Bonus all all all
SELECT * FROM  employees e
JOIN salaries s   on e.emp_no = s.emp_no
JOIN dept_emp de on e.emp_no = de.emp_no
JOIN dept_manager dem on e.emp_no = dem.emp_no
join titles t on e.emp_no = t.emp_no
join departments dprts on de.dept_no = dprts.dept_no
