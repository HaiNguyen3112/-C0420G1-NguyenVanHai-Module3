USE classicmodels;
delimiter //
CREATE PROCEDURE getCusById(IN cusNum INT(11))
BEGIN 
SELECT * FROM customers WHERE customerNumber = cusNum;
END //
delimiter ;
CALL getCusById(175);

delimiter //
CREATE PROCEDURE GetCustomersCountByCity( IN in_city VARCHAR(50), OUT total INT)
BEGIN
SELECT COUNT(customerNumber)
INTO total
FROM customers
WHERE city = in_city;
END //
delimiter ;

CALL GetCustomersCountByCity("Lyon",@total);
SELECT @total;

delimiter // 
CREATE PROCEDURE SetCounter( INOUT counter INT, IN inc INT)
BEGIN
SET counter = counter + inc;
END //
delimiter ;
SET @counter =1;
CALL SetCounter(@counter,1);
CALL SetCounter(@counter,1);
CALL SetCounter(@counter,5);
SELECT @counter;