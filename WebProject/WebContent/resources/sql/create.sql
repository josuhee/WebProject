create table if not exists customer(
	id varchar(30) not null primary key,
	passwd varchar(20),
	name varchar(30)
)DEFAULT CHARSET=utf8;

create table if not exists seller(
	id varchar(30) not null primary key,
	passwd varchar(20),
	name varchar(30)
)DEFAULT CHARSET=utf8;

create table if not exists product(
	id int not null auto_increment primary key,
	name varchar(30),
	price int,
	unitsInStock int,
	description TEXT,
	filename varchar(50),
	currDate datetime,
	seller_id varchar(30),
	foreign key (seller_id) references seller(id)
)DEFAULT CHARSET=utf8;




desc customer;
select * from seller;

insert into product(name) values("hi2");
select * from product;
delete from product where id = 2;
drop table product;