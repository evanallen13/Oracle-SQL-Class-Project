set echo on
set feedback on
set verify on
set heading on

/* start C:\Users\evana\Desktop\project\describe.sql */

spool C:\Users\evana\Desktop\project\spool\describe.txt


describe Orders;

describe Products;

describe ReasonCode;

describe Customers;

describe Counter;

spool off 

