use classicmodels;
explain select * from customers where customerNumber = 175;
alter table customers add index idx_customerNumber(customerNumber);
alter table customers drop index idx_customerNumber;
alter table customers add index idx_full_name(contactFirstName,contactLastName);
explain select * from customers where contactFirstName in ("Jean","King");
