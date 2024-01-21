SELECT * FROM dev_schema.movie;
SELECT * FROM dev_schema.director;
SELECT * FROM dev_schema.movie_direction;
SELECT * FROM dev_schema.genres;
SELECT * FROM dev_schema.movie_genre;

-- Write a query to find out movie names and their corresponding directors

SELECT m.mov_title, d.dir_fname, d.dir_lname
FROM 
dev_schema.movie m 
INNER JOIN dev_schema.movie_direction md
ON m.movie_id = md.fk_mov_id
INNER JOIN dev_schema.director d
ON d.dir_id = md.fk_dir_id;


