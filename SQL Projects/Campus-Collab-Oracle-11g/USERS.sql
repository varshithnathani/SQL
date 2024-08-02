
SQL> -- users creations
SQL> create table users( userId int, username varchar2(50) NOT NULL UNIQUE, Password varchar2(225) NOT NULL, Email varchar2(100) NOTNULL UNIQUE, constraint users_userid_pk primary key(userid));

Table created.

SQL> insert into users values(&userId,'&UserName','&Password','&Email');
Enter value for userid: 001
Enter value for username: Alpha
Enter value for password: Alpha_001
Enter value for email: alpha@gmail.com
old   1: insert into users values(&userId,'&UserName','&Password','&Email')
new   1: insert into users values(001,'Alpha','Alpha_001','alpha@gmail.com')

1 row created.

SQL> /
Enter value for userid: 002
Enter value for username: Beta
Enter value for password: Beta_002
Enter value for email: beta@gmail.com;
old   1: insert into users values(&userId,'&UserName','&Password','&Email')
new   1: insert into users values(002,'Beta','Beta_002','beta@gmail.com;')

1 row created.

SQL>

