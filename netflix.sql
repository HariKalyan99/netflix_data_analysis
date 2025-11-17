-- netflix project

drop table if exists netflix;

CREATE TABLE netflix (
    show_id VARCHAR(6),
    type VARCHAR(10),
    title VARCHAR(150),
    director VARCHAR(250),
    casts VARCHAR(1000),
    country VARCHAR(150),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(15),
    listed_in VARCHAR(100),
    description VARCHAR(250)
);


select * from netflix;

-- show how many rows are there
select count(*) as total_content from netflix;

-- see all the unique items
select distinct director from netflix;

SELECT COUNT(DISTINCT director) AS num_of_directors
FROM netflix;



-- 15 Business Problems & Solutions

-- 1. Count the number of Movies vs TV Shows

select * from netflix;
select director, count(*) as each_director_count from netflix group by director;
-- order by max on top
select director, count(*) as each_director_count from netflix group by director order by each_director_count desc;

select max(each_director_count) as max_count from (
select director, count(*) as each_director_count from netflix group by director
);

select type, count(*) as director_count from netflix group by type;




-- 2. Find the most common rating for movies and TV shows

select type, rating, ranking, total_count from (
select type, rating, count(*) as total_count, rank() 
over(partition by type order by count(*) desc) as ranking from netflix 
group by 1, 2
) as tab1  where ranking = 1
-- order by 1,3 desc;


-- 
select * from netflix;

select max(rating_discrete) as max_rating from (select rating, count(*) as rating_discrete from netflix group by rating); 


SELECT rating, COUNT(*) AS rating_count
FROM netflix
GROUP BY rating
ORDER BY rating_count asc
limit 1;

SELECT rating, COUNT(*) AS rating_count
FROM netflix
GROUP BY rating
ORDER BY rating_count DESC
limit 1;

-- 3. List all movies released in a specific year (e.g., 2020)
select title, release_year from netflix where release_year = '2020';


-- 4. Find the top 5 countries with the most content on Netflix



-- 5. Identify the longest movie
-- 6. Find content added in the last 5 years
-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
-- 8. List all TV shows with more than 5 seasons
-- 9. Count the number of content items in each genre
-- 10.Find each year and the average numbers of content release in India on netflix. 
-- return top 5 year with highest avg content release!
-- 11. List all movies that are documentaries
-- 12. Find all content without a director
-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!
-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
-- 15.
-- Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
-- the description field. Label content containing these keywords as 'Bad' and all other 
-- content as 'Good'. Count how many items fall into each category.