SQL*Plus: Release 11.2.0.2.0 Production on Tue Jul 23 23:12:55 2024

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

SQL> connect varshith;
Enter password:
Connected.
SQL> create table student(
  2  sid int constraint student_id_pr primary key,
  3  sname varchar2(20),
  4  marks int);

Table created.

SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SID                                       NOT NULL NUMBER(38)
 SNAME                                              VARCHAR2(20)
 MARKS                                              NUMBER(38)

SQL> -- insert data
SQL>
SQL> insert into student values(001,'varshith',90);

1 row created.

SQL> -- lets see some errors also
SQL> -- 1. trying to enter the same value in the primary key feild
SQL>
SQL> insert into student values(001,'ashok',90);
insert into student values(001,'ashok',90)
*
ERROR at line 1:
ORA-00001: unique constraint (VARSHITH.STUDENT_ID_PR) violated


SQL>
SQL> -- 2. Trying to enter the null in primary key feild
SQL>
SQL> insert into student(name, marks) values('ashok',90);
insert into student(name, marks) values('ashok',90)
                    *
ERROR at line 1:
ORA-00904: "NAME": invalid identifier


SQL> insert into student(sname, marks) values('ashok',90);
insert into student(sname, marks) values('ashok',90)
*
ERROR at line 1:
ORA-01400: cannot insert NULL into ("VARSHITH"."STUDENT"."SID")


SQL>
SQL> -- Drop the primary key
SQL> alter table student drop constraint student_id_pr;

Table altered.

SQL> desc stuedent;
ERROR:
ORA-04043: object stuedent does not exist


SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SID                                                NUMBER(38)
 SNAME                                              VARCHAR2(20)
 MARKS                                              NUMBER(38)

SQL>
SQL> -- add primary key constraint
SQL> alter table student add constraint student_id_pr primary key(sid);

Table altered.

SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SID                                       NOT NULL NUMBER(38)
 SNAME                                              VARCHAR2(20)
 MARKS                                              NUMBER(38)

SQL>
SQL> -- create another table to see the combined view of primary key
SQL>
SQL> create table student1(
  2  regno varchar2(10),
  3  course varchar2(20),
  4  );
)
*
ERROR at line 4:
ORA-00904: : invalid identifier


SQL> create table student1(
  2  regno varchar2(10),
  3  course varchar2(20));

Table created.

SQL> insert into student1 values('&regno','&course');
Enter value for regno: 7039
Enter value for course: dbms
old   1: insert into student1 values('&regno','&course')
new   1: insert into student1 values('7039','dbms')

1 row created.

SQL> /
Enter value for regno: 7039
Enter value for course: os
old   1: insert into student1 values('&regno','&course')
new   1: insert into student1 values('7039','os')

1 row created.

SQL> /
Enter value for regno: 7039
Enter value for course: java
old   1: insert into student1 values('&regno','&course')
new   1: insert into student1 values('7039','java')

1 row created.

SQL> /
Enter value for regno: 7039
Enter value for course: apttitude
old   1: insert into student1 values('&regno','&course')
new   1: insert into student1 values('7039','apttitude')

1 row created.

SQL> /
Enter value for regno: 7001
Enter value for course: os
old   1: insert into student1 values('&regno','&course')
new   1: insert into student1 values('7001','os')

1 row created.

SQL> /
Enter value for regno: 7001
Enter value for course: dbms
old   1: insert into student1 values('&regno','&course')
new   1: insert into student1 values('7001','dbms')

1 row created.

SQL> /
Enter value for regno: 7002
Enter value for course: 0s
old   1: insert into student1 values('&regno','&course')
new   1: insert into student1 values('7002','0s')

1 row created.

SQL> select * from student1;

REGNO      COURSE
---------- --------------------
7039       dbms
7039       os
7039       java
7039       apttitude
7001       os
7001       dbms
7002       0s

7 rows selected.

SQL> -- in this case we wont be able to choose single column as primary key
SQL> -- so make those two as primary key
SQL>
SQL> alter table student1 add constraint student1_regno_course_pr primary key(regno, course);

Table altered.

SQL> desc student1;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 REGNO                                     NOT NULL VARCHAR2(10)
 COURSE                                    NOT NULL VARCHAR2(20)

SQL> drop table student;

Table dropped.

SQL> drop table student1;

Table dropped.
