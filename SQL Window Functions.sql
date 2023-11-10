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




