CREATE DATABASE demo;
USE demo;
CREATE TABLE Products (
    Id INT,
    productCode INT,
    productName VARCHAR(45),
    productPrice VARCHAR(45),
    productAmount VARCHAR(45),
    productDescription VARCHAR(45),
    productStatus VARCHAR(45),
    PRIMARY KEY (Id)
);

INSERT INTO Products VALUES(1,45,"asd","123","fdgf","dsf","ewrwer");
INSERT INTO Products VALUES(2,13,"asd","aswerdasd","fdgf","dsf","ewrwer");
INSERT INTO Products VALUES(6,154443,"ddd","a123sdasd","fdgf","dsf","ewrwer");
INSERT INTO Products VALUES(4,122,"asd","asdd12asd","fdgf","dsf","ewrwer");
INSERT INTO Products VALUES(5,123,"asd","50000","fdgf","dsf","ewrwer");

-- Buoc 3
EXPLAIN SELECT * FROM Products WHERE productCode =123;

CREATE UNIQUE INDEX idx_product 
ON Products(productCode);

EXPLAIN SELECT * FROM Products WHERE productCode =123;
ALTER TABLE Products DROP INDEX idx_product;

EXPLAIN SELECT * FROM Products WHERE productName ="ddd" AND productPrice = 50000;

CREATE INDEX idx_product2
ON Products(productName,productPrice);

EXPLAIN SELECT * FROM Products WHERE productName ="ddd" AND productPrice = 50000;

-- Buoc 4:
CREATE VIEW product_view AS
    SELECT 
        productCode, productName, productPrice
    FROM
        Products;

SELECT 
    *
FROM
    product_view;

CREATE OR REPLACE VIEW product_view AS
    SELECT 
        productCode, productName, productPrice, productStatus
    FROM
        Products;

SELECT 
    *
FROM
    product_view;

DROP VIEW product_view;


-- Buoc 5: 
delimiter //
CREATE PROCEDURE pro_procedure ()
BEGIN
SELECT * FROM Products;
END //
delimiter ;

CALL pro_procedure();
-- Id int,productCode int,productName varchar(45),productPrice varchar(45),productAmount varchar(45),productDescription varchar(45),productStatus varchar(45),
delimiter //
CREATE PROCEDURE add_product(IN id INT, IN procode INT, IN proname VARCHAR(45), IN proprice VARCHAR(45), IN proamount VARCHAR(45), IN prodes VARCHAR(45), IN prostatus VARCHAR(45))
BEGIN
INSERT INTO Products VALUES (id,procode,proname,proprice,proamount,prodes,prostatus);
END //
delimiter ;

CALL add_product(7,234,"sdf","wer","32r","2rfewf","2dfewfd");



