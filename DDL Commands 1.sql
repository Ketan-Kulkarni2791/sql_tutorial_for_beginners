-- ######################### CREATE #########################

CREATE TABLE students
(
	s_id int primary key,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	gender varchar(10) CHECK(GENDER IN ('M', 'F', 'Male', 'Female')),
	age int,
	dob date,
	grade float,
	is_active boolean,
	CONSTRAINT ch_student_age CHECK(age>0)
)

CREATE SCHEMA test_schema;

CREATE TABLE test_schema.students
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

-- ######################### ALTER #########################
ALTER TABLE test_schema.students RENAME TO new_students;
ALTER TABLE test_schema.new_students ALTER COLUMN dob TYPE VARCHAR;

-- ######################### TRUNCATE #########################
TRUNCATE TABLE test_schema.new_students;

-- ######################### DROP #########################
DROP TABLE test_schema.new_students;
DROP SCHEMA test_schema;

SELECT *FROM test_schema.testing_1;

INSERT INTO test_schema.testing_1 VALUES
(5, 'Rachit', 'Kulkarni', 'M', 4, '09-03-2019', 98.15, 'true'),
(2, 'Rachit', 'Sharma', 'M', 10, '09-03-2013', 90.15, 'true'),
(3, 'Katrina', 'Kaif', 'Female', 36, '09-03-1986', 40.00, 'false'),
(4, 'Atharva', 'Shindikar', 'Male', 4, '10-01-2019', 85.25, 'true');

