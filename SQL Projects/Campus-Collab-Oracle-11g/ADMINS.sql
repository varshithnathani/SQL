
SQL> -- creating admin table
SQL>
SQL> create table admins(adminId int, adminName varchar2(100) NOT NULL, Email varchar2(100) NOT NULL UNIQUE, constraintadmins_adminId_pk primary key(adminId));

Table created.

SQL> insert into admins values(001,'Admin1','admin1@gmail.com');

1 row created.


SQL>
