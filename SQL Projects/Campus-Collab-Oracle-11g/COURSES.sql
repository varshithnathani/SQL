
SQL> create table courses(courseid int, courseName varchar2(100) Not null, semId int, constraint courses_courseId_pk primary key(courseId), constraint courses_SemId_fk foreign key(semId) references semesters(semId));

Table created.

SQL> insert into courses values(001, 'Intro to Java',001);

1 row created.

SQL> insert into courses values(002, 'Intro to SQL',002);

1 row created.

SQL>
