SHOW DATABASES;

CREATE DATABASE practice1;

USE practice1;

CREATE TABLE users(
    userID INT NOT NULL auto_increment PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

SHOW TABLES;

SELECT * FROM users;

INSERT INTO users (name) VALUES ('Diwash Mainali'), ('Utsav Mainali');

SELECT * FROM users;

ALTER TABLE users RENAME COLUMN name TO full_name;

SELECT * FROM users;

DELETE FROM users WHERE full_name = 'Utsav Mainali';

SELECT * FROM users;

UPDATE users SET users.full_name = 'Utsav Mainali' WHERE users.full_name = 'Diwash Mainali';

SELECT * FROM users;

CREATE TABLE subject(
    subject_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(255) DEFAULT('Hello')
);

INSERT INTO subject VALUES ();

SELECT * FROM subject;

SELECT full_name, subject_name FROM users INNER JOIN subject;

DROP TABLE subject;

SHOW TABLES ;

Drop DATABASE practice1;

SHOW DATABASES;