-- You have to create a schema first. Since we don't want our tables to be created in default 'public' schema
CREATE SCHEMA IF NOT EXISTS dev_schema;

-- DROP TABLE dev_schema.movie_direction;
-- DROP TABLE dev_schema.movie;
-- DROP TABLE dev_schema.director;
-- DROP TABLE dev_schema.movie_cast;
-- DROP TABLE dev_schema.actor;
-- DROP TABLE dev_schema.movie_genre;
-- DROP TABLE dev_schema.genre;
-- DROP TABLE dev_schema.reviewer;

CREATE TABLE IF NOT EXISTS dev_schema.movie
(             
	movie_id SERIAL primary key,
	mov_title varchar(50) NOT NULL,
	mov_year int,
	mov_lang varchar(50),
	mov_dt_rel Date,
	mov_rel_country varchar(50)		
);

-- DROP TABLE dev_schema.movie;

CREATE TABLE IF NOT EXISTS dev_schema.director
(             
	dir_id SERIAL primary key,
	dir_fname  varchar(50) NOT NULL,
	dir_lname  varchar(50)
			
);

-- DROP TABLE dev_schema.director;

-- Create sequence for movie_direction table
CREATE SEQUENCE IF NOT EXISTS dev_schema.movie_direction_pk_auto_seq;
SELECT setval('dev_schema.movie_direction_pk_auto_seq', 10);
CREATE TABLE IF NOT EXISTS dev_schema.movie_direction
(  
		movie_direction_id text primary key DEFAULT 'MV_DIR_' || nextval('dev_schema.movie_direction_pk_auto_seq'),
	    fk_dir_id int,
		fk_mov_id int,
		CONSTRAINT fk_dir
		 foreign key (fk_dir_id) 
		 REFERENCES dev_schema.director(dir_id),
		CONSTRAINT fk_movie
		 foreign key (fk_mov_id) 
		 REFERENCES dev_schema.movie(movie_id)
		
);

-- DROP TABLE dev_schema.movie_direction;

CREATE TABLE IF NOT EXISTS dev_schema.actor
(             
	actor_id INT PRIMARY KEY,
	actor_fname varchar(50) NOT NULL,
	actor_lname varchar(50),
	actor_gender varchar(1) CHECK (ACTOR_GENDER IN ('M' , 'F'))		
);

-- DROP TABLE dev_schema.actor;

-- create sequence
CREATE SEQUENCE IF NOT EXISTS dev_schema.act_pk_auto_sequence
start 100
increment 1
NO MAXVALUE
CACHE 1
OWNED BY dev_schema.actor.actor_id;
-- use sequence for the target column
ALTER TABLE dev_schema.actor ALTER COLUMN actor_id SET DEFAULT nextval('dev_schema.act_pk_auto_sequence');

-- DROP TABLE dev_schema.movie_cast;

-- Create sequence for movie_cast table
CREATE SEQUENCE IF NOT EXISTS dev_schema.movie_cast_pk_auto_seq;
SELECT setval('dev_schema.movie_cast_pk_auto_seq', 100);
-- Create movie_cast table
CREATE TABLE IF NOT EXISTS dev_schema.movie_cast
(
	movie_cast_id text primary key DEFAULT 'MV_CAST_' || nextval('dev_schema.movie_cast_pk_auto_seq'),
	fk_actor_id int,
	fk_movie_id int,
	role varchar(30) NOT NULL
);

-- ALTER TABLE dev_schema.movie_cast RENAME COLUMN fk_movie_id TO fk_mov_id; 
-- DROP TABLE dev_schema.genre;

-- Create sequence for genre table
CREATE SEQUENCE IF NOT EXISTS dev_schema.genre_pk_auto_seq;
SELECT setval('dev_schema.genre_pk_auto_seq', 10);
CREATE TABLE IF NOT EXISTS dev_schema.genre
(             
	gen_id text primary key DEFAULT 'GENRE_' || nextval('dev_schema.genre_pk_auto_seq'),
	gen_title varchar(50) NOT NULL			
);

SELECT * FROM dev_schema.genre;
-- DROP TABLE dev_schema.movie_genre;

-- Create sequence for movie_genre table
CREATE SEQUENCE IF NOT EXISTS dev_schema.mov_genre_pk_auto_seq;
SELECT setval('dev_schema.mov_genre_pk_auto_seq', 100);
CREATE TABLE IF NOT EXISTS dev_schema.movie_genre
( 
	mov_gen_id text primary key DEFAULT 'MOV_GENRE_' || nextval('dev_schema.mov_genre_pk_auto_seq'),
	fk_gen_id text,	
	fk_mov_id int
);

SELECT * FROM dev_schema.movie;
SELECT * FROM dev_schema.movie_genre;

CREATE TABLE IF NOT EXISTS dev_schema.reviewer
(             
	     rev_id SERIAL primary key,
	     rev_name varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS dev_schema.rating
(             
	fk_mov_id int,
    fk_rev_id int,
	rev_stars int CHECK (rev_stars >=0 AND rev_stars <=5) NOT NULL,
    num_of_rev int CHECK(num_of_rev>0) NOT NULL
);