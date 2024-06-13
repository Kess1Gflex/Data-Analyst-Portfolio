SELECT * FROM  airlines_delay
SELECT AirportFrom FROM  airlines_delay

-->Identify the Top 5 Most Frequent Routes:

WITH  Routess AS (
	SELECT AirportFrom, AirportTO, COUNT(*) AS Route_Ways
	From airlines_delay
	GROUP BY AirportFrom, AirportTO

)
SELECT TOP 5 * FROM Routess
ORDER BY Route_Ways DESC

-->Calculate the Percentage of Delayed Flights per Day of the Week:

WITH DELAY_PERCENT AS(
	SELECT DAYOFWEEK, COUNT (*) AS TOTAL_FLIGHT, SUM(CASE WHEN Class = 1 THEN 1 ELSE 0 END) as TOTAL_DELAY
	FROM airlines_delay
	
	GROUP BY DayOfWeek
)
SELECT *, (TOTAL_DELAY * 100/TOTAL_FLIGHT) FROM DELAY_PERCENT

-->Identify the Airlines with the Most Frequent Delays:

WITH AIRRLINE_DELAY AS (
	SELECT AIRLINE, COUNT (*) AS DELAY
	FROM airlines_delay
	WHERE CLASS =1
	GROUP BY Airline
)
SELECT * FROM AIRRLINE_DELAY
ORDER BY DELAY DESC





