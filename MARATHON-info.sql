-- Lab 4 - MARATHON
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `MARATHON`;
-- Q1
SELECT Place, RunTime, DATE_FORMAT(Pace, '%i:%s') AS Pace
FROM marathon
WHERE FirstName = 'ANDRES' AND LastName = 'AMOE';


USE `MARATHON`;
-- Q2
SELECT FirstName, LastName, Place, RunTime, GroupPlace
FROM marathon
WHERE Sex = 'F'
    AND Town = 'QUNICY' AND State = 'MA'  -- yes, it's QUNICY
ORDER BY Place;


USE `MARATHON`;
-- Q3
SELECT FirstName, LastName, Town, Place, GroupPlace, RunTime
FROM marathon
WHERE Age = 27 AND Sex = 'F'
    AND State = 'RI'
ORDER BY RunTime;


USE `MARATHON`;
-- Q4
SELECT DISTINCT m1.BibNumber
FROM marathon AS m1, marathon AS m2
WHERE m1.Place != m2.Place
    AND m1.BibNumber = m2.BibNumber
ORDER BY m1.BibNumber;


USE `MARATHON`;
-- Q5
SELECT first.Sex, first.AgeGroup, first.FirstName, first.LastName, first.Age,
    second.FirstName, second.LastName, second.Age
FROM marathon AS first, marathon AS second
WHERE first.Sex = second.Sex AND first.AgeGroup = second.AgeGroup
    AND first.GroupPlace = 1
    AND second.GroupPlace = 2
ORDER BY first.Sex, first.AgeGroup;
