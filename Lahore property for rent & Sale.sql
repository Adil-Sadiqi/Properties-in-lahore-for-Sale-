use payment;
select * from rental;
-- List of location where the rent is minimun/ more affordable place to live
select Location, min(pkr) AS RENT
from rental
group by Location
order by Rent ASC
limit 10;

-- list of location with highest rent per month
select Location, Max(pkr) As rent
from rental
group by location
order by Rent DESC
limit 10;
-- LOCATION WITH PRICE, TYPE AND MAXIMUM RENT
SELECT r.Location, r.Price, r.Type, r.PKR AS MaxRent
FROM Rental r
JOIN (
    SELECT Location, MAX(PKR) AS MaxRent
    FROM Rental
    GROUP BY Location
) t
ON r.Location = t.Location AND r.PKR = t.MaxRent
ORDER BY r.PKR DESC
LIMIT 10;
 
 -- list of types of property available for rent
select  distinct(type), pkr

from rental ;
-- LIST OF DIFFERENT PROPERTY TYPE WITH AVERAGE PRICE
SELECT type, AVG(pkr) AS avg_rent
FROM rental
GROUP BY type
ORDER BY type ASC
LIMIT 10;
-- LOWEST POPERTY AVAILABLE FOR RENT WITH PROPERTY TYPE
SELECT Type, Location, MIN(PKR) AS LowestRent
FROM Rental
GROUP BY Type, Location
ORDER BY LowestRent ASC
LIMIT 10;
-- SUM OF TOTAL PORPERTY RENTAL PRICE WITH GROUP BY TYPES
select type, sum(PKR)
from rental
group by type;

-- AVAILABLE COUNT OF PROPERTY AT DIFFERNT LOCATION
select count(type), location
from rental
group by location
order by location asc;

-- AVERAGE RENT OF DIFFERENT PROPERTY TYPE
select avg(PKR) as Normal_Price, type
from rental
group by type
order by type desc;

select location from rental;

 -- AVAILABLE PROPERTY TYPE BY LOCATION 
 select distinct(area), type
from rental;
-- LIST OF PROPERTY AVAILABLE FOR RENT IN DIFFERENT LOCATION AREA WITH THEIR PRICE AND SIZE
SELECT r.Location, r.area, r.Type, r.PKR AS MaxRent
FROM Rental r
JOIN (
    SELECT Location, MAX(PKR) AS MaxRent
    FROM Rental
    GROUP BY Location
) t
ON r.Location = t.Location AND r.PKR = t.MaxRent
ORDER BY r.PKR DESC
LIMIT 10;

-- DIFFERENT PROPERTY BY AREA AND NUMBER OF BEDROOM ,BATHROOM WITH RENT 
SELECT r.Location, r.area, r.baths, r.beds AS BEDROOM, r.PKR AS Price
FROM Rental r
JOIN (
    SELECT Location, COUNT(beds) AS BEDROOM
    FROM Rental
    GROUP BY Location
) t
ON r.Location = t.Location AND r.beds = t.BEDROOM
ORDER BY r.PKR DESC
LIMIT 50;
