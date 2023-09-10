-------------------------------------- CTE --------------------------------------
SELECT * FROM dev_schema.employee;

-- Fetch employees where employees with fresher, junior and senior status as per salary

WITH cte_employee_status AS 
(
	SELECT employee_id, first_name, last_name, 
	CASE salary
		WHEN 30000 THEN 'Works as fresher'
		WHEN 180000 THEN 'Works as Junior Engineer'
		WHEN 200000 THEN 'Works as Senior Engineer'
		ELSE 'Works as managers'
	END AS employee_status
	FROM dev_schema.employee 
)
SELECT employee_id, first_name, last_name, employee_status
FROM cte_employee_status
WHERE employee_status = 'Works as Junior Engineer'
ORDER BY employee_id;


-- Fetch the employees and their department with the salary more than average highest salary of all the departments

WITH cte_salary_status AS
(
	SELECT emp.employee_id, emp.first_name, emp.last_name, emp.salary, dept.department_name
	FROM dev_schema.employee as emp INNER JOIN dev_schema.department as dept
	ON emp.fk_department_id = dept.department_id
	WHERE (dept.department_name, emp.salary) IN (SELECT dept.department_name, MAX(emp.salary) FROM 
											 dev_schema.employee as emp INNER JOIN dev_schema.department as dept
											ON emp.fk_department_id = dept.department_id GROUP BY dept.department_name)
)
