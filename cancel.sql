set echo off
set feedback off
set verify off
set heading off

/* start C:\Users\evana\Desktop\project\cancel.sql */

prompt
prompt ***** Welcome to iSell! *****
prompt ***** CANCEL ORDER *****
prompt

select 'Today''s date: '||sysdate from dual;

accept VorderNum prompt 'Please enter the Order Number: '
prompt

select 'Order Number: '||orderNum
	||chr(10)||'Date Ordered: '||orderDate
	||chr(10)||'Order Status: '||orderStatus
	||chr(10)||'Customer Number: '||Orders.customerNum
	||chr(10)||chr(9)||lastName||', '||firstName 
	||chr(10)||chr(9)||address
	||chr(10)||chr(9)||city||', '||state||' '||zip
	||chr(10)||chr(9)||'('||substr(phone,1,3)||')'||substr(phone,4,3)||'-'||substr(phone,7,4)
	||chr(10)||'Item Number: '||Orders.productNum
	||chr(10)||chr(9)||'Item Description: '||productName 
	||chr(10)||chr(9)||'Unit Price: '||Orders.UnitPrice
	||chr(10)||'Quantity Ordered: '||orderQty
	||chr(10)||'Amount Ordered: '||orderAmount
	from Orders, Customers, Products
	where Orders.orderNum = &VorderNum
	and Orders.customerNum = Customers.customerNum
	and Orders.productNum = Products.productNum;

prompt ********************************************

set heading on 

select reasonCode As Cancel, reasonDescription As Reason_Code
	from ReasonCode;

set heading off

prompt
accept Vreason prompt 'Please enter a reason code: '

update Orders 
	set orderStatus = 'Cancelled',
	reasonCode = &Vreason
	where orderNum = &VorderNum;

select 'This order is now CANCELLED. Thank you for your business.'
	from Orders 
	where &VorderNum = orderNum 
	and orderStatus = 'Cancelled';