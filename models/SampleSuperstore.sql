
 
SELECT

Segment,
SUM(Sales) AS total_sales,  
SUM(Quantity) AS total_quantity,
avg(Discount) as avg_discount,
sum(Profit) as total_profit,
avg((Profit/Sales)*100) as avg_profit_margin
FROM SampleSuperstore.SampleSuperstore
GROUP BY Segment
 