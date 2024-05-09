CREATE SCHEMA IF NOT EXISTS dev_schema;

CREATE TABLE IF NOT EXISTS dev_schema.job
(
	job_id SERIAL primary key,
	job_title VARCHAR(100) NOT NULL,
	min_salary INT,
	max_salary INT,
	CONSTRAINT check_min_salary CHECK(min_salary>0),
	CONSTRAINT check_max_salary CHECK(max_salary>0)
);

CREATE TABLE IF NOT EXISTS dev_schema.department
(
	department_id INT primary key,
	department_name VARCHAR(100) NOT NULL UNIQUE
);

-- create sequence
CREATE SEQUENCE IF NOT EXISTS dev_schema.dept_pk_auto_sequence
start 100
increment 1
NO MAXVALUE
CACHE 1
OWNED BY dev_schema.department.department_id;
-- use sequence for the target column
ALTER TABLE dev_schema.department ALTER COLUMN department_id SET DEFAULT nextval('dev_schema.dept_pk_auto_sequence');

-- Create sequence for Employee table
CREATE SEQUENCE IF NOT EXISTS dev_schema.emp_pk_auto_seq;
SELECT setval('dev_schema.emp_pk_auto_seq', 10);
-- Create Employee table
CREATE TABLE IF NOT EXISTS dev_schema.employee
(
	employee_id text primary key DEFAULT 'TechM' || nextval('dev_schema.emp_pk_auto_seq'),
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	salary INT NOT NULL,
	fk_job_id INT,
	fk_department_id INT,
	CONSTRAINT fk_job
     foreign key (fk_job_id) 
     REFERENCES dev_schema.job(job_id),
	CONSTRAINT fk_department
     foreign key (fk_department_id) 
     REFERENCES dev_schema.department(department_id)
);


-- Insert data into job table
INSERT INTO dev_schema.job (job_title, min_salary, max_salary) VALUES
('Software Developer', 15000, 300000),
('Software Tester', 10000, 100000),
('IT Infra Admin', 7000, 30000),
('Data Analyst', 12000, 200000),
('Business Analyst', 11000, 180000),
('Accountant', 14000, 250000),
('SPOC HR', 8000, 50000);


-- Insert data into department table
INSERT INTO dev_schema.department (department_name) VALUES
('IT Developent'),
('IT Infrastructure'),
('Data Analytics'),
('Finance'),
('HR');

-- Insert data into employee table
INSERT INTO dev_schema.employee (first_name, last_name, salary, fk_job_id, fk_department_id) VALUES
('Rachit', 'Kulkarni', 300000, 1, 100),
('Ketan', 'Kulkarni', 300000, 1, 100),
('Rahul', 'Gupta', 200000, 4, 102),
('Ajinkya', 'Tonpe', 10000, 7, 104),
('Shobha', 'Tripathy', 50000, 6, 104),
('Indu', 'Singh', 30000, 2, 100),
('Manoj', 'Gadkar', 25000, 3, 101),
('Shubham', 'Giradkar', 180000, 5, 104),
('Pooja', 'Shrivastava', 30000, 7, 104),
('Chandler', 'Bing', 280000, 1, 100),
('Phebe', 'Buffey', 250000, 1, 100),
('Rachel', 'Green', 150000, 4, 102),
('Monica', 'Geller', 30000, 7, 104),
('Ross', 'Geller', 40000, 6, 104),
('Michael', 'Scott', 30000, 2, 100),
('Joey', 'Tribianni', 15000, 3, 101),
('Regina', 'Phalangi', 150000, 5, 104),
('Dwight', 'Schrute', 30000, 7, 104);

-- TRUNCATE dev_schema.employee;



SELECT department_id, department_name FROM dev_schema.department;
SELECT job_id, job_title FROM dev_schema.job;
SELECT * FROM dev_schema.employee;

--------------------------------------------------------------------------------------------------------------

SELECT * FROM dev_schema.job;							-- To fetch all the data from job table.
SELECT job_title, max_salary FROM dev_schema.job;		-- To fetch specific columns data.
SELECT job_title as dream_job, max_salary as dream_pay
FROM dev_schema.job;									-- Alias named column



-- Return all the employees whose salary is equal to 300000
SELECT * FROM dev_schema.employee WHERE salary = 300000;

-- Return all the employees whose salary is less than 300000
SELECT * FROM dev_schema.employee WHERE salary < 300000;

SELECT * FROM dev_schema.employee WHERE salary >= 300000;

SELECT * FROM dev_schema.employee WHERE salary <> 300000;
SELECT * FROM dev_schema.employee WHERE salary != 300000;

-- Fetch an employee where last_name = ‘Kulkarni’ and salary = 300000
SELECT * FROM dev_schema.employee WHERE last_name = 'Kulkarni' AND salary = 300000;

-- Return the employees whose salary is either 3 lacs or 2 lacs
SELECT * FROM dev_schema.employee WHERE salary = 30000000 OR salary = 200000;

-- Find any values that start with K
SELECT * FROM dev_schema.employee WHERE last_name LIKE 'K%';

-- Find any values that have p in any position
SELECT * FROM dev_schema.employee WHERE last_name LIKE '%P%' AND last_name LIKE '%a%';

-- Find any value that ends with 'a'
SELECT * FROM dev_schema.employee WHERE last_name LIKE '%a';

-- Find any values that have 00 in the second and third positions
SELECT * FROM dev_schema.employee WHERE salary::text LIKE '_00%';

-- Find any values that have 8 in the second position and end with 0
SELECT * FROM dev_schema.employee WHERE salary::text LIKE '_8%0';

-- How to use float operator with LIKE ?

-- Find any values that start with K
SELECT * FROM dev_schema.employee WHERE last_name ILIKE 'k%';

-- IN operator
SELECT * FROM dev_schema.employee WHERE employee_id IN ('TechM35', 'TechM36', 'TechM37');
SELECT * FROM dev_schema.employee WHERE first_name IN ('Rachit', 'Ketan', 'Manoj', 'Shubham');
SELECT first_name, salary, fk_job_id FROM dev_schema.employee WHERE fk_job_id IN (1, 2, 3);

-- NOT IN operator
SELECT * FROM dev_schema.employee WHERE employee_id NOT IN ('TechM35', 'TechM36', 'TechM37');

-- BETWEEN operator
SELECT first_name, last_name, salary FROM dev_schema.employee WHERE salary BETWEEN 200000 AND 300000;

-- BETWEEN operator with text
SELECT * FROM dev_schema.employee WHERE first_name BETWEEN 'I' AND 'Q';

-- IS NULL operator
SELECT first_name, last_name FROM dev_schema.employee WHERE last_name IS NULL;
SELECT first_name, last_name FROM dev_schema.employee WHERE last_name IS NOT NULL;

-- Addition operator
SELECT first_name, last_name, salary, salary+10000 as appraised_salary FROM dev_schema.employee;

-- Subtraction operator
SELECT first_name, last_name, salary, salary-10000 as depraised_salary FROM dev_schema.employee;

-- Multiplication operator
SELECT first_name, last_name, salary, salary*2 as appraised_salary FROM dev_schema.employee;

-- Division operator
SELECT first_name, last_name, salary, salary/2 as depraised_salary FROM dev_schema.employee;

-- DISTINCT Clause
SELECT salary FROM dev_schema.employee;
SELECT DISTINCT salary FROM dev_schema.employee;

-- SELECT DISTINCT first_name, salary FROM dev_schema.employee;
SELECT DISTINCT salary, first_name  FROM dev_schema.employee;

-- ORDER BY clause
SELECT * FROM dev_schema.employee ORDER BY salary DESC;
SELECT * FROM dev_schema.employee ORDER BY 4 DESC;

-- LIMIT with OFFSET
SELECT * FROM dev_schema.employee ORDER BY salary DESC LIMIT 5;
SELECT * FROM dev_schema.employee ORDER BY salary DESC LIMIT 4 OFFSET 4;
SELECT * FROM dev_schema.employee ORDER BY salary DESC LIMIT 4 OFFSET 10;

-- ORDER BY clause
SELECT * FROM dev_schema.employee ORDER BY salary DESC;

SELECT * FROM dev_schema.employee ORDER BY 4 DESC;

-- LIMIT with OFFSET
SELECT * FROM dev_schema.employee ORDER BY salary DESC LIMIT 5;

SELECT * FROM dev_schema.employee ORDER BY salary DESC LIMIT 4 OFFSET 4;

-- CASE statement

-- Based on salary, fetch the employee data and add a new column EmployeeStatus based on salary
SELECT employee_id, first_name, last_name, 
CASE
	WHEN salary <= 30000 THEN 'Works as fresher'
	WHEN salary > 30000 AND salary <= 200000 THEN 'Works as Junior Engineer'
	WHEN salary > 200000 AND salary < 300000 THEN 'Works as Senior Engineer'
	ELSE 'Works as managers'
END AS EmployeeStatus 
FROM dev_schema.employee;

-- CASE expression
SELECT first_name, last_name, 
CASE salary
	WHEN 30000 THEN 'Works as fresher'
	WHEN 180000 THEN 'Works as Junior Engineer'
	WHEN 200000 THEN 'Works as Senior Engineer'
	ELSE 'Works as managers'
END AS EmployeeStatus
FROM dev_schema.employee;

----------------------------------- INNER JOIN -----------------------------------
SELECT * FROM dev_schema.employee;
SELECT * FROM dev_schema.department;
SELECT * FROM dev_schema.job;

SELECT *
FROM 
dev_schema.employee as emp INNER JOIN dev_schema.department as dept
ON 
emp.fk_department_id = dept.department_id;

-- Fetch all the employee's first name, last name and their respective department names.

SELECT 
dev_schema.employee.first_name, dev_schema.employee.last_name,
dev_schema.department.department_name
FROM 
dev_schema.employee INNER JOIN dev_schema.department
ON 
dev_schema.employee.fk_department_id = dev_schema.department.department_id;


SELECT 
emp.first_name, emp.last_name,
dept.department_name
FROM 
dev_schema.employee as emp INNER JOIN dev_schema.department as dept
ON 
emp.fk_department_id = dept.department_id;

-- Fetch employee names, salary and job title.
SELECT 
emp.first_name, emp.last_name, emp.salary,
job.job_title
FROM
dev_schema.employee as emp INNER JOIN dev_schema.job as job
ON emp.fk_job_id = job.job_id;

-- Fetch employee names with their job title and department name.
SELECT 
emp.first_name, emp.last_name,
job.job_title,
dept.department_name
FROM
dev_schema.employee as emp INNER JOIN dev_schema.job as job
ON emp.fk_job_id = job.job_id
INNER JOIN dev_schema.department as dept
ON emp.fk_department_id = dept.department_id;

-- Fetch employees and their job titles where department is IT Developement

SELECT * FROM dev_schema.department;


SELECT
emp.first_name, emp.last_name,
job.job_title
FROM
dev_schema.employee as emp INNER JOIN dev_schema.job as job
ON 
emp.fk_job_id = job.job_id
INNER JOIN dev_schema.department as dept
ON
emp.fk_department_id = dept.department_id
WHERE 
department_name = 'IT Developent';


SELECT 
emp.first_name, emp.last_name,
job.job_title, dept.department_name
FROM
dev_schema.employee as emp INNER JOIN dev_schema.job as job
ON emp.fk_job_id = job.job_id
INNER JOIN dev_schema.department as dept
ON emp.fk_department_id = dept.department_id
WHERE dept.department_name = 'IT Developent';

------------------------------------ GROUP BY ------------------------------------

SELECT * FROM dev_schema.employee;

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

-- Fetch total number of employees and total amount of salary for each department.
SELECT
dept.department_name, COUNT(employee_id) as Total_Employees, SUM(emp.salary) as Total_Salary
FROM
dev_schema.employee as emp INNER JOIN dev_schema.department as dept
ON emp.fk_department_id = dept.department_id 
GROUP BY dept.department_name ORDER BY Total_Salary DESC;

-- Fetch average salary for each job title.
SELECT
job.job_title, AVG(emp.salary) as avg_salary
FROM
dev_schema.employee as emp INNER JOIN dev_schema.job as job
ON emp.fk_job_id = job.job_id 
GROUP BY job.job_title ORDER BY avg_salary DESC;

------------------------------------ GROUP BY With HAVING clause ------------------------------------

-- Fetch departments with total salaries greater than 1.5 lacs.
SELECT 
dept.department_name, SUM(emp.salary) as total_salary
FROM
dev_schema.employee as emp INNER JOIN dev_schema.department as dept
ON emp.fk_department_id = dept.department_id 
GROUP BY dept.department_name HAVING SUM(emp.salary) >= 150000 ORDER BY total_salary DESC;

-- Fetch total number of employees and total amount of salary for each department ahving no of employees greater than 2.
SELECT
dept.department_name, COUNT(employee_id) as Total_Employees, SUM(emp.salary) as Total_Salary
FROM
dev_schema.employee as emp INNER JOIN dev_schema.department as dept
ON emp.fk_department_id = dept.department_id 
GROUP BY dept.department_name HAVING COUNT(employee_id) > 2 ORDER BY Total_Salary DESC;

-------------------------------------- Count() --------------------------------------
SELECT COUNT(*) FROM dev_schema.employee;

SELECT COUNT(employee_id) FROM dev_schema.employee;

-------------------------------------- Sum() --------------------------------------
SELECT SUM(salary) FROM dev_schema.employee;

SELECT SUM(salary) FROM dev_schema.employee WHERE salary < 300000;

-------------------------------------- MIN/MAX() --------------------------------------
SELECT MIN(salary) as min_salary, MAX(salary) as max_salary FROM dev_schema.employee;

SELECT MAX(employee_id) FROM dev_schema.employee;


-------------------------------------- Order of Execution --------------------------------------
SELECT first_name FROM dev_schema.employee ORDER BY salary;

SELECT DISTINCT first_name FROM dev_schema.employee ORDER BY salary;

SELECT DISTINCT salary FROM dev_schema.employee ORDER BY salary;

-------------------------------------- Subquery --------------------------------------
SELECT AVG(salary) as avg_salary FROM dev_schema.employee;

SELECT * FROM dev_schema.employee WHERE salary > 116666.666666666667;

SELECT * FROM dev_schema.employee WHERE salary > (SELECT AVG(salary) as avg_salary FROM dev_schema.employee);

-- Fetch the employees with the highest salary for each department
SELECT emp.employee_id, emp.first_name, emp.last_name, emp.salary, dept.department_name
FROM dev_schema.employee as emp INNER JOIN dev_schema.department as dept
ON emp.fk_department_id = dept. department_id
WHERE (dept.department_name, emp.salary) IN (SELECT dept.department_name, MAX(emp.salary) FROM 
											 dev_schema.employee as emp INNER JOIN dev_schema.department as dept
											ON emp.fk_department_id = dept.department_id GROUP BY dept.department_name);

-- Select the employees with second highest salary
SELECT first_name, last_name, MAX(salary) as salary FROM dev_schema.employee
WHERE salary < (SELECT MAX(salary) FROM dev_schema.employee) GROUP BY first_name, last_name ORDER BY salary DESC LIMIT 1;

-- first_name	last_name	salary	salary_diff
--	Ketan		Kulkarni	300000	0
--	Rahul		Gupta		200000	100000















