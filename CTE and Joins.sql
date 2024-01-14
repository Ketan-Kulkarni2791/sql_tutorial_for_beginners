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
SELECT employee_id, first_name, last_name, salary, department_name FROM cte_salary_status
WHERE salary > (SELECT AVG(salary) FROM cte_salary_status);


-------------------------------------- Left Outer Join --------------------------------------

SELECT *
FROM dev_schema.department as dept LEFT OUTER JOIN dev_schema.employee as emp  
ON emp.fk_department_id = dept.department_id;

-------------------------------------- Right Outer Join --------------------------------------

SELECT *
FROM dev_schema.employee as emp RIGHT OUTER JOIN dev_schema.department as dept  
ON emp.fk_department_id = dept.department_id;

-------------------------------------- Full Outer Join --------------------------------------

SELECT *
FROM dev_schema.employee as emp Full OUTER JOIN dev_schema.department as dept  
ON emp.fk_department_id = dept.department_id;

-------------------------------------- Cross Join --------------------------------------


SELECT * FROM dev_schema.employee;

SELECT *
FROM dev_schema.employee CROSS JOIN dev_schema.department;

SELECT *
FROM dev_schema.employee as emp CROSS JOIN dev_schema.department as dept
WHERE dept.department_name IN ('IT Development', 'HR', 'Cloud');

-------------------------------------- Self Join --------------------------------------

-- TBD

-------------------------------------- Two Column Join --------------------------------------

CREATE SEQUENCE IF NOT EXISTS dev_schema.cust_acc_id_seq;
SELECT setval('dev_schema.cust_acc_id_seq', 1000);
CREATE TABLE IF NOT EXISTS dev_schema.customer_account
(
	customer_id text primary key DEFAULT 'CUST' || nextval('dev_schema.cust_acc_id_seq'),
	customer_name VARCHAR(50) NOT NULL,
	contact_firstname VARCHAR(100) NOT NULL,
	contact_lastname VARCHAR(100) NOT NULL,
	country VARCHAR(100)
);

SELECT * FROM dev_schema.customer_account;

INSERT INTO dev_schema.customer_account (customer_name, contact_firstname, contact_lastname, country) VALUES
('Principal Global Solutions', 'Indu', 'Singh', 'USA' ),
('Agfa Healthcare', 'Bhanu Prasad', 'Kongala', 'Belgium' ),
('General Electric', 'Shobha', 'Tripathy', 'UK' ),
('Baker Hughes', 'Ketan', 'Kulkarni', 'USA' ),
('Maharashtra State Government', 'Sarang', 'Newaskar', 'India' );

-- Select the employees and their ids who are also customer first contact.

SELECT e.employee_id, e.first_name, e.last_name, ca.customer_name
FROM dev_schema.employee e INNER JOIN dev_schema.customer_account ca
ON e.first_name = ca.contact_firstname
AND e.last_name = ca.contact_lastname;






