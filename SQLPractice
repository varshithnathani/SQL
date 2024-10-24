
SQL> create table Emp(Eid int, Ename varchar2(30), Edisignation varchar2(30), Cid int);

Table created.

SQL> desc emp;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EID                                                NUMBER(38)
 ENAME                                              VARCHAR2(30)
 EDISIGNATION                                       VARCHAR2(30)
 CID                                                NUMBER(38)

SQL> create table Student(SId int, SName varchar2(30), Cid int);

Table created.

SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SID                                                NUMBER(38)
 SNAME                                              VARCHAR2(30)
 CID                                                NUMBER(38)

SQL> create table Course(CId int, CName varchar2(30), CTimeLine int);

Table created.

SQL> desc course;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CID                                                NUMBER(38)
 CNAME                                              VARCHAR2(30)
 CTIMELINE                                          NUMBER(38)

SQL> alter table student add constraint SId_PK;
alter table student add constraint SId_PK
                                        *
ERROR at line 1:
ORA-00904: : invalid identifier


SQL> alter table student add constraint SId_PK primary key;
alter table student add constraint SId_PK primary key
                                                    *
ERROR at line 1:
ORA-00906: missing left parenthesis


SQL> alter table student add constraint primary key sid_pk;
alter table student add constraint primary key sid_pk
                                               *
ERROR at line 1:
ORA-00902: invalid datatype


SQL> alter table student add constraint SId_PK primary key(sid);

Table altered.

SQL> alter table Emp add constraint EId_PK primary key(Eid);

Table altered.

SQL> alter table course add constraint CId_PK primary key(Cid);

Table altered.

SQL> alter table emp add constraint cid_fk foreign key(cid) references course(cid);

Table altered.

SQL> alter table student add constraint cid_fk_student foreign key(cid) references course(cid);

Table altered.

SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SID                                       NOT NULL NUMBER(38)
 SNAME                                              VARCHAR2(30)
 CID                                                NUMBER(38)

SQL> desc emp;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EID                                       NOT NULL NUMBER(38)
 ENAME                                              VARCHAR2(30)
 EDISIGNATION                                       VARCHAR2(30)
 CID                                                NUMBER(38)

SQL> desc course;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CID                                       NOT NULL NUMBER(38)
 CNAME                                              VARCHAR2(30)
 CTIMELINE                                          NUMBER(38)

SQL> insert into course values(&CID,'&CName',&Ctimeline);
Enter value for cid: 001
Enter value for cname: java
Enter value for ctimeline: 6
old   1: insert into course values(&CID,'&CName',&Ctimeline)
new   1: insert into course values(001,'java',6)

1 row created.

SQL> /
Enter value for cid: 002
Enter value for cname: python
Enter value for ctimeline: 5
old   1: insert into course values(&CID,'&CName',&Ctimeline)
new   1: insert into course values(002,'python',5)

1 row created.

SQL> select * from course;

       CID CNAME                           CTIMELINE
---------- ------------------------------ ----------
         1 java                                    6
         2 python                                  5

SQL> insert into student values(&SID, '&Sname',&Cid);
Enter value for sid: 7039
Enter value for sname: varshith
Enter value for cid: 001
old   1: insert into student values(&SID, '&Sname',&Cid)
new   1: insert into student values(7039, 'varshith',001)

1 row created.

SQL> /
Enter value for sid: 7001
Enter value for sname: alpha
Enter value for cid: 001
old   1: insert into student values(&SID, '&Sname',&Cid)
new   1: insert into student values(7001, 'alpha',001)

1 row created.

SQL> /
Enter value for sid: 7002
Enter value for sname: beta
Enter value for cid: 002
old   1: insert into student values(&SID, '&Sname',&Cid)
new   1: insert into student values(7002, 'beta',002)

1 row created.

SQL> select * from student;

       SID SNAME                                 CID
---------- ------------------------------ ----------
      7039 varshith                                1
      7001 alpha                                   1
      7002 beta                                    2

SQL> insert into emp values(&EID, '&EName', '&EDesignation', &cid);
Enter value for eid: 1001
Enter value for ename: satish
Enter value for edesignation: Prof
Enter value for cid: 001
old   1: insert into emp values(&EID, '&EName', '&EDesignation', &cid)
new   1: insert into emp values(1001, 'satish', 'Prof', 001)

1 row created.

SQL> /
Enter value for eid: 1002
Enter value for ename: c j Satish
Enter value for edesignation: Asst. Prof
Enter value for cid: 002
old   1: insert into emp values(&EID, '&EName', '&EDesignation', &cid)
new   1: insert into emp values(1002, 'c j Satish', 'Asst. Prof', 002)

1 row created.

SQL> select * from emp;

       EID ENAME                          EDISIGNATION
---------- ------------------------------ ------------------------------
       CID
----------
      1001 satish                         Prof
         1

      1002 c j Satish                     Asst. Prof
         2


SQL> set linesize 300;
SQL> select * from emp;

       EID ENAME                          EDISIGNATION                          CID
---------- ------------------------------ ------------------------------ ----------
      1001 satish                         Prof                                    1
      1002 c j Satish                     Asst. Prof                              2

SQL> -- add another column as salary in emp
SQL>
SQL> alter table emp add column salary int;
alter table emp add column salary int
                    *
ERROR at line 1:
ORA-00904: : invalid identifier


SQL> alter table emp add salary int;

Table altered.

SQL> desc emp;
 Name      Null?     Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- --------------------------------------------------------------------------------------------------------------------
 EID
      NOT NULL NUMBER(38)
 ENAME                                                                                                                              VARCHAR2(30)
 EDISIGNATION                                                                                                                       VARCHAR2(30)
 CID                                                                                                                                NUMBER(38)
 SALARY                                                                                                                             NUMBER(38)

SQL> set linesize 300;
SQL> desc emp;
 Name      Null?     Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- --------------------------------------------------------------------------------------------------------------------
 EID
      NOT NULL NUMBER(38)
 ENAME                                                                                                                              VARCHAR2(30)
 EDISIGNATION                                                                                                                       VARCHAR2(30)
 CID                                                                                                                                NUMBER(38)
 SALARY                                                                                                                             NUMBER(38)

SQL> update emp set salary = 1000000 where Ename = 'Satish';

0 rows updated.

SQL> select * from Emp;

       EID ENAME                          EDISIGNATION                          CID     SALARY
---------- ------------------------------ ------------------------------ ---------- ----------
      1001 satish                         Prof                                    1
      1002 c j Satish                     Asst. Prof                              2

SQL> update emp set salary = 1000000 where Ename = 'satish';

1 row updated.

SQL> select * from Emp;

       EID ENAME                          EDISIGNATION                          CID     SALARY
---------- ------------------------------ ------------------------------ ---------- ----------
      1001 satish                         Prof                                    1    1000000
      1002 c j Satish                     Asst. Prof                              2

SQL> update emp set salary = 1000000 where Ename Like 'c%';

1 row updated.

SQL> select * from emp;

       EID ENAME                          EDISIGNATION                          CID     SALARY
---------- ------------------------------ ------------------------------ ---------- ----------
      1001 satish                         Prof                                    1    1000000
      1002 c j Satish                     Asst. Prof                              2    1000000

SQL> update emp set salary = 2000000 where Ename Like 'c%';

1 row updated.

SQL> select * from emp;

       EID ENAME                          EDISIGNATION                          CID     SALARY
---------- ------------------------------ ------------------------------ ---------- ----------
      1001 satish                         Prof                                    1    1000000
      1002 c j Satish                     Asst. Prof                              2    2000000

SQL>
SQL> -- 2nd highest salary from the data
SQL>
SQL> -- sub query
SQL> select max(salary) from emp where salary<(select max(salary) from emp);

MAX(SALARY)
-----------
    1000000

SQL> -- highest salary
SQL> select max(salary) from emp;

MAX(SALARY)
-----------
    2000000

SQL> select e.Ename, e.cid, c.cname from emp e, course c
  2  where e.cid = c.cid;

ENAME                                 CID CNAME
------------------------------ ---------- ------------------------------
satish                                  1 java
c j Satish                              2 python

SQL> select e.Ename, e.cid, c.cname from emp e, course c
  2  where e.cid = c.cid and c.cname = 'java';

ENAME                                 CID CNAME
------------------------------ ---------- ------------------------------
satish                                  1 java

SQL>
