
SELECT * FROM Tweets

-->Filtering by Text Length:
SELECT text, LEN(text) AS tweet_length FROM Tweets
WHERE Len(text) <=50
AND sentiment = 'positive'

/*extract all tweets with neutral sentiment that also
include any form of question (e.g., “?”, “what”, “how”):*/

SELECT textID, text, selected_text 
FROM Tweets 
WHERE sentiment = 'neutral' AND 
(text LIKE '%?%' OR text LIKE '%what%' OR text LIKE '%how%')

-->Sentiment Comparison
SELECT sentiment, AVG(LEN(text)) AS avg_tweet_length 
FROM Tweets 
WHERE sentiment IN ('positive', 'negative')
GROUP BY sentiment;


SELECT T.sentiment, COUNT(T.text) AS GOOD FROM Tweets T
WHERE text LIKE '%good%' 
GROUP BY T.sentiment

SELECT TW.sentiment, COUNT(T.text) AS BAD FROM Tweets TW
WHERE text LIKE '%bad%' 
GROUP BY TW.sentiment

ON T.sentiment= TW.sentiment


