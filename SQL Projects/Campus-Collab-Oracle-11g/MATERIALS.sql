
SQL> create table Materials (
  2      MId int PRIMARY KEY,
  3      MName VARCHAR2(100) NOT NULL,
  4      MDescription varchar2(225),
  5      Pagecount int,
  6      Downloads int DEFAULT 0,
  7      Likes int DEFAULT 0,
  8      Dislikes int DEFAULT 0,
  9      UserId int,
 10      CourseId int,
 11      SemId int,
 12      UniversityId int,
 13      CONSTRAINT materials_courseId_fk FOREIGN KEY (CourseId) REFERENCES Courses(CourseId),
 14      CONSTRAINT materials_semId_fk FOREIGN KEY (SemId) REFERENCES Semesters(SemId),
 15      CONSTRAINT materials_universityID_fk FOREIGN KEY (UniversityId) REFERENCES Universities(UniversityId)
 16  );

Table created.

SQL> desc materials;
 Name                                                  Null?   Type
 ----------------------------------------------------- -------- ------------------------------------
 MID                                                   NOT NULL NUMBER(38)
 MNAME                                                 NOT NULL VARCHAR2(100)
 MDESCRIPTION                                                  VARCHAR2(225)
 PAGECOUNT                                                     NUMBER(38)
 DOWNLOADS                                                     NUMBER(38)
 LIKES                                                         NUMBER(38)
 DISLIKES                                                      NUMBER(38)
 USERID                                                        NUMBER(38)
 COURSEID                                                      NUMBER(38)
 SEMID                                                         NUMBER(38)
 UNIVERSITYID                                                  NUMBER(38)

SQL> insert into materials values(001, 'Complete Java','Basic to Advance Java Programs',100,0,0,0,001,001,001,001);

1 row created.

SQL> insert into materials values(001, 'Complete SQL','Basic to Advance SQL Programs',90,0,0,0,002,002,002,002);
insert into materials values(001, 'Complete SQL','Basic to Advance SQL Programs',90,0,0,0,002,002,002,002)
*
ERROR at line 1:
ORA-00001: unique constraint (PROJECT.SYS_C007402) violated


SQL> insert into materials values(002, 'Complete SQL','Basic to Advance SQL Programs',90,0,0,0,002,002,002,002);

1 row created.

SQL> select * from materials;

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


       MID
----------
MNAME
----------------------------------------------------------------------------------------------------
MDESCRIPTION
----------------------------------------------------------------------------------------------------
 PAGECOUNT  DOWNLOADS      LIKES   DISLIKES     USERID   COURSEID      SEMID UNIVERSITYID
---------- ---------- ---------- ---------- ---------- ---------- ---------- ------------
         2
Complete SQL
Basic to Advance SQL Programs
        90          0          0          0          2          2          2            2


SQL> set linesize 100;
SQL> select * from materials;

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


       MID
----------
MNAME
----------------------------------------------------------------------------------------------------
MDESCRIPTION
----------------------------------------------------------------------------------------------------
 PAGECOUNT  DOWNLOADS      LIKES   DISLIKES     USERID   COURSEID      SEMID UNIVERSITYID
---------- ---------- ---------- ---------- ---------- ---------- ---------- ------------
         2
Complete SQL
Basic to Advance SQL Programs
        90          0          0          0          2          2          2            2


SQL>
