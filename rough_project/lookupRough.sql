set echo off
set feedback off
set verify off
set heading off

/* start C:\Users\evana\Desktop\380Project\lookupRough.sql */

prompt ***** Welcome to iSell! *****
prompt ****** SHOW ORDER DETAILS ******

accept VorderNum prompt 'Please enter the Order Number: '

select 'Order Number: '||orderNum
	||chr(10)||'Order Status: '||status
	||chr(10)||''
	||chr(10)||'Customer Number: '||Customers.customerNum
	||chr(10)||chr(9)||lastName||','||firstName
	||chr(10)||chr(9)||address
	||chr(10)||chr(9)||city||','||state||' '||zip
	||chr(10)||chr(9)||phone
	||chr(10)||''
	||chr(10)||'Item Number: '||Orders.PNum
	||chr(10)||chr(9)||'Item Description: '||PName
	||chr(10)||chr(9)||'Unit Price: '||'$'||UnitPrice
	||chr(10)||'Date Ordered: '||OrderDate
	||chr(10)||'Date Shipped: '||dateShipped 
	||chr(10)||''
	||chr(10)||'Quantity Ordered: '||QtyOrdered
	||chr(10)||'Amount Ordered: '||amountOrdered
	||chr(10)||'Quantity Shipped: '||QtyShipped
	||chr(10)||'Amount Shipped: '||amountShipped
	from Status,Orders,Customers,Products
	where orderNum =  &VorderNum
	and Orders.StatusNum = Status.StatusNum
	and Orders.PNum = Products.PNum
	and Orders.customerNum = Customers.customerNum;