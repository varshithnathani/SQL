
SQL> create table employees(
  2  EmployeeId int,
  3  Name varchar2(30),
  4  DepartmentId int,
  5  RoleId int,
  6  HireDate date,
  7  salaryId int,
  8  constraint employee_DepartmentId_fk foreign key(DepartmentId) references Departments(DepartmentID),
  9  constraint employee_employeeID_pk primary key(EmployeeId),
 10  constraint employee_RoleId_fk foreign key(roleId) references roles(roleId));

Table created.

SQL> alter table add constraint employee_salaryId_fk foreign key(salaryId) references salaries(salaryId);
alter table add constraint employee_salaryId_fk foreign key(salaryId) references salaries(salaryId)
            *
ERROR at line 1:
ORA-00903: invalid table name


SQL> alter table employees add constraint employee_salaryId_fk foreign key(salaryId) references salaries(salaryId);

Table altered.

SQL> alter table employee drop constraint employee_salaryId_fk;
alter table employee drop constraint employee_salaryId_fk
*
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> alter table employees drop constraint employee_salaryId_fk;

Table altered.

SQL> desc employees;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEEID                                NOT NULL NUMBER(38)
 NAME                                               VARCHAR2(30)
 DEPARTMENTID                                       NUMBER(38)
 ROLEID                                             NUMBER(38)
 HIREDATE                                           DATE
 SALARYID                                           NUMBER(38)

SQL> insert into employees values(&EmployeeId,'&Name',&DepartmentId,&RoleId,'&Hiredate',&salaryId);
Enter value for employeeid: 001
Enter value for name: varshith
Enter value for departmentid: 001
Enter value for roleid: 001
Enter value for hiredate: 02-Aug-2021
Enter value for salaryid: 001
old   1: insert into employees values(&EmployeeId,'&Name',&DepartmentId,&RoleId,'&Hiredate',&salaryId)
new   1: insert into employees values(001,'varshith',001,001,'02-Aug-2021',001)

1 row created.

SQL> /
Enter value for employeeid: 002
Enter value for name: Ashok
Enter value for departmentid: 001
Enter value for roleid: 003
Enter value for hiredate: 02-Sep-2021
Enter value for salaryid: 002
old   1: insert into employees values(&EmployeeId,'&Name',&DepartmentId,&RoleId,'&Hiredate',&salaryId)
new   1: insert into employees values(002,'Ashok',001,003,'02-Sep-2021',002)

1 row created.

SQL> select * from employees;

EMPLOYEEID NAME                           DEPARTMENTID     ROLEID HIREDATE
---------- ------------------------------ ------------ ---------- ---------
  SALARYID
----------
         1 varshith                                  1          1 02-AUG-21
         1

         2 Ashok                                     1          3 02-SEP-21
         2


SQL> set linesize 100;
SQL> select * from employees;

EMPLOYEEID NAME                           DEPARTMENTID     ROLEID HIREDATE    SALARYID
---------- ------------------------------ ------------ ---------- --------- ----------
         1 varshith                                  1          1 02-AUG-21          1
         2 Ashok                                     1          3 02-SEP-21          2

SQL>
