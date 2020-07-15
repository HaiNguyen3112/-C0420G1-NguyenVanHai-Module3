use classicmodels;

SELECT 
    `status`
FROM
    orders
GROUP BY `status`;

SELECT 
    `status`, COUNT(status) AS 'Number_Of_Status'
FROM
    orders
GROUP BY `status`;

SELECT 
    `status`, COUNT(quantityOrdered * priceEach) AS Amount
FROM
    orders
        INNER JOIN
    orderdetails ON orders.orderNumber = orderdetails.orderNumber
GROUP BY `status`;

SELECT 
    orderNumber, COUNT(quantityOrdered * priceEach) AS Amount
FROM
    orderdetails
GROUP BY orderNumber;

SELECT 
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
        INNER JOIN
    orderdetails ON orders.orderNumber = orderdetails.orderNumber
WHERE
    status = 'shipped'
GROUP BY year
HAVING year > 2003
