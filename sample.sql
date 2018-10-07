CREATE DATABASE mydb
OWNER aibekkuralbaev;

DROP DATABASE mydb;

CREATE TABLE employees (
  id     SERIAL CONSTRAINT employees_pkey PRIMARY KEY,
  name   VARCHAR(50) NOT NULL,
  salary INTEGER DEFAULT 10000
);



INSERT INTO employees (name, salary) VALUES ('Sam', 5000);
INSERT INTO employees (name) VALUES ('Sam');
INSERT INTO employees (name, salary) VALUES ('Bob2',30000);

DELETE FROM employees WHERE id=1;



ALTER SEQUENCE employees_id_seq INCREMENT 2;

DROP TABLE employees_copy;
CREATE TABLE employees_copy (
  LIKE employees INCLUDING CONSTRAINTS
);

INSERT INTO employees_copy (salary) VALUES (10000);

SELECT * FROM employees_copy;


ALTER TABLE employees ADD COLUMN department VARCHAR(50);
ALTER TABLE employees DROP COLUMN department;

ALTER TABLE employees
  ADD COLUMN department VARCHAR(50) NOT NULL DEFAULT 'IT';

ALTER TABLE employees
    ALTER COLUMN department DROP DEFAULT;

ALTER TABLE employees
    ALTER COLUMN department DROP NOT NULL;

INSERT INTO employees (name, salary, department)
VALUES ('John', 5000, 'R&D');

INSERT INTO employees (name, salary)
VALUES ('John', 5000);


ALTER TABLE employees
    ALTER COLUMN department SET DATA TYPE VARCHAR(10);

INSERT INTO employees (name, salary, department)
VALUES ('John', 5000, 'R&D');


DROP TABLE IF EXISTS employees_copy RESTRICT;

ALTER TABLE employees
    ADD COLUMN created_at TIMESTAMP;


INSERT INTO employees (name, salary, department, created_at)
VALUES ('John', 5000, 'R&D', now());

ALTER TABLE employees
    ALTER COLUMN created_at TYPE date;

ALTER TABLE employees
    ADD COLUMN updated_at TIMESTAMP WITH TIME ZONE;

INSERT INTO employees (name, salary, department, created_at, updated_at)
VALUES ('John', 5000, 'R&D', now(), now());

SELECT * FROM employees;


CREATE TABLE cities (
    name            text,
    population      float,
    altitude        int     -- in feet
);

CREATE TABLE capitals (
    state           char(2)
) INHERITS (cities);

INSERT INTO cities VALUES ('Almaty', 100000, 1000);
INSERT INTO capitals VALUES ('Astana', 100000, 1000,'KZ');

SELECT * FROM cities;
SELECT * FROM capitals;
SELECT * FROM ONLY cities;


UPDATE cities SET name='Shymkent' WHERE name = 'Almaty';