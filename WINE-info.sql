-- Lab 4 - WINE
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `WINE`;
-- Q1
SELECT w.Name, w.Winery, w.Score
FROM wine AS w, appellations AS a
WHERE w.Appellation = a.Appellation
    AND w.Grape = 'Zinfandel' AND w.Vintage = 2008
    AND a.Appellation = 'Napa Valley'
ORDER BY w.Score DESC;


USE `WINE`;
-- Q2
SELECT DISTINCT g.Grape
FROM wine AS w, grapes AS g
WHERE w.Grape = g.Grape
    AND g.Color = 'White'
    AND w.Vintage = 2009
    AND w.Score >= 90
ORDER BY g.Grape;


USE `WINE`;
-- Q3
SELECT a.Appellation, a.County
FROM wine AS w, appellations AS a
WHERE w.Appellation = a.Appellation
    AND a.County = 'Sonoma'
    AND w.Grape = 'Grenache'
ORDER BY a.County, a.Appellation;


USE `WINE`;
-- Q4
SELECT DISTINCT w.Vintage
FROM wine AS w, appellations AS a
WHERE w.Appellation = a.Appellation
    AND w.Grape = 'Zinfandel'
    AND a.County = 'Sonoma'
    AND w.Score > 92
ORDER BY w.Vintage;


USE `WINE`;
-- Q5
SELECT Name, Vintage, Score, Price * Cases * 12 AS Revenue
FROM wine
WHERE Winery = 'Altamura'
    AND Price IS NOT NULL AND Cases IS NOT NULL
ORDER BY Price * Cases * 12 DESC;


USE `WINE`;
-- Q6
SELECT (kosta.Price) + (2 * darioush.Price) + (3 * kistler.Price) AS TotalPrice
FROM wine AS kosta, wine AS darioush, wine AS kistler
-- kosta
WHERE kosta.Winery = 'Kosta Browne'
    AND kosta.Name = 'Koplen Vineyard'
    AND kosta.Vintage = 2008
    AND kosta.Grape = 'Pinot Noir'
-- darioush
    AND darioush.Winery = 'Darioush'
    AND darioush.Vintage = 2007
    AND darioush.Name = 'Darius II'
    AND darioush.Grape = 'Cabernet Sauvingnon'
-- kistler
    AND kistler.Winery = 'Kistler'
    AND kistler.Name = 'McCrea Vineyard'
    AND kistler.Vintage = 2006
    AND kistler.Grape = 'Chardonnay';
