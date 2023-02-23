-- Lab 4 - CSU
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `CSU`;
-- Q1
SELECT Campus
FROM campuses
WHERE County = 'San Diego'
ORDER BY Campus;


USE `CSU`;
-- Q2
SELECT d.year, d.degrees
FROM campuses AS slo, degrees AS d
WHERE slo.Id = d.CampusId
    AND slo.Campus = 'California Polytechnic State University-San Luis Obispo'
    AND d.year >= 2000 AND d.year <= 2004
ORDER BY d.year;


USE `CSU`;
-- Q3
SELECT c.Campus, d.Name AS Discipline, dEnr.Gr, dEnr.Ug
FROM campuses AS c, disciplines AS d, discEnr AS dEnr
WHERE dEnr.CampusId = c.Id AND dEnr.Discipline = d.Id
    AND d.Name IN('Computer and Info. Sciences', 'Engineering', 'Mathematics')
    AND c.Campus IN('California Polytechnic State University-San Luis Obispo',
        'California State Polytechnic University-Pomona',
        'Humboldt State University')
ORDER BY c.Campus, d.Name;


USE `CSU`;
-- Q4
SELECT c.Campus, d.Year, (d.degrees / e.FTE) AS Ratio
FROM campuses AS c, degrees AS d, enrollments AS e
WHERE d.CampusId = c.Id AND e.CampusId = c.Id
    AND d.Year = e.Year
    AND (d.degrees / e.FTE) > 0.25
ORDER BY d.Year, c.Campus;


USE `CSU`;
-- Q5
SELECT c.Campus, d.Name, dEnr.Ug, dEnr.Gr
FROM discEnr AS dEnr, disciplines AS d, campuses AS c
WHERE dEnr.CampusId = c.Id AND dEnr.Discipline = d.Id
    AND dEnr.Year = 2004
    AND dEnr.Gr > 0 AND dEnr.Ug > 0
    AND dEnr.Gr > 3 * dEnr.Ug
ORDER BY c.Campus, d.Name;


USE `CSU`;
-- Q6
SELECT fees.Year, e.FTE * fees.fee AS TotalFees,
    e.FTE * fees.fee / faculty.FTE AS FeesPerFaculty
FROM campuses AS sd, enrollments AS e, fees, faculty
WHERE sd.Campus = 'San Diego State University'
    AND e.CampusId = sd.Id
    AND e.Year = fees.Year
    AND e.Year = faculty.Year
    AND fees.Year = faculty.Year
    AND fees.CampusId = sd.Id AND faculty.CampusId = sd.Id
    AND fees.Year >= 2000 AND fees.Year <= 2004
ORDER BY fees.Year;


USE `CSU`;
-- Q7
SELECT c.Campus, e.FTE AS Students, f.FTE AS Faculty, (e.FTE / f.FTE) AS Ratio
FROM campuses AS sj_c, enrollments AS sj_e,
    campuses AS c, enrollments AS e, faculty AS f
-- San Jose campus/enrollments
WHERE sj_c.Campus = 'San Jose State University'
    AND sj_e.CampusId = sj_c.Id
    AND sj_e.Year = 2003
-- other campuses
    AND e.CampusId != sj_e.CampusId
    AND e.CampusId = c.Id AND e.Year = 2003  -- enrollments
    AND f.CampusId = c.Id AND f.Year = 2003  -- faculty
    AND e.FTE > sj_e.FTE
ORDER BY e.FTE / f.FTE;
