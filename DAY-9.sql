SQL> desc employee;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EID                                                NUMBER(38)
 ENAME                                              VARCHAR2(20)

SQL> insert into employee values(001, 'varshith');

1 row created.

SQL> select * from employee;

       EID ENAME
---------- --------------------
         1 varshith

SQL> -- 1. copy complete employee table to a new table
SQL>
SQL> create table employee1 as select * from employee;

Table created.

SQL> select * from employee2;
select * from employee2
              *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> select * from employee1;

       EID ENAME
---------- --------------------
         1 varshith

SQL>
SQL> -- 2. create a table with out any data
SQL> create table employee2 as select * from employee where 1=0;

Table created.

SQL> select * from employee2;

no rows selected

SQL> desc employee2;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EID                                                NUMBER(38)
 ENAME                                              VARCHAR2(20)

SQL> -- on delete cascade
SQL>
SQL> create table student(id int, name varchar2(20), address varchar2(20), eid int);

Table created.

SQL> alter table student add constraint student_id_pr primary key(id);

Table altered.

SQL> create table campus(Cid int, cname varchar2(20));

Table created.

SQL> alter table campus add constraint course_cid_pr primary key(cid);

Table altered.

SQL> alter table student modify rename eid to cid;
alter table student modify rename eid to cid
                           *
ERROR at line 1:
ORA-00904: : invalid identifier


SQL> alter table student rename column eid to cid;

Table altered.

SQL> alter table student add constraint student_cid_fk foreign key(cid) references campus(cid);

Table altered.

SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                        NOT NULL NUMBER(38)
 NAME                                               VARCHAR2(20)
 ADDRESS                                            VARCHAR2(20)
 CID                                                NUMBER(38)

SQL> desc campus;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CID                                       NOT NULL NUMBER(38)
 CNAME                                              VARCHAR2(20)

SQL> -- insert data
SQL>
SQL> insert into campus values(420,'SCOPE');

1 row created.

SQL> insert into campus values(302,'SENSE');

1 row created.

SQL> insert into student values(001,'varshith','martur',420);

1 row created.

SQL> insert into student values(002,'alpha','US',420);

1 row created.

SQL> insert into student values(003,'beta','UK',302);

1 row created.

SQL> select * from student;

        ID NAME                 ADDRESS                     CID
---------- -------------------- -------------------- ----------
         1 varshith             martur                      420
         2 alpha                US                          420
         3 beta                 UK                          302

SQL> select * from campus;

       CID CNAME
---------- --------------------
       420 SCOPE
       302 SENSE

SQL>
SQL> -- now i will try to delete a row in campus which will gives us a error
SQL>
SQL> delete from campus where cid = 420;
delete from campus where cid = 420
*
ERROR at line 1:
ORA-02292: integrity constraint (VARSHITH.STUDENT_CID_FK) violated - child
record found


SQL> -- to rectify this we can use cascade
SQL>
SQL> -- first drop the existing constraint
SQL> alter table student drop constraint student_cid_fr;
alter table student drop constraint student_cid_fr
                                    *
ERROR at line 1:
ORA-02443: Cannot drop constraint  - nonexistent constraint


SQL> alter table student drop constraint student_cid_fk;

Table altered.

SQL> -- now add a new constraint with " ON DELETE CASCADE "
SQL>
SQL> alter table student add constraint student_cid_fk foreign key(cid) reference campus(cid) ON DELETE CASCADE;
alter table student add constraint student_cid_fk foreign key(cid) reference campus(cid) ON DELETE CASCADE
                                                                   *
ERROR at line 1:
ORA-00905: missing keyword


SQL> alter table student add constraint student_cid_fk foreign key(cid) references campus(cid) ON DELETE CASCADE;

Table altered.

SQL> -- now if i delete a row in campus, the foreign key connected in student table all rows will be deleted;
SQL>
SQL> delete from campus where cid = 420;

1 row deleted.

SQL> select * from campus;

       CID CNAME
---------- --------------------
       302 SENSE

SQL> select * from student;

        ID NAME                 ADDRESS                     CID
---------- -------------------- -------------------- ----------
         3 beta                 UK                          302

SQL> -- we can even make it as null instead of deleting the complete rows from the child table
SQL>
SQL> -- first delete the existing constraint
SQL>
SQL> alter table student drop constraint student_cid_fk;

Table altered.

SQL> -- add a new constraint
SQL>
SQL> alter table student add constraint student_cid_fk foreign key(cid) references campus(cid) on delete SET NULL;

Table altered.

SQL> delete from campus where cid = 302;

1 row deleted.

SQL> select * from campus;

no rows selected

SQL> select * from student;

        ID NAME                 ADDRESS                     CID
---------- -------------------- -------------------- ----------
         3 beta                 UK

SQL> alter table student drop constraint student_cid_fk
  2  ;

Table altered.

SQL> drop table student;

Table dropped.

SQL> drop table campus;

Table dropped.
