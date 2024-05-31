CREATE DATABASE lucy;
Show databases;
USE lucy;

CREATE DATABASE lucy; -- Gives error when database already exists
CREATE DATABASE IF NOT EXISTS lucy; -- If database doesn't exists then it creates, else don't create

Drop DATABASE lucy;
Drop DATABASE sakila;

CREATE DATABASE sakila;

USE sakila;

CREATE TABLE actor
(
    actor_id    SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    first_name  VARCHAR(255)               DEFAULT NULL,
    last_name   VARCHAR(255),
    last_update TIMESTAMP,
    PRIMARY KEY (actor_id)
);

SHOW TABLES;

INSERT INTO actor (first_name)
VALUES ('Diwash');

INSERT INTO actor (first_name)
VALUES ('Elizabeth'); # Can't add due to duplicate primary key

SHOW CHARACTER SET;


CREATE TABLE IF NOT EXISTS actor
(
    actor_id    SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name  VARCHAR(255)      NOT NULL,
    last_name   VARCHAR(255)      NOT NULL,
    last_update TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (actor_id),
    KEY idx_actor_last_name (last_name)
);

SHOW CREATE TABLE actor;

SELECT * FROM actor;


ALTER TABLE actor RENAME COLUMN last_update TO last_update_time;

DESC actor;

ALTER TABLE actor CHANGE last_update_time last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
DESC  actor;

DROP DATABASE sakila;