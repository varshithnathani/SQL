SQL> create table Attandance(
  2  AttandanceId int,
  3  EmployeeId int,
  4  AttandanceDate date,
  5  AttandanceStatus varchar2(20),
  6  constraint Attandance_AttandanceId_pk primary key(AttandanceId),
  7  constraint Attandance_EmployeeId_fk foreign key(EmployeeId) references Employees(EmployeeId));

Table created.

SQL> desc attandance;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 ATTANDANCEID                                          NOT NULL NUMBER(38)
 EMPLOYEEID                                                     NUMBER(38)
 ATTANDANCEDATE                                                 DATE
 ATTANDANCESTATUS                                               VARCHAR2(20)

SQL>
SQL> insert into attandance values(&AttandanceId,&EmployeeId,&AttandanceDate,'&AttandanceStatus');
Enter value for attandanceid: 001
Enter value for employeeid: 001
Enter value for attandancedate: sysdate
Enter value for attandancestatus: present
old   1: insert into attandance values(&AttandanceId,&EmployeeId,&AttandanceDate,'&AttandanceStatus')
new   1: insert into attandance values(001,001,sysdate,'present')

1 row created.

SQL> /
Enter value for attandanceid: 002
Enter value for employeeid: 002
Enter value for attandancedate: sysdate
Enter value for attandancestatus: Absent
old   1: insert into attandance values(&AttandanceId,&EmployeeId,&AttandanceDate,'&AttandanceStatus')
new   1: insert into attandance values(002,002,sysdate,'Absent')

1 row created.

SQL> select * from attandance;

ATTANDANCEID EMPLOYEEID ATTANDANC ATTANDANCESTATUS
------------ ---------- --------- --------------------
           1          1 31-JUL-24 present
           2          2 31-JUL-24 Absent

SQL>