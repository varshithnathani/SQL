SQL> create table student(id int, name varchar2(20), address varchar2(20), Sid int);

Table created.

SQL> alter table student add constraint student_id_pr primary key(id);

Table altered.

SQL> create table school(sid int, sname varchar2(20));

Table created.

SQL> alter table school add constraint school_sid_pr primary key(sid);

Table altered.

SQL> alter table student add constraint student_school_sid_fr foreign key(sid) references school(sid);

Table altered.

SQL> desc school;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SID                                       NOT NULL NUMBER(38)
 SNAME                                              VARCHAR2(20)

SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                        NOT NULL NUMBER(38)
 NAME                                               VARCHAR2(20)
 ADDRESS                                            VARCHAR2(20)
 SID                                                NUMBER(38)

SQL> insert into school values(100,'SCOPE');

1 row created.

SQL> insert into school values(101,'SENSE');

1 row created.

SQL> select * from school;

       SID SNAME
---------- --------------------
       100 SCOPE
       101 SENSE

SQL> insert into student values(&Id,'&Name','&Address',&sid);
Enter value for id: 001
Enter value for name: varshith
Enter value for address: martur
Enter value for sid: 100
old   1: insert into student values(&Id,'&Name','&Address',&sid)
new   1: insert into student values(001,'varshith','martur',100)

1 row created.

SQL> /
Enter value for id: 002
Enter value for name: Alpha
Enter value for address: US
Enter value for sid: 100
old   1: insert into student values(&Id,'&Name','&Address',&sid)
new   1: insert into student values(002,'Alpha','US',100)

1 row created.

SQL> /
Enter value for id: 003
Enter value for name: Slayer
Enter value for address: US
Enter value for sid: 101
old   1: insert into student values(&Id,'&Name','&Address',&sid)
new   1: insert into student values(003,'Slayer','US',101)

1 row created.

SQL> -- lets see a forieign key violated case also
SQL> insert into student values(&Id,'&Name','&Address',&sid);
Enter value for id: 004
Enter value for name: Demon
Enter value for address: UK
Enter value for sid: 102
old   1: insert into student values(&Id,'&Name','&Address',&sid)
new   1: insert into student values(004,'Demon','UK',102)
insert into student values(004,'Demon','UK',102)
*
ERROR at line 1:
ORA-02291: integrity constraint (VARSHITH.STUDENT_SCHOOL_SID_FR) violated -
parent key not found


SQL> select * from student;

        ID NAME                 ADDRESS                     SID
---------- -------------------- -------------------- ----------
         1 varshith             martur                      100
         2 Alpha                US                          100
         3 Slayer               US                          101

SQL> select * from school;

       SID SNAME
---------- --------------------
       100 SCOPE
       101 SENSE

SQL> alter table student drop constraint student_school_sid_fr;

Table altered.

SQL> alter table student drop constraint  student_id_pr;

Table altered.

SQL> alter table school drop constraint school_sid_pr;

Table altered.

SQL> drop table student;

Table dropped.

SQL> drop table school;

Table dropped.
