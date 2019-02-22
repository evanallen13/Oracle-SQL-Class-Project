set echo on
set feedback on
set verify on
set heading on

/* start C:\Users\evana\Desktop\project\testData.sql */

spool C:\Users\evana\Desktop\project\spool\testDate.txt

column orderNum heading 'Order|Num' format 9999
column orderDate heading 'Order|Date' format date 
column customerNum heading 'Cust|Num' format 9999
column productNum heading 'Prod|Num' format a5
column orderStatus heading 'Status' format a10
column reasonCode heading 'Reason|Code' format 9

select orderNum,orderDate,customerNum,productNum,orderStatus,reasonCode from Orders;

column orderNum heading 'Order|Num' format 999
column lastName heading 'Last|Name' format a9
column firstName heading 'Fist|Name' format a8
column address heading 'Address' format a15
column city heading 'City' format a11
column state heading 'State' format a5
column zip heading 'Zip' format 99999

select customerNum,lastName,firstName,address,city,state,zip,phone from Customers;

select * from Products;


spool off
