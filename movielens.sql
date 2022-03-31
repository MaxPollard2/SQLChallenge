USE movielens;

-- List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
SELECT title, release_date
FROM movies
WHERE release_date>="1983-01-01" AND release_date<="1993-12-31"
ORDER BY release_date DESC;

-- Without using LIMIT, list the titles of the movies with the lowest average rating.
SELECT movies.title, SUM(ratings.rating)/COUNT(ratings.movie_id)
FROM movies
JOIN ratings ON movies.id=ratings.movie_id
GROUP BY ratings.movie_id
ORDER BY SUM(ratings.rating)/COUNT(ratings.movie_id) ASC;

-- List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.
SELECT *
FROM movies
-- Join genres
JOIN genres_movies ON movies.id=genres_movies.movie_id
JOIN genres ON genres_movies.genre_id=genres.id
-- JOIN occupations via usersa via ratings
JOIN ratings ON movies.id=ratings.movie_id
JOIN users ON ratings.user_id=users.id
JOIN occupations ON users.occupation_id=occupations.id
WHERE 	occupations.`name` = "student" AND users.gender="M" 
		AND users.age=24 AND ratings.rating=5 AND genres.`name`="Sci-FI";

-- List the unique titles of each of the movies released on the most popular release day.
SELECT title
FROM movies
WHERE release_date = (
	SELECT release_date
	FROM movies
	GROUP BY release_date
	ORDER BY COUNT(release_date) DESC
	LIMIT 1
);


-- Find the total number of movies in each genre; list the results in ascending numeric order.
SELECT genres.`name`, COUNT(movies.id)
FROM movies
JOIN genres_movies on movies.id=genres_movies.movie_id
JOIN genres ON genres_movies.genre_id=genres.id
GROUP BY genres.`name`
ORDER BY COUNT(movies.title) ASC;
