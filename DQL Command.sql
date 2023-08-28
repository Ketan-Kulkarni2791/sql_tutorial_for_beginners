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


CREATE SEQUENCE IF NOT EXISTS dev_schema.emp_id_seq;
SELECT setval('dev_schema.emp_id_seq', 10);
CREATE TABLE IF NOT EXISTS dev_schema.employee
(
	employee_id text primary key DEFAULT 'TechM' || nextval('dev_schema.emp_id_seq'),
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


INSERT INTO dev_schema.job (job_title, min_salary, max_salary) VALUES
('Software Developer', 15000, 300000),
('Software Tester', 10000, 100000),
('IT Infra Admin', 7000, 30000),
('Data Analyst', 12000, 200000),
('Business Analyst', 11000, 180000),
('Accountant', 14000, 250000),
('SPOC HR', 8000, 50000);


INSERT INTO dev_schema.department (department_name) VALUES
('IT Developent'),
('IT Infrastructure'),
('Data Analytics'),
('Finance'),
('HR');


INSERT INTO dev_schema.employee (first_name, last_name, salary, fk_job_id, fk_department_id) VALUES
('Rachit', 'Kulkarni', 300000, 1, 100),
('Ketan', 'Kulkarni', 300000, 1, 100),
('Rahul', 'Gupta', 200000, 4, 102),
('Ajinkya', 'Tonpe', 10000, 7, 104),
('Shobha', 'Tripathy', 50000, 6, 104),
('Indu', 'Singh', 30000, 2, 100),
('Manoj', 'Gadkar', 25000, 3, 101),
('Shubham', 'Giradkar', 180000, 5, 104),
('Pooja', 'Shrivastava', 30000, 7, 104);

---------------------------------------------------------------------------------------------------

SELECT * FROM dev_schema.job;							-- To fetch all the data from job table.
SELECT job_title, max_salary FROM dev_schema.job;		-- To fetch specific columns data.
SELECT job_title as dream_job, max_salary as dream_pay
FROM dev_schema.job;									-- Alias named column

-- Return all the employees whose salary is equal to 300000
SELECT * FROM dev_schema.employee WHERE salary = 300000;

-- Return all the employee names whose salary is less than 30000
SELECT * FROM dev_schema.employee WHERE salary < 30000;

-- Return all the employee names whose salary is greater than 30000
SELECT * FROM dev_schema.employee WHERE salary > 30000;

-- Return all the employee names whose salary is greater than or equal to 30000
SELECT * FROM dev_schema.employee WHERE salary >= 30000;

-- Return all the employee names whose salary is less than or equal to 30000
SELECT * FROM dev_schema.employee WHERE salary <= 30000;

-- Return all the employee names whose salary is not equal to 300000
SELECT * FROM dev_schema.employee WHERE salary <> 300000;
SELECT * FROM dev_schema.employee WHERE salary != 300000;

-- And operator
SELECT * FROM dev_schema.employee WHERE salary = 300000 AND last_name = 'Kulkarni';

-- OR operator
SELECT * FROM dev_schema.employee WHERE salary = 300000 OR salary = 200000;

-- LIKE operator

-- Finds any values that start with K
SELECT * FROM dev_schema.employee WHERE last_name LIKE 'k%';
-- Finds any values that have p in any position
SELECT * FROM dev_schema.employee WHERE last_name LIKE '%p%';
-- Finds any value that ends with 'a'
SELECT * FROM dev_schema.employee WHERE last_name LIKE '%a';

-- Finds any values that have 00 in the second and third positions
SELECT * FROM dev_schema.employee WHERE salary::text LIKE '_00%';
-- Finds any values that have 8 in the second position and end with a 0
SELECT * FROM dev_schema.employee WHERE salary::text LIKE '_8%0';









