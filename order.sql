set echo off
set feedback off
set verify off
set heading off

/* start C:\Users\evana\Desktop\project\order.sql */

spool C:\Users\evana\Desktop\spool\project\order.txt

column pnum heading 'p#' format a3
column pname heading PName format a15
column price heading 'Unit|Price' format $9,999.99
column type heading 'Type' format a9
column warehouse heading 'Warehouse|Units' format 9,999
column available heading 'Available|Units' format 9,999

prompt
prompt ***** Welcome to iSell! *****
prompt ****** PLACE AN ORDER *******

select 'Today''s Date:',sysdate from dual;

prompt
accept VcustomerNum prompt 'Enter the Customer Number: ' 
select chr(10)||'Customer Name: '||lastName||', '||firstName
	||chr(10)||chr(9)||'Shipping Address: '||Address
	||chr(10)||chr(9)||'City, State Zip: '||trim(city)||', '||trim(state)||''||trim(zip)
	||chr(10)||chr(9)||'Phone: '||'('||substr(phone,1,3)||')'||substr(phone,4,3)||'-'||substr(phone,6,4)
	from Customers
	where customerNum = &VcustomerNum;

accept VproductName prompt 'Enter Product Search Keyword: '

set heading on
select productNum AS pnum,
	productName AS pname,
	UnitPrice As price,
	Type As type,
	warehouseUnits AS warehouse,
	availableUnits AS available  
	from Products 
	where lower(productName) like trim(lower('%&VproductName%'));
set heading off

prompt
accept VproductNum prompt 'Enter the Item Number: ' 

select 'Item Number: '||productNum 
	||chr(10)||'Item Description: '||productName
	||chr(10)||'Unit Price: '||ltrim(to_char(unitPrice,'$9,999.99'))
	from Products
	where Products.productNum = lower('&VproductNum');

accept Vqty prompt 'Enter the quantity ordered: ' 

select 'Amount Ordered: '||ltrim(to_char(&Vqty*UnitPrice,'$9,999.99'))
	from Products
	where Products.productNum = lower('&VproductNum');


insert into Orders (orderNum,orderDate,customerNum,productNum,orderQty,UnitPrice,orderAmount,orderStatus)
	select maxNum,sysdate,&VcustomerNum,'&VproductNum',&Vqty,Products.UnitPrice,(Products.UnitPrice*&Vqty),'Open'
	from counter,Products
	where '&VproductNum' = productNum;

select '***** Order Status: '||orderStatus
	||chr(10)||'***** Order Number is ---->'||chr(9)||maxNum
	from Orders, counter
	where Orders.orderNum = maxNum;

update counter set maxNum = maxNum+1;
commit;

spool off