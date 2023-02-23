-- Lab 4 - CARS
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `CARS`;
-- Q1
SELECT makes.Make, cardata.Year
FROM makes, cardata
WHERE cardata.Id = makes.Id
    AND makes.model = 'fiat'
ORDER BY cardata.Year;


USE `CARS`;
-- Q2
SELECT makes.Make, cardata.Year
FROM makes, cardata, models, carmakers
WHERE models.Maker = carmakers.Id
    AND makes.Model = models.Model
    AND cardata.Id = makes.Id
    AND carmakers.Maker = 'chrysler'
    AND cardata.Year >= 1971 AND cardata.Year <= 1973
ORDER BY cardata.Year, makes.Make;


USE `CARS`;
-- Q3
SELECT carmakers.FullName, countries.Name
FROM carmakers, countries, continents
WHERE carmakers.Country = countries.Id AND countries.Continent = continents.Id
    AND continents.Name = 'asia'
ORDER BY countries.Name, carmakers.FullName;


USE `CARS`;
-- Q4
SELECT carmakers.Maker AS CarMaker, makes.Make AS CarName
FROM makes, cardata, models, carmakers
WHERE makes.Id = cardata.Id AND makes.Model = models.Model AND models.Maker = carmakers.Id
    AND cardata.Cylinders != 4
    AND cardata.Year = 1977
    AND cardata.MPG > 20
    AND cardata.Accelerate > 13;


USE `CARS`;
-- Q5
SELECT DISTINCT carmakers.FullName AS CarMaker, countries.Name AS Country
FROM makes, models, carmakers, cardata, countries
WHERE makes.Model = models.Model AND makes.Id = cardata.Id
    AND models.Maker = carmakers.Id AND carmakers.Country = countries.Id
    AND countries.Name = 'usa'
    AND cardata.Weight < 2000
    AND cardata.Year >= 1977 AND cardata.Year <= 1979
ORDER BY carmakers.FullName;


USE `CARS`;
-- Q6
SELECT makes.Make, cardata.Year, (cardata.Weight / cardata.Horsepower) AS Ratio
FROM makes, cardata, models, carmakers
WHERE makes.Id = cardata.Id AND makes.Model = models.Model
    AND models.Maker = carmakers.Id
    AND carmakers.Maker = 'saab'
    AND cardata.Year > 1971
ORDER BY (cardata.Weight / cardata.Horsepower) DESC;
