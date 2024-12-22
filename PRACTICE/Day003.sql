
SQL> select sysdate from dual;

SYSDATE
---------
22-DEC-24

SQL>
SQL> select table_name from user_tables;

TABLE_NAME
------------------------------
STUDENT
EMPLOYEE

SQL>
SQL> -- let's contiue with employee table and do the Group by and Having clauses.
SQL>
SQL> -- 1. Total Salary for Each Experience Level
SQL>
SQL> select Experience, sum(salary) as Total_salary from employee group by experience;

EXPERIENCE TOTAL_SALARY
---------- ------------
        13       250000
         5       100000
         8       150000
        23      1000000

SQL>
SQL> -- 2. Average Salary for Each Experience Level
SQL>
SQL> select Experience, AVG(Salary) as AVG_Salary from employee group by experience;

EXPERIENCE AVG_SALARY
---------- ----------
        13     250000
         5     100000
         8     150000
        23    1000000

SQL>
SQL> -- 3. Number of Employees for Each Salary Level
SQL>
SQL> select salary, count(*) as Total_Count from employee group by salary;

    SALARY TOTAL_COUNT
---------- -----------
    100000           1
   1000000           1
    250000           1
    150000           1

SQL>
SQL> -- 4. Employees with Total Salary Above a Certain Threshold
SQL>
SQL> select Experience, SUM(Salary) from employee group by Experience having SUM(salary) > 200000;

EXPERIENCE SUM(SALARY)
---------- -----------
        13      250000
        23     1000000

SQL>
SQL> -- 5. Count of Employees for Experience Levels with More Than 1 Employee
SQL>
SQL> select experience, count(*) from employee group by experience having count(*) > 1;

no rows selected

SQL>
SQL> -- 6. Maximum Salary for Each Experience Level
SQL>
SQL> select experiecce, Max(Salary) as MAX_SALARY from employee group by experience;
select experiecce, Max(Salary) as MAX_SALARY from employee group by experience
       *
ERROR at line 1:
ORA-00904: "EXPERIECCE": invalid identifier


SQL> select experiece, Max(Salary) as MAX_SALARY from employee group by experience;
select experiece, Max(Salary) as MAX_SALARY from employee group by experience
       *
ERROR at line 1:
ORA-00904: "EXPERIECE": invalid identifier


SQL> select experience, Max(Salary) as MAX_SALARY from employee group by experience;

EXPERIENCE MAX_SALARY
---------- ----------
        13     250000
         5     100000
         8     150000
        23    1000000

SQL>
SQL> -- 7. Minimum Salary for Experience Levels with More Than 5 Years
SQL>
SQL> select Experience, Min(Salary) from employee where experience > 5 group by experience;

EXPERIENCE MIN(SALARY)
---------- -----------
        13      250000
         8      150000
        23     1000000

SQL>
SQL> -- 8. Total Salary for Each Phone Number Prefix
SQL>
SQL> select SUBSTR(phno, 1, 3) as phno_prefix, sum(Salary) from employee group by SUBSTR(phno, 1, 3);

PHNO_PREFIX  SUM(SALARY)
------------ -----------
989              1250000
898               150000
909               100000

SQL>
SQL> -- 9. Average Salary for Each Experience Level With Total Salary Greater Than 500,000
SQL>
SQL> select Experience, AVG(Salary) from employee group by experience having sum(salary) > 500000;

EXPERIENCE AVG(SALARY)
---------- -----------
        23     1000000

SQL>
SQL> -- 10. Employees Grouped by Experience Levels in Descending Order
SQL>
SQL> select Experience, SUM(Salary) from employee group by experience order by experience desc;

EXPERIENCE SUM(SALARY)
---------- -----------
        23     1000000
        13      250000
         8      150000
         5      100000

SQL>
