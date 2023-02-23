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
-- Q4 TODO: date format
SELECT CODE, TO_CHAR(CheckIn, 'MONTH DD'), TO_CHAR(CheckOut, 'MONTH DD'),
    RoomName, DATEDIFF(CheckOut, CheckIn) * Rate AS TotalCost
FROM reservations, rooms
WHERE reservations.Room = rooms.RoomCode
    AND FirstName = 'GRANT' AND LastName = 'KNERIEN'
ORDER BY DAY(CheckIn);


USE `INN`;
-- Q5 TODO: overlap condition
-- SELECT rooms.RoomName, others.LastName, others.CheckIn,
    -- DATEDIFF(others.CheckOut, others.CheckIn) AS NumNights
SELECT rooms.RoomName, others.LastName, fritz.CheckIn AS fIn, fritz.CheckOut AS fOut, others.CheckIn, others.CheckOut, DATEDIFF(others.CheckOut, others.CheckIn) AS NumNights
FROM reservations AS fritz, reservations AS others, rooms
WHERE fritz.FirstName = 'FRITZ' AND fritz.LastName = 'SPECTOR'
    AND NOT (others.FirstName = 'FRITZ' AND others.LastName = 'SPECTOR')
    -- overlap: both check in before either checks out
    AND others.CheckOut > fritz.CheckIn AND fritz.CheckOut > others.CheckIn
    AND rooms.RoomCode = others.Room AND rooms.decor = 'modern'
ORDER BY others.CheckIn, rooms.RoomName;


USE `INN`;
-- Query 6 TODO: date format
-- Report all reservations in rooms with double beds that contained four adults.
For each reservation report its code, the full name and the code of the room,
check-in and check out dates. Report reservations in chronological order,
and sorted by the three-letter room code (in alphabetical order) for any reservations that commenced on the same day. Report check-in and check-out dates in the format 'Day Mon' (day followed by the abbreviated month), no year is required.

SELECT reservations.CODE, RoomCode, RoomName,
    TO_CHAR(CheckIn, 'MONTH DD'), TO_CHAR(CheckOut, 'MONTH DD')
FROM reservations, rooms
WHERE reservations.Room = rooms.RoomCode
    AND Adults = 4
    AND Beds = 2 AND bedType = 'Double'
ORDER BY CheckIn, RoomCode;
