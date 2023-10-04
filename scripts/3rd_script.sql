--1. How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
FROM data_analyst_jobs;
--1793
--2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT company
FROM data_analyst_jobs
LIMIT 10;
--ExxonMobil
--3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN'OR location = 'KY';
--TN 21
--TN OR KY 27
--4. How many postings in Tennessee have a star rating above 4?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN'AND star_rating>4;
-- 3
--5. How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
--151
--6. Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?
SELECT location AS state, AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_star_rating DESC;
--NE
--7. Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT title) AS distinct_title_count
FROM data_analyst_jobs;
--881
--8. How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT location)AS distinct_location, COUNT(DISTINCT title) AS distinct_title
FROM data_analyst_jobs
WHERE location='CA';
--230
--9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT DISTINCT company, COUNT(company), AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count>5000
AND company IS NOT NULL 
GROUP BY company
ORDER BY avg_star_rating DESC;
--40
--10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT DISTINCT company, COUNT(company), AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count>5000
AND company IS NOT NULL
GROUP BY company
ORDER BY avg_star_rating DESC;
--"company"
--"American Express"
--"General Motors"
--"Kaiser Permanente"
--"Microsoft""company"
--"Nike"
--"Unilever"
--11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title LIKE '%nalyst%' OR title LIKE '%NALYST%'
AND title IS NOT NULL;
--TITLES 1669
-- DISTINCT TITLES 774
--12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT DISTINCT *
FROM data_analyst_jobs
WHERE title NOT LIKE'%nalyst%' 
AND title NOT LIKE '%NALYST%' 
AND title NOT LIKE '%nalytic%'
AND title NOT LIKE '%NALYTIC%'
AND title IS NOT NULL;
--4
--Tableau--
