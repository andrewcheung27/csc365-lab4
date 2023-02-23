-- Lab 4 - STUDENTS
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `STUDENTS`;
-- Q1
SELECT firstname, lastname
FROM list
WHERE Classroom = 109
ORDER BY lastname DESC;


USE `STUDENTS`;
-- Q2
SELECT DISTINCT classroom, grade
FROM list
ORDER BY grade;


USE `STUDENTS`;
-- Q3
SELECT t.First, t.Last
FROM list AS l, teachers AS t
WHERE l.classroom = t.classroom 
    AND l.firstname = 'SHIRLEY' AND l.lastname = 'STIRE';


USE `STUDENTS`;
-- Q4
SELECT t2.First AS First, t2.Last AS Last
FROM teachers AS t1, teachers AS t2
WHERE t1.First = 'Kirk' AND t1.Last = 'MARROTTE'
    AND (t2.classroom = t1.classroom + 1 OR t2.classroom = t1.classroom - 1)
ORDER BY t2.classroom;


USE `STUDENTS`;
-- Q5
SELECT students.FirstName AS FirstName, students.LastName AS LastName
FROM list AS sherman, list AS students
WHERE sherman.FirstName = 'SHERMAN' AND sherman.LastName = 'DROP'
    AND students.grade = sherman.grade 
    AND NOT students.classroom = sherman.classroom
ORDER BY students.classroom, students.LastName;
