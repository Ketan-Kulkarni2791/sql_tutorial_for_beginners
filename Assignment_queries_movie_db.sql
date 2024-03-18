SELECT * FROM dev_schema.movie;
SELECT * FROM dev_schema.director;
SELECT * FROM dev_schema.movie_direction;
SELECT * FROM dev_schema.actor;
SELECT * FROM dev_schema.genre;
SELECT * FROM dev_schema.movie_genre;
SELECT * FROM dev_schema.reviewer;
SELECT * FROM dev_schema.rating;

-- Write a query to find out movie names and their corresponding directors

SELECT m.mov_title, d.dir_fname, d.dir_lname
FROM 
dev_schema.movie m 
INNER JOIN dev_schema.movie_direction md
ON m.movie_id = md.fk_mov_id
INNER JOIN dev_schema.director d
ON d.dir_id = md.fk_dir_id;

-- Write a SQL query to display director names of the movies those are released in USA and India.

SELECT m.mov_title, d.dir_fname, d.dir_lname
FROM 
dev_schema.movie m 
INNER JOIN dev_schema.movie_direction md
ON m.movie_id = md.fk_mov_id
INNER JOIN dev_schema.director d
ON d.dir_id = md.fk_dir_id
WHERE m.mov_rel_country IN ('USA', 'India') ORDER BY m.mov_lang;

-- Write a SQL query to display the movie title and director name of all the Marathi movie.

SELECT m.mov_title, d.dir_fname, d.dir_lname
FROM 
dev_schema.movie m 
INNER JOIN dev_schema.movie_direction md
ON m.movie_id = md.fk_mov_id
INNER JOIN dev_schema.director d
ON d.dir_id = md.fk_dir_id
WHERE m.mov_lang = 'Marathi' ORDER BY m.mov_year;

-- Write a SQL query to display the movie title, movie language, release country and director name of the movies those are 
-- released between year 2010 and 2020.

SELECT m.mov_title, m.mov_lang, d.dir_fname, d.dir_lname
FROM 
dev_schema.movie m 
INNER JOIN dev_schema.movie_direction md
ON m.movie_id = md.fk_mov_id
INNER JOIN dev_schema.director d
ON d.dir_id = md.fk_dir_id
WHERE m.mov_year BETWEEN 2010 AND 2020 ORDER BY m.mov_year;

-- Write a SQL query to display the count of the movies for each language.

-- Write a query to find out movie names and their corresponding genres

SELECT m.mov_title, g.gen_title
FROM 
dev_schema.movie m 
INNER JOIN dev_schema.movie_genre mg
ON m.movie_id = mg.fk_mov_id
INNER JOIN dev_schema.genre g
ON g.gen_id = mg.fk_gen_id;

-- Write a SQL query to display the count of the movies for each language.

SELECT mov_lang, COUNT(mov_title) FROM dev_schema.movie GROUP BY mov_lang;

-- Write a SQL query to display the maximum count of actors and their gender. (Whoever has maximum count between male and female.)

SELECT actor_gender, COUNT(actor_gender) FROM dev_schema.actor
GROUP BY actor_gender HAVING COUNT(actor_gender) = (SELECT COUNT(actor_gender) FROM dev_schema.actor GROUP BY actor_gender
												  ORDER BY COUNT(actor_gender) DESC LIMIT 1);

WITH cte_max_gender AS
(
	SELECT actor_gender, COUNT(actor_gender) as max_cnt FROM dev_schema.actor GROUP BY actor_gender ORDER BY COUNT(actor_gender) DESC
)
SELECT actor_gender, max_cnt FROM cte_max_gender LIMIT 1;

SELECT actor_gender, COUNT(actor_gender) as max_cnt FROM dev_schema.actor GROUP BY actor_gender ORDER BY COUNT(actor_gender) DESC LIMIT 1;

-- Write a SQL query to display the movies with no movie cast.

SELECT * FROM dev_schema.actor;
SELECT * FROM dev_schema.movie_cast;

SELECT * 
FROM dev_schema.movie AS m 
LEFT JOIN
dev_schema.movie_cast AS mc
ON m.movie_id = mc.fk_movie_id
LEFT JOIN
dev_schema.actor as a
ON mc.fk_actor_id = a.actor_id
WHERE mc.fk_actor_id  IS NULL;

-- Write a SQL query to display all the actors those have played role in 'Ab tak chhappan'

-- *** Using Subquery ***
SELECT actor_fname, actor_lname FROM dev_schema.actor WHERE actor_id IN (
	SELECT fk_actor_id FROM dev_schema.movie_cast WHERE fk_movie_id IN (
		SELECT movie_id FROM dev_schema.movie WHERE mov_title = 'Ab tak chhappan'
));

-- *** Using Join and Subquery ***
SELECT a.actor_fname, a.actor_lname
FROM
dev_schema.actor AS a INNER JOIN dev_schema.movie_cast AS mc
ON a.actor_id = mc.fk_actor_id
WHERE mc.fk_movie_id IN (
	SELECT movie_id FROM dev_schema.movie WHERE mov_title = 'Ab tak chhappan'
);

-- Write a SQL query to display movie title and all the actors those have played role in 'Ab tak chhappan'

-- *** Using Join ***
SELECT m.mov_title, a.actor_fname, a.actor_lname FROM 
dev_schema.actor AS a INNER JOIN dev_schema.movie_cast AS mc
ON a.actor_id = mc.fk_actor_id
INNER JOIN dev_schema.movie AS m
ON m.movie_id = mc.fk_movie_id
WHERE m.mov_title = 'Ab tak chhappan';

SELECT * FROM dev_schema.movie_direction;
SELECT * FROM dev_schema.genre;
SELECT * FROM dev_schema.movie_genre;
SELECT * FROM dev_schema.reviewer;
SELECT * FROM dev_schema.rating;

-- Write a SQL query to display movie name, its genre, director name, reviewer and ratings.
SELECT m.mov_title, m.mov_year, m.mov_lang, d.dir_fname, d.dir_lname, g.gen_title, r.rev_name, ra.rev_stars, ra.num_of_rev FROM 
dev_schema.movie AS m INNER JOIN dev_schema.movie_direction AS md
ON m.movie_id = md.fk_mov_id
INNER JOIN dev_schema.director AS d
ON d.dir_id = md.fk_dir_id
INNER JOIN dev_schema.movie_genre AS mg
ON m.movie_id = mg.fk_mov_id
INNER JOIN dev_schema.genre AS g
ON g.gen_id = mg.fk_gen_id
INNER JOIN dev_schema.rating AS ra
ON m.movie_id = ra.fk_mov_id
INNER JOIN dev_schema.reviewer AS r
ON r.rev_id = ra.fk_rev_id;


-- Write a SQL query to display average count of stars for English movies.
SELECT AVG(r.rev_stars) AS stars
FROM
dev_schema.movie AS m INNER JOIN dev_schema.rating AS r
ON m.movie_id = r.fk_mov_id
GROUP BY m.mov_lang
HAVING m.mov_lang = 'English';


-- Write a SQL query to display average count of stars for each language.

SELECT m.mov_lang, AVG(r.rev_stars) AS stars
FROM
dev_schema.movie AS m INNER JOIN dev_schema.rating AS r
ON m.movie_id = r.fk_mov_id
GROUP BY m.mov_lang;

-- Write a SQL query to display movie name and its IMDB ratings.

SELECT m.mov_title, rw.rev_name, r.rev_stars
FROM
dev_schema.movie AS m INNER JOIN dev_schema.rating AS r
ON m.movie_id = r.fk_mov_id
INNER JOIN dev_schema.reviewer AS rw
ON rw.rev_id = r.fk_rev_id
WHERE rw.rev_name = 'Imdb' ORDER BY r.rev_stars ASC;

-- Write a SQL query to display the average 'BookMyShow' rating for english movies.

SELECT m.mov_lang, AVG(r.rev_stars)
FROM
dev_schema.movie AS m INNER JOIN dev_schema.rating AS r
ON m.movie_id = r.fk_mov_id
INNER JOIN dev_schema.reviewer AS rw
ON rw.rev_id = r.fk_rev_id
WHERE rw.rev_name = 'BookMyShow' GROUP BY m.mov_lang
HAVING m.mov_lang = 'English';

