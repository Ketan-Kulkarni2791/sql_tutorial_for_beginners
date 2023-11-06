-------------------------------------- CONCAT() --------------------------------------

SELECT CONCAT('Hello', 'World');		-- o/p : "HelloWorld"
SELECT CONCAT('Hello', ' ', 'World');		-- o/p : "Hello World"

SELECT CONCAT(first_name, ' ', last_name) as Employee_Full_Name FROM dev_schema.employee;


-------------------------------------- CONCAT_WS() --------------------------------------

SELECT CONCAT_WS(',', 'Hello', 'World');		-- o/p : "Hello,World"
SELECT CONCAT_WS('Hello', 'World');				-- o/p : "World"

SELECT CONCAT_WS(', ', department_id, department_name) FROM dev_schema.department;


-------------------------------------- LOWER() --------------------------------------

SELECT LOWER('GDWLKGHDSLGHDG');					-- o/p : "gdwlkghdslghdg"

SELECT LOWER(first_name) as full_name FROM dev_schema.employee;
SELECT LOWER(CONCAT(first_name, ' ', last_name)) as full_name FROM dev_schema.employee;

-------------------------------------- CHAR_LENGTH()/CHARACTER_LENGTH() --------------------------------------

SELECT CHAR_LENGTH('hjdghdsjhgjahsd');						-- o/p : 15
SELECT CHAR_LENGTH('hjdghdsjhgjahsd kgkkgk yfhdj');			-- o/p : 28
SELECT CHARACTER_LENGTH('hjdghdsjhgjahsd');					-- o/p : 15
SELECT CHARACTER_LENGTH('hjdghdsjhgjahsd kgkkgk yfhdj');	-- o/p : 28

SELECT last_name, CHAR_LENGTH(last_name) as length_of_last_names FROM dev_schema.employee;

-------------------------------------- SUBSTRING() --------------------------------------

SELECT last_name, SUBSTRING( first_name, 1, 1 ) AS initial FROM dev_schema.employee ORDER BY last_name;

-------------------------------------- COALESCE() --------------------------------------

SELECT * FROM dev_schema.job;
INSERT INTO dev_schema.job (job_title, min_salary, max_salary) VALUES ('Cleaner', 5000, NULL);

SELECT job_title, (max_salary-min_salary/2) as avg_salary FROM dev_schema.job;
SELECT job_title, (COALESCE(max_salary, 0)-min_salary/2) as avg_salary FROM dev_schema.job;

-------------------------------------- CAST() --------------------------------------

SELECT CAST('100' AS INTEGER);
SELECT CAST('10C' AS INTEGER);
SELECT CAST ('2020-01-01' AS DATE), CAST ('01-OCT-2020' AS DATE);
SELECT CAST('true' AS BOOLEAN), CAST('false' as BOOLEAN), CAST('T' as BOOLEAN), CAST('F' as BOOLEAN);

-------------------------------------- SUM() --------------------------------------

SELECT SUM(salary) as total_salary FROM dev_schema.employee;

-------------------------------------- COUNT() --------------------------------------

SELECT COUNT(*) FROM dev_schema.employee;
SELECT COUNT(DISTINCT fk_department_id) FROM dev_schema.employee; 

-------------------------------------- EXTRACT() --------------------------------------

SELECT * FROM dev_schema.employee;
ALTER TABLE dev_schema.employee ADD COLUMN created_at DATE DEFAULT NOW();
ALTER TABLE dev_schema.employee DROP COLUMN created_at;
ALTER TABLE dev_schema.employee ADD COLUMN created_at TIMESTAMP DEFAULT NOW();
ALTER TABLE dev_schema.employee ADD COLUMN updated_at TIMESTAMP DEFAULT NOW();

UPDATE dev_schema.employee 
SET created_at = '2017-11-21 09:21:56.732847'
WHERE first_name = 'Regina';

SELECT EXTRACT(CENTURY FROM TIMESTAMP '2023-03-11 17:43:17.436');
SELECT EXTRACT(CENTURY FROM TIMESTAMP '1998-03-11 17:43:17.436');
SELECT EXTRACT(DAY FROM TIMESTAMP '2023-03-11 17:43:17.436');
SELECT EXTRACT(DAY FROM INTERVAL '19 days 3 minute');
SELECT EXTRACT(MONTH FROM TIMESTAMP '2023-03-11 17:43:17.436');
SELECT EXTRACT(DOW FROM TIMESTAMP '2023-03-11 17:43:17.436');
SELECT EXTRACT(EPOCH FROM TIMESTAMP WITH TIME ZONE '2023-03-11 17:43:17.436-07');
SELECT EXTRACT(EPOCH FROM TIMESTAMP '2023-03-11 17:43:17.436');
SELECT EXTRACT(EPOCH FROM INTERVAL '3 days 10 hours');
SELECT EXTRACT(HOUR FROM TIMESTAMP '2023-03-11 17:43:17.436');



