set echo on 
set verify off
set feedback off 

/* start C:\Users\evana\Desktop\moreSql\10_1.sql */

drop table Enrollments;
drop table Students;

create table Students(
	SNum number(3),
	Sname varchar(10),
	Major varchar(3),
	Status varchar(9));

create table Enrollments( 
	SNum number(3),
	CNum varchar(5),
	Semester varchar(5),
	Grade varchar(2));

insert into Students values(101,'Andy','IS','Junior');
insert into Students values(102,'Betty',Null,'Freshman');
insert into Students values(103,'Cind','FIN','Senior');
insert into Students values(104,'David','IS','Junior');

insert into Enrollments values(104,'IS300','Fa16','B');
insert into Enrollments values(101,'IS300','Fa16','A');
insert into Enrollments values(102,'IS301','Fa16','D');
insert into Enrollments values(101,'IS310','Fa16','A');
insert into Enrollments VALUES(103,'IS310','Sp17',Null);
insert into Enrollments VALUES(102,'IS301','Sp17',Null);
insert into Enrollments VALUES(104,'IS10','Sp17',Null);

prompt 'Enter the Dragon'
accept VSName prompt 'Enter student name' 

SELECT CNum, Grade 
	FROM Students,Enrollments
	WHERE Students.Sname like '%&VSName%'
	AND Students.SNum = Enrollments.SNum;


prompt
prompt