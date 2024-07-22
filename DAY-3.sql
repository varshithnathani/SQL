SQL> -- String Handling Functions
SQL>
SQL> create table employee(Eid int, Ename varchar(20), Designation varchar2(20), Salary number(10), DepNo number(5));

Table created.

SQL> insert into employee values(&Eid,'&Ename','&Designation',&salary,&DepNo);
Enter value for eid: 001
Enter value for ename: varshith
Enter value for designation: Asst-Dean
Enter value for salary: 100000
Enter value for depno: 100
old   1: insert into employee values(&Eid,'&Ename','&Designation',&salary,&DepNo)
new   1: insert into employee values(001,'varshith','Asst-Dean',100000,100)

1 row created.

SQL> /
Enter value for eid: 002
Enter value for ename: ashok
Enter value for designation: dean
Enter value for salary: 2000000
Enter value for depno: 100
old   1: insert into employee values(&Eid,'&Ename','&Designation',&salary,&DepNo)
new   1: insert into employee values(002,'ashok','dean',2000000,100)

1 row created.

SQL> /
Enter value for eid: 003
Enter value for ename: dummy
Enter value for designation: prof
Enter value for salary: 900000
Enter value for depno: 120
old   1: insert into employee values(&Eid,'&Ename','&Designation',&salary,&DepNo)
new   1: insert into employee values(003,'dummy','prof',900000,120)

1 row created.

SQL> /
Enter value for eid: 004
Enter value for ename: alpha
Enter value for designation: asst
Enter value for salary: 120000
Enter value for depno: 120
old   1: insert into employee values(&Eid,'&Ename','&Designation',&salary,&DepNo)
new   1: insert into employee values(004,'alpha','asst',120000,120)

1 row created.

SQL> select * from Employee;

       EID ENAME                DESIGNATION              SALARY      DEPNO
---------- -------------------- -------------------- ---------- ----------
         1 varshith             Asst-Dean                100000        100
         2 ashok                dean                    2000000        100
         3 dummy                prof                     900000        120
         4 alpha                asst                     120000        120

SQL>
SQL> -- printing names in UPPER case
SQL>
SQL> select UPPER(Ename) from employee;

UPPER(ENAME)
--------------------
VARSHITH
ASHOK
DUMMY
ALPHA

SQL>
SQL> -- printing names in LOWER case
SQL>
SQL> select Lower(Ename) from employee;

LOWER(ENAME)
--------------------
varshith
ashok
dummy
alpha

SQL>
SQL> -- Only first letter --> initcap(name)
SQL>
SQL> select initcap(Ename) from employee;

INITCAP(ENAME)
--------------------
Varshith
Ashok
Dummy
Alpha

SQL> --Increase the size of Ename
SQL> alter table employee modify name varchar2(30);
alter table employee modify name varchar2(30)
                            *
ERROR at line 1:
ORA-00904: "NAME": invalid identifier


SQL> alter table employee modify Ename varchar2(30);

Table altered.

SQL> desc employee;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EID                                                NUMBER(38)
 ENAME                                              VARCHAR2(30)
 DESIGNATION                                        VARCHAR2(20)
 SALARY                                             NUMBER(10)
 DEPNO                                              NUMBER(5)

SQL> update employee set Ename = 'varshith Nathani' where Eid = 001;

1 row updated.

SQL> select * from Employeel
  2  ;
select * from Employeel
              *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> select * from Employee;

       EID ENAME                          DESIGNATION              SALARY
---------- ------------------------------ -------------------- ----------
     DEPNO
----------
         1 varshith Nathani               Asst-Dean                100000
       100

         2 ashok                          dean                    2000000
       100

         3 dummy                          prof                     900000
       120


       EID ENAME                          DESIGNATION              SALARY
---------- ------------------------------ -------------------- ----------
     DEPNO
----------
         4 alpha                          asst                     120000
       120


SQL> set linesize 300;
SQL> select * from employee;

       EID ENAME                          DESIGNATION              SALARY      DEPNO
---------- ------------------------------ -------------------- ---------- ----------
         1 varshith Nathani               Asst-Dean                100000        100
         2 ashok                          dean                    2000000        100
         3 dummy                          prof                     900000        120
         4 alpha                          asst                     120000        120

SQL> select initcap(Ename) from Employee;

INITCAP(ENAME)
------------------------------
Varshith Nathani
Ashok
Dummy
Alpha

SQL>
SQL> -- length of string
SQL> select length(name) from employee;
select length(name) from employee
              *
ERROR at line 1:
ORA-00904: "NAME": invalid identifier


SQL> select length(Ename) from employee;

LENGTH(ENAME)
-------------
           16
            5
            5
            5

SQL> select length(Ename), Ename from employee where Eid = 001;

LENGTH(ENAME) ENAME
------------- ------------------------------
           16 varshith Nathani

SQL> select length(Ename), Ename from employee;

LENGTH(ENAME) ENAME
------------- ------------------------------
           16 varshith Nathani
            5 ashok
            5 dummy
            5 alpha

SQL> select Eid,length(Ename),initcap(Ename) from Employee;

       EID LENGTH(ENAME) INITCAP(ENAME)
---------- ------------- ------------------------------
         1            16 Varshith Nathani
         2             5 Ashok
         3             5 Dummy
         4             5 Alpha

SQL>
SQL> -- substring
SQL>
SQL> select substr(Ename,1,3) from employee where Eid = 001;

SUBSTR(ENAME
------------
var

SQL> select substr(Ename, 1,3) from employee;

SUBSTR(ENAME
------------
var
ash
dum
alp

SQL> -- concatination of two strings
SQL>
SQL> select concat(Ename,Designation) from employee;

CONCAT(ENAME,DESIGNATION)
--------------------------------------------------
varshith NathaniAsst-Dean
ashokdean
dummyprof
alphaasst

SQL>
SQL> -- replace
SQL>
SQL> select replace(Ename,'varshith','Nathani') from employee where Eid = 001;

REPLACE(ENAME,'VARSHITH','NATHANI')
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Nathani Nathani

SQL> select * from Employee;

       EID ENAME                          DESIGNATION              SALARY      DEPNO
---------- ------------------------------ -------------------- ---------- ----------
         1 varshith Nathani               Asst-Dean                100000        100
         2 ashok                          dean                    2000000        100
         3 dummy                          prof                     900000        120
         4 alpha                          asst                     120000        120

SQL> -- In select it will just change the value and display it
SQL> -- to make it perminent we need to use update
SQL>
SQL> update employee set = rename(Ename,'Varshith','Nathani') where Eid = 001;
update employee set = rename(Ename,'Varshith','Nathani') where Eid = 001
                    *
ERROR at line 1:
ORA-01747: invalid user.table.column, table.column, or column specification


SQL> update employee set Ename= rename(Ename,'Varshith','Nathani') where Eid = 001;
update employee set Ename= rename(Ename,'Varshith','Nathani') where Eid = 001
                           *
ERROR at line 1:
ORA-00936: missing expression


SQL> update employee set Ename= replace(Ename,'Varshith','Nathani') where Eid = 001;

1 row updated.
