SQL> -- date data types
SQL>
SQL> create table employee(Eid int, JoinDate Date, RetireDate Date);

Table created.

SQL> insert into employee values(&Eid,'&JoinDate','&RetireDate');
Enter value for eid: 001
Enter value for joindate: 25-Apr-2004
Enter value for retiredate: 20-Jul-2025
old   1: insert into employee values(&Eid,'&JoinDate','&RetireDate')
new   1: insert into employee values(001,'25-Apr-2004','20-Jul-2025')

1 row created.

SQL> /
Enter value for eid: 002
Enter value for joindate: 03-Dec-2006
Enter value for retiredate: 20-Jul-2027
old   1: insert into employee values(&Eid,'&JoinDate','&RetireDate')
new   1: insert into employee values(002,'03-Dec-2006','20-Jul-2027')

1 row created.

SQL> select * from employee;

       EID JOINDATE  RETIREDAT
---------- --------- ---------
         1 25-APR-04 20-JUL-25
         2 03-DEC-06 20-JUL-27

SQL>
SQL> -- current date
SQL> select sysdate from dual;

SYSDATE
---------
23-JUL-24

SQL> select sysdate+10 from dual;

SYSDATE+1
---------
02-AUG-24

SQL> select sysdate-2 from dual;

SYSDATE-2
---------
21-JUL-24

SQL> select extract(day from JoinDate) from employee;

EXTRACT(DAYFROMJOINDATE)
------------------------
                      25
                       3

SQL> select extract(day from JoinDate), joindate from employee;

EXTRACT(DAYFROMJOINDATE) JOINDATE
------------------------ ---------
                      25 25-APR-04
                       3 03-DEC-06

SQL> select extract(year from joindate) from employee;

EXTRACT(YEARFROMJOINDATE)
-------------------------
                     2004
                     2006

SQL> select extract(Month from joindate) from employee;

EXTRACT(MONTHFROMJOINDATE)
--------------------------
                         4
                        12

SQL>
SQL> -- months between joindate and retire date & joindate and sysdate
SQL>
SQL> select months_between(joindate,retiredate) from employee;

MONTHS_BETWEEN(JOINDATE,RETIREDATE)
-----------------------------------
                         -254.83871
                         -247.54839

SQL> select months_between(retiredate, joindate) from employee;

MONTHS_BETWEEN(RETIREDATE,JOINDATE)
-----------------------------------
                          254.83871
                         247.548387

SQL> -- round off
SQL> select ROUND(months_between(retiredate, joindate)) from employee;

ROUND(MONTHS_BETWEEN(RETIREDATE,JOINDATE))
------------------------------------------
                                       255
                                       248

SQL> -- No of years
SQL> select (Round(months_between(retiredate,joindate)))/12 from employee;

(ROUND(MONTHS_BETWEEN(RETIREDATE,JOINDATE)))/12
-----------------------------------------------
                                          21.25
                                     20.6666667

SQL> select Round((months_between(retiredate,joindate))/12) from employee;

ROUND((MONTHS_BETWEEN(RETIREDATE,JOINDATE))/12)
-----------------------------------------------
                                             21
                                             21

SQL> -- with current date
SQL>
SQL> select months_between(sysdate,joindate) from employee;

MONTHS_BETWEEN(SYSDATE,JOINDATE)
--------------------------------
                      242.957845
                      211.667523

SQL> -- add months to sysdate
SQL> select add_months(sysdate,4) from employee;

ADD_MONTH
---------
23-NOV-24
23-NOV-24

SQL> select days_between(sysdate, joindate) from employee;
select days_between(sysdate, joindate) from employee
       *
ERROR at line 1:
ORA-00904: "DAYS_BETWEEN": invalid identifier


SQL> -- to get the last day of the month --> last_day(sysdate)
SQL>
SQL> select last_day(sysdate) from dual;

LAST_DAY(
---------
31-JUL-24

SQL> -- first day in month
SQL>
SQL> select trunc(sysdate,'month') from dual;

TRUNC(SYS
---------
01-JUL-24

SQL>
SQL>
SQL> -- to_char
SQL>
SQL> select to_char(joindate, 'dd month yyyy') from employee;

TO_CHAR(JOINDATE,'DDMONTHYYYY')
--------------------------------------------
25 april     2004
03 december  2006

SQL> select to_char(joindate, 'day month yyyy') from employee;

TO_CHAR(JOINDATE,'DAYMONTHYYYY')
------------------------------------------------------------------------------
sunday    april     2004
sunday    december  2006

SQL> select to_char(joindate,'dd mon year') from employee;

TO_CHAR(JOINDATE,'DDMONYEAR')
----------------------------------------------------------
25 apr two thousand four
03 dec two thousand six

SQL> -- time stamp
SQL>
SQL> select to_char(sysdate,'dd mm yyyy hh mm ss') from dual'
  2  ;
ERROR:
ORA-01756: quoted string not properly terminated


SQL> select to_char(sysdate,'dd mm yyyy hh mm ss') from dual;

TO_CHAR(SYSDATE,'DD
-------------------
23 07 2024 04 07 31
