-- You have to create a schema first. Since we don't want our tables to be created in default 'public' schema
CREATE SCHEMA IF NOT EXISTS dev_schema;

CREATE TABLE IF NOT EXISTS dev_schema.movie
(             
	movie_id SERIAL primary key,
	mov_title varchar(50) NOT NULL,
	mov_year int,
	mov_lang varchar(50),
	mov_dt_rel Date,
	mov_rel_country varchar(50)		
);

CREATE TABLE IF NOT EXISTS dev_schema.director
(             
	dir_id SERIAL primary key,
	dir_fname  varchar(50) NOT NULL,
	dir_lname  varchar(50)
			
);

CREATE TABLE IF NOT EXISTS dev_schema.movie_direction
(             
	    fk_dir_id int,
		fk_mov_id int
		
);

CREATE TABLE IF NOT EXISTS dev_schema.actor
(             
	actor_id INT PRIMARY KEY,
	actor_fname varchar(50) NOT NULL,
	actor_lname varchar(50),
	actor_gender varchar(1) CHECK (ACTOR_GENDER IN ('M' , 'F'))		
);
-- create sequence
CREATE SEQUENCE IF NOT EXISTS dev_schema.act_pk_auto_sequence
start 100
increment 1
NO MAXVALUE
CACHE 1
OWNED BY dev_schema.actor.actor_id;
-- use sequence for the target column
ALTER TABLE dev_schema.actor ALTER COLUMN actor_id SET DEFAULT nextval('dev_schema.act_pk_auto_sequence');

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

ALTER TABLE dev_schema.movie_cast RENAME COLUMN fk_movie_id TO fk_mov_id; 

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

CREATE TABLE IF NOT EXISTS dev_schema.genres
(             
	gen_id SERIAL primary key,
	gen_title varchar(50) NOT NULL			
);

CREATE TABLE IF NOT EXISTS dev_schema.movie_genre
(             
	fk_mov_id int,
    fk_gen_id int	
);