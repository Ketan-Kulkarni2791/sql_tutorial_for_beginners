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


