SQL> -- creating a student table
SQL>
SQL> create table student(Id number(5), Name varchar2(20), phno number(10), email varchar2(20), address varchar2(20));

Table created.

SQL> desc student;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 ID                                                             NUMBER(5)
 NAME                                                           VARCHAR2(20)
 PHNO                                                           NUMBER(10)
 EMAIL                                                          VARCHAR2(20)
 ADDRESS                                                        VARCHAR2(20)

SQL> -- Insert data into the table.
SQL>
SQL> insert into student values(7039, 'varshith', 9014565432, 'var@gmail.com', 'Martur');

1 row created.

SQL>
SQL> -- select statement to retrive the data
SQL>
SQL> select * from student;

        ID NAME                       PHNO EMAIL                ADDRESS
---------- -------------------- ---------- -------------------- --------------------
      7039 varshith             9014565432 var@gmail.com        Martur

SQL>
SQL> -- Insert data in different way
SQL>
SQL> insert into student (ID, NAME, PHNO, EMAIL, ADDRESS) values(7040, 'Dummy', 9999988888, 'dummy@yahoo.com',Martur');
ERROR:
ORA-01756: quoted string not properly terminated


SQL> insert into student (ID, NAME, PHNO, EMAIL, ADDRESS) values(7040, 'Dummy', 9999988888, 'dummy@yahoo.com','Martur');

1 row created.

SQL> select * from student;

        ID NAME                       PHNO EMAIL                ADDRESS
---------- -------------------- ---------- -------------------- --------------------
      7039 varshith             9014565432 var@gmail.com        Martur
      7040 Dummy                9999988888 dummy@yahoo.com      Martur

SQL>
SQL> -- Insert data in another way --> Less time consumption for multiple records
SQL>
SQL> insert into student values (&ID,'&name',&phno,'&Email','&Address');
Enter value for id: 7041
Enter value for name: dummy2
Enter value for phno: 999888899
Enter value for email: dummy2@yahoo.com
Enter value for address: martur
old   1: insert into student values (&ID,'&name',&phno,'&Email','&Address')
new   1: insert into student values (7041,'dummy2',999888899,'dummy2@yahoo.com','martur')

1 row created.

SQL> /
Enter value for id: 7041
Enter value for name: alpha
Enter value for phno: 9898989998
Enter value for email: alpha@gmail.com
Enter value for address: uk
old   1: insert into student values (&ID,'&name',&phno,'&Email','&Address')
new   1: insert into student values (7041,'alpha',9898989998,'alpha@gmail.com','uk')

1 row created.

SQL> select * from student;

        ID NAME                       PHNO EMAIL                ADDRESS
---------- -------------------- ---------- -------------------- --------------------
      7039 varshith             9014565432 var@gmail.com        Martur
      7040 Dummy                9999988888 dummy@yahoo.com      Martur
      7041 dummy2                999888899 dummy2@yahoo.com     martur
      7041 alpha                9898989998 alpha@gmail.com      uk

SQL>
SQL>
SQL> -- lets practice some where and limit based queries
SQL>
SQL> -- 1. Retrieve records where the name is "Dummy":
SQL>
SQL> select * from student where name = 'Dummy';

        ID NAME                       PHNO EMAIL                ADDRESS
---------- -------------------- ---------- -------------------- --------------------
      7040 Dummy                9999988888 dummy@yahoo.com      Martur

SQL> -- 2. Retrieve records where the address is "Martur":
SQL> select * from student where address = 'Martur';

        ID NAME                       PHNO EMAIL                ADDRESS
---------- -------------------- ---------- -------------------- --------------------
      7039 varshith             9014565432 var@gmail.com        Martur
      7040 Dummy                9999988888 dummy@yahoo.com      Martur

SQL>
SQL> -- 3. Retrieve records where the phone number starts with "999":
SQL>
SQL> select * from student where phno like '999%';

        ID NAME                       PHNO EMAIL                ADDRESS
---------- -------------------- ---------- -------------------- --------------------
      7040 Dummy                9999988888 dummy@yahoo.com      Martur
      7041 dummy2                999888899 dummy2@yahoo.com     martur

SQL>
SQL> -- 4. Retrieve records where ID is greater than 7040:
SQL>
SQL> select * from student where id>7040;

        ID NAME                       PHNO EMAIL                ADDRESS
---------- -------------------- ---------- -------------------- --------------------
      7041 dummy2                999888899 dummy2@yahoo.com     martur
      7041 alpha                9898989998 alpha@gmail.com      uk

SQL>
SQL> -- 5. Retrieve records where the email contains "gmail":
SQL>
SQL> select * from student where email like '%gmail%;
ERROR:
ORA-01756: quoted string not properly terminated


SQL> select * from student where email like '%gmail%';

        ID NAME                       PHNO EMAIL                ADDRESS
---------- -------------------- ---------- -------------------- --------------------
      7039 varshith             9014565432 var@gmail.com        Martur
      7041 alpha                9898989998 alpha@gmail.com      uk

SQL>
SQL> -- 6. Retrieve the first 2 rows from the student table
SQL>
SQL> select * from student where rownum <=2;

        ID NAME                       PHNO EMAIL                ADDRESS
---------- -------------------- ---------- -------------------- --------------------
      7039 varshith             9014565432 var@gmail.com        Martur
      7040 Dummy                9999988888 dummy@yahoo.com      Martur

SQL>
SQL> -- 7. Retrieve records where ID is less than 7041 and fetch the first row only:
SQL>
SQL> select * from student where id<7041 rownum =1;
select * from student where id<7041 rownum =1
                                    *
ERROR at line 1:
ORA-00933: SQL command not properly ended


SQL> select * from student where id<7041 AND rownum =1;

        ID NAME                       PHNO EMAIL                ADDRESS
---------- -------------------- ---------- -------------------- --------------------
      7039 varshith             9014565432 var@gmail.com        Martur

SQL>
SQL> -- 8. Retrieve the last record by ordering ID in descending order
SQL>
SQL> select * from (select * from student order by id desc) where rownum =1;

        ID NAME                       PHNO EMAIL                ADDRESS
---------- -------------------- ---------- -------------------- --------------------
      7041 dummy2                999888899 dummy2@yahoo.com     martur

SQL>
SQL> -- 9. Retrieve records where the name starts with "d" (case-insensitive):
SQL>
SQL> select * from student where lower(name) like 'd%';

        ID NAME                       PHNO EMAIL                ADDRESS
---------- -------------------- ---------- -------------------- --------------------
      7040 Dummy                9999988888 dummy@yahoo.com      Martur
      7041 dummy2                999888899 dummy2@yahoo.com     martur

SQL>
SQL> -- 10. Retrieve records where the phone number is between 9000000000 and 9999999999:
SQL>
SQL> select * from student where phno between 9000000000 and 9999999999;

        ID NAME                       PHNO EMAIL                ADDRESS
---------- -------------------- ---------- -------------------- --------------------
      7039 varshith             9014565432 var@gmail.com        Martur
      7040 Dummy                9999988888 dummy@yahoo.com      Martur
      7041 alpha                9898989998 alpha@gmail.com      uk

SQL>
