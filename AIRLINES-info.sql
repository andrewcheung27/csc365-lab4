-- Lab 4 - AIRLINES
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `AIRLINES`;
-- Q1
SELECT DISTINCT airlines.Name, airlines.Abbr
FROM flights, airlines
WHERE flights.Airline = airlines.id
    AND (flights.Source = 'KQA' OR flights.Destination = 'KQA')
ORDER BY airlines.Name;


USE `AIRLINES`;
-- Q2
SELECT flights.FlightNo, airports.Code, airports.Name
FROM flights, airlines, airports
WHERE flights.Source = 'KQA'
    AND flights.Airline = airlines.Id AND airlines.Name = 'Delta Airlines'
    AND flights.Destination = airports.Code
ORDER BY flights.FlightNo;


USE `AIRLINES`;
-- Q3
SELECT flight1.FlightNo AS FlightNo1, flight2.FlightNo AS FlightNo2,
    flight2.Destination AS FinalDestinationCode, airports.Name AS AirportName
FROM flights AS flight1, flights AS flight2, airlines, airports
WHERE airlines.Name = 'Delta Airlines'
    AND flight1.Airline = airlines.Id AND flight2.Airline = airlines.Id
    AND flight1.Source = 'KQA'  -- flight1 starts at KQA
    AND flight1.Destination = flight2.Source   -- flight1 transfers to flight2
    AND NOT flight2.Destination = 'KQA'  -- exclude going back to KQA
    AND flight2.Destination = airports.Code
ORDER BY flight2.Destination;


USE `AIRLINES`;
-- Q4
SELECT source.Name AS Source, d_flights.Source AS SourceCode,
    dest.Name AS Dest, d_flights.Destination AS DestCode
FROM flights AS d_flights, airlines AS d_airlines,  -- Delta
    flights AS j_flights, airlines AS j_airlines,  -- JetBlue
    airports AS source, airports AS dest
WHERE d_flights.Airline = d_airlines.Id
    AND d_airlines.Name = 'Delta Airlines'
    AND j_flights.Airline = j_airlines.Id
    AND j_airlines.Name = 'JetBlue Airways'
    -- same source and destination
    AND d_flights.Source = source.Code
    AND d_flights.Source = j_flights.Source
    AND d_flights.Destination = dest.Code
    AND d_flights.Destination = j_flights.Destination
    -- hide redundant pairs (only showing return flights)
    AND MOD(d_flights.FlightNo, 2) = 1;


USE `AIRLINES`;
-- Q5
SELECT DISTINCT del_flights.Source AS Code
FROM flights AS del_flights, airlines AS del,
    flights AS fr_flights, airlines AS fr,
    flights AS us_flights, airlines AS us,
    flights AS ual_flights, airlines AS ual,
    flights AS sw_flights, airlines AS sw
-- join flights and airlines for each airline
WHERE (del_flights.Airline = del.Id AND del.Name = 'Delta Airlines'
    AND fr_flights.Airline = fr.Id AND fr.Name = 'Frontier Airlines'
    AND us_flights.Airline = us.Id AND us.Name = 'US Airways'
    AND ual_flights.Airline = ual.Id AND ual.Name = 'United Airlines'
    AND sw_flights.Airline = sw.Id AND sw.Name = 'Southwest Airlines')
-- join the 5 airlines on flights.Source
    AND (del_flights.Source = fr_flights.Source
    AND del_flights.Source = us_flights.Source
    AND del_flights.Source = ual_flights.Source
    AND del_flights.Source = sw_flights.Source)
ORDER BY del_flights.Source;


USE `AIRLINES`;
-- Q6
SELECT DISTINCT f1.Source
FROM flights AS f1, flights AS f2, flights AS f3,
    airlines AS del
WHERE del.Name = 'Delta Airlines'
-- delta airline foreign key
    AND f1.Airline = del.Id
    AND f2.Airline = del.Id
    AND f3.Airline = del.Id
-- same source airport
    AND f1.Source = f2.Source
    AND f1.Source = f3.Source
    AND f2.Source = f3.Source
-- different flights
    AND NOT f1.FlightNo = f2.FlightNo
    AND NOT f1.FlightNo = f3.FlightNo
    AND NOT f2.FlightNo = f3.FlightNo
ORDER BY f1.Source;
