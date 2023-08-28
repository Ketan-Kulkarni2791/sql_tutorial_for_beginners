-- ######################### INSERT #########################

SELECT * FROM test_schema.testing_1;

INSERT INTO test_schema.testing_1 VALUES
(5, 'Rachit', 'Kulkarni', 'M', 4, '09-03-2019', 98.15, 'true'),
(2, 'Rachit', 'Sharma', 'M', 10, '09-03-2013', 90.15, 'true'),
(3, 'Katrina', 'Kaif', 'Female', 36, '09-03-1986', 40.00, 'false'),
(4, 'Atharva', 'Shindikar', 'Male', 4, '10-01-2019', 85.25, 'true');

SELECT first_name as fname, last_name as lname FROM test_schema.testing_1 ORDER BY age DESC;

INSERT INTO test_schema.testing_1 VALUES
(6, 'Hritik', 'Roshan', 'M', -10, '09-03-2013', 98.15, 'true');

INSERT INTO test_schema.testing_1 VALUES
(6, 'Hritik', 'Roshan', 'M', 10, '09-03-2013', 98.15, false);

-- ######################### UPDATE #########################

SELECT * FROM test_schema.testing_1 ORDER BY t_id;

UPDATE test_schema.testing_1 SET last_name = 'Tripathi' WHERE t_id = 10;

-- ######################### DELETE #########################

DELETE FROM test_schema.testing_1 WHERE age>10;
DELETE FROM test_schema.testing_1;











