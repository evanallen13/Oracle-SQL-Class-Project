set echo off
set feedback off
set verify off
set heading off

/* start C:\Users\evana\Desktop\project\setup.sql */

drop table Orders;
drop table Customers;
drop table ReasonCode;
drop table Products;
drop table Counter;

create table Products(
	productNum varchar(4) PRIMARY KEY,
	productName varchar(15),
	UnitPrice number(6),
	type varchar(9),
	warehouseUnits number(4),
	availableUnits number(4));

create table ReasonCode(
	ReasonCode number(10) PRIMARY KEY,
	ReasonDescription varchar(19));

create table Customers(
	customerNum number(5) PRIMARY KEY,
	lastName varchar(20),
	firstName varchar(20),
	address varchar(20),
	city varchar(20),
	state varchar(20),
	zip varchar(20),
	phone number(10));

create table Counter(
	maxNum number(5));

create table Orders(
	orderNum number(5) PRIMARY KEY,
	orderDate date,
	customerNum number(5), /* FK */
	productNum varchar(4), /* FK */
	orderQty number(4),
	shipQty number(4),
	UnitPrice number(6,2), /* Not FK */
	orderAmount number(6,2),
	shipDate date,
	shipAmount number(6,2),
	orderStatus varchar(15),
	reasonCode number(1), /* FK */
	constraint fk_Orders_customerNum foreign key (customerNum) references Customers (customerNum),
	constraint fk_Orders_prodcutNum foreign key (productNum) references Products (productNum),
	constraint fk_Orders_reasonCode foreign key (reasonCode) references ReasonCode (reasonCode));

/* Insert Products */
insert into Products values('p1','Pen',1.59,'Regular',1000,880);
insert into Products values('p2','Pencil',2.00,'Promo',500,450);
insert into Products values('p3','Ballpen',2.49,'Regular',800,700);
insert into Products values('c1','Coffee Cup',5.00,'Promo',500,400);
insert into Products values('k1','75% keyboard',10.00,'Regular',100,90);

/* Insert Reasons */
insert into ReasonCode values(1,'No longer need');
insert into ReasonCode values(2,'Found better price');
insert into ReasonCode values(3,'Too long to deliver');
insert into ReasonCode values(4,'Others');

/* Insert Customers */
insert into Customers values(102,'Jones','Elaine','123 Main Street','Los Angeles','CA',91001,3235111199);
insert into Customers values(103,'Fett','Boba','354 Second Ave.','Mos Eisley','FL',84576,5844688424);
insert into Customers values(104,'Solo','Han','5872 Park Street', 'Hoth','TN',68715,6816872347);
insert into Customers values(105,'Skywalker','Luke','6547 Esperanza','Tatooine','FL',98716,6589578724);

/* Insert Orders */
insert into Orders values(1001,'25-MAR-2018',102,'p2',20,18,2.00,40.00,'28-MAR-2018',36.00,'Shipped',NULL);

/* Counter */
insert into Counter values(1001);
