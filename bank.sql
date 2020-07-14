CREATE DATABASE bank;
USE bank;
CREATE TABLE customers (
    customer_number VARCHAR(20),
    fullname VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone INT,
    PRIMARY KEY (customer_number)
);

CREATE TABLE type_of_account (
    id INT NOT NULL,
    `name` VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE accounts (
    account_number VARCHAR(50),
    customer_number VARCHAR(20),
    account_type_id INT,
    `date` DATE,
    balance INT DEFAULT 0,
    PRIMARY KEY (account_number),
    FOREIGN KEY (customer_number)
        REFERENCES customers (customer_number),
    FOREIGN KEY (account_type_id)
        REFERENCES type_of_account (id)
);

CREATE TABLE transactions (
    tran_number INT PRIMARY KEY,
    tran_account_number VARCHAR(50),
    tran_date DATE,
    amounts INT,
    descriptions VARCHAR(200),
    FOREIGN KEY (tran_account_number)
        REFERENCES accounts (account_number)
);




