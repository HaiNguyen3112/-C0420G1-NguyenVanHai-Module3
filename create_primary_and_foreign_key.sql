create database second_database;
use second_database;
create table users(
user_id int auto_increment primary key,
username varchar(40),
password varchar(255),
email varchar(255)
);
create table roles(
role_id int auto_increment,
role_name varchar(50),
primary key(role_id)
);

create table userrole(
user_id int not null,
role_id int not null,
primary key(user_id,role_id),
foreign key(user_id) references users(user_id),
foreign key(role_id) references roles(role_id)
);

insert into users(username,password,email) values("Hai","123456","nguyenhai@gmail.com"),
("Huong","456789","huynhhuong@gmail.com"),("Binh","15596324","binhbi@gmail.com");
insert into roles values (1,"Honda"),(2,"Yamaha"),(3,"SYM");
insert into userrole values(1,2);
truncate userrole;