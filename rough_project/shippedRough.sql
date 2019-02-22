set feedback off
set echo off
set verify off
set heading off

/* start C:\Users\evana\Desktop\380Project\shippedRough.sql */

prompt '***** Welcome to iSell! *****'
prompt '****** UPDATE SHIPPING ******'

select 'Today''s date:', sysdate from dual;
accept VorderNum prompt 'Enter order number: '

select 'Date ordered: '||orderDate
/* Customer data */
||chr(10)||'Customer number: '||Customers.customerNum
||chr(10)||chr(9)||firstName||' '||lastname
||chr(10)||chr(9)||address
||chr(10)||chr(9)||city||', '||state||' '||zip
||chr(10)||chr(9)||phone
/* Product data */
||chr(10)||'Item description: '||Orders.PNum
||chr(10)||chr(9)||'Item Description: '||PName
||chr(10)||chr(9)||'Unit Price: '||UnitPrice
||chr(10)||'Quantity Ordered: '|| amountOrdered
||chr(10)||'Amount Ordered: '||amountOrdered
	from Orders,Customers,Products,Status 
	where &VorderNum = orderNum
	and Orders.PNum = Products.PNum 
	and Orders.StatusNum = Status.StatusNum 
	and Orders.customerNum = customers.customerNum;

accept VordersShipped prompt 'Quantity shipped: '

update Orders 
	set statusNum = 2 , 
	QtyShipped = &VordersShipped, 
	amountShipped = (&VordersShipped*(select UnitPrice from products where Orders.PNum = Products.PNum)) 
	where Orders.orderNum = &VorderNum;

select 'Order status: '||Status
	||chr(10)|| 'Date Shipped: '||dateShipped
	||chr(10)|| 'Quantity Shipped: '||QtyShipped
	||chr(10)|| 'Amount Shipped: '||amountShipped
	from Orders,Status
	where Orders.orderNum = &VorderNum
	And Orders.StatusNum = Status.StatusNum;