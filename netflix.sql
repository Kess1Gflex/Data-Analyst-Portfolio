
EXEC sp_rename 'all-weeks-countries_cleaned.weekly_rank', 'weekly_rank_country', 'COLUMN';
EXEC sp_rename 'all-weeks-global_CLEANED.weekly_rank_country', 'weekly_rank_global', 'COLUMN';

SELECT * FROM [all-weeks-countries_cleaned]
JOIN [all-weeks-global_CLEANED]
ON [all-weeks-countries_cleaned].week= [all-weeks-global_CLEANED].week

-->2,180,000 ROWS

SELECT * FROM [all-weeks-countries_cleaned]
JOIN [all-weeks-global_CLEANED]
ON [all-weeks-countries_cleaned].weekly_rank= [all-weeks-global_CLEANED].weekly_rank
--> THEY KEEP INCREASING

SELECT * FROM [all-weeks-countries_cleaned]
INNER JOIN [all-weeks-global_CLEANED]
ON [all-weeks-countries_cleaned].show_title= [all-weeks-global_CLEANED].show_title
AND [all-weeks-countries_cleaned].week= [all-weeks-global_CLEANED].week
-->WHERE [all-weeks-countries_cleaned].weekly_rank_country <=5
WHERE [all-weeks-global_CLEANED].show_title= 'Money Heist'


SELECT [all-weeks-countries_cleaned].country_name, 
[all-weeks-countries_cleaned].show_title, [all-weeks-countries_cleaned].weekly_rank_country,
[all-weeks-countries_cleaned].week, [all-weeks-global_CLEANED].week
 FROM [all-weeks-countries_cleaned]
INNER JOIN [all-weeks-global_CLEANED]
ON [all-weeks-countries_cleaned].show_title= [all-weeks-global_CLEANED].show_title
AND [all-weeks-countries_cleaned].week= [all-weeks-global_CLEANED].week
WHERE [all-weeks-countries_cleaned].weekly_rank_country =1
AND [all-weeks-global_CLEANED].weekly_rank_global = 1
and YEAR([all-weeks-global_CLEANED].WEEK)= 2022
ORDER BY [all-weeks-countries_cleaned].country_name

SELECT * FROM [all-weeks-global_CLEANED]
SELECT DISTINCT[all-weeks-global_CLEANED].show_title, [all-weeks-global_CLEANED].weekly_hours_viewed,
[all-weeks-global_CLEANED].cumulative_weeks_in_top_10, [all-weeks-global_CLEANED].week
FROM [all-weeks-countries_cleaned]
INNER JOIN [all-weeks-global_CLEANED]
ON [all-weeks-countries_cleaned].show_title= [all-weeks-global_CLEANED].show_title
AND [all-weeks-countries_cleaned].week= [all-weeks-global_CLEANED].week
WHERE MONTH([all-weeks-global_CLEANED].week )= 01
AND YEAR([all-weeks-global_CLEANED].WEEK)= 2022
ORDER BY [all-weeks-global_CLEANED].weekly_hours_viewed DESC

SELECT COUNT(DISTINCT [all-weeks-countries_cleaned].country_name) AS TOTAL_COUNTRY, [all-weeks-global_CLEANED].show_title
-->[all-weeks-countries_cleaned].country_name 
FROM [all-weeks-countries_cleaned]
INNER JOIN [all-weeks-global_CLEANED]
ON [all-weeks-countries_cleaned].show_title= [all-weeks-global_CLEANED].show_title
AND [all-weeks-countries_cleaned].week= [all-weeks-global_CLEANED].week
GROUP BY [all-weeks-global_CLEANED].show_title 
ORDER BY TOTAL_COUNTRY DESC 

SELECT DISTINCT [all-weeks-countries_cleaned].country_name
FROM [all-weeks-countries_cleaned]
INNER JOIN [all-weeks-global_CLEANED]
ON [all-weeks-countries_cleaned].show_title= [all-weeks-global_CLEANED].show_title
AND [all-weeks-countries_cleaned].week= [all-weeks-global_CLEANED].week
WHERE [all-weeks-global_CLEANED].show_title= 'Money Heist'

SELECT [all-weeks-countries_cleaned].country_name,
MAX([all-weeks-countries_cleaned].cumulative_weeks_in_top_10) AS WEEKS_ON_BOARD
FROM [all-weeks-countries_cleaned]
LEFT JOIN [all-weeks-global_CLEANED]
ON [all-weeks-countries_cleaned].show_title= [all-weeks-global_CLEANED].show_title
AND [all-weeks-countries_cleaned].week= [all-weeks-global_CLEANED].week
WHERE [all-weeks-countries_cleaned].week= '2022-01-16'
GROUP BY [all-weeks-countries_cleaned].country_name
ORDER BY WEEKS_ON_BOARD DESC
