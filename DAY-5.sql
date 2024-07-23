SQL> create table employee(Eid int, Ename varchar(20), Designation varchar2(20), DepNo number(5));

Table created.

SQL> insert into employee values(&Eid,'&Ename','&Designation',&DepNo);
Enter value for eid: 001
Enter value for ename: ashok
Enter value for designation: Dean
Enter value for depno: 100
old   1: insert into employee values(&Eid,'&Ename','&Designation',&DepNo)
new   1: insert into employee values(001,'ashok','Dean',100)

1 row created.

SQL> /
Enter value for eid: 002
Enter value for ename: varshith
Enter value for designation: Asst-Dean
Enter value for depno: 100
old   1: insert into employee values(&Eid,'&Ename','&Designation',&DepNo)
new   1: insert into employee values(002,'varshith','Asst-Dean',100)

1 row created.

SQL> /
Enter value for eid: 003
Enter value for ename: dummy
Enter value for designation: Prof
Enter value for depno: 120
old   1: insert into employee values(&Eid,'&Ename','&Designation',&DepNo)
new   1: insert into employee values(003,'dummy','Prof',120)

1 row created.

SQL> /
Enter value for eid: 004
Enter value for ename: alpha
Enter value for designation: Prof
Enter value for depno: 120
old   1: insert into employee values(&Eid,'&Ename','&Designation',&DepNo)
new   1: insert into employee values(004,'alpha','Prof',120)

1 row created.

SQL> /
Enter value for eid: 005
Enter value for ename: beta
Enter value for designation: Asso
Enter value for depno: 121
old   1: insert into employee values(&Eid,'&Ename','&Designation',&DepNo)
new   1: insert into employee values(005,'beta','Asso',121)

1 row created.

SQL> select * from Employee;

       EID ENAME                DESIGNATION               DEPNO
---------- -------------------- -------------------- ----------
         1 ashok                Dean                        100
         2 varshith             Asst-Dean                   100
         3 dummy                Prof                        120
         4 alpha                Prof                        120
         5 beta                 Asso                        121

SQL> alter table employee modify salary number(10);
alter table employee modify salary number(10)
                            *
ERROR at line 1:
ORA-00904: "SALARY": invalid identifier


SQL> alter table employee add salary number(10);

Table altered.

SQL> insert into employee values(&salary);
Enter value for salary: 100000
old   1: insert into employee values(&salary)
new   1: insert into employee values(100000)
insert into employee values(100000)
            *
ERROR at line 1:
ORA-00947: not enough values


SQL> update employee set salary = 100000 where Ename = 'ashok';

1 row updated.

SQL> select * from employee;

       EID ENAME                DESIGNATION               DEPNO     SALARY
---------- -------------------- -------------------- ---------- ----------
         1 ashok                Dean                        100     100000
         2 varshith             Asst-Dean                   100
         3 dummy                Prof                        120
         4 alpha                Prof                        120
         5 beta                 Asso                        121

SQL> update employee set salary = 200000 where ename like 'v%';

1 row updated.

SQL> select * from employee;

       EID ENAME                DESIGNATION               DEPNO     SALARY
---------- -------------------- -------------------- ---------- ----------
         1 ashok                Dean                        100     100000
         2 varshith             Asst-Dean                   100     200000
         3 dummy                Prof                        120
         4 alpha                Prof                        120
         5 beta                 Asso                        121

SQL> update employee set salary = 10000 where Ename = 'dummy';

1 row updated.

SQL> update employee set salary = 15000 where Ename = 'alpha';

1 row updated.

SQL> select * from employee;

       EID ENAME                DESIGNATION               DEPNO     SALARY
---------- -------------------- -------------------- ---------- ----------
         1 ashok                Dean                        100     100000
         2 varshith             Asst-Dean                   100     200000
         3 dummy                Prof                        120      10000
         4 alpha                Prof                        120      15000
         5 beta                 Asso                        121

SQL>
SQL> -- group by
SQL>
SQL> select sum(salary) from employee;

SUM(SALARY)
-----------
     325000

SQL> select avg(salary) from employee;

AVG(SALARY)
-----------
      81250

SQL> select min(salary) from employee;

MIN(SALARY)
-----------
      10000

SQL> select max(salary) from employee;

MAX(SALARY)
-----------
     200000

SQL>
SQL> -- sum of salary for designation wise
SQL>
SQL> select designation, sum(Salary) from employee group by designtion;
select designation, sum(Salary) from employee group by designtion
                                                       *
ERROR at line 1:
ORA-00904: "DESIGNTION": invalid identifier


SQL> select designation, sum(Salary) from employee group by designation;

DESIGNATION          SUM(SALARY)
-------------------- -----------
Asst-Dean                 200000
Prof                       25000
Dean                      100000
Asso

SQL> select DepNo, sum(salary) from employee group by depno;

     DEPNO SUM(SALARY)
---------- -----------
       100      300000
       120       25000
       121

SQL> select designation, sum(salary) as totalsum group by designation;
select designation, sum(salary) as totalsum group by designation
                                            *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> select designation, sum(salary) as totalsum from employee group by designation;

DESIGNATION            TOTALSUM
-------------------- ----------
Asst-Dean                200000
Prof                      25000
Dean                     100000
Asso

SQL>
SQL> -- having
SQL>
SQL> select designation,sum(salary) from employee group by designation having sum(salary)>150000;

DESIGNATION          SUM(SALARY)
-------------------- -----------
Asst-Dean                 200000

SQL> select depno, sum(salary) as totalsum from employee group by depno having sum(salary)>= 150000;

     DEPNO   TOTALSUM
---------- ----------
       100     300000

SQL> select depno, sum(salary) from employee group by depno order by sum(salary);

     DEPNO SUM(SALARY)
---------- -----------
       120       25000
       100      300000
       121

SQL> select depno, sum(salary) from employee group by depno order by sum(salary) desc;

     DEPNO SUM(SALARY)
---------- -----------
       121
       100      300000
       120       25000

SQL> select * from employee order by Ename desc;

       EID ENAME                DESIGNATION               DEPNO     SALARY
---------- -------------------- -------------------- ---------- ----------
         2 varshith             Asst-Dean                   100     200000
         3 dummy                Prof                        120      10000
         5 beta                 Asso                        121
         1 ashok                Dean                        100     100000
         4 alpha                Prof                        120      15000

SQL> select * from employee order by Ename;

       EID ENAME                DESIGNATION               DEPNO     SALARY
---------- -------------------- -------------------- ---------- ----------
         4 alpha                Prof                        120      15000
         1 ashok                Dean                        100     100000
         5 beta                 Asso                        121
         3 dummy                Prof                        120      10000
         2 varshith             Asst-Dean                   100     200000

SQL> select * from employee order by Ename asc;

       EID ENAME                DESIGNATION               DEPNO     SALARY
---------- -------------------- -------------------- ---------- ----------
         4 alpha                Prof                        120      15000
         1 ashok                Dean                        100     100000
         5 beta                 Asso                        121
         3 dummy                Prof                        120      10000
         2 varshith             Asst-Dean                   100     200000

SQL> select depno,designation,sum(salary) from employee group by depno,designation;

     DEPNO DESIGNATION          SUM(SALARY)
---------- -------------------- -----------
       100 Dean                      100000
       121 Asso
       120 Prof                       25000
       100 Asst-Dean                 200000

SQL> select depno,deisgnation,sum(salary) as totalsum from employee group by depno, designation order by sum(salary) desc;
select depno,deisgnation,sum(salary) as totalsum from employee group by depno, designation order by sum(salary) desc
             *
ERROR at line 1:
ORA-00904: "DEISGNATION": invalid identifier


SQL> select depno,designation,sum(salary) as totalsum from employee group by depno, designation order by sum(salary) desc;

     DEPNO DESIGNATION            TOTALSUM
---------- -------------------- ----------
       121 Asso
       100 Asst-Dean                200000
       100 Dean                     100000
       120 Prof                      25000
