-- ######################### INSERT #########################

SELECT * FROM test_schema.testing_1;

INSERT INTO test_schema.testing_1 VALUES
(5, 'Rachit', 'Kulkarni', 'M', 4, '09-03-2019', 98.15, 'true'),
(2, 'Rachit', 'Sharma', 'M', 10, '09-03-2013', 90.15, 'true'),
(3, 'Katrina', 'Kaif', 'Female', 36, '09-03-1986', 40.00, 'false'),
(4, 'Atharva', 'Shindikar', 'Male', 4, '10-01-2019', 85.25, 'true');

SELECT first_name as fname, last_name as lname FROM test_schema.testing_1 ORDER BY age DESC;

INSERT INTO test_schema.testing_1 VALUES
(6, '12345', 'Roshan', 'M', 40, '09-03-2013', 98.15, 'true');

INSERT INTO test_schema.testing_1 VALUES (first_name, last_name, )
('Rahul', 'Gupta', 'M', 31, '31-05-1991', 98.15, 'false');

INSERT INTO test_schema.testing_1 VALUES
(6, 'Hritik', 'Roshan', 'M', 10, '09-03-2013', 98.15, false);

SELECT first_name, age FROM test_schema.testing_1;

SELECT * FROM test_schema.testing_1 WHERE first_name IN ('Rachit', 'Katrina');

-- ######################### UPDATE #########################

SELECT * FROM test_schema.testing_1 ORDER BY dob DESC;

UPDATE test_schema.testing_1 SET first_name = 'Hritik' WHERE t_id = 6;

UPDATE test_schema.testing_1 SET last_name = 'Tripathi' WHERE t_id = 10;

-- ######################### DELETE #########################

DELETE FROM test_schema.testing_1 WHERE age>36;
DELETE FROM test_schema.testing_1;



-- ######################### Identity Column #########################

CREATE TABLE test_schema.identity_test_column
(
	i_id SERIAL primary key,
	name varchar(100) NOT NULL
);

SELECT * FROM test_schema.identity_test_column;

INSERT INTO test_schema.identity_test_column VALUES (1, 'testing 1');

UPDATE test_schema.identity_test_column SET i_id = 5 WHERE name = 'testing 1';
UPDATE test_schema.identity_test_column SET i_id = 51 WHERE name = 'testing 2';

DELETE FROM test_schema.identity_test_column WHERE i_id = 3;


INSERT INTO test_schema.identity_test_column (name) VALUES ('testing 7');


-- ######################### Identity Column With SEQUENCE #########################

CREATE TABLE test_schema.seq_table
(
	seq_id INT primary key,
	name varchar(100) NOT NULL
);

CREATE SEQUENCE auto_seq_id
start 100
increment 1
NO MAXVALUE;

SELECT * FROM test_schema.seq_table;

INSERT INTO test_schema.seq_table(seq_id, name) VALUES (nextval('auto_seq_id'), 'testing 2');












