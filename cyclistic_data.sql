--Create tables for all months in the year and import data for cleaning.
--

CREATE TABLE IF NOT EXISTS public."Jan2021_Jan2022"
(
    ride_id character(100) COLLATE pg_catalog."default",
    rideable_type character(100) COLLATE pg_catalog."default",
    started_at timestamp(6) without time zone,
    ended_at timestamp(6) without time zone,
    start_station_name character(100) COLLATE pg_catalog."default",
    start_station_id character(100) COLLATE pg_catalog."default",
    end_station_name character(100) COLLATE pg_catalog."default",
    end_station_id character(100) COLLATE pg_catalog."default",
    start_lat double precision,
    start_lng double precision,
    end_lat double precision,
    end_lng double precision,
    member_casual character(100) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Jan2021_Jan2022"
    OWNER to postgres;
    
--Create a New table "Jan2021_Jan2022" to aggregate information from all months in one
--table using same structure above.   

--Aggregate information into one table with query below:

INSERT INTO "Jan2021_Jan2022"(
SELECT * FROM "Jan2021"
UNION ALL
SELECT * FROM "Feb2021"
UNION ALL
SELECT * FROM "Mar2021"
UNION ALL
SELECT * FROM "Apr2021"
UNION ALL
SELECT * FROM "May2021"
UNION ALL
SELECT * FROM "Jun2021"
UNION ALL
SELECT * FROM "Jul2021"
UNION ALL
SELECT * FROM "Aug2021"
UNION ALL
SELECT * FROM "Sep2021"
UNION ALL
SELECT * FROM "Oct2021"
UNION ALL
SELECT * FROM "Nov2021"
UNION ALL
SELECT * FROM "Dec2021"
UNION ALL
SELECT * FROM "Jan2022");

-- A total of 5,698,833 emerge from the aggregation and ready for cleaning.
--First we add new columns/metrics for analysis including:
--ride length, day of the week and single values for start and end points.

WITH 
aggregated_data AS (SELECT * FROM "Jan2021_Jan2022"),
new_Metrics AS (SELECT ride_id, 
EXTRACT(EPOCH FROM (ended_at - started_at))/60 AS "ride_length_minutes", 
point(start_lng, start_lat) AS start_point, point (end_lng, end_lat) AS end_point,
CASE
            WHEN EXTRACT(dow FROM started_at) = 0 THEN 'Sunday'
            WHEN EXTRACT(dow FROM started_at) = 1 THEN 'Monday'
            WHEN EXTRACT(dow FROM started_at) = 2 THEN 'Tuesday'
            WHEN EXTRACT(dow FROM started_at) = 3 THEN 'Wednesday'
            WHEN EXTRACT(dow FROM started_at) = 4 THEN 'Thursday'
            WHEN EXTRACT(dow FROM started_at) = 5 THEN 'Friday'
            WHEN EXTRACT(dow FROM started_at) = 6 THEN 'Saturday'
            END AS day_of_the_week
FROM aggregated_Data
)
SELECT        
  a.ride_id,
  a.rideable_type,
  n.day_of_the_week,
  a.started_at,
  a.ended_at,
  n.ride_length_minutes,
  n.start_point,
  n.end_point,
  a.start_station_name,
  a.start_station_id,
  a.end_station_name,
  a.end_station_id,
  a.member_casual
FROM
  aggregated_data AS a    
JOIN
  new_metrics AS n        
ON a.ride_id = n.ride_id

--Add the where clause to filter out records with missing data and 
--negative/zero ride length
--This ensures that the data we are working with is clean and ready for analysis.

WHERE          
   ride_length_minutes > 0    
   AND
   start_station_name IS NOT NULL       
   AND
   end_station_name IS NOT NULL;
   
   
--A total of 4,668,232 emerge after cleaning done.
--Copy data and save in a new table "jan2021_jan2022_cleaned"

SELECT member_casual, Round(AVG(ride_length_minutes), 2)
FROM Jan2021_Jan2022_Cleaned 
GROUP BY member_casual;

SELECT day_of_the_week, Round(AVG(ride_length_minutes), 2)
FROM Jan2021_Jan2022_Cleaned 
GROUP BY day_of_the_week
ORDER BY Round(AVG(ride_length_minutes), 2) desc;

SELECT day_of_the_week, count(*)
FROM Jan2021_Jan2022_Cleaned 
GROUP BY day_of_the_week
ORDER BY count(*) desc;