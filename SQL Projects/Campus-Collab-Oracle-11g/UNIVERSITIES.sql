
SQL> -- creating universities table
SQL>
SQL> create table universities( universityId int, uname varchar2(100) NOT NULL, constraint universities_universityId_pk primary key(universityId));

Table created.

SQL> insert into universities values(001, 'AU');

1 row created.

SQL> insert into universities values(002, 'NAjU');

1 row created.

SQL>
