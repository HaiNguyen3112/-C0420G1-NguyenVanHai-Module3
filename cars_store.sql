create database cars_store;
use cars_store;
CREATE TABLE productlines (
    product_line VARCHAR(50) NOT NULL,
    text_description TEXT,
    image TEXT,
    PRIMARY KEY (product_line)
);

CREATE TABLE products (
    product_code VARCHAR(15),
    product_name VARCHAR(70) NOT NULL,
    product_Scale VARCHAR(10) NOT NULL,
    product_vendor VARCHAR(50) NOT NULL,
    product_description TEXT NOT NULL,
    quantity_in_stock INT NOT NULL,
    buy_price FLOAT NOT NULL,
    msrp FLOAT NOT NULL,
    product_line VARCHAR(50) NOT NULL,
    PRIMARY KEY (product_code),
    FOREIGN KEY (product_line)
        REFERENCES productlines (product_line)
);

CREATE TABLE offices (
    office_code VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    address_line1 VARCHAR(50) NOT NULL,
    address_line2 VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50) NOT NULL,
    postal_code VARCHAR(15) NOT NULL,
    PRIMARY KEY (office_code)
);

CREATE TABLE employees (
    employee_number INT NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    report_to INT NOT NULL,
    office_code VARCHAR(10) NOT NULL,
    FOREIGN KEY (office_code)
        REFERENCES offices (office_code),
    FOREIGN KEY (report_to)
        REFERENCES employees (employee_number),
    PRIMARY KEY (employee_number)
);

CREATE TABLE customers (
    customer_number INT,
    customer_name VARCHAR(50) NOT NULL,
    customer_last_name VARCHAR(50) NOT NULL,
    customer_first_name VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    address_line1 VARCHAR(50) NOT NULL,
    address_line2 VARCHAR(50),
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    pastal_code VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    credit_limit FLOAT,
    sales_rep_employee_number INT NOT NULL,
    FOREIGN KEY (sales_rep_employee_number)
        REFERENCES employees (employee_number),
    PRIMARY KEY (customer_number)
);

CREATE TABLE orders (
    order_number INT NOT NULL,
    order_date DATE NOT NULL,
    requeried_date DATE NOT NULL,
    shipped_date DATE,
    `status` VARCHAR(15) NOT NULL,
    comments TEXT,
    quantity_ordered INT NOT NULL,
    price_each FLOAT NOT NULL,
    customer_number INT NOT NULL,
    PRIMARY KEY (order_number),
    FOREIGN KEY (customer_number)
        REFERENCES customers (customer_number)
);



CREATE TABLE payments (
    customer_number INT NOT NULL,
    check_number VARCHAR(50) NOT NULL,
    payment_date DATE NOT NULL,
    amount FLOAT NOT NULL,
    FOREIGN KEY (customer_number)
        REFERENCES customers (customer_number)
);




CREATE TABLE order_details (
    order_number INT NOT NULL,
    product_code VARCHAR(15) NOT NULL,
    PRIMARY KEY (order_number , product_code),
    FOREIGN KEY (order_number)
        REFERENCES orders (order_number),
    FOREIGN KEY (product_code)
        REFERENCES products (product_code)
);


