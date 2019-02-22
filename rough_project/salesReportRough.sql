set echo off
set feedback off
set verify off
set heading off

/* start C:\Users\evana\Desktop\380Project\salesReportRough.sql */

prompt ****** SALES REPORT ******

column PName heading 'Product|Description' format a20

select Orders.PNum, PName, orderDate
	from Orders, Products
	where Orders.PNum = Products.PNum
	group by 