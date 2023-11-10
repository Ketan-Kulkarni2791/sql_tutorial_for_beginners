SELECT * FROM dev_schema.movie;
SELECT * FROM dev_schema.genres;
SELECT * FROM dev_schema.movie_genre;


INSERT INTO dev_schema.movie (mov_title, mov_year, mov_lang, mov_dt_rel) VALUES
('Mad Max fury road', 2015, 'English', '2015-09-12'),
('The theory of everything', 2014, 'English', '2014-10-19'),
('Lokmanya', 2021, 'Marathi', '2021-11-20'),
('The Hanuman returns', 2018, 'Hindi', '2018-12-12'),
('GI Joe retiliation', 2012, 'English', '2012-09-30'),
('Tumbadd', 2019, 'Hindi', '2019-06-10'),
('Conjuring', 2011, 'English', '2011-05-30'),
('Bhaag Milkha bhaag', 2010, 'Hindi', '2010-09-30'),
('Rege', 2009, 'Marathi', '2009-04-14'),
('ABCD', 2013, 'Hindi', '2013-09-30'),
('Uri', 2019, 'Hindi', '2019-09-30'),
('Enigma', 2001, 'English', '2001-09-30'),
('Life is beautiful', 1997, 'English', '1997-09-20');


INSERT INTO dev_schema.genres (gen_title) VALUES
('Action'), ('Adventure'), ('Animation'), ('Biography'), ('Comedy'), ('Crime'), ('Drama'),
('Horror'), ('Music'), ('Mystery'), ('Romance'), ('Thriller'), ('War');

INSERT INTO dev_schema.movie_genre (fk_mov_id, fk_gen_id) VALUES
(1, 7), (2, 5), (3, 7), (4, 10), (5, 11), (6, 10), (7, 12), (8, 6), (9, 5), (10, 2), (11, 4), (12, 4),
(13, 3), (14, 1), (15, 8), (16, 8), (17, 4), (18, 6), (19, 9), (20, 13), (21, 13), (22, 13);

SELECT * FROM dev_schema.movie;
SELECT * FROM dev_schema.director;
SELECT * FROM dev_schema.movie_direction;

ALTER TABLE dev_schema.movie_direction DROP COLUMN mov_dir_id;

INSERT INTO dev_schema.director (dir_fname, dir_lname) VALUES
('George', 'Miller'), ('James', 'Marsh'), ('Om', 'Raut'),
('Anurag', 'Kashyap'), ('Jon M.', 'Chu'), ('Rahi Anil', 'Barve'),
('Anand', 'Gandhi'), ('James', 'Wan'), ('Rakeysh Omprakash', 'Mehra'),
('Abhijit', 'Panse'), ('Remo', 'D''Souza'), ('Aditya', 'Dhar'),
('Michael', 'Apted'), ('Roberto', 'Benigni');

INSERT INTO dev_schema.movie_direction (fk_mov_id, fk_dir_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10), (11, 11), 
(12, 12), (13, 13), (14, 14), (15, 15), (15, 16), (16, 17), (17, 18), (18, 19), (19, 20),
(20, 21), (21, 22), (22, 23);


