SELECT * FROM dairy_dataset

EXEC sp_rename 'dbo.dairy_dataset.Location', 'Store_Location', 'COLUMN'

SELECT SUM(Quantity_Sold_liters_kg) AS SOLD, Date FROM dairy_dataset
GROUP BY Date
ORDER BY SOLD DESC

SELECT MONTH(Date), SUM(Approx_Total_Revenue_INR) FROM dairy_dataset
WHERE YEAR(Date) = '2022'
GROUP BY MONTH(Date)
ORDER BY MONTH(Date) 

SELECT Product_Name, Product_ID, Store_Location FROM dairy_dataset
WHERE Shelf_Life_days <=30

SELECT Product_ID, Product_Name, Production_Date, Expiration_Date, Store_Location,
DATEDIFF(day, Production_Date, Expiration_Date) AS Days_Between_Production_And_Expiration
FROM  dairy_dataset
ORDER BY Days_Between_Production_And_Expiration DESC;

SELECT Product_Name, Product_ID, Store_Location, Quantity_in_Stock_liters_kg, Minimum_Stock_Threshold_liters_kg FROM dairy_dataset
WHERE  Minimum_Stock_Threshold_liters_kg < Quantity_in_Stock_liters_kg

SELECT TOP 1 Product_Name, SUM(Total_Value) AS TOTAL FROM dairy_dataset
GROUP BY Product_Name
ORDER BY TOTAL DESC

SELECT TOP 1 Product_Name, SUM(Total_Value) AS TOTAL FROM dairy_dataset
GROUP BY Product_Name
ORDER BY TOTAL ASC

SELECT  Brand, SUM(Approx_Total_Revenue_INR) AS TOTAL FROM dairy_dataset
GROUP BY Brand
ORDER BY TOTAL DESC

