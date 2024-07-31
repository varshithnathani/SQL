
SQL> create table Departments(DepartmentId int, DepartmentName varchar2(30), constraint Departments_DepartmentId_pk primary key(DepartmentId));

Table created.

SQL> desc Departments;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPARTMENTID                              NOT NULL NUMBER(38)
 DEPARTMENTNAME                                     VARCHAR2(30)

SQL> insert into departments values(001,'CSE');

1 row created.

SQL> insert into departments values(002,'EE');

1 row created.

SQL> insert into departments values(003,'ECE');

1 row created.

SQL> insert into departments values(004,'Mech');

1 row created.

SQL> select * from departments;

DEPARTMENTID DEPARTMENTNAME
------------ ------------------------------
           1 CSE
           2 EE
           3 ECE
           4 Mech

SQL>
