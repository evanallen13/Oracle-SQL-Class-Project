set echo off
set feedback off
set verify off
set heading off

/* start C:\Users\evana\Desktop\project\whyX.sql */

prompt ****** Cancel Reason Code Analysis ******

accept VnumDays prompt 'Please enter past number of days to query: '

set heading on
select Orders.reasonCode,ReasonDescription,count(orderNum),sum(orderQty),sum(orderAmount)
	from Orders,ReasonCode
	where orderStatus = 'Cancelled'
	and Orders.ReasonCode = ReasonCode.ReasonCode
	and (trunc(sysdate)-trunc(orderDate)) <= &VnumDays
	group by Orders.reasonCode,ReasonDescription;