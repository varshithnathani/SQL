
SQL> -- Queries
SQL>
SQL> -- extracting all materials by entering the university id
SQL>
SQL> select * from materials
  2  where universityid = 001;

       MID
----------
MNAME
----------------------------------------------------------------------------------------------------
MDESCRIPTION
----------------------------------------------------------------------------------------------------
 PAGECOUNT  DOWNLOADS      LIKES   DISLIKES     USERID   COURSEID      SEMID UNIVERSITYID
---------- ---------- ---------- ---------- ---------- ---------- ---------- ------------
         1
Complete Java
Basic to Advance Java Programs
       100          0          0          0          1          1          1            1


SQL> -- increasing the like count for materials
SQL>
SQL> update materials set likes = likes+1 where mid = 001;

1 row updated.

SQL> -- increasing the download count for materials
SQL>
SQL> update materials set downloads = downloads +1 where mid = 001;

1 row updated.

SQL> select * from materials where mid =1;

       MID
----------
MNAME
----------------------------------------------------------------------------------------------------
MDESCRIPTION
----------------------------------------------------------------------------------------------------
 PAGECOUNT  DOWNLOADS      LIKES   DISLIKES     USERID   COURSEID      SEMID UNIVERSITYID
---------- ---------- ---------- ---------- ---------- ---------- ---------- ------------
         1
Complete Java
Basic to Advance Java Programs
       100          1          1          0          1          1          1            1


SQL> select Mid, Mname from materials where semid = 001 and universityid = 001;

       MID
----------
MNAME
----------------------------------------------------------------------------------------------------
         1
Complete Java


SQL> select Mid, Mname from materials where semid = 001 and universityid = 002;

no rows selected

SQL>
