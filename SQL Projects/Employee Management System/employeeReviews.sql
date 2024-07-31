SQL> create table employeeReviews(
  2  ReviewId int,
  3  EmployeeId int,
  4  ReviewDate date,
  5  Comments varchar2(30),
  6  Rating int,
  7  Others varchar2(20),
  8  constraint employeeReviews_reviewId_pk primary key(reviewId),
  9  constraint employeeReviews_EmployeeId_fk foreign key(EmployeeId) references Employees(EmployeeId));

Table created.

SQL>
SQL> set linesize 100
SQL> desc employeereviews;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 REVIEWID                                              NOT NULL NUMBER(38)
 EMPLOYEEID                                                     NUMBER(38)
 REVIEWDATE                                                     DATE
 COMMENTS                                                       VARCHAR2(30)
 RATING                                                         NUMBER(38)
 OTHERS                                                         VARCHAR2(20)

SQL>
SQL> insert into employeereviews values(&reviewId,&EmployeeId,&ReviewDate,'&Comments',&rating,'&Others');
Enter value for reviewid: 001
Enter value for employeeid: 001
Enter value for reviewdate: sysdate
Enter value for comments: Intresting Class
Enter value for rating: 5
Enter value for others: None
old   1: insert into employeereviews values(&reviewId,&EmployeeId,&ReviewDate,'&Comments',&rating,'&Others')
new   1: insert into employeereviews values(001,001,sysdate,'Intresting Class',5,'None')

1 row created.

SQL> /
Enter value for reviewid: 002
Enter value for employeeid: 002
Enter value for reviewdate: sysdate
Enter value for comments: No class
Enter value for rating: 0
Enter value for others: None
old   1: insert into employeereviews values(&reviewId,&EmployeeId,&ReviewDate,'&Comments',&rating,'&Others')
new   1: insert into employeereviews values(002,002,sysdate,'No class',0,'None')

1 row created.

SQL> select * from employeereviews;

  REVIEWID EMPLOYEEID REVIEWDAT COMMENTS                           RATING OTHERS
---------- ---------- --------- ------------------------------ ---------- --------------------
         1          1 31-JUL-24 Intresting Class                        5 None
         2          2 31-JUL-24 No class                                0 None

SQL>