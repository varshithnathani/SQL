
SQL> select sysdate from dual;

SYSDATE
---------
21-DEC-24

SQL>
SQL> -- First let's see the tables availabe in my user account/ db
SQL>
SQL> select table_name from user_tables;

TABLE_NAME
------------------------------
STUDENT

SQL>
SQL> desc student;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 ID                                                             NUMBER(5)
 NAME                                                           VARCHAR2(20)
 PHNO                                                           NUMBER(10)
 EMAIL                                                          VARCHAR2(20)
 ADDRESS                                                        VARCHAR2(20)

SQL>
SQL> -- let's create another tables for Aggregate Functions: COUNT, SUM, AVG --
SQL>
SQL> create table Employee (Id number(4), Name varchar2(20), phno number(10), salary number(7), Experience number(2));

Table created.

SQL> desc employee;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 ID                                                             NUMBER(4)
 NAME                                                           VARCHAR2(20)
 PHNO                                                           NUMBER(10)
 SALARY                                                         NUMBER(7)
 EXPERIENCE                                                     NUMBER(2)

SQL>
SQL> -- let's insert some date into employee
SQL>
SQL> insert into employee (&Id, '&Name', &Phno, &Salary, &Experience);
Enter value for id: 001
Enter value for name: David
Enter value for phno: 9090909090
Enter value for salary: 100000
Enter value for experience: 5
old   1: insert into employee (&Id, '&Name', &Phno, &Salary, &Experience)
new   1: insert into employee (001, 'David', 9090909090, 100000, 5)
insert into employee (001, 'David', 9090909090, 100000, 5)
                      *
ERROR at line 1:
ORA-00928: missing SELECT keyword


SQL> insert into employee values (&Id, '&Name', &Phno, &Salary, &Experience);
Enter value for id: 001
Enter value for name: David
Enter value for phno: 9090909090
Enter value for salary: 100000
Enter value for experience: 5
old   1: insert into employee values (&Id, '&Name', &Phno, &Salary, &Experience)
new   1: insert into employee values (001, 'David', 9090909090, 100000, 5)

1 row created.

SQL> /
Enter value for id: 002
Enter value for name: John
Enter value for phno: 8989898989
Enter value for salary: 150000
Enter value for experience: 8
old   1: insert into employee values (&Id, '&Name', &Phno, &Salary, &Experience)
new   1: insert into employee values (002, 'John', 8989898989, 150000, 8)

1 row created.

SQL> /
Enter value for id: 003
Enter value for name: Amy
Enter value for phno: 9898989890
Enter value for salary: 250000
Enter value for experience: 13
old   1: insert into employee values (&Id, '&Name', &Phno, &Salary, &Experience)
new   1: insert into employee values (003, 'Amy', 9898989890, 250000, 13)

1 row created.

SQL> /
Enter value for id: 004
Enter value for name: Andrew
Enter value for phno: 9890998909
Enter value for salary: 1000000
Enter value for experience: 23
old   1: insert into employee values (&Id, '&Name', &Phno, &Salary, &Experience)
new   1: insert into employee values (004, 'Andrew', 9890998909, 1000000, 23)

1 row created.

SQL> set linesize 100;
SQL>
SQL>
SQL> select * from employee;

        ID NAME                       PHNO     SALARY EXPERIENCE
---------- -------------------- ---------- ---------- ----------
         1 David                9090909090     100000          5
         2 John                 8989898989     150000          8
         3 Amy                  9898989890     250000         13
         4 Andrew               9890998909    1000000         23

SQL>
SQL> -- 1. COUNT: Total Number of Employees
SQL>
SQL> select count(*) AS Total_Employees from employee;

TOTAL_EMPLOYEES
---------------
              4

SQL>
SQL> -- 2. SUM: Total Salary of All Employees
SQL>
SQL> select sum(salary) from employee;

SUM(SALARY)
-----------
    1500000

SQL>
SQL>
SQL> -- 3. AVG: Average Salary of Employees
SQL>
SQL> select AVG(salary) as AVG_SALARY from employee;

AVG_SALARY
----------
    375000

SQL>
SQL> -- 4. COUNT: Employees with More Than 10 Years of Experience
SQL>
SQL> select COUNT(*) as MORE_THAN_10Y_Ex from employee where experience > 10;

MORE_THAN_10Y_EX
----------------
               2

SQL>
SQL> -- 5. SUM: Total Salary of Employees with Experience > 10
SQL>
SQL> select sum(Salary) as Total_Salary_10Y_Ex from Employee where experience>10;

TOTAL_SALARY_10Y_EX
-------------------
            1250000

SQL>
SQL> -- 6. AVG: Average Salary of Employees with Salary > 200000
SQL>
SQL> select AVG(salary) as AVG_HIGH_SALARY from employee where salary > 200000;

AVG_HIGH_SALARY
---------------
         625000

SQL>
SQL> -- 7. COUNT with DISTINCT: Number of Unique Experience Levels
SQL>
SQL> select count(DISTINCT Experience) as Unique_Ex_Level from employee;

UNIQUE_EX_LEVEL
---------------
              4

SQL>
SQL> -- 8. Combining Aggregate Functions:
SQL>
SQL> select count(*) as Total_Count, SUM(salary) as Total_Sum, AVG(Salary) as Avg_salary from employee;

TOTAL_COUNT  TOTAL_SUM AVG_SALARY
----------- ---------- ----------
          4    1500000     375000

SQL>
SQL> -- 9. MIN (Minimum Salary)
SQL>
SQL> select MIN(salary) as MIN_SALARY from employee;

MIN_SALARY
----------
    100000

SQL>
SQL> -- 10. MAX (Maximum Salary)
SQL>
SQL> select MAX(salary) as MAX_SALARY from employee;

MAX_SALARY
----------
   1000000

SQL>
SQL> -- 11. MEDIAN (Median Salary)
SQL>
SQL> select MEDIAN(salary) as MEDIAN_SALARY from Employee;

MEDIAN_SALARY
-------------
       200000

SQL>
SQL> -- 12. STDDEV (Standered Deviation)
SQL>
SQL> select STDDEV(salary) as Standered_Deviation from Employee;

STANDERED_DEVIATION
-------------------
         421307.489

SQL>
SQL> -- 13. VARIANCE (Variance of Salary)
SQL>
SQL> select VARIANCE(salary) as Variance from employee;

  VARIANCE
----------
1.7750E+11

SQL>
