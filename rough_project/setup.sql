set echo off
set feedback off
set verify off
set heading off


/* start C:\Users\evana\Desktop\380Project\setup.sql */

drop table CancelledOrders;
drop table CancelledReasons;
drop table Orders; 
drop table Customers;
drop table Products;
drop table Status;
drop table counter;

create table Customers(
	customerNum number(5) PRIMARY KEY,
	firstName varchar(15),
	lastName varchar (15),
	address varchar (30),
	city varchar(20),
	state varchar(3),
	zip number(5),
	phone varchar(14));
     
CREATE TABLE Products( 
	PNum varchar(2) PRIMARY KEY,
	PName varchar(20),
	UnitPrice number(6,2),
	Type varchar(8),
	WarehouseUnits number(4),
	AvailableUnits number(4));

CREATE TABLE Status(
	StatusNum number(2) PRIMARY KEY,
	Status varchar(9));

CREATE TABLE Orders(
	orderNum number(5) PRIMARY KEY,
	orderDate date,
	dateShipped date,
	customerNum number(5),
	QtyOrdered number(5),
	QtyShipped number(5),
	PNum varchar(2),
	statusNum number(2),
	amountOrdered number(8,2),
	amountShipped number(8,2),
	constraint fk_Orders_CustomerNum foreign key (customerNum) references Customers (customerNum), 
	constraint fk_Orders_statusNum foreign key (statusNum) references Status (StatusNum),
	constraint fk_Orders_PNum foreign key (PNum) references Products (PNum));
 
CREATE TABLE CancelledReasons(
	cancelledNum number(1) PRIMARY KEY,
	cancelledReason varchar(20));

CREATE TABLE CancelledOrders(
	cancelledNum number(1),
	orderNum number(5),
	cancelledDate date,
	constraint fk_CancelledOrders_orderNum foreign key (orderNum) references Orders(orderNum),
	constraint fk_CancelledOrders_cancelled foreign key (cancelledNum) references CancelledReasons(cancelledNum));

CREATE TABLE Counter(
	MaxNum number(5));

/* Insert into counter */
insert into Counter values(1004);

/* Insert Customers */
insert into Customers values(102,'Elaine','Jones','123 Main Street','Los Angeles','CA',91001,'(323) 511-1199');
insert into Customers values(103,'Boba','Fett','354 Second Ave.','Mos Eisley','FL',84576,'(584) 468-8424');
insert into Customers values(104,'Han','Solo','5872 Park Street', 'Hoth','TN',68715,'(681) 687-2347');
insert into Customers values(105,'Luke','Skywalker','6547 Esperanza','Tatooine','FL',98716,'(658) 957-8724');

/* Insert Products */
insert into Products values('p1','Pen',1.59,'Regular',1000,880);
insert into Products values('p2','Pencil',2.00,'Promo',500,450);
insert into Products values('p3','Ballpen',2.49,'Regular',800,700);
insert into Products values('c1','Coffee Cup',5.00,'Promo',500,400);
insert into Products values('k1','75% keyboard',10.00,'Regular',100,90);

/* Insert Status */ 
insert into Status values(1,'Open');
insert into Status values(2,'Shipped');
insert into Status values(3,'Cancelled');

/* insert into Cancelled Reason */
insert into CancelledReasons values(1,'No longer need');
insert into CancelledReasons values(2,'Found better price');
insert into CancelledReasons values(3,'Too long to deliver');
insert into CancelledReasons values(4,'Others');

/* insert into Orders */
insert into Orders values (1001,'22-MAR-2018',NUll,102,18,20,'p2',2,36.00,40.00);
insert into Orders values (1002,'20-MAR-2018','22-MAR-2018',102,17,21,'p3',2,42.33,52.29);
insert into Orders values (1003,'23-MAR-2018',NULL,103,12,13,'c1',1,23.23,42.42);
/* insert into Cancelled orders */ 
insert into CancelledOrders values (2,1001,'23-MAR-2018');