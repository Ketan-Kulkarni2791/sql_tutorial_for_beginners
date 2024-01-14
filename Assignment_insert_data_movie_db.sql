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

SELECT * FROM dev_schema.actor;

INSERT INTO dev_schema.actor (actor_fname, actor_lname, actor_gender) VALUES
('Arun', 'Nalawade', 'M'),			-- shwaas
('Sandeep', 'Kulkarni', 'M'),		-- shwaas
('Amruta', 'Subhash', 'F'),			-- shwaas
('Vibhawari', 'Deshpande', 'F'),	-- shwaas
('Ashok', 'Saraf', 'M'),			-- ashi hi
('Sachin', 'Pilgaokar', 'M'),		-- ashi hi
('Lakshmikant', 'Berde', 'M'),		-- ashi hi
('Sudhir', 'Joshi', 'M'),			-- ashi hi
('Nivedita', 'Saraf', 'F'),			-- ashi hi
('Supriya', 'Pilgaokar', 'F'),		-- ashi hi
('Emma', 'Thompson', 'F'),			-- sense
('Alan', 'Rickman', 'M'),			-- sense
('Kate', 'Winslet', 'F'),			-- sense
('Hugh', 'Grant', 'M'),				-- sense
('Jonny', 'Depp', 'M'),				-- ninth gate
('Emmanuelle', 'Seigner', 'F'),		-- ninth gate
('Lena', 'Olin', 'F'),				-- ninth gate
('Tony', 'Amoni', 'M'),				-- ninth gate
('Jim', 'Carrey', 'M'),				-- eternal sunshine
('Kirsten', 'Dunst', 'F'),			-- eternal sunshine
('Elijah', 'Wood', 'M'),			-- eternal sunshine
('Brad', 'Pitt', 'M'),				-- joe
('Claire', 'Farloni', 'F'),			-- joe
('Anthony', 'Hopkins', 'M'),		-- joe
('Jake', 'Weber', 'M'),				-- joe
('Amir', 'Khan', 'M'),				-- talaash
('Kareena', 'Kapoor', 'F'),			-- talaash
('Rani', 'Mukharji', 'F'),			-- talaash
('Nawajuddin', 'Siddiqui', 'M'),	-- talaash
('Rajkumar', 'Rao', 'M'),			-- talaash
('Sheeba', 'Chadhha', 'F'),			-- talaash
('Nana', 'Patekar', 'M'),			-- chhappan
('Prasad', 'Purandare', 'M'),		-- chhappan
('Rewathi', '', 'F'),				-- chhappan
('Mohan', 'Agashe', 'M'),			-- chhappan
('Harshitaa', 'Bhatt', 'F'),		-- chhappan
('Yashpal', 'Sharma', 'M'),			-- chhappan
('Akshay', 'Kumar', 'M'),			-- hera pheri
('Sunil', 'Shetty', 'M'),			-- hera pheri
('Paresh', 'Rawal', 'M'),			-- hera pheri
('Tabu', '', 'F'),					-- hera pheri
('Tom', 'Hardy', 'M'),				-- mad max
('Charlize', 'Theron', 'F'),		-- mad max
('Nicolas', 'Hault', 'M'),			-- mad max
('Courtney', 'Eaton', 'F'),			-- mad max
('Subodh', 'Bhave', 'M'),			-- lokmanya
('Chinmay', 'Mandlekar', 'M'),		-- lokmanya
('Priya', 'Bapat', 'F'),			-- lokmanya
('Angad', 'Mhaskar', 'M'),			-- lokmanya
('Malak', 'Shah', 'M'),				-- hanuman
('Irfan', 'Khan', 'M'),				-- hanuman
('Lillian', 'Carlson', 'F'),		-- hanuman
('Dwayne', 'Jonson', 'M'),			-- G I
('Adrianne', 'Palicki', 'F'),		-- G I
('Channing', 'Tatum', 'M'),			-- G I
('Bruce', 'Willis', 'M'),			-- G I
('Sohum', 'Shah', 'M'),				-- Tumbadd
('Jyoti', 'Malshe', 'F'),			-- Tumbadd
('Ronjini', 'Chakraborty', 'F'),	-- Tumbadd
('Mohammad', 'Samad', 'M'),			-- Tumbadd
('Anita', 'Date-Kelkar', 'F'),		-- Tumbadd
('Vera', 'Fermiga', 'F'),			-- Conjuring
('Patrick', 'Wilson', 'M'),			-- Conjuring
('Sterling', 'Jerins', 'F'),		-- Conjuring
('Farhan', 'Akhtar', 'M'),			-- Bhaag
('Japtej', 'Singh', 'M'),			-- Bhaag
('Sonam', 'Kapoor', 'F'),			-- Bhaag
('Divya', 'Dutta', 'F'),			-- Bhaag
('Aroh', 'Velankar', 'M'),			-- Rege
('Mahesh', 'Manjrekar', 'M'),		-- Rege
('Santosh', 'Juvekar', 'M'),		-- Rege
('Pushkar', 'Shrotri', 'M'),		-- Rege
('Remo', 'D''Souza', 'M'),			-- abcd
('Prabhu', 'Deva', 'M'),			-- abcd
('Kay Kay', 'Menon', 'M'),			-- abcd
('Vicky', 'Kaushal', 'M'),			-- uri
('Yami', 'Gautam', 'F'),			-- uri
('Kirti', 'Kulhari', 'F'),			-- Uri
('Dougray', 'Scott', 'M'),			-- Enigma
('Saffron', 'Burrows', 'F'),		-- Enigma
('Roberto', 'Benigni', 'M'),		-- life
('Marisa', 'Paredes', 'F'),			-- life
('Anupam', 'Kher', 'M'),			
('Vidya', 'Balan', 'F'),			
('Heather', 'Graham', 'F'),			
('Tom', 'Cruise', 'M');

SELECT * FROM dev_schema.actor;
SELECT * FROM dev_schema.movie;
SELECT * FROM dev_schema.movie_cast;

INSERT INTO dev_schema.movie_cast (fk_movie_id, fk_actor_id, role) VALUES
(1, 100, 'Lead Actor'),
(1, 101, 'Supportive Actor'),
(1, 102, 'Lead Actress'),
(1, 103, 'Supportive Actress'),
(2, 104, 'Lead Actor'),
(2, 105, 'Lead Actor'),
(2, 106, 'Lead Actor'),
(2, 107, 'Supportive Actor'),
(2, 108, 'Lead Actress'),
(2, 109, 'Lead Actress'),





