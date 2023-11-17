-- View for employees and their salaries

CREATE VIEW dev_schema.emp_salary_view AS
SELECT employee_id, first_name, last_name, salary FROM dev_schema.employee;

SELECT * FROM dev_schema.emp_salary_view;
SELECT * FROM dev_schema.emp_salary_view ORDER BY salary DESC;

SELECT employee_id, salary, 
DENSE_RANK() OVER (ORDER BY salary DESC)
FROM dev_schema.emp_salary_view;

-- View for employee and their departement

CREATE VIEW dev_schema.emp_dept_view AS
SELECT * FROM 
dev_schema.employee AS emp INNER JOIN dev_schema.department as dept
ON emp.fk_department_id = dept.department_id;

SELECT * FROM dev_schema.emp_dept_view;
SELECT employee_id, first_name, last_name, salary, department_name FROM dev_schema.emp_dept_view;

-- View for employee, departement and job

CREATE VIEW dev_schema.emp_dept_job AS
SELECT * FROM
dev_schema.employee AS emp INNER JOIN dev_schema.department as dept
ON emp.fk_department_id = dept.department_id
INNER JOIN dev_schema.job AS job 
ON emp.fk_job_id = job.job_id;

SELECT * FROM dev_schema.emp_dept_job;
SELECT employee_id, first_name, last_name, salary, department_name, job_title FROM dev_schema.emp_dept_job;
SELECT employee_id, first_name, last_name, salary, department_name, job_title FROM dev_schema.emp_dept_job
ORDER BY salary DESC;




