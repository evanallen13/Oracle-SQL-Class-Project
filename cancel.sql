set echo off
set feedback off
set verify off
set heading off

/* start C:\Users\evana\Desktop\project\cancel.sql */

prompt ***** Welcome to iSell! *****
prompt ***** CANCEL ORDER *****

select 'Today''s date: '||sysdate from dual;

accept VorderNum prompt 'Please enter the Order Number: '

select 'Order Number: '||