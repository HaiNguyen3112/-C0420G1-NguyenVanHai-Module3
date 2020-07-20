USE classicmodels;
delimiter //
CREATE PROCEDURE findAllCustomer()
BEGIN
SELECT * FROM customers;
END //
delimiter ;

CALL findAllCustomer;