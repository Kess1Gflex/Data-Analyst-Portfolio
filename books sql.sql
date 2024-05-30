
SELECT * FROM [bestsellers with categories]

SELECT Genre, COUNT (*) AS BOOK_COUNT FROM [bestsellers with categories]
GROUP BY Genre

SELECT COUNT (DISTINCT Author) AS AUTHORS FROM [bestsellers with categories]

SELECT Year, COUNT(DISTINCT Name) AS BOOKS_PUBLISHED FROM [bestsellers with categories]
GROUP BY Year

SELECT Genre, SUM(Reviews) FROM [bestsellers with categories]
GROUP BY Genre

SELECT SUM(Price) FROM [bestsellers with categories]

SELECT Author, SUM(Reviews) FROM [bestsellers with categories]
GROUP BY Author

SELECT * FROM [bestsellers with categories]
Where Year = '2014'

SELECT Genre, AVG(User_Rating) FROM [bestsellers with categories]
GROUP BY Genre

SELECT Year,Count(*) AS TOTAL_BOOKS ,SUM(Price) AS REVENUE FROM [bestsellers with categories]
GROUP BY Year

SELECT Genre, Year, AVG(Price) FROM [bestsellers with categories]
GROUP BY Genre, Year

SELECT Author, Genre, COUNT(*) FROM [bestsellers with categories]
GROUP BY Author, Genre
