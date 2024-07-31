SQL> select * from employees;

EMPLOYEEID NAME                           DEPARTMENTID     ROLEID HIREDATE    SALARYID
---------- ------------------------------ ------------ ---------- --------- ----------
         1 varshith                                  1          1 02-AUG-21          1
         2 Ashok                                     1          3 02-SEP-21          2

SQL> select Employees.name, employeereviews.reviewdate, employeereviews.rating
  2  from employees, employeereviews
  3  where employees.employeeId = employeereviews.EmployeeId;

NAME                           REVIEWDAT     RATING
------------------------------ --------- ----------
varshith                       31-JUL-24          5
Ashok                          31-JUL-24          0

SQL> select Employees.EmployeeId, Employees.name, Attandance.attandancestatus
  2  from employees, attandance
  3  where employees.employeeId = attandance.EmployeeId;

EMPLOYEEID NAME                           ATTANDANCESTATUS
---------- ------------------------------ --------------------
         1 varshith                       present
         2 Ashok                          Absent

SQL> select Employees.EmployeeId, Employees.name, Attandance.attandancestatus
  2  from employees, attandance
  3  where employees.employeeId = attandance.EmployeeId AND Attandance.Attandancestatus ='Absent';

EMPLOYEEID NAME                           ATTANDANCESTATUS
---------- ------------------------------ --------------------
         2 Ashok                          Absent

SQL>
SQL> select Employees.name, Roles.RoleId, Roles.rolename
  2  from employees, roles
  3  where employees.roleId = roles.roleId;

NAME                               ROLEID ROLENAME
------------------------------ ---------- ------------------------------
varshith                                1 Prof
Ashok                                   3 Dean