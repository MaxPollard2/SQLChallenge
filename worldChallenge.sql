USE world;

-- Using COUNT, get the number of cities in the USA.
SELECT COUNT(ID)
FROM city
JOIN country ON country.`Code`=city.CountryCode
WHERE country.Name="United States";

-- Find out the population and life expectancy for people in Argentina.
SELECT Population, LifeExpectancy
FROM country
WHERE `Name`="Argentina";

-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT `Name`, LifeExpectancy
FROM country
WHERE LifeExpectancy IS NOT NULL
ORDER BY LifeExpectancy DESC
LIMIT 1;


-- Using JOIN ... ON, find the capital city of Spain.
SELECT city.`Name`
FROM city
JOIN country ON country.capital=city.ID
WHERE country.`Name` = "Spain";

-- Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
SELECT DISTINCT countrylanguage.`Language`
FROM countrylanguage
JOIN country on country.`code`=countrylanguage.CountryCode
WHERE country.Region = "Southeast Asia";

-- Using a single query, list 25 cities around the world that start with the letter F.
SELECT `Name`
FROM city
WHERE `Name` LIKE "F%"
LIMIT 25;

-- Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT COUNT(ID)
FROM city
JOIN country ON country.`Code`=city.CountryCode
WHERE country.Name="China";

-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT `Name`, population
FROM country
WHERE population IS NOT NULL AND population>0
ORDER BY population ASC
LIMIT 1;

-- Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(`CODE`)
FROM country;

-- What are the top ten largest countries by area?
SELECT `Name`, SurfaceArea
FROM country
ORDER BY SurfaceArea DESC
LIMIT 10;

-- List the five largest cities by population in Japan.
SELECT city.`Name`
FROM city
JOIN country ON country.`Code`=city.CountryCode
WHERE country.Name="Japan"
ORDER BY city.Population DESC
LIMIT 5;

-- List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
SELECT `Name`, `Code`
FROM country
WHERE HeadOfState="Elisabeth II";

-- List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
SELECT `Name`, Population, SurfaceArea, Population/SurfaceArea
FROM country
WHERE Population/SurfaceArea>0
ORDER BY Population/SurfaceArea ASC
LIMIT 10;

-- List every unique world language.
SELECT DISTINCT `Language`
FROM countrylanguage;


-- List the names and GNP of the world's top 10 richest countries.
SELECT `Name`, GNP
FROM country
ORDER BY GNP DESC
LIMIT 10;


-- List the names of, and number of languages spoken by, the top ten most multilingual countries.
select COUNT(country.`Name`), country.`Name`
from countrylanguage
JOIN country ON countrylanguage.CountryCode=Country.`code`
GROUP BY country.`Name`
ORDER BY COUNT(country.`Name`) DESC
LIMIT 10;


-- List every country where over 50% of its population can speak German.
select country.`Name`
from countrylanguage
JOIN country ON countrylanguage.CountryCode=Country.`code`
WHERE countrylanguage.`language`="German" AND countrylanguage.Percentage > 50;


-- Which country has the worst life expectancy? Discard zero or null values.
SELECT country.`Name`, lifeExpectancy
FROM country
WHERE lifeExpectancy IS NOT NULL AND lifeExpectancy != 0
ORDER BY lifeExpectancy ASC
LIMIT 1;

-- List the top three most common government forms.
select COUNT(GovernmentForm), GovernmentForm
FROM country
GROUP BY GovernmentForm
ORDER BY Count(GovernmentForm) DESC
LIMIT 3;

-- How many countries have gained independence since records began?
select COUNT(`Code`)
FROM Country
WHERE IndepYear IS NOT NULL;