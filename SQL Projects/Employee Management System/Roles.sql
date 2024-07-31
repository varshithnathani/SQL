
SQL> create table roles(RoleId int, RoleName varchar2(30));

Table created.

SQL> alter table roles add constraint roles_RoleId_pk primary key(roleId);

Table altered.

SQL> desc roles;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ROLEID                                    NOT NULL NUMBER(38)
 ROLENAME                                           VARCHAR2(30)

SQL> insert into roles values(&RoleId,'&RoleName');
Enter value for roleid: 001
Enter value for rolename: Prof
old   1: insert into roles values(&RoleId,'&RoleName')
new   1: insert into roles values(001 ,'Prof')

1 row created.

SQL> /
Enter value for roleid: 002
Enter value for rolename: Assit
old   1: insert into roles values(&RoleId,'&RoleName')
new   1: insert into roles values(002,'Assit')

1 row created.

SQL> /
Enter value for roleid: 003
Enter value for rolename: Dean
old   1: insert into roles values(&RoleId,'&RoleName')
new   1: insert into roles values(003,'Dean')

1 row created.

SQL> select * from roles;

    ROLEID ROLENAME
---------- ------------------------------
         1 Prof
         2 Assit
         3 Dean

SQL>
