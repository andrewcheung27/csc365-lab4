-- Lab 4 - KATZENJAMMER
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `KATZENJAMMER`;
-- Q1
SELECT s.Title
FROM Tracklists AS t, Albums AS a, Songs AS s
WHERE t.Album = a.AId AND t.Song = s.SongId
    AND a.Title = 'Rockland'
ORDER BY t.Position;


USE `KATZENJAMMER`;
-- Q2
SELECT b.Firstname, i.Instrument
FROM Instruments AS i, Songs AS s, Band AS b
WHERE i.Song = s.SongId AND i.Bandmate = b.Id
    AND s.Title = 'My Own Tune'
ORDER BY b.Firstname, i.Instrument;


USE `KATZENJAMMER`;
-- Q3
SELECT DISTINCT i.Instrument
FROM Instruments AS i, Band AS b
WHERE i.Bandmate = b.Id AND b.Firstname = 'Anne-Marit'
ORDER BY i.Instrument;


USE `KATZENJAMMER`;
-- Q4
SELECT s.Title, b.Firstname
FROM Instruments AS i, Songs AS s, Band AS b
WHERE i.Song = s.SongId AND i.Bandmate = b.Id
    AND i.Instrument = 'harmonica'
ORDER BY s.Title;


USE `KATZENJAMMER`;
-- Q5
SELECT DISTINCT i.Instrument
FROM Vocals AS v, Songs AS s, Band AS b, Instruments AS i
WHERE v.Song = s.SongId AND i.Song = s.SongID
    AND v.Bandmate = b.Id AND i.Bandmate = b.Id
    AND v.VocalType = 'lead'
    AND b.Firstname = 'Turid'
ORDER BY i.Instrument;


USE `KATZENJAMMER`;
-- Q6
SELECT s.Title, b.Firstname, p.StagePosition
FROM Songs AS s, Performance AS p, Band AS b, Vocals AS v
WHERE v.Song = s.SongId AND v.Bandmate = b.Id
    AND p.Song = s.SongId AND p.Bandmate = b.Id
    AND v.Song = p.Song AND v.Bandmate = p.Bandmate
    AND v.VocalType = 'lead'
    AND p.StagePosition != 'center'
ORDER BY s.Title;


USE `KATZENJAMMER`;
-- Q7
SELECT DISTINCT s.Title
FROM Instruments AS i1, Instruments AS i2, Instruments AS i3,
    Band AS b, Songs AS s
WHERE i1.Song = s.SongId AND i2.Song = s.SongId AND i3.Song = s.SongId
    AND i1.Bandmate = b.Id AND i2.Bandmate = b.Id AND i3.Bandmate = b.Id
    AND b.Firstname = 'Anne-Marit'
    AND i1.Instrument != i2.Instrument
    AND i1.Instrument != i3.Instrument
    AND i2.Instrument != i3.Instrument
ORDER BY s.Title;


USE `KATZENJAMMER`;
-- Q8
SELECT band_r.Firstname AS RightPosition, band_c.Firstname AS CenterPosition,
    band_b.Firstname AS BackPosition, band_l.Firstname AS LeftPosition
-- join Performance and Band for each of the 4 positions, and one common Song
FROM Performance AS pos_r, Band AS band_r,
    Performance AS pos_c, Band AS band_c,
    Performance AS pos_b, Band AS band_b,
    Performance AS pos_l, Band AS band_l,
    Songs AS s
WHERE s.Title = 'A Bar In Amsterdam'
-- right
    AND pos_r.Song = s.SongId
    AND pos_r.Bandmate = band_r.Id
    AND pos_r.StagePosition = 'right'
-- center
    AND pos_c.Song = s.SongId
    AND pos_c.Bandmate = band_c.Id
    AND pos_c.StagePosition = 'center'
-- back
    AND pos_b.Song = s.SongId
    AND pos_b.Bandmate = band_b.Id
    AND pos_b.StagePosition = 'back'
-- left
    AND pos_l.Song = s.SongId
    AND pos_l.Bandmate = band_l.Id
    AND pos_l.StagePosition = 'left';
