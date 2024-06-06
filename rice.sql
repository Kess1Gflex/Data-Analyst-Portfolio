
SELECT * FROM rice_production

SELECT Area, Value_tonnes AS Production
FROM rice_production
WHERE Year = 2020
AND Value_tonnes = (SELECT MAX(Value_tonnes) 
             FROM rice_production 
             WHERE Year = 2020);

-->"Which areas produced more rice than the average production in 2019?"

SELECT Area, Value_tonnes AS Production
FROM rice_production
WHERE Year = 2019
AND Value_tonnes > (SELECT AVG(Value_tonnes) 
             FROM rice_production 
             WHERE Year = 2019);

SELECT Area, Value_tonnes AS Production_2020,
       CASE 
           WHEN Value_tonnes > 1000000 THEN 'High'
           WHEN Value_tonnes BETWEEN 500000 AND 1000000 THEN 'Medium'
           ELSE 'Low'
       END AS Production_Category
FROM rice_production
WHERE Year = 2020;


SELECT Area, 
       (SELECT Value_tonnes FROM rice_production sp2 WHERE sp2.Area = sp1.Area AND Year = 2020) AS Production_2020,
       (SELECT Value_tonnes FROM rice_production sp3 WHERE sp3.Area = sp1.Area AND Year = 2019) AS Production_2019,
       CASE
           WHEN (SELECT Value_tonnes FROM rice_production sp4 WHERE sp4.Area = sp1.Area AND Year = 2020) > 
                (SELECT Value_tonnes FROM rice_production sp5 WHERE sp5.Area = sp1.Area AND Year = 2019) THEN 'Increase'
           WHEN (SELECT Value_tonnes FROM rice_production sp6 WHERE sp6.Area = sp1.Area AND Year = 2020) < 
                (SELECT Value_tonnes FROM rice_production sp7 WHERE sp7.Area = sp1.Area AND Year = 2019) THEN 'Decrease'
           ELSE 'No Change'
       END AS Production_Change
FROM rice_production sp1
GROUP BY Area;

--> Using CTE's

WITH ProductionData AS (
    SELECT Area,
           (SELECT Value_tonnes FROM rice_production sp2 WHERE sp2.Area = sp1.Area AND Year = 2020) AS Production_2020,
           (SELECT Value_tonnes FROM rice_production sp3 WHERE sp3.Area = sp1.Area AND Year = 2019) AS Production_2019
    FROM rice_production sp1
    GROUP BY Area
)
SELECT Area, Production_2020, Production_2019,
       CASE
           WHEN Production_2020 > Production_2019 THEN 'Increase'
           WHEN Production_2020 < Production_2019 THEN 'Decrease'
           ELSE 'No Change'
       END AS Production_Change
FROM ProductionData;

SELECT Area
FROM rice_production sp1
WHERE Year = 2019
AND (SELECT Value_tonnes 
     FROM rice_production sp2 
     WHERE sp2.Area = sp1.Area AND Year = 2019) > 
    (SELECT Value_tonnes 
     FROM rice_production sp3 
     WHERE sp3.Area = sp1.Area AND Year = 2018) * 1.20;


