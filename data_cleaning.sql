# World Life Expectancy Project (Data Cleaning)

SELECT * 
FROM world_life_expectancy;

# Identifying duplicates
# Concat country + year to return an unique column where I can verify if there are duplicates or not.
SELECT Country, Year, CONCAT(Country, Year), COUNT(CONCAT(Country, Year)) AS count_dup
FROM world_life_expectancy
GROUP BY Country, Year, CONCAT(Country, Year)
HAVING COUNT(CONCAT(Country, Year)) > 1;

#Using row_number
SELECT *
FROM
	(SELECT Country, Year, Row_ID,
		ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS row_num
		FROM world_life_expectancy) AS row_table
WHERE row_num > 1;


#Removing Duplicates
DELETE FROM world_life_expectancy
WHERE Row_ID IN (
			SELECT Row_ID
		FROM
			(SELECT Country, Year, Row_ID,
				ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS row_num
				FROM world_life_expectancy) AS row_table
		WHERE row_num > 1
);

#Identify the blanks
SELECT *
FROM world_life_expectancy
WHERE Status = '';

#Figure out all distinct status from the table
SELECT DISTINCT(Status)
FROM world_life_expectancy
;

#Update using self-Join
#Develoing Status
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status <>''
AND t2.Status = 'Developing';



#Developed Status
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developed'
WHERE t1.Status = ''
AND t2.Status <>''
AND t2.Status = 'Developed';

SELECT *
FROM world_life_expectancy;

#Populating Life Expectancy column
#Fill in missing life expectancy values by calculating the average of the previous and subsequent years for the same country.
#Since this operation involves three years (the missing year, the previous year, and the subsequent year), I am using a self-join with 
#three instances of the table: t1, t2, and t3.
SELECT t1.Country, t1.Year, t1.`Life expectancy`,
t2.Country, t2.Year, t2.`Life expectancy`,
t3.Country, t3.Year, t3.`Life expectancy`,
ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.Year = t2.Year-1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country
    AND t1.Year = t3.Year+1
WHERE t1.`Life expectancy`= '';

#Udating
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.Year = t2.Year-1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country
    AND t1.Year = t3.Year+1
SET t1.`Life expectancy` = ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
WHERE t1.`Life expectancy`= '';