SQL> desc student;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 ID                                                    NOT NULL NUMBER(38)
 NAME                                                           VARCHAR2(20)
 ADDRESS                                                        VARCHAR2(20)
 GENDER                                                         VARCHAR2(10)
 SID                                                            NUMBER(38)
 CLASSID                                                        NUMBER(38)

SQL> desc school;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 SID                                                   NOT NULL NUMBER(38)
 SNAME                                                          VARCHAR2(20)
 SLOCATION                                                      VARCHAR2(20)

SQL> set linesize 300;
SQL> select * from student;

        ID NAME                 ADDRESS              GENDER            SID    CLASSID
---------- -------------------- -------------------- ---------- ---------- ----------
        70 varshith             martur               male              420         70
         2 Alpha                US                   Male              420         70
         3 Beta                 US                   Male              308         70
         4 Ghama                UK                   Male                          70
         5 cathorine            UK                   Female                        70

SQL> select * from school;

       SID SNAME                SLOCATION
---------- -------------------- --------------------
       420 SCOPE                AB1
       308 SENSE                AB2
       408 VISH                 CB

SQL> -- equi join
SQL>
SQL> select student.name, school.sname from student,school where student.sid = school.sid;

NAME                 SNAME
-------------------- --------------------
varshith             SCOPE
Alpha                SCOPE
Beta                 SENSE

SQL> select s1.name, s2.name as RespoName from student s1, student s2 where s1.classid = s2.id;

NAME                 RESPONAME
-------------------- --------------------
cathorine            varshith
Ghama                varshith
Beta                 varshith
Alpha                varshith
varshith             varshith

SQL> -- above one is comes under self join
SQL>
SQL> -- lets get the above data in a format
SQL> select s1.name, s2.name as Representator from student s1, student s2 where s1.classid = s2.id order by lower(s1.name);

NAME                 REPRESENTATOR
-------------------- --------------------
Alpha                varshith
Beta                 varshith
cathorine            varshith
Ghama                varshith
varshith             varshith

SQL> -- non equi join --> for that we will create a two new table with no data in relation
SQL> create table employee(id int, ename varchar2(20), designation varchar2(20), salary int);

Table created.

SQL> insert intp employee values(&id,'&ename','&designation',&salary);
Enter value for id: 001
Enter value for ename: varshith
Enter value for designation: dean
Enter value for salary: 100000
old   1: insert intp employee values(&id,'&ename','&designation',&salary)
new   1: insert intp employee values(001,'varshith','dean',100000)
insert intp employee values(001,'varshith','dean',100000)
       *
ERROR at line 1:
ORA-00925: missing INTO keyword


SQL> insert into employee values(&id,'&ename','&designation',&salary);
Enter value for id: 001
Enter value for ename: varshith
Enter value for designation: dean
Enter value for salary: 100000
old   1: insert into employee values(&id,'&ename','&designation',&salary)
new   1: insert into employee values(001,'varshith','dean',100000)

1 row created.

SQL> /
Enter value for id: 002
Enter value for ename: dummy1
Enter value for designation: assit
Enter value for salary: 70000
old   1: insert into employee values(&id,'&ename','&designation',&salary)
new   1: insert into employee values(002,'dummy1','assit',70000)

1 row created.

SQL> /
Enter value for id: 003
Enter value for ename: dummy2
Enter value for designation: prof
Enter value for salary: 80000
old   1: insert into employee values(&id,'&ename','&designation',&salary)
new   1: insert into employee values(003,'dummy2','prof',80000)

1 row created.

SQL> /
Enter value for id: 004
Enter value for ename: dummy3
Enter value for designation: assit
Enter value for salary: 90000
old   1: insert into employee values(&id,'&ename','&designation',&salary)
new   1: insert into employee values(004,'dummy3','assit',90000)

1 row created.

SQL> -- create another table
SQL> create table salaryinfo(grade int, lowrange int, highrange int);

Table created.

SQL> insert into salaryinfo values(1,10000,50000);

1 row created.

SQL> insert into salaryinfo values(2,50000,70000);

1 row created.

SQL> insert into salaryinfo values(2,70001,100000);

1 row created.

SQL> update salaryinfo set lowrange = 50001;

3 rows updated.

SQL> update salaryinfo set lowrange = 10000 where grade =1;

1 row updated.

SQL> update salaryinfo set grade =3 where highrange = 100000;

1 row updated.

SQL> update salaryinfo set lowrange = 70001 where grade =3;

1 row updated.

SQL> select * from salaryinfo;

     GRADE   LOWRANGE  HIGHRANGE
---------- ---------- ----------
         1      10000      50000
         2      50001      70000
         3      70001     100000

SQL> select * from employee;

        ID ENAME                DESIGNATION              SALARY
---------- -------------------- -------------------- ----------
         1 varshith             dean                     100000
         2 dummy1               assit                     70000
         3 dummy2               prof                      80000
         4 dummy3               assit                     90000

SQL>
SQL> select e.name,g.grade from employee e, salaryinfo g where s.salary between g.lowrange and g.highrange;
select e.name,g.grade from employee e, salaryinfo g where s.salary between g.lowrange and g.highrange
                                                          *
ERROR at line 1:
ORA-00904: "S"."SALARY": invalid identifier


SQL> select e.name,g.grade from employee e, salaryinfo g where e.salary between g.lowrange and g.highrange;
select e.name,g.grade from employee e, salaryinfo g where e.salary between g.lowrange and g.highrange
       *
ERROR at line 1:
ORA-00904: "E"."NAME": invalid identifier


SQL> select e.ename,g.grade from employee e, salaryinfo g where e.salary between g.lowrange and g.highrange;

ENAME                     GRADE
-------------------- ----------
dummy1                        2
varshith                      3
dummy2                        3
dummy3                        3

SQL>
SQL>
SQL> -- natural join
SQL> -- in natural join it joins the table with forign key, we no need to enter the data like where s.eid = sch.eid;
SQL> select * from student;

        ID NAME                 ADDRESS              GENDER            SID    CLASSID
---------- -------------------- -------------------- ---------- ---------- ----------
        70 varshith             martur               male              420         70
         2 Alpha                US                   Male              420         70
         3 Beta                 US                   Male              308         70
         4 Ghama                UK                   Male                          70
         5 cathorine            UK                   Female                        70

SQL> select * from school;

       SID SNAME                SLOCATION
---------- -------------------- --------------------
       420 SCOPE                AB1
       308 SENSE                AB2
       408 VISH                 CB

SQL> select name, sname from student natural join school;

NAME                 SNAME
-------------------- --------------------
varshith             SCOPE
Alpha                SCOPE
Beta                 SENSE

SQL> -- to work natural join in both table the column name must be same if not it will produce cross join
SQL> -- that means in these table sid id similar (priamry key and foreign key)
SQL>
SQL>
SQL> -- cross join
SQL> create table test1(test1value1 varchar(10), test1value2 varchar2(10));

Table created.

SQL> insert into test1 values('val1T1','val1T1');

1 row created.

SQL> insert into test1 values('val2T1','val2T1');

1 row created.

SQL> create table test2(test2val1 int, test2val2 int);

Table created.

SQL> insert into test2 values(1,1);

1 row created.

SQL> insert into test2 values(2,2);

1 row created.

SQL> select * from test1;

TEST1VALUE TEST1VALUE
---------- ----------
val1T1     val1T1
val2T1     val2T1

SQL> select * from test2;

 TEST2VAL1  TEST2VAL2
---------- ----------
         1          1
         2          2

SQL> select * from test1 cross join test2;

TEST1VALUE TEST1VALUE  TEST2VAL1  TEST2VAL2
---------- ---------- ---------- ----------
val1T1     val1T1              1          1
val1T1     val1T1              2          2
val2T1     val2T1              1          1
val2T1     val2T1              2          2

SQL> -- even if we don't write cross join also it will take as cross join
SQL> select * from test1,test2;

TEST1VALUE TEST1VALUE  TEST2VAL1  TEST2VAL2
---------- ---------- ---------- ----------
val1T1     val1T1              1          1
val1T1     val1T1              2          2
val2T1     val2T1              1          1
val2T1     val2T1              2          2

SQL>
SQL> -- left join --> inner join + remaining left side data
SQL>
SQL> select * from student;

        ID NAME                 ADDRESS              GENDER            SID    CLASSID
---------- -------------------- -------------------- ---------- ---------- ----------
        70 varshith             martur               male              420         70
         2 Alpha                US                   Male              420         70
         3 Beta                 US                   Male              308         70
         4 Ghama                UK                   Male                          70
         5 cathorine            UK                   Female                        70

SQL> select * from school;

       SID SNAME                SLOCATION
---------- -------------------- --------------------
       420 SCOPE                AB1
       308 SENSE                AB2
       408 VISH                 CB

SQL> select s.name, sch.sname from student s, school sch where s.eid = sch.eid(+); -- use plus on right side to get left join
  2  ;
select s.name, sch.sname from student s, school sch where s.eid = sch.eid(+); -- use plus on right side to get left join
                                                                            *
ERROR at line 1:
ORA-00911: invalid character


SQL> select s.name, sch.sname from student s, school sch where s.eid = sch.eid(+);
select s.name, sch.sname from student s, school sch where s.eid = sch.eid(+)
                                                                  *
ERROR at line 1:
ORA-00904: "SCH"."EID": invalid identifier


SQL> select s.name, sch.sname from student s, school sch where s.sid = sch.sid(+);

NAME                 SNAME
-------------------- --------------------
Alpha                SCOPE
varshith             SCOPE
Beta                 SENSE
cathorine
Ghama

SQL> -- right join
SQL> -- use (+) on left side to get the right join
SQL> select s.name, sch.sname from student s, school sch where s.sid(+) = sch.sid;

NAME                 SNAME
-------------------- --------------------
varshith             SCOPE
Alpha                SCOPE
Beta                 SENSE
                     VISH

SQL> -- even we can use the command in palce of (+)
SQL> select s.name, sch.sname from student s left outer join school sch where s.sid = sch.sid;
select s.name, sch.sname from student s left outer join school sch where s.sid = sch.sid
                                                                   *
ERROR at line 1:
ORA-00905: missing keyword


SQL> select s.name, sch.sname from student s left outer join school sch on s.sid = sch.sid;

NAME                 SNAME
-------------------- --------------------
Alpha                SCOPE
varshith             SCOPE
Beta                 SENSE
cathorine
Ghama

SQL> select s.name, sch.sname from student s rigth join school sch on s.sid = sch.sid;
select s.name, sch.sname from student s rigth join school sch on s.sid = sch.sid
                                        *
ERROR at line 1:
ORA-00933: SQL command not properly ended


SQL> select s.name, sch.sname from student s right join school sch on s.sid = sch.sid;

NAME                 SNAME
-------------------- --------------------
varshith             SCOPE
Alpha                SCOPE
Beta                 SENSE
                     VISH

SQL> -- we can use both ( left join  or left outer join similarly for right)
SQL>
SQL>
SQL> -- full outer join
SQL>
SQL> select s.name,sch.sname from student s, school sch where s.sid = sch.sid(+)
  2  union
  3  select s.name, sch.sname from student s, school sch where s.sid(+) = sch.sid;

NAME                 SNAME
-------------------- --------------------
Alpha                SCOPE
Beta                 SENSE
Ghama
cathorine
varshith             SCOPE
                     VISH

6 rows selected.

SQL> -- we can use directly full outer join
SQL> select s.name, sch.sname from student s full outer join  school sch on s.sid = sch.sid;

NAME                 SNAME
-------------------- --------------------
varshith             SCOPE
Alpha                SCOPE
Beta                 SENSE
Ghama
cathorine
                     VISH

6 rows selected.
