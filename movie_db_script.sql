CREATE SCHEMA IF NOT EXISTS dev_schema;

CREATE TABLE IF NOT EXISTS dev_schema.movie
(
	mov_id SERIAL primary key,
	mov_title VARCHAR(50) NOT NULL,
	mov_year INT,
	mov_lang VARCHAR(50),
	mov_dt_rel date
);

CREATE TABLE IF NOT EXISTS dev_schema.director
(
	dir_id SERIAL primary key,
	dir_fname VARCHAR(50) NOT NULL,
	dir_lname VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS dev_schema.movie_direction
(
	mov_dir_id SERIAL primary key,
	fk_mov_id INT,
	fk_dir_id INT,
	CONSTRAINT fk_movie
     foreign key (fk_mov_id) 
     REFERENCES dev_schema.movie(mov_id),
	CONSTRAINT fk_director
     foreign key (fk_dir_id) 
     REFERENCES dev_schema.director(dir_id)
);


INSERT INTO dev_schema.movie VALUES
('Shwaas', 2004, 'Marathi', '01/01/2004'),
('Ashi hi Banvabanvi', 1986, 'Marathi', '01/01/1986'),
('Sense and sensebility', 1995, 'English', '01/01/1995'),
('The ninth gate', 1999, 'English', '01/01/1999'),
('Eternal sunshine of the spotless mind', 2004, 'English', '01/01/2004'),
('Meet Joe Black', 1998, 'English', '01/01/1998'),
('Talaash', 2010, 'Hindi', '01/01/2010'),
('Ab tak chhappan', 1999, 'Hindi', '01/01/1999'),
('Hera Pheri', 2003, 'Hindi', '01/01/2003');

INSERT INTO dev_schema.director VALUES
('Sandeep', 'Sawant'),
('Sachin', 'Pilgaonkar'),
('Ang', 'Ang'),
('Roman', 'Polanski'),
('Michel', 'Gondry'),
('Martin', 'Brest'),
('Reema', 'Kagti'),
('Shimit', 'Amin'),
('Priyadarshan', 'Das');
