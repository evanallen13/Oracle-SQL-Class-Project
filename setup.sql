set echo on
set feedback on
set verify on
set heading on

/* start C:\Users\evana\Desktop\project\setup.sql */
spool C:\Users\evana\Desktop\project\spool\setup.txt

drop table Orders;
drop table Customers;
drop table ReasonCode;
drop table Products;
drop table Counter;

create table Products(
	productNum varchar2(4) PRIMARY KEY,
	productName varchar2(15),
	UnitPrice number(6,2),
	type varchar2(9),
	warehouseUnits number(4),
	availableUnits number(4));

create table ReasonCode(
	ReasonCode number(1) PRIMARY KEY,
	ReasonDescription varchar2(19));

create table Customers(
	customerNum number(5) PRIMARY KEY,
	lastName varchar2(20),
	firstName varchar2(20),
	address varchar2(20),
	city varchar2(20),
	state varchar2(20),
	zip number(5),
	phone number(10));

create table Counter(
	maxNum number(5));

create table Orders(
	orderNum number(5) PRIMARY KEY,
	orderDate date,
	customerNum number(5), /* FK */
	productNum varchar2(4), /* FK */
	orderQty number(4),
	shipQty number(4),
	UnitPrice number(6,2), /* Not FK */
	orderAmount number(6,2),
	shipDate date,
	shipAmount number(6,2),
	orderStatus varchar2(15),
	reasonCode number(1), /* FK */
	constraint fk_Orders_customerNum foreign key (customerNum) references Customers (customerNum),
	constraint fk_Orders_prodcutNum foreign key (productNum) references Products (productNum),
	constraint fk_Orders_reasonCode foreign key (reasonCode) references ReasonCode (reasonCode));

/* Insert Products */
insert into Products values('p1','Pen',1.59,'Regular',1000,880);
insert into Products values('p2','Pencil',2.00,'Promo',500,450);
insert into Products values('p3','Ballpen',2.49,'Regular',800,700);
insert into Products values('p4','Coffee Cup',5.00,'Promo',500,400);
insert into Products values('p5','75% keyboard',10.00,'Regular',100,90);
insert into Products values('p6','Logitech Mouse',12.23,'Promo',400,350);
insert into Products values('p7','Football',13.00,'Regular',75,70);

/* Insert Reasons */
insert into ReasonCode values(1,'No longer need');
insert into ReasonCode values(2,'Found better price');
insert into ReasonCode values(3,'Too long to deliver');
insert into ReasonCode values(4,'Others');

/* Insert Customers */
insert into Customers values(102,'Jones','Elaine','123 Main Street','Los Angeles','CA',91001,3235111199);
insert into Customers values(103,'Fett','Boba','354 Second Ave.','Mos Eisley','FL',84576,5844688424);
insert into Customers values(104,'Solo','Han','5872 Park Street','Hoth','TN',68715,6816872347);
insert into Customers values(105,'Skywalker','Luke','6547 Esperanza','Tatooine','FL',98716,6589578724);
insert into Customers values(106,'Kenobi','Obi-Wan','5345 Jedi Temple Dr.','Coruscant','GA',95634,876348763);

/* Insert Orders */
insert into Orders values(999,'11-DEC-2018',106,'p5',4,3,10.00,40.00,'12-DEC-2018',30.00,'Open',Null);
insert into Orders values(1000,'16-NOV-2018',103,'p1',15,13,1.59,23.85,'17-NOV-2018',20.67,'Open',Null);
insert into Orders values(1001,'01-DEC-2018',105,'p4',29,29,5.00,145.00,'02-DEC-2018',145.00,'Open',Null);
insert into Orders values(1002,'25-NOV-2018',103,'p1',13,9,1.59,20.67,'26-NOV-2018',14.31,'Open', Null );
insert into Orders values(1003,'11-NOV-2018',106,'p5',12,9,10.00,120.00,'12-NOV-2018',90.00,'Open',Null);
insert into Orders values(1004,'09-DEC-2018',105,'p1',16,11,1.59,25.44,'10-DEC-2018',17.49,'Open',Null);
insert into Orders values(1005,'12-DEC-2018',106,'p6',29,29,12.23,354.67,'18-DEC-2018',354.67,'Open',Null);
insert into Orders values(1006,'01-NOV-2018',102,'p1',3,2,1.59,4.77,'02-NOV-2018',3.18,'Open',Null);
insert into Orders values(1007,'05-DEC-2018',106,'p4',1,1,5.00,5.00,'06-DEC-2018',5.00,'Open',Null);
insert into Orders values(1008,'13-DEC-2018',102,'p5',22,22,10.00,220.00,'14-DEC-2018',220.00,'Open', Null );
insert into Orders values(1009,'12-NOV-2018',102,'p5',26,26,10.00,260.00,'13-NOV-2018',260.00,'Open',Null);
insert into Orders values(1010,'05-NOV-2018',104,'p2',18,17,2.00,36.00,'06-NOV-2018',34.00,'Open',Null);
insert into Orders values(1011,'09-NOV-2018',102,'p6',3,0,12.23,36.69,'10-NOV-2018',0.00,'Open', Null );
insert into Orders values(1012,'05-NOV-2018',106,'p6',20,19,12.23,244.60,'6-NOV-2018',232.37,'Open',Null);
insert into Orders values(1013,'04-DEC-2018',103,'p4',6,5,5.00,30.00,'05-DEC-2018',25.00,'Open',Null);
insert into Orders values(1014,'13-NOV-2018',105,'p3',23,23,2.49,57.27,'14-NOV-2018',57.27,'Open', Null );
insert into Orders values(1015,'29-NOV-2018',103,'p6',17,14,12.23,207.91,'30-NOV-2018',171.22,'Open',Null);
insert into Orders values(1016,'02-DEC-2018',105,'p4',17,12,5.00,85.00,'03-DEC-2018',60.00,'Open',Null);

/* Counter */
insert into Counter values((select max(orderNum) from Orders)+1);

spool off