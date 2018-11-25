set echo off
set feedback off
set verify off
set heading off

/* start C:\Users\evana\Desktop\project\lookup.sql */

prompt 
prompt ***** Welcome to iSell! *****
prompt ****** SHOW ORDER DETAIL ******
prompt 

accept VorderNum prompt 'Please enter the Order Number: '

select 'Order Number: '||orderNum
	||'Order Status: '||orderStatus
	||''
	||chr(10)||'Customer Number: '||Orders.CustomerNum
	||chr(10)||chr(9)||lastName||','||firstName
	||chr(10)||chr(9)||address
	||chr(10)||chr(9)||city||', '||state||' '||zip
	||chr(10)||chr(9)||'('||substr(phone,1,3)||')'||substr(phone,4,3)||'-'||substr(phone,6,4)
	||chr(10)||' '
	||chr(10)||'Item Number: '||Orders.productNum
	||chr(10)||chr(9)||'Item Description: '||productName
	||chr(10)||chr(9)||'Unit Price: '||Orders.UnitPrice 
	||chr(10)||''
	||chr(10)||'Date Ordered: '||orderDate 
	||chr(10)||'Date Shipped: '||shipDate
	||chr(10)||' '
	||chr(10)||'Quantity Ordered: '||orderQty
	||chr(10)||'Amount Ordered: '||orderAmount
	||chr(10)||'Quantity Shipped: '||shipQty
	||chr(10)||'Amount Shipped: '||shipAmount
	from Orders,Customers,Products 
	where Orders.orderNum = &VorderNum
	and Orders.CustomerNum = Customers.CustomerNum
	and Orders.productNum = Products.productNum;