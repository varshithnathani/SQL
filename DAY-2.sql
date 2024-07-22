SQL*Plus: Release 11.2.0.2.0 Production on Tue Jul 23 01:32:29 2024

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

SQL> connect varshith;
Enter password:
Connected.
SQL> create table employee(Eid int, Ename varchar2(20), phone number(10), Salary number(10));

Table created.

SQL> desc employee;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EID                                                NUMBER(38)
 ENAME                                              VARCHAR2(20)
 PHONE                                              NUMBER(10)
 SALARY                                             NUMBER(10)

SQL> insert into employee values(&Eid,'&Ename',&phone,&Salary);
Enter value for eid: 001
Enter value for ename: varshith
Enter value for phone: 9014561315
Enter value for salary: 100000
old   1: insert into employee values(&Eid,'&Ename',&phone,&Salary)
new   1: insert into employee values(001,'varshith',9014561315,100000)

1 row created.

SQL> /
Enter value for eid: 002
Enter value for ename: ashok
Enter value for phone: 999999999
Enter value for salary: 200000
old   1: insert into employee values(&Eid,'&Ename',&phone,&Salary)
new   1: insert into employee values(002,'ashok',999999999,200000)

1 row created.

SQL> select * from employee;

       EID ENAME                     PHONE     SALARY
---------- -------------------- ---------- ----------
         1 varshith             9014561315     100000
         2 ashok                 999999999     200000

SQL> commit;

Commit complete.

SQL> select Ename,salary from employee where salary>100000;

ENAME                    SALARY
-------------------- ----------
ashok                    200000

SQL> -- like
SQL> select name from employee where name like 'v%';
select name from employee where name like 'v%'
                                *
ERROR at line 1:
ORA-00904: "NAME": invalid identifier


SQL> select Ename from employee where Ename like 'v%';

ENAME
--------------------
varshith

SQL> select Ename from employee where Ename like '%k';

ENAME
--------------------
ashok

SQL> -- starts with v and ends with h
SQL> select Ename from employee where Ename like 'v%h';

ENAME
--------------------
varshith

SQL> insert into employee values(&Eid,'&Ename',&phone, &salary);
Enter value for eid: 003
Enter value for ename: Alpha
Enter value for phone: 8888899999
Enter value for salary: 11000
old   1: insert into employee values(&Eid,'&Ename',&phone, &salary)
new   1: insert into employee values(003,'Alpha',8888899999, 11000)

1 row created.

SQL> /
Enter value for eid: 004
Enter value for ename: Beta
Enter value for phone: 9999988888
Enter value for salary: 15000
old   1: insert into employee values(&Eid,'&Ename',&phone, &salary)
new   1: insert into employee values(004,'Beta',9999988888, 15000)

1 row created.

SQL> select * from employee;

       EID ENAME                     PHONE     SALARY
---------- -------------------- ---------- ----------
         1 varshith             9014561315     100000
         2 ashok                 999999999     200000
         3 Alpha                8888899999      11000
         4 Beta                 9999988888      15000

SQL> select name from employee where salary between 10000 AND 15000;
select name from employee where salary between 10000 AND 15000
       *
ERROR at line 1:
ORA-00904: "NAME": invalid identifier


SQL> select Ename from employee where salary between 10000 AND 15000;

ENAME
--------------------
Alpha
Beta

SQL> -- we will insert a row with salary null and try to retrive it
SQL> insert into employee values(&Eid,'&Ename',&phone, &salary);
Enter value for eid: 005
Enter value for ename: Ghama
Enter value for phone: 8888888888
Enter value for salary:
old   1: insert into employee values(&Eid,'&Ename',&phone, &salary)
new   1: insert into employee values(005,'Ghama',8888888888, )
insert into employee values(005,'Ghama',8888888888, )
                                                    *
ERROR at line 1:
ORA-00936: missing expression


SQL> insert into employee values(004,'Ghama',888888888,);
insert into employee values(004,'Ghama',888888888,)
                                                  *
ERROR at line 1:
ORA-00936: missing expression


SQL> insert into employee values(004,'Ghama',888888888,'');

1 row created.

SQL> select * from employee;

       EID ENAME                     PHONE     SALARY
---------- -------------------- ---------- ----------
         1 varshith             9014561315     100000
         2 ashok                 999999999     200000
         3 Alpha                8888899999      11000
         4 Beta                 9999988888      15000
         4 Ghama                 888888888

SQL> -- now fetch the null valued row
SQL> select * from employee where salary is null;

       EID ENAME                     PHONE     SALARY
---------- -------------------- ---------- ----------
         4 Ghama                 888888888

SQL> -- print all except salary is null
SQL> select * from employee where salary is NOT null;

       EID ENAME                     PHONE     SALARY
---------- -------------------- ---------- ----------
         1 varshith             9014561315     100000
         2 ashok                 999999999     200000
         3 Alpha                8888899999      11000
         4 Beta                 9999988888      15000

SQL> delete from employee where Ename = 'Beta';

1 row deleted.

SQL> select * from employee;

       EID ENAME                     PHONE     SALARY
---------- -------------------- ---------- ----------
         1 varshith             9014561315     100000
         2 ashok                 999999999     200000
         3 Alpha                8888899999      11000
         4 Ghama                 888888888

SQL> delete from employee where Ename = 'varshith' and phone = 9014561315;

1 row deleted.

SQL> select * from employee;

       EID ENAME                     PHONE     SALARY
---------- -------------------- ---------- ----------
         2 ashok                 999999999     200000
         3 Alpha                8888899999      11000
         4 Ghama                 888888888

SQL> drop table employee;

Table dropped.
