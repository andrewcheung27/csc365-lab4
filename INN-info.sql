-- Lab 4 - INN
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `INN`;
-- Q1
SELECT RoomCode, RoomName
FROM rooms
WHERE decor = 'traditional' AND basePrice > 170 AND Beds = 2
ORDER BY RoomCode;


USE `INN`;
-- Q2
SELECT LastName, CheckIn, CheckOut, Adults + Kids AS Guests,
    DATEDIFF(CheckOut, CheckIn) * Rate AS TotalCost
FROM reservations, rooms AS room
WHERE reservations.Room = room.RoomCode
    AND room.RoomName = 'Frugal not apropos'
    AND MONTH(CheckIn) = 7 AND MONTH(CheckOut) = 7
ORDER BY CheckIn;


USE `INN`;
-- Q3
SELECT RoomName, CheckIn, CheckOut
FROM reservations, rooms
WHERE reservations.Room = rooms.RoomCode
    AND CheckIn <= '2010-06-07'
    AND CheckOut > '2010-06-07'
ORDER BY RoomName;


USE `INN`;
-- Q4
SELECT CODE, RoomName, DATE_FORMAT(CheckIn, '%M %e') AS CheckIn,
    DATE_FORMAT(CheckOut, '%M %e') AS CheckOut,
    DATEDIFF(CheckOut, CheckIn) * Rate AS TotalCost
FROM reservations, rooms
WHERE reservations.Room = rooms.RoomCode
    AND FirstName = 'GRANT' AND LastName = 'KNERIEN'
ORDER BY MONTH(CheckIn), DAYOFMONTH(CheckIn);


USE `INN`;
-- Q5
SELECT rooms.RoomName, others.LastName, others.CheckIn,
    DATEDIFF(others.CheckOut, others.CheckIn) AS NumNights
FROM reservations AS fritz, reservations AS others, rooms
WHERE fritz.FirstName = 'FRITZ' AND fritz.LastName = 'SPECTOR'
    AND NOT (others.FirstName = 'FRITZ' AND others.LastName = 'SPECTOR')
    -- overlap: both check in before the other checks out
    AND fritz.CheckIn + 1 < others.CheckOut
    AND others.CheckIn + 1 < fritz.CheckOut
    AND rooms.RoomCode = others.Room AND rooms.decor = 'modern'
ORDER BY others.CheckIn, rooms.RoomName;


USE `INN`;
-- Q6
SELECT reservations.CODE, RoomCode, RoomName,
    DATE_FORMAT(CheckIn, '%e %b') AS CheckIn,
    DATE_FORMAT(CheckOut, '%e %b') AS CheckOut
FROM reservations, rooms
WHERE reservations.Room = rooms.RoomCode
    AND Adults = 4
    AND Beds = 2 AND bedType = 'Double'
ORDER BY MONTH(CheckIn), DAYOFMONTH(CheckIn), RoomCode;
