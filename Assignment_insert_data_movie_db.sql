SELECT * FROM dev_schema.movie;
SELECT * FROM dev_schema.director;
SELECT * FROM dev_schema.movie_direction;

INSERT INTO dev_schema.movie (mov_title, mov_year, mov_lang, mov_dt_rel, mov_rel_country) VALUES
('Mad Max fury road', 2015, 'English', '2015-09-12', 'USA'),
('The theory of everything', 2014, 'English', '2014-10-19', 'UK'),
('Lokmanya', 2021, 'Marathi', '2021-11-20', 'India'),
('The Hanuman returns', 2018, 'Hindi', '2018-12-12', 'India'),
('GI Joe retiliation', 2012, 'English', '2012-09-30', 'USA'),
('Tumbadd', 2019, 'Hindi', '2019-06-10', 'India'),
('Conjuring', 2011, 'English', '2011-05-30', 'USA'),
('Bhaag Milkha bhaag', 2010, 'Hindi', '2010-09-30', 'India'),
('Rege', 2009, 'Marathi', '2009-04-14', 'India'),
('ABCD', 2013, 'Hindi', '2013-09-30', 'India'),
('Uri', 2019, 'Hindi', '2019-09-30', 'India'),
('Enigma', 2001, 'English', '2001-09-30', 'UK'),
('Life is beautiful', 1997, 'English', '1997-09-20', 'Poland'),
('Shwaas', 2004, 'Marathi', '2004-01-12', 'India'),
('Ashi hi banavabanavi', 1988, 'Marathi', '1988-06-25', 'India'),
('Sense and sensebility', 1995, 'English', '1995-06-15', 'UK'),
('The ninth gate', 1999, 'English', '1999-06-09', 'USA'),
('The eternal sunshine of the spotless mind', 2004, 'English', '2004-04-25', 'USA'),
('Meet Joe Black', 1998, 'English', '1998-12-12', 'USA'),
('Talaash', 2012, 'Hindi', '2012-08-11', 'India'),
('Ab tak chhappan', 2004, 'Hindi', '2004-11-11', 'India'),
('Hera pheri', 2000, 'Hindi', '2000-03-18', 'India');

SELECT * FROM dev_schema.movie;
SELECT * FROM dev_schema.director;

INSERT INTO dev_schema.director (dir_fname, dir_lname) VALUES
('George', 'Miller'), ('James', 'Marsh'), ('Om', 'Raut'),
('Anurag', 'Kashyap'), ('Jon M.', 'Chu'), ('Rahi Anil', 'Barve'),
('Anand', 'Gandhi'), ('James', 'Wan'), ('Rakeysh Omprakash', 'Mehra'),
('Abhijit', 'Panse'), ('Remo', 'D''Souza'), ('Aditya', 'Dhar'),
('Michael', 'Apted'), ('Roberto', 'Benigni'), ('Sandeep', 'Sawant'), ('Sachin', 'Pilgaonkar'),
('Ang', 'Lee'), ('Roman', 'Polanski'), ('Michel', 'Gondry'), ('Reema', 'Kagti'), ('Shimit', 'Amin');

INSERT INTO dev_schema.movie_direction (fk_mov_id, fk_dir_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (6, 7), (7, 8), (8, 9), (9, 10), (10, 11), 
(11, 12), (12, 13), (13, 14),
(14, 15), (15, 16), (16, 17), (17, 18), (18, 19), (19, 20), (20, 21);

SELECT * FROM dev_schema.actor;

INSERT INTO dev_schema.actor (actor_fname, actor_lname, actor_gender) VALUES
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
('Lillian', 'Carlson', 'F'),		-- G I
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
('Tom', 'Cruise', 'M'),
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
('Tabu', '', 'F');					-- hera pheri

SELECT * FROM dev_schema.actor;
SELECT * FROM dev_schema.movie;
SELECT * FROM dev_schema.movie_cast;

INSERT INTO dev_schema.movie_cast (fk_movie_id, fk_actor_id, role) VALUES
(1, 100, 'Lead Actor'),
(1, 101, 'Supportive Actor'),
(1, 102, 'Lead Actress'),
(1, 103, 'Supportive Actress'),
(3, 104, 'Lead Actor'),
(3, 105, 'Lead Actor'),
(3, 106, 'Lead Actor'),
(3, 107, 'Supportive Actor'),
(4, 108, 'Lead Actor'),
(4, 109, 'Supportive Actor'),
(5, 110, 'Lead Actress'),
(5, 111, 'Lead Actor'),
(5, 112, 'Supportive Actress'),
(5, 113, 'Supportive Actor'),
(5, 114, 'Supportive Actor'),
(6, 115, 'Lead Actor'),
(6, 116, 'Supportive Actress'),
(6, 117, 'Supportive Actress'),
(6, 118, 'Lead Actor'),
(6, 119, 'Supportive Actress'),
(7, 120, 'Lead Actress'),
(7, 121, 'Lead Actor'),
(7, 122, 'Supportive Actress'),
(8, 123, 'Lead Actor'),
(8, 124, 'Supportive Actor'),
(8, 125, 'Supportive Actress'),
(8, 126, 'Supportive Actress'),
(9, 127, 'Lead Actor'),
(9, 128, 'Lead Actor'),
(9, 129, 'Supportive Actor'),
(9, 130, 'Supportive Actor'),
(10, 131, 'Supportive Actor'),
(10, 132, 'Lead Actor'),
(10, 133, 'Supportive Actor'),
(11, 134, 'Lead Actor'),
(11, 135, 'Supportive Actress'),
(11, 136, 'Supportive Actress'),
(12, 137, 'Lead Actor'),
(12, 138, 'Supportive Actress'),
(12, 157, 'Lead Actress'),
(13, 139, 'Lead Actor'),
(13, 140, 'Lead Actress'),
(14, 145, 'Lead Actor'),
(14, 146, 'Supportive Actor'),
(14, 147, 'Supportive Actress'),
(14, 148, 'Supportive Actress'),
(15, 149, 'Lead Actor'),
(15, 150, 'Lead Actor'),
(15, 151, 'Lead Actor'),
(15, 152, 'Supportive Actor'),
(15, 153, 'Lead Actress'),
(15, 154, 'Lead Actress'),
(16, 155, 'Lead Actress'),
(16, 156, 'Supportive Actor'),
(16, 157, 'Supportive Actress'),
(16, 158, 'Supportive Actor'),
(17, 159, 'Lead Actor'),
(17, 160, 'Supportive Actress'),
(17, 161, 'Supportive Actress'),
(17, 162, 'Supportive Actor'),
(18, 163, 'Lead Actor'),
(18, 164, 'Supportive Actor'),
(18, 165, 'Supportive Actress'),
(18, 157, 'Lead Actress'),
(19, 166, 'Lead Actor'),
(19, 167, 'Lead Actress'),
(19, 168, 'Supportive Actor'),
(19, 169, 'Supportive Actor'),
(20, 170, 'Lead Actor'),
(20, 171, 'Lead Actress'),
(20, 172, 'Supportive Actress'),
(20, 173, 'Supportive Actor'),
(20, 174, 'Supportive Actor'),
(20, 175, 'Supportive Actress'),
(21, 176, 'Lead Actor'),
(21, 177, 'Lead Actor'),
(21, 178, 'Lead Actress'),
(21, 179, 'Supportive Actor'),
(21, 180, 'Supportive Actress'),
(21, 181, 'Supportive Actor'),
(22, 182, 'Lead Actor'),
(22, 183, 'Lead Actor'),
(22, 184, 'Lead Actor'),
(22, 185, 'Supportive Actress');

SELECT * FROM dev_schema.movie;
SELECT * FROM dev_schema.genre;
SELECT * FROM dev_schema.movie_genre;

-- DELETE FROM dev_schema.movie

INSERT INTO dev_schema.genre (gen_title) VALUES
('Action'), ('Adventure'), ('Animation'), ('Biography'), ('Comedy'), ('Crime'), ('Drama'),
('Horror'), ('Music'), ('Mystery'), ('Romance'), ('Thriller'), ('War');

INSERT INTO dev_schema.movie_genre (fk_mov_id, fk_gen_id) VALUES
(1, 'GENRE_11'), (2, 'GENRE_14'), (3, 'GENRE_14'), (4, 'GENRE_13'), (5, 'GENRE_11'), (6, 'GENRE_20'), (7, 'GENRE_18'), (8, 'GENRE_14'), 
(9, 'GENRE_16'), (10, 'GENRE_19'), (11, 'GENRE_23'), (12, 'GENRE_23'),
(13, 'GENRE_17'), (14, 'GENRE_17'), (15, 'GENRE_15'), (16, 'GENRE_21'), (17, 'GENRE_20'), (18, 'GENRE_21'), (19, 'GENRE_22'), 
(20, 'GENRE_22'), (21, 'GENRE_16'), (22, 'GENRE_15');


SELECT * FROM dev_schema.movie;
SELECT * FROM dev_schema.reviewer;
SELECT * FROM dev_schema.rating;

INSERT INTO dev_schema.reviewer (rev_name) VALUES
('The Gaurdian'), ('Imdb'), ('Deadline'), ('Reddit'), ('India Times'), ('BookMyShow');







