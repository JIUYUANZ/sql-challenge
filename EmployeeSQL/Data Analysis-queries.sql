--1.List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no,e.first_name,e.last_name,e.sex,s.salary
from employees as e
	join salaries as s 
	on e.emp_no = s.emp_no；

--2.List the first name, last name, and hire date for the employees who were hired in 1986.	
SELECT e.first_name,e.last_name,e.hire_date
from employees as e
where e.hire_date > '1/1/1986' and e.hire_date > '1/1/1987'；

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no,d.dept_name,dm.emp_no,e.first_name,e.last_name
from dept_manager as dm
    join employees as e 
	on dm.emp_no = e.emp_no
    join departments as d 
	on dm.dept_no = d.dept_no；

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no,e.emp_no,e.first_name,e.last_name,d.dept_name
from dept_emp as de
    join departments as d
    on de.dept_no = d.dept_no
    join employees as e
    on de.emp_no = e.emp_no；

--5.List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name,e.last_name,e.sex
from employees as e
where e.first_name = 'Hercules' and e.last_name LIKE 'B%';

--6.List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no,e.last_name,e.first_name
from employees as e
    join dept_emp as de
    on e.emp_no = de.emp_no
    join departments as d
    on de.dept_no = d.dept_no
where dept_name ='Sales';

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
from employees as e
    join dept_emp as de
    on e.emp_no = de.emp_no
    join departments as d
    on de.dept_no = d.dept_no
where dept_name ='Sales' or dept_name ='Development';

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,COUNT(*)
from employees
GROUP BY last_name
ORDER BY COUNT(*)DESC;
