set echo off
set feedback off
set verify off
set heading off

/* start C:\Users\evana\Desktop\project\shipped.sql */

prompt
prompt ***** Welcome to iSell! *****
prompt ****** UPDATE SHIPPING ******

select 'Todays Date:', sysdate from dual;

accept VorderNum prompt 'Please enter the Order Number: '

select 'Order Number: '||orderNum
	||chr(10)||'Date Ordered: '||orderDate
	||chr(10)||'Customer Number: '||Orders.customerNum
	||chr(10)||chr(9)||lastName||', '||firstName
	||chr(10)||chr(9)||address
	||chr(10)||chr(9)||city||','||state||' '||zip
	||chr(10)||'Item Number: '||Orders.productNum
	||chr(10)||chr(9)||'Item Description: '||productName
	||chr(10)||chr(9)||'Unit Price: '||Orders.UnitPrice 
	||chr(10)||'Quantity Ordered: '||orderQty
	||chr(10)||'Amount Ordered: '||orderAmount
	from Orders,Customers,Products
	where orderNum = &VorderNum
	and Customers.customerNum = Orders.customerNum
	and Products.productNum = Orders.productNum;

prompt *************************

accept VqtyShipped prompt 'Quantity Shipped: '

update Orders 
	set orderStatus = 'Shipped',
	shipDate = sysdate,
	shipAmount = (&VqtyShipped*(select UnitPrice from Orders where &VorderNum = orderNum));


select 'Order Status: '||orderStatus
	||chr(10)||'Date Shipped: '||shipDate
	||chr(10)||'Quantity Shipped: '||&VqtyShipped
	||chr(10)||'Amount Shipped: '||ltrim(to_char(shipAmount,'$9,999.99'))
	from Orders
	where &VorderNum = orderNum;


