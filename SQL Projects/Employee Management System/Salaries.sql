SQL> create table salaries(
  2  salaryId int,
  3  EmployeeId int,
  4  SalaryAmount decimal(10,2),
  5  JoinDate date,
  6  constraint Salaries_salaryID_pk primary key(salaryId),
  7  constraint salaries_EmployeeId_fk foreign key(EmployeeId) references Employees(EmployeeId));

Table created.

SQL> desc salaries;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SALARYID                                  NOT NULL NUMBER(38)
 EMPLOYEEID                                         NUMBER(38)
 SALARYAMOUNT                                       NUMBER(10,2)
 JOINDATE                                           DATE

SQL>  insert into salaries values(&salaryid,&EmployeeId,&SalaryAmount,'&JoinDate');
Enter value for salaryid: 002
Enter value for employeeid: 002
Enter value for salaryamount: 200000
Enter value for joindate: 02-Sep-2021
old   1:  insert into salaries values(&salaryid,&EmployeeId,&SalaryAmount,'&JoinDate')
new   1:  insert into salaries values(002,002,200000,'02-Sep-2021')

1 row created.

SQL> select * from salaries;

  SALARYID EMPLOYEEID SALARYAMOUNT JOINDATE
---------- ---------- ------------ ---------
         2          2       200000 02-SEP-21

SQL>  insert into salaries values(&salaryid,&EmployeeId,&SalaryAmount,'&JoinDate');
Enter value for salaryid: 001
Enter value for employeeid: 001
Enter value for salaryamount: 100000
Enter value for joindate: 02-Aug-2021
old   1:  insert into salaries values(&salaryid,&EmployeeId,&SalaryAmount,'&JoinDate')
new   1:  insert into salaries values(001,001,100000,'02-Aug-2021')

1 row created.

SQL> select * from salaries;

  SALARYID EMPLOYEEID SALARYAMOUNT JOINDATE
---------- ---------- ------------ ---------
         2          2       200000 02-SEP-21
         1          1       100000 02-AUG-21

SQL>