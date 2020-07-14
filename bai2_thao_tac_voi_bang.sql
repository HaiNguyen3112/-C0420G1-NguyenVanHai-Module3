CREATE DATABASE second_database;
USE second_database;
CREATE TABLE contacts (
    contact_id INT(11) NOT NULL AUTO_INCREMENT,
    last_name VARCHAR(30) NOT NULL,
    first_name VARCHAR(25),
    birthday DATE,
    CONSTRAINT contracts_pk PRIMARY KEY (contact_id)
);
-- truncate contacts;
INSERT INTO contacts(last_name,first_name,birthday) VALUES("Tran","An","2002/10/10"), 
("Nguyen","Hai","2001/12/12"), 
("Huynh","Huong","2000/10/19");
ALTER TABLE contacts ADD address VARCHAR(20) NOT NULL AFTER birthday;
ALTER TABLE contacts DROP COLUMN address;
ALTER TABLE contacts CHANGE first_name name VARCHAR(20) NOT NULL;
ALTER TABLE contacts RENAME TO people;