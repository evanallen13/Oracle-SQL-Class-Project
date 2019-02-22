set echo off
set feedback off
set verify off
set heading off
/*  start C:\Users\evana\Desktop\380Project\productsRough2.sql */

prompt
prompt ***** Welcome to iSell *****
prompt ***** PLACE AN ORDER *****
prompt
accept VcustNum prompt 'Enter customer number: '

/* Customer Information */
select 'Customer name:',rtrim(ltrim(lastName))||', '||rtrim(ltrim(firstName))||chr(10)||'Shipping Address: '||rtrim(ltrim(address))||chr(10)||'City,State,Zip: '|| rtrim(ltrim(city))||', '||rtrim(ltrim(state))||', '||rtrim(ltrim(zip))||'Phone: '|| rtrim(ltrim(phone))
	from Customers
	where &VcustNum = customerNum;

prompt
accept VpName prompt 'Enter product search keyword: '

/* Show products based on keywords */
set heading on
select *
	from Products 
	where lower(PName) like rtrim(ltrim(lower('%&VpName%')));
set heading off

accept VPnum prompt 'Enter product number: '

/* Show Product details */
select 'Item Number: '||PNum||chr(10)||'Item Descrption: '||PName||chr(10)||'Unit Price: '||UnitPrice 
	from Products
	where Pnum = lower('&VPnum');

accept VQty prompt 'Enter Quantity: '

select 'Total price: '||(UnitPrice*&VQty)
	from products
	where Pnum = lower('&VPnum');

insert into Orders (orderNum,orderDate,customerNum,QtyOrdered,PNum,statusNum,amountOrdered) 
	select maxnum,sysdate,&VcustNum,&VQty,Pnum,1,(Products.UnitPrice*&VQty) 
	from counter,products
	where Pnum = lower('&VPnum');

update counter set maxnum = maxnum+1;
commit;

select lpad('Your order number is ------> ',30,'*'),ltrim(maxnum)
	from counter;
