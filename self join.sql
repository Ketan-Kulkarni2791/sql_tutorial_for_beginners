SELECT * FROM dev_schema.employee;


ALTER TABLE dev_schema.employee ADD COLUMN reports_to TEXT;

SELECT * FROM dev_schema.employee WHERE fk_department_id = 100;

UPDATE dev_schema.employee SET reports_to = 'TechM12' WHERE fk_department_id = 100; 
UPDATE dev_schema.employee SET reports_to = null WHERE employee_id = 'TechM12';

SELECT * FROM dev_schema.employee WHERE fk_department_id = 101;

INSERT INTO dev_schema.employee (first_name, last_name, salary, fk_job_id, fk_department_id, reports_to) VALUES
('Jim', 'Halpert', 20000, 3, 101, 'TechM17'),
('Ross', 'Gellar', 16000, 3, 101, 'TechM17');

SELECT * FROM dev_schema.employee WHERE fk_department_id = 102;

INSERT INTO dev_schema.employee (first_name, last_name, salary, fk_job_id, fk_department_id, reports_to) VALUES
('Dhruv', 'Rathee', 170000, 4, 102, 'TechM13'),
('Aakash', 'Banarjee', 130000, 4, 102, 'TechM13');

SELECT * FROM dev_schema.employee WHERE fk_department_id = 103;
SELECT * FROM dev_schema.department WHERE department_id = 103;
SELECT * FROM dev_schema.job;

INSERT INTO dev_schema.employee (first_name, last_name, salary, fk_job_id, fk_department_id, reports_to) VALUES
('Dwight', 'Schrute', 190000, 6, 103, 'TechM24'),
('Bill', 'Clinton', 175000, 6, 103, 'TechM24');

SELECT * FROM dev_schema.employee WHERE fk_department_id = 104;
SELECT * FROM dev_schema.department WHERE department_id = 104;
SELECT * FROM dev_schema.job;

UPDATE dev_schema.employee SET reports_to = 'TechM18' WHERE fk_department_id = 104; 
UPDATE dev_schema.employee SET reports_to = null WHERE employee_id = 'TechM18';

----------------------------- Using Inner Join --------------------------------
SELECT 
    concat(emp.first_name, ' ', emp.last_name) AS employee,
    concat(manager.first_name, ' ', manager.last_name) AS manager
FROM
    dev_schema.employee AS emp
INNER JOIN
    dev_schema.employee AS manager 
ON manager.employee_id = emp.reports_to;

----------------------------- Using Left Join --------------------------------
SELECT 
    concat(emp.first_name, ' ', emp.last_name) AS employee,
    concat(manager.first_name, ' ', manager.last_name) AS manager
FROM
    dev_schema.employee AS emp
LEFT JOIN
    dev_schema.employee AS manager 
ON manager.employee_id = emp.reports_to ORDER BY manager;




