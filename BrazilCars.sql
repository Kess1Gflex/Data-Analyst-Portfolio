SELECT * FROM Brazil_Cars

SELECT Date, SUM(VALUE) AS TOTAL FROM Brazil_Cars
GROUP BY Date

--> Calculate the moving average of sales over a Yearly-Quarter window
SELECT Date, Value, 
    AVG(VALUE) OVER ( ORDER BY DATE ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Moving_Avg_Quarter
FROM
    Brazil_Cars;

SELECT 
    date, 
    value, 
    AVG(value) OVER () AS avg_sales, 
    value - AVG(value) OVER () AS sales_difference
FROM 
    Brazil_Cars;

--> What is the maximum sales value for each month?
SELECT 
    DATEPART(YEAR, date) AS year, 
    DATEPART(MONTH, date) AS month, 
    MAX(value) OVER (PARTITION BY DATEPART(YEAR, date), DATEPART(MONTH, date)) AS max_sales
FROM 
    Brazil_Cars;

--> Rank the days (in this case, months) within each year based on their sales value
SELECT 
    date, 
    value, 
    RANK() OVER (PARTITION BY YEAR(date) ORDER BY value DESC) AS monthly_rank
FROM 
    Brazil_Cars;