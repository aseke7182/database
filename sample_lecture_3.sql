
INSERT INTO departments (name) VALUES ('R&D');
SELECT *
FROM departments;

INSERT INTO employees (name, salary, department)
VALUES ('Bob', 120000, 2);

INSERT INTO departments DEFAULT VALUES;

SELECT *
FROM employees;


CREATE TABLE tmp_employees (
  LIKE employees
);

INSERT INTO tmp_employees
    SELECT * FROM employees WHERE salary = 100000
    RETURNING *;

SELECT name as employee_name FROM tmp_employees;

UPDATE departments SET name = 'Education'
WHERE id = 3
RETURNING id, name AS department_name;

UPDATE employees AS e SET salary = salary + 10000 FROM departments AS d
WHERE d.name = 'R&D' AND e.department = d.id;

UPDATE employees AS e SET salary = 0 WHERE department =
                                           (SELECT id FROM departments WHERE name = 'Accounting')
RETURNING *;


UPDATE tmp_employees SET salary = (SELECT salary FROM employees WHERE id = 26);

SELECT * FROM tmp_employees;

DELETE FROM employees AS e USING departments AS d
WHERE d.name = 'Accounting' AND e.department = d.id
RETURNING *;

SELECT * FROM employees;
