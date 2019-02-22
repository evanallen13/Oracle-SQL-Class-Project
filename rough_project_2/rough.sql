set feedback on
set echo on
set verify on
set heading on

/* start C:\Users\evana\Desktop\moreSql\rough.sql */
drop table Products;

CREATE TABLE Products( 
	PNum varchar(2) PRIMARY KEY,
	PName varchar(8),
	UnitPrice number(6,2),
	Type varchar(8),
	WarehouseUnits number(4),
	Available number(4));

insert into Products values('p1','Pen',1.59,'Regular',1000,880);
insert into Products values('p2','Pencil',2.00,'Promo',500,450);
insert into Products values('p3','Ballpen',2.49,'Regular',800,700);


prompt
prompt 'Welcome to Evan''s store of amazing things'
prompt 
accept vPName prompt 'Please enter product name: '
prompt 

column UnitPrice heading 'Price' format $9,999.99
column Total heading 'Total' format $9,999.99

# This looks up product weather lower or cap
SELECT PNum, PName, UnitPrice, WarehouseUnits AS Units, UnitPrice*WarehouseUnits Total 
	FROM Products
	WHERE PName like lower('%&vPName%')
	OR PName like initcap('&vPName%');


drop table Products;
