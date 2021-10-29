CREATE DATABASE week3_demo;

CREATE TABLE demo_table (
    id    INTEGER     PRIMARY KEY,
    title VARCHAR(80) NOT NULL
);

INSERT INTO demo_table 
    (id, title)
VALUES 
    (1, 'First title'),
    (2, 'Second title');

SELECT * FROM demo_table;