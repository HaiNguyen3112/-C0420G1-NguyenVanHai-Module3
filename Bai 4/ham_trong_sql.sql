use second_database;
CREATE TABLE student (
    id INT,
    `name` VARCHAR(20),
    age INT,
    course VARCHAR(20),
    total INT
);

insert into student values (1,"Hoang",21,"CNTT",400000),
(2,"Viet",19,"DTVT",320000),
(3,"Thanh",18,"KTDN",400000),
(4,"Nhan",21,"CK",450000),
(5,"Huong",20,"TCNH",500000),
(5,"Huong",20,"TCNH",200000);

SELECT 
    *
FROM
    student
WHERE
    name = 'Huong';

SELECT 
    name, SUM(total)
FROM
    student
WHERE
    name = 'Huong'
GROUP BY `name`;

SELECT 
    name
FROM
    student
GROUP BY `name`;