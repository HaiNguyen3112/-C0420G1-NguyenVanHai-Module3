create database demo;
use demo;
create table Products(
Id int,
productCode int,
productName varchar(45),
productPrice varchar(45),
productAmount varchar(45),
productDescription varchar(45),
productStatus varchar(45),
primary key(Id)
);

insert into Products values(1,45,"asd","123","fdgf","dsf","ewrwer");
insert into Products values(2,13,"asd","aswerdasd","fdgf","dsf","ewrwer");
insert into Products values(6,154443,"ddd","a123sdasd","fdgf","dsf","ewrwer");
insert into Products values(4,122,"asd","asdd12asd","fdgf","dsf","ewrwer");
insert into Products values(5,123,"asd","50000","fdgf","dsf","ewrwer");

-- Buoc 3
explain select * from Products where productCode =123;

create unique index idx_product 
on Products(productCode);

explain select * from Products where productCode =123;
alter table Products drop index idx_product;

explain select * from Products where productName ="ddd" and productPrice = 50000;

create index idx_product2
on Products(productName,productPrice);

explain select * from Products where productName ="ddd" and productPrice = 50000;

-- Buoc 4:
create view product_view as 
select productCode, productName, productPrice
from Products;

select * from product_view;

create or replace view product_view as 
select productCode, productName, productPrice, productStatus
from Products;

select * from product_view;

drop view product_view;


-- Buoc 5: 
delimiter //
create procedure pro_procedure ()
begin
select * from Products;
end //
delimiter ;

call pro_procedure();
-- Id int,productCode int,productName varchar(45),productPrice varchar(45),productAmount varchar(45),productDescription varchar(45),productStatus varchar(45),
delimiter //
create procedure add_product(in id int, in procode int, in proname varchar(45), in proprice varchar(45), in proamount varchar(45), in prodes varchar(45), in prostatus varchar(45))
begin
insert into Products values (id,procode,proname,proprice,proamount,prodes,prostatus);
end //
delimiter ;

call add_product(7,234,"sdf","wer","32r","2rfewf","2dfewfd");



