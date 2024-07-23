SQL*Plus: Release 11.2.0.2.0 Production on Wed Jul 24 00:25:30 2024

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

SQL> connect varshith;
Enter password:
Connected.
SQL> create table student(
  2  name varchar2(20),
  3  mark1 int constraint student_mark1_ck check(mark1>=0),
  4  mark2 int constraint student_mark2_ck check(mark2>=0 and mark2<=100));

Table created.

SQL> -- the above table is column level constraints
SQL>
SQL> insert into student values('varshith',120,90);

1 row created.

SQL> select * from student;

NAME                      MARK1      MARK2
-------------------- ---------- ----------
varshith                    120         90

SQL> -- lets see the error case
SQL> insert into student values('ashok',120,120);
insert into student values('ashok',120,120)
*
ERROR at line 1:
ORA-02290: check constraint (VARSHITH.STUDENT_MARK2_CK) violated


SQL>
SQL> -- Table level constraints
SQL> drop table student;

Table dropped.

SQL> create table student(
  2  name varchar2(10),
  3  mark1 int,
  4  mark2 int,
  5  constraints student_marks_ch check(mark1>=0 and mark2>=0 and mark2<=100));

Table created.

SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NAME                                               VARCHAR2(10)
 MARK1                                              NUMBER(38)
 MARK2                                              NUMBER(38)

SQL> insert into student values('varshith',120,20);

1 row created.

SQL> -- error case
SQL> insert into student values('varshith',120,120);
insert into student values('varshith',120,120)
*
ERROR at line 1:
ORA-02290: check constraint (VARSHITH.STUDENT_MARKS_CH) violated


SQL> insert into student values('varshith',-120,20);
insert into student values('varshith',-120,20)
*
ERROR at line 1:
ORA-02290: check constraint (VARSHITH.STUDENT_MARKS_CH) violated


SQL> drop table student;

Table dropped.

SQL> -- lets see unique in table level constraints
SQL>
SQL> create table student(
  2  name varchar2(20),
  3  parentph int,
  4  studnet int,
  5  constraints student_no_uni unique(parentph,studnet));

Table created.

SQL> insert into student values('&name',&parentph,&studnet);
Enter value for name: varshith
Enter value for parentph: 9014561315
Enter value for studnet: 999999999
old   1: insert into student values('&name',&parentph,&studnet)
new   1: insert into student values('varshith',9014561315,999999999)

1 row created.

SQL> /
Enter value for name: ashok
Enter value for parentph: 9014561315
Enter value for studnet: 999999999
old   1: insert into student values('&name',&parentph,&studnet)
new   1: insert into student values('ashok',9014561315,999999999)
insert into student values('ashok',9014561315,999999999)
*
ERROR at line 1:
ORA-00001: unique constraint (VARSHITH.STUDENT_NO_UNI) violated


SQL> /
Enter value for name: ashok
Enter value for parentph: 9014561315
Enter value for studnet: 8888888888
old   1: insert into student values('&name',&parentph,&studnet)
new   1: insert into student values('ashok',9014561315,8888888888)

1 row created.

SQL> select * from student;

NAME                   PARENTPH    STUDNET
-------------------- ---------- ----------
varshith             9014561315  999999999
ashok                9014561315 8888888888

SQL> drop table studnet;
drop table studnet
           *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> drop table student;

Table dropped.
