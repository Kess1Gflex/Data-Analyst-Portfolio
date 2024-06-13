
SELECT * FROM World_Happiness_Report_2024

-->Countries with Consistently High Happiness:

SELECT country FROM( 
	SELECT country FROM World_Happiness_Report_2024
	WHERE all_ages BETWEEN 1 AND 20
) AS WORLD_HAPPIEST

INTERSECT

SELECT country FROM( 
	SELECT country FROM World_Happiness_Report_2024
	WHERE the_young BETWEEN 1 AND 20
) AS WORLD_HAPPIEST

INTERSECT 

SELECT country FROM( 
	SELECT country FROM World_Happiness_Report_2024
	WHERE the_old BETWEEN 1 AND 20
) AS WORLD_HAPPIEST

INTERSECT

SELECT country FROM( 
	SELECT country FROM World_Happiness_Report_2024
	WHERE lower_middle BETWEEN 1 AND 20
) AS WORLD_HAPPIEST

INTERSECT

SELECT country FROM( 
	SELECT country FROM World_Happiness_Report_2024
	WHERE upper_middle BETWEEN 1 AND 20
) AS WORLD_HAPPIEST

SELECT * FROM World_Happiness_Report_2024

-->Exploring Overlaps in Age Group Ranks:

SELECT country FROM( 
	SELECT country FROM World_Happiness_Report_2024
	WHERE the_young BETWEEN 1 AND 25
) AS WORLD_HAPPIEST

EXCEPT

SELECT country FROM( 
	SELECT country FROM World_Happiness_Report_2024
	WHERE the_old BETWEEN 1 AND 25
) AS WORLD_HAPPIEST

-->Countries With Top Ranks in Any Demographic:

SELECT country FROM World_Happiness_Report_2024 WHERE all_ages <= 5
UNION
SELECT country FROM World_Happiness_Report_2024 WHERE the_young <= 5
UNION
SELECT country FROM World_Happiness_Report_2024 WHERE lower_middle <= 5
UNION
SELECT country FROM World_Happiness_Report_2024 WHERE upper_middle <= 5
UNION
SELECT country FROM World_Happiness_Report_2024 WHERE the_old <= 5;

