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

create table if not exists orderform(
	id int not null auto_increment primary key,
	customer_id varchar(20),
	seller_id varchar(20),
	product_id int,
	product_cnt int,
	ship_name varchar(20),
	ship_zipcode varchar(10),
	ship_address varchar(50),
	status_c varchar(20),
	status_s varchar(20),
	foreign key (seller_id) references seller(id),
	foreign key (customer_id) references customer(id),
	foreign key (product_id) references product(id)
)DEFAULT CHARSET=utf8;
