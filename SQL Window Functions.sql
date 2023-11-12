SELECT * FROM dev_schema.employee;
SELECT * FROM dev_schema.department;
SELECT * FROM dev_schema.job;

-- Fetch total salary distribution for each department
SELECT 
dept.department_name, SUM(emp.salary) as total_salary
FROM
dev_schema.employee as emp INNER JOIN dev_schema.department as dept
ON emp.fk_department_id = dept.department_id 
GROUP BY dept.department_name ORDER BY total_salary DESC;

-- Fetch total salary distribution for each department along with the department id
SELECT 
dept.department_name, dept.department_id, SUM(emp.salary) as total_salary
FROM
dev_schema.employee as emp INNER JOIN dev_schema.department as dept
ON emp.fk_department_id = dept.department_id 
GROUP BY dept.department_name, dept.department_id ORDER BY total_salary DESC;

-- Using empty over()
SELECT 
salary, 
SUM(salary) over() as total_salary,
AVG(salary) over() as avg_salary,
MAX(salary) over() as max_salary,
MIN(salary) over() as min_salary,
(salary::numeric/sum(salary) over()) * 100 as percentage_salary
FROM
dev_schema.employee ORDER BY total_salary DESC;

-- Using partition clause with over()
SELECT 
dept.department_name,
emp.salary, 
SUM(emp.salary) over(PARTITION BY dept.department_id ORDER BY emp.salary DESC) as total_salary_as_per_department,
AVG(emp.salary) over(PARTITION BY dept.department_id) as avg_salary_as_per_department,
MAX(emp.salary) over(PARTITION BY dept.department_id) as max_salary_as_per_department,
MIN(emp.salary) over(PARTITION BY dept.department_id) as min_salary_as_per_department,
(emp.salary::numeric/sum(emp.salary) over(PARTITION BY dept.department_id)) * 100 as percentage_salary_as_per_department
FROM
dev_schema.employee as emp INNER JOIN dev_schema.department as dept
ON emp.fk_department_id = dept.department_id;

SELECT 
dept.department_name,
emp.salary, 
SUM(emp.salary) over(PARTITION BY dept.department_id ORDER BY emp.salary DESC) as total_salary_as_per_department,
AVG(emp.salary) over() as avg_salary_as_per_department,
MAX(emp.salary) over(PARTITION BY dept.department_id) as max_salary_as_per_department,
MIN(emp.salary) over() as min_salary_as_per_department,
(emp.salary::numeric/sum(emp.salary) over(PARTITION BY dept.department_id)) * 100 as percentage_salary_as_per_department
FROM
dev_schema.employee as emp INNER JOIN dev_schema.department as dept
ON emp.fk_department_id = dept.department_id;

-- Write a sql query to fetch employee id, employee name, employee salary, employee department name, employee job title,
-- And max salary as per the department.

SELECT emp.employee_id, emp.first_name, emp.last_name, emp.salary, dept.department_name, job.job_title, 
MAX(emp.salary) OVER (PARTITION BY dept.department_id ORDER BY emp.salary DESC) AS max_salary_per_department
FROM
dev_schema.employee as emp INNER JOIN dev_schema.department as dept
ON emp.fk_department_id = dept.department_id
INNER JOIN dev_schema.job as job
ON emp.fk_job_id = job.job_id;

-- Write a sql query to fetch employee id, employee name, employee salary, employee department name, employee job title,
-- And max salary as per the department along with the count of employees per department

SELECT emp.employee_id, emp.first_name, emp.last_name, emp.salary, dept.department_name, job.job_title, 
MAX(emp.salary) OVER (PARTITION BY dept.department_id ORDER BY emp.salary DESC) AS max_salary_per_department,
COUNT(*) OVER (PARTITION BY dept.department_id) as total_no_of_emp_per_dept
FROM
dev_schema.employee as emp INNER JOIN dev_schema.department as dept
ON emp.fk_department_id = dept.department_id
INNER JOIN dev_schema.job as job
ON emp.fk_job_id = job.job_id;





