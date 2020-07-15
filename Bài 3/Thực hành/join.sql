use classicmodels;
SELECT 
    customers.customerNumber,
    customerName,
    phone,
    paymentDate,
    amount
FROM
    customers
        INNER JOIN
    payments ON customers.customerNumber = payments.customerNumber
WHERE
    city = 'Las Vegas';

SELECT 
    c.customerNumber, c.customerName, o.orderNumber, o.status
FROM
    customers c
        LEFT JOIN
    orders o ON c.customerNumber = o.customerNumber;

SELECT 
    c.customerNumber, c.customerName, o.orderNumber, o.status
FROM
    customers c
        LEFT JOIN
    orders o ON c.customerNumber = o.customerNumber
WHERE
    orderNumber IS NULL;
