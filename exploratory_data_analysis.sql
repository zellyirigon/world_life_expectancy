# World Life Expectancy Project (Exploratory Data Analysis)

#How much each country increased life expectancy between 2007 and 2022.
SELECT Country, MIN(`Life expectancy`), MAX(`Life expectancy`),
ROUND(MAX(`Life expectancy`)-MIN(`Life expectancy`),1) AS Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0
  AND MAX(`Life expectancy`)<>0
ORDER BY Life_Increase_15_Years DESC;

#Average life expectancy per year over time.
SELECT Year, ROUND(AVG(`Life expectancy`),1)
FROM world_life_expectancy
WHERE `Life expectancy` <>0
GROUP BY Year
ORDER BY Year;

#Correlation between Life Expectancy and GDP columns
SELECT Country, ROUND(AVG(`Life expectancy`),1) AS Life_exp, ROUND(AVG(GDP),2) AS GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Life_exp >0
AND GDP >0
ORDER BY GDP;
#Case statement-- Comparing average life expectancy between high-GDP and low-GDP countries.
SELECT 
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) AS High_GDP_Count,
AVG(CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END) AS High_GDP_Life_Exp,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) AS Low_GDP_Count,
AVG(CASE WHEN GDP <= 1500 THEN `Life expectancy` ELSE NULL END) AS Low_GDP_Life_Exp
FROM world_life_expectancy
;
#Comparison between Developed and Developing countries (count and average life expectancy)
SELECT *
FROM world_life_expectancy;

SELECT Status, COUNT(DISTINCT Country), ROUND(AVG(`Life expectancy`),1)
FROM world_life_expectancy
GROUP BY Status;

#Correlation between BMI and life expectancy
SELECT Country, ROUND(AVG(`Life expectancy`),1) AS Life_exp, ROUND(AVG(BMI),1) AS BMI
FROM world_life_expectancy
GROUP BY Country
HAVING Life_exp > 0
AND BMI > 0
ORDER BY BMI DESC;

#Rolling Total of Adult Mortality for Brazil over the years.
#The SUM() function with the OVER() clause creates a rolling total, summing Adult Mortality year by year.
#PARTITION BY Country ensures that the rolling sum is calculated separately for each country.
#ORDER BY Year makes sure the sum accumulates chronologically.
SELECT Country, 
Year,
`Life expectancy`,
`Adult Mortality`, 
SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy
WHERE Country = 'Brazil';





