set echo on
set feedback on
set verify on
set heading on

/* start C:\Users\evana\Desktop\project\whyX.sql */

spool C:\Users\evana\Desktop\project\spool\whyX.txt

column reasonCode heading 'Reason|Code' format 9999
column ReasonDescription heading 'Reason|Description' format a20
column numberCancelled heading 'No of |Orders' format 9,999
column qtyCancelled heading 'Total |Units' format 9,999
column amountCancelled heading 'Total |Amount' format $9,999.99

prompt ****** Cancel Reason Code Analysis ******

accept VnumDays prompt 'Please enter past number of days to query: '

set heading on
select Orders.reasonCode,
	ReasonDescription,
	count(orderNum) AS numberCancelled,
	sum(orderQty) AS qtyCancelled,
	sum(orderAmount) AS amountCancelled
	from Orders,ReasonCode
	where orderStatus = 'Cancelled'
	and Orders.ReasonCode = ReasonCode.ReasonCode
	and (trunc(sysdate)-trunc(orderDate)+1) <= &VnumDays
	group by Orders.reasonCode,ReasonDescription;

spool off