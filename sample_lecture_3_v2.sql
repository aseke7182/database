CREATE TABLE TeSt (
  name VARCHAR(10)
);

DROP TABLE test;
CREATE TABLE "TeSt" (
  name VARCHAR(10)
);

SELECT *
FROM "TeSt"; -- this is comment


INSERT INTO departments DEFAULT VALUES;
ALTER TABLE departments
  ALTER COLUMN name SET DEFAULT 'ABCD';

SELECT *
FROM departments;

INSERT INTO departments VALUES (DEFAULT, 'IT');
INSERT INTO departments (name) VALUES ('Accounting');

INSERT INTO employees VALUES (DEFAULT, 'John', 100000, 8);
INSERT INTO employees (salary, name, department) VALUES (120000, 'Sam', 10);

SELECT *
FROM employees;

CREATE TABLE tmp_employees (
  LIKE employees INCLUDING CONSTRAINTS
);

INSERT INTO tmp_employees
  SELECT *
  FROM employees
  WHERE salary = 100000
RETURNING *;


SELECT *
FROM tmp_employees;


UPDATE tmp_employees
SET salary = salary + 10000
RETURNING *;

UPDATE employees
SET salary = salary * 0.9
WHERE salary > 100000
RETURNING name, salary AS "New Salary";


UPDATE employees AS e
SET salary = salary * 2 FROM departments AS d
WHERE d.name = 'Accounting' AND e.department = d.id
RETURNING *;


UPDATE employees AS e
SET salary = salary / 2
WHERE department =
      (SELECT id
       FROM departments
       WHERE name = 'IT')
RETURNING *;


UPDATE employees
SET (name, salary) = (SELECT name, salary
              FROM tmp_employees
              WHERE id = 32)
RETURNING *;


DELETE FROM tmp_employees;

SELECT * FROM tmp_employees;

DELETE FROM employees WHERE id = 40
RETURNING *;


DELETE FROM employees AS e USING departments AS d
WHERE d.name = 'Accounting' AND e.department = d.id
RETURNING *;

SELECT * FROM departments;

DELETE FROM employees WHERE department = 8;

DELETE FROM departments WHERE id = 8
RETURNING name;
