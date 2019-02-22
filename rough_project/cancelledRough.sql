set echo off
set feedback off
set verify off
set heading off

/* start C:\Users\evana\Desktop\380Project\cancelledRough.sql */

/* Welcome message */
select lpad(rpad(' Welcome to iSell!!! ',24,'*'),27,'*')
	||chr(10)||
	lpad(rpad(' CANCEL ORDER ',22,'*'),27,'*') 
	from dual;

/* Date */
select 'Today''s Date: '||sysdate from dual;

/* User enter Order Number */
accept VorderNum prompt 'Please enter Order Number: '

/* Order Query */
select 'Order Number: '||orderNum
	||chr(10)||'Date Ordered: '||orderDate
	||chr(10)||'Order Status: '||status 
	||chr(10)||'Customer Number: '||Orders.customerNum
	||chr(10)||chr(9)||firstName||','||lastName
	||chr(10)||chr(9)||address
	||chr(10)||chr(9)||city||','||state||' '||zip
	||chr(10)||'Item Number: '||Orders.PNum
	||chr(10)||'Item Description: '||Products.PName
	||chr(10)||'Unit Price: '||'$'|| UnitPrice
	||chr(10)||'Quantity Ordered: '||QtyOrdered
	||chr(10)||'Amount Ordered: '||'$'||amountOrdered
	from Orders,Status,Customers,Products
	where Customers.customerNum = Orders.customerNum
	and Products.PNum = Orders.PNum
	and Status.StatusNum = Orders.StatusNum
	and Orders.orderNum = &VorderNum;

select rpad('*',35,'*') from dual;
prompt
prompt Cancelled Reason Codes: 
select cancelledNum,cancelledReason from CancelledReasons;

accept VreasonCode prompt 'Enter a reason code: '

update Orders 
	set statusNum = 3
	where orderNum = &VorderNum;

Insert into CancelledOrders values(&VreasonCode,&VorderNum,sysdate);

prompt
prompt This Order is now CANCELLED. Thank you for the business 