CREATE DATABASE library;
USE library;

CREATE TABLE students (
    student_id VARCHAR(15),
    student_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    image TINYINT,
    PRIMARY KEY (student_id)
);

CREATE TABLE books (
    book_id VARCHAR(15),
    book_name VARCHAR(50) NOT NULL,
    book_publisher VARCHAR(20) NOT NULL,
    book_author VARCHAR(50) NOT NULL,
    book_year_publish YEAR NOT NULL,
    book_times_of_publish INT NOT NULL,
    book_price INT NOT NULL,
    book_image TINYINT,
    catigories_id INT NOT NULL,
    PRIMARY KEY (book_id)
);

CREATE TABLE borrowed_books (
    borrowed_id INT AUTO_INCREMENT,
    student_id VARCHAR(15) NOT NULL,
    book_id VARCHAR(15) NOT NULL,
    borrowed_date DATE NOT NULL,
    returned_date DATE,
    PRIMARY KEY (borrowed_id)
);

CREATE TABLE categories (
    catigories_id INT AUTO_INCREMENT,
    categories_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (catigories_id)
);

CREATE TABLE address (
    address_id INT AUTO_INCREMENT,
    student_id VARCHAR(15),
    address_name VARCHAR(500),
    PRIMARY KEY (address_id)
);

ALTER TABLE address ADD FOREIGN KEY (student_id) REFERENCES students(student_id);

ALTER TABLE borrowed_books ADD FOREIGN KEY (student_id) REFERENCES students(student_id);
ALTER TABLE borrowed_books ADD FOREIGN KEY (book_id) REFERENCES books(book_id);
ALTER TABLE books ADD FOREIGN KEY (catigories_id) REFERENCES categories(catigories_id);

insert into students values ("C04H","Hai","nguyenhai@gmail.com",112);
insert into students values ("C03D","Dang","dangnguyen@gmail.com",113);
insert into students values ("C05A","An","tranan@gmail.com",90);
insert into students values ("C02T","Tien","tiendang@gmail.com",80);
insert into students values ("C04K","Khanh","khanhtran@gmail.com",70);


insert into books values("1","Trang Quynh","Kim Dong","Xuan Dieu",1995,3,25000,80,1);
insert into books values("2","Pha che","Kim Dong","ABC",1993,2,50000,90,2);
insert into books values("3","Avenger","Kim Dong","DEF",2000,5,75000,100,1);
insert into books values("4","Math","Kim Dong","BBB",2003,1,19000,50,3);
insert into books values("5","Science","Kim Dong","DDD",2010,6,110000,60,1);


insert into categories (categories_name)  values ("Science");
insert into categories (categories_name) values ("Childrent");
insert into categories (categories_name) values ("Math");
insert into categories (categories_name) values ("Food-Drinks");
insert into categories (categories_name) values ("Comic");

    
insert into borrowed_books (student_id,book_id,borrowed_date,returned_date) values("C04H","1","2020/06/07","2020/06/14");
insert into borrowed_books (student_id,book_id,borrowed_date,returned_date) values("C03D","2","2020/06/01","2020/06/14");
insert into borrowed_books (student_id,book_id,borrowed_date,returned_date) values("C05A","3","2020/05/06","2020/05/14");
insert into borrowed_books (student_id,book_id,borrowed_date,returned_date) values("C04H","4","2020/05/15","2020/06/01");
insert into borrowed_books (student_id,book_id,borrowed_date,returned_date) values("C04K","2","2020/06/07","2020/06/14");


insert into address (student_id,address_name) values("C04H","Ha Nam");
insert into address (student_id,address_name) values("C04K","Hai Phong");
insert into address (student_id,address_name) values("C05A","Quang Nam");
insert into address (student_id,address_name) values("C03D","Ha Noi");
insert into address (student_id,address_name) values("C04H","Dong Nai");

SELECT 
    student_name, address.address_name AS address
FROM
    students
        INNER JOIN
    address ON students.student_id = address.student_id
HAVING students.student_name = 'Hai'
  
  
    
