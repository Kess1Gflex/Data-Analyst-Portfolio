
SELECT TOP 5 * FROM [the_office_episodes cleaned]
JOIN [the_office_imdb cleaned]
ON  [the_office_episodes cleaned].season =[the_office_imdb cleaned].season
AND [the_office_episodes cleaned].episode_num_in_season = [the_office_imdb cleaned].episode_num 
WHERE [the_office_episodes cleaned].season= 1
WHERE [the_office_episodes cleaned].prod_code = 3012 -->Num 5
ORDER BY [the_office_imdb cleaned].imdb_rating DESC --> NUM 4

-->9
SELECT written_by, COUNT (*) FROM [the_office_episodes cleaned]
JOIN [the_office_imdb cleaned]
ON  [the_office_episodes cleaned].season =[the_office_imdb cleaned].season
AND [the_office_episodes cleaned].episode_num_in_season = [the_office_imdb cleaned].episode_num 
GROUP BY [the_office_episodes cleaned].written_by


-->Num 10 revisit
SELECT [the_office_episodes cleaned].season,[the_office_episodes cleaned].episode_num_in_season FROM [the_office_episodes cleaned]
JOIN [the_office_imdb cleaned]
ON  [the_office_episodes cleaned].season =[the_office_imdb cleaned].season
AND [the_office_episodes cleaned].episode_num_in_season = [the_office_imdb cleaned].episode_num 
-->WHERE [the_office_episodes cleaned].episode_num_in_season = ( SELECT MIN(episode_num_in_season) FROM [the_office_episodes cleaned])
WHERE [the_office_episodes cleaned].episode_num_in_season = ( SELECT MAX(episode_num_in_season) FROM [the_office_episodes cleaned])
ORDER BY [the_office_episodes cleaned].season
-->WHERE [the_office_episodes cleaned].season= 1


SELECT title from [the_office_episodes cleaned]
