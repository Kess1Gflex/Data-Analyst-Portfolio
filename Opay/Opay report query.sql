SELECT * FROM Revenue$
SELECT * FROM Expenses$
SELECT SUM(amount) AS Total_Revenue FROM Revenue$ 
SELECT SUM(amount) AS Total_Expense FROM Expenses$ 
SELECT 
    (SELECT SUM(amount) FROM Revenue$) - (SELECT SUM(amount) FROM Expenses$) AS NetProfit;

SELECT SUM(amount) AS Total_Revenue, DATENAME(MONTH, revenue_date) AS Monthly_Revenue FROM Revenue$
GROUP BY DATENAME(MONTH, revenue_date)

SELECT SUM(amount) AS Total_Revenue, DATENAME(QUARTER, revenue_date) AS Quarter_Revenue FROM Revenue$
GROUP BY DATENAME(QUARTER, revenue_date)

SELECT SUM(amount) AS Total_Expense, DATENAME(MONTH, expense_date) AS Monthly_Expense FROM Expenses$
GROUP BY DATENAME(MONTH, expense_date)

SELECT SUM(amount) AS Total_Expense, DATENAME(QUARTER, expense_date) AS Quater_Expense FROM Expenses$
GROUP BY DATENAME(Quarter, expense_date)