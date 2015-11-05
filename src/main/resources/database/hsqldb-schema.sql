
create table user (
    id  int NOT NULL AUTO_INCREMENT,
	name  varchar(50)  ,
	age  int NULL ,
	sex  int NULL  ,
	PRIMARY KEY (id)
);

create table teacher(
	id int not null AUTO_INCREMENT,
	name varchar(50),
	gender varchar(50),
	research_area varchar(50),
	title varchar(50),
	primary key (id)
);

create table student(
	id int not null AUTO_INCREMENT,
	name varchar(50),
	gender varchar(50),
	major varchar(50),
	grade varchar(50),
	supervisor_id int not null,
	primary key (id),
	constraint fk_product_1 foreign key (supervisor_id)
        references teacher (id)
);

create table product(
	id int not null AUTO_INCREMENT,
	currentPrice double,
	standardPrice double,
	name varchar(20),
	shortDescription varchar(50) ,
	details varchar(50),
	defaultPicturePath varchar(50),
	primary key(id)
);

create table picture(
	id int not null AUTO_INCREMENT,
	productId int,
	picturepath varchar(50),
	primary key (id),
	constraint fk_pictureProduct foreign key (productId) references product(id)
);

create table category(
	id integer not null AUTO_INCREMENT,
	parentId integer,
	name varchar(50),
	primary key(id)
);
create table productCategory(
	id int not null AUTO_INCREMENT,
	productId int,
	categoryId int,
	primary key(id),
	constraint fk_product foreign key(productId) references product(id),
	constraint fk_category foreign key(categoryId) references category(id)
);