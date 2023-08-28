-- ######################### CREATE ######################### 
CREATE TABLE testing_1
(
	t_id int primary key,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	gender varchar(10) CHECK(GENDER IN ('M', 'F', 'Male', 'Female')),
	age int,
	dob date,
	grade float,
	is_active boolean,
	CONSTRAINT ch_student_age CHECK(age>0)
);

CREATE SCHEMA test_schema;
	
CREATE TABLE test_schema.testing_1
(
	t_id int primary key,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	gender varchar(10) CHECK(GENDER IN ('M', 'F', 'Male', 'Female')),
	age int,
	dob date,
	grade float,
	is_active boolean,
	CONSTRAINT ch_student_age CHECK(age>0),
	-- CONSTRAINT ch_gender CHECK(GENDER IN ('M', 'F', 'Male', 'Female'))
);

-- ######################### Identity Column #########################

DROP TABLE test_schema.identity_test_column;

CREATE TABLE test_schema.identity_test_column
(
	i_id SERIAL primary key,
	name varchar(100) NOT NULL
);
SELECT * FROM test_schema.identity_test_column;
INSERT INTO test_schema.identity_test_column(name) VALUES ('testing 1');
INSERT INTO test_schema.identity_test_column(name) VALUES ('testing 2');
INSERT INTO test_schema.identity_test_column(name) VALUES ('testing 1');
DELETE FROM test_schema.identity_test_column WHERE i_id IN (5, 6, 10);
INSERT INTO test_schema.identity_test_column(name) VALUES ('testing 1');

CREATE SEQUENCE IF NOT EXISTS test_schema.auto_i_id
start 100
increment 1
MAXVALUE 200;
INSERT INTO test_schema.identity_test_column(i_id, name) VALUES (nextval('test_schema.auto_i_id'), 'testing 3');
SELECT * FROM test_schema.identity_test_column;


-- ######################### ALTER #########################
ALTER TABLE test_schema.testing_1 RENAME TO new_testing_1;
ALTER TABLE test_schema.new_testing_1 ALTER COLUMN dob TYPE VARCHAR;

-- ######################### DROP #########################
DROP TABLE test_schema.testing_1;
DROP SCHEMA test_schema;

-- ######################### TRUNCATE #########################
TRUNCATE TABLE test_schema.new_testing_1;