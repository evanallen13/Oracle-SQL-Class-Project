set feedback on
set echo on
set verify on
set heading off

/* start C:\Users\evana\Desktop\moreSql\productsRough.sql */



/* Variable VCustNum = customerid */
accept VCustNum prompt 'Enter customer number: '

select address 
	from Customers 
	where customerNum = &VCustNum;

select city 
	from Customers 
	where customerNum = &VCustNum;

accept VPName prompt 'Enter product name: '

select * 
	from products 
	where products.PName like initcap('%&VPName%')
	or products.PName like lower('%&VPName%');

/* Variable VPNum = pnum */
accept VPNum prompt 'Enter product ID: '

select 'Product Description' PName 
	from products
	where products.PNum = initcap('&VPNum')
	or products.PNum = lower('&VPNum');

/* VAmount = order Qty */
accept VAmount prompt 'Enter amount: '

column total heading 'Total' format $9999.99

select (UnitPrice* &VAmount) AS Total
	from products
	where products.PNum = '&VPNum';

/* insert into Orders values(1003,Null,Null,VCustNum,VAmount,Null,VPNum,1,(VAmount)*(select UnitPrice from products where products.PNum = '&VPNum'),54.55); */


select * from Orders;
	
