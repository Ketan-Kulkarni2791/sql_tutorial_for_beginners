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


-------------------------------------- LPAD() --------------------------------------

SELECT LPAD('')