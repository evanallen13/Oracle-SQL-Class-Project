set echo off
set feedback off
set verify off
set heading off

/* start C:\Users\evana\Desktop\project\salesReport.sql */

column numOfOrders heading 'No of |Orders' format 9999
column productNum heading 'Prod|No' format a5
column productName heading 'Product|Name' format a15
column orderDate heading 'Order|Month' format a6
column totalUnits heading 'Total|Units' format 9,999
column totalAmount heading 'Total|Amount' format $9,999.99

prompt 
prompt ****** SALES REPORT ******

set heading on 
select Orders.productNum,
	to_char(orderDate,'mm/yy') As orderDate,
	productName,
	count(orderNum) As numOfOrders,
	sum(orderQty) As totalUnits,
	sum(orderAmount) As totalAmount
	from Products,Orders 
	where Orders.productNum = Products.productNum
	and (orderStatus = 'Open' OR orderStatus = 'Shipped')
	group by Orders.productNum,productName,to_char(orderDate,'mm/yy');

set heading off