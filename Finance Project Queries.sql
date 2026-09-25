create database Corporate_Rating;
use Corporate_Rating;

DESCRIBE corporate_rating.`corporate rating`;

SELECT * FROM corporate_rating.`corporate rating`;

SELECT *
FROM corporate_rating.`corporate rating`
LIMIT 10;

SELECT COUNT(*) AS total_records FROM corporate_rating.`corporate rating`;

SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN `Name` IS NULL THEN 1 ELSE 0 END) AS null_name,
    SUM(CASE WHEN `Rating` IS NULL THEN 1 ELSE 0 END) AS null_rating
FROM corporate_rating.`corporate rating`;

SELECT * FROM corporate_rating.`corporate rating`
WHERE 1 = 0;


SELECT 
    COUNT(*) AS total_records,
    COUNT(DISTINCT CONCAT_WS('|', 
        `Name`,
        `Rating`
    )) AS unique_records
FROM corporate_rating.`corporate rating`;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT CONCAT_WS('|', 
        `Company`,
        `Rating`
    )) AS unique_records
FROM corporate_rating.`corporate rating`;

SELECT * FROM corporate_rating.`corporate rating`
WHERE `Rating` IS NULL;


SELECT
    `Rating`,
    COUNT(*) AS company_count
FROM corporate_rating.`corporate rating`
GROUP BY `Rating`
ORDER BY company_count DESC;

SELECT
    `Rating`,
    COUNT(*) AS company_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM corporate_rating.`corporate rating`),2) AS percentage
FROM corporate_rating.`corporate rating`
GROUP BY `Rating`
ORDER BY company_count DESC;

SELECT * FROM corporate_rating.`corporate rating`
WHERE `Rating` = 'AAA';


SELECT
    `Rating`,
    COUNT(*) AS company_count
FROM corporate_rating.`corporate rating`
GROUP BY `Rating`
ORDER BY `Rating`;

SELECT *
FROM corporate_rating.`corporate rating`
LIMIT 1;

SELECT
    `Rating`,
    COUNT(*) AS company_count,
    ROUND(AVG(`currentRatio`), 2) AS avg_current_ratio,
    ROUND(AVG(`netProfitMargin`), 2) AS avg_net_profit_margin,
    ROUND(AVG(`returnOnEquity`), 2) AS avg_roe,
    ROUND(AVG(`debtRatio`), 2) AS avg_debt_ratio,
    ROUND(AVG(`freeCashFlowPerShare`), 2) AS avg_free_cash_flow
FROM corporate_rating.`corporate rating`
GROUP BY `Rating`
ORDER BY company_count DESC;

SELECT
    `Sector`,
    `Rating`,
    COUNT(*) AS company_count
FROM corporate_rating.`corporate rating`
GROUP BY `Sector`, `Rating`
ORDER BY `Sector`, company_count DESC;

SELECT
    `Year`,
    `Rating`,
    COUNT(*) AS company_count
FROM corporate_rating.`corporate rating`
GROUP BY `Year`, `Rating`
ORDER BY `Year`, company_count DESC;

SELECT
    `Quarter`,
    `Rating`,
    COUNT(*) AS company_count
FROM corporate_rating.`corporate rating`
GROUP BY `Quarter`, `Rating`
ORDER BY `Quarter`, company_count DESC;


SELECT
    `Rating Category`,
    COUNT(*) AS company_count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*)
         FROM corporate_rating.`corporate rating`),
        2
    ) AS percentage
FROM corporate_rating.`corporate rating`
GROUP BY `Rating Category`
ORDER BY company_count DESC;

SELECT
    `Name`,
    `Symbol`,
    `Sector`,
    `Rating`,
    `Rating Score`,
    `Rating Category`
FROM corporate_rating.`corporate rating`
ORDER BY `Rating Score` DESC
LIMIT 10;


