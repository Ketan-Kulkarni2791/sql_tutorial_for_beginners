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


