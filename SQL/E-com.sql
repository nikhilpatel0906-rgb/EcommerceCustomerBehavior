
-- E-Commerce Customer Behavior Analysis

-- 1. Overall KPIs

SELECT 
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN Revenue = 'TRUE' THEN 1 ELSE 0 END) AS total_purchases,
    ROUND(SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS conversion_rate,
    ROUND(AVG(BounceRates) * 100, 2) AS avg_bounce_rate
FROM online_shoppers;


-- 2. Visitor Type Analysis
SELECT
    VisitorType,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END) AS purchases,
    ROUND(SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS conversion_rate
FROM online_shoppers
GROUP BY VisitorType
ORDER BY conversion_rate DESC;


-- 3. Weekend vs Weekday 
SELECT
    Weekend,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END) AS purchases,
    ROUND(SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS conversion_rate
FROM online_shoppers
GROUP BY Weekend;



-- 4. Bounce Rate Analysis 

SELECT
    Revenue,
    ROUND(AVG(BounceRates),4) AS avg_bounce_rate
FROM online_shoppers
GROUP BY Revenue;



-- 5. Exit Rate Analysis 

SELECT
    Revenue,
    ROUND(AVG(ExitRates),4) AS avg_exit_rate
FROM online_shoppers
GROUP BY Revenue;



-- 6. Monthly Purchases & Conversion

SELECT
    Month,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END) AS purchases,
    ROUND(SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS conversion_rate
FROM online_shoppers
GROUP BY Month
ORDER BY 
    CASE 
        WHEN Month = 'Feb' THEN 2
        WHEN Month = 'Mar' THEN 3
        WHEN Month = 'Apr' THEN 4
        WHEN Month = 'May' THEN 5
        WHEN Month = 'Jun' THEN 6
        WHEN Month = 'Jul' THEN 7
        WHEN Month = 'Aug' THEN 8
        WHEN Month = 'Sep' THEN 9
        WHEN Month = 'Oct' THEN 10
        WHEN Month = 'Nov' THEN 11
        WHEN Month = 'Dec' THEN 12
    END;



-- 7. Engagement Analysis 

SELECT
    ProductRelated_Duration,
    PageValues,
    Revenue
FROM online_shoppers;


-- 8. Traffic Type Analysis

SELECT
    TrafficType,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END) AS purchases,
    ROUND(SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS conversion_rate
FROM online_shoppers
GROUP BY TrafficType
ORDER BY conversion_rate DESC;



-- 9. Region Analysis 

SELECT
    Region,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END) AS purchases,
    ROUND(SUM(CASE WHEN Revenue='TRUE' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS conversion_rate
FROM online_shoppers
GROUP BY Region
ORDER BY conversion_rate DESC;


-- 10. High Engagement but No Purchase


SELECT *
FROM online_shoppers
WHERE ProductRelated_Duration > (
    SELECT AVG(ProductRelated_Duration) FROM online_shoppers
)
AND Revenue = 'FALSE';



-- 11. High Intent Customers 

SELECT *
FROM online_shoppers
WHERE PageValues > (
    SELECT AVG(PageValues) FROM online_shoppers
)
AND Revenue = 'TRUE';