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

