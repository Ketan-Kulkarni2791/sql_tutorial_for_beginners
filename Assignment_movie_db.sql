-- You have to create a schema first. Since we don't our tables to be created in default 'public' schema
CREATE SCHEMA dev_schema;

CREATE TABLE dev_schema.movie
(             
	movie_id SERIAL primary key,
	mov_title varchar(50) NOT NULL,
	mov_year int,
	mov_lang varchar(50),
	mov_dt_rel Date,
	mov_rel_country varchar(50)		
);

CREATE TABLE dev_schema.director
(             
	dir_id SERIAL primary key,
	dir_fname  varchar(50) NOT NULL,
	dir_lname  varchar(50)
			
);

CREATE TABLE dev_schema.movie_direction
(             
	    fk_dir_id int,
		fk_mov_id int
		
);

CREATE TABLE dev_schema.movie_Actor
(             
	actor_id SERIAL primary key,
	actor_fname varchar(50) NOT NULL,
	actor_lname varchar(50),
	actor_gender varchar(1) CHECK (ACTOR_GENDER IN ('M' , 'F'))		
);

CREATE TABLE dev_schema.movie_cast
(
	fk_actor_id int,
	fk_movie_id int,
	role varchar(30) NOT NULL
);

CREATE TABLE dev_schema.reviewer
(             
	     rev_id SERIAL primary key,
	     rev_name varchar(50) NOT NULL
);

CREATE TABLE dev_schema.rating
(             
	fk_mov_id int,
    fk_rev_id int,
	rev_stars int CHECK (rev_stars >=0 AND rev_stars <=5) NOT NULL,
    num_of_rev int CHECK(num_of_rev>0) NOT NULL
);

CREATE TABLE dev_schema.genres
(             
	gen_id SERIAL primary key,
	gen_title varchar(50) NOT NULL			
);

CREATE TABLE dev_schema.movie_genre
(             
	fk_mov_id int,
    fk_gen_id int	
);