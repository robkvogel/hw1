-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint #1: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
--   Hint #2: Do NOT name one of your models/tables “cast” or “casts”; this 
--   is a reserved word in sqlite and will break your database! Instead, 
--   think of a better word to describe this concept; i.e. the relationship 
--   between an actor and the movie in which they play a part.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers ON

-- Drop existing tables, so you'll start fresh each time this script is run.
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS performances;
DROP TABLE IF EXISTS studios;

--Add other tables as they are created/ dropped


-- Create new tables, according to your domain model

CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year INTERGER,
  rating TEXT,
  studio_id INTEGER
);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT,
  last_name TEXT
);

CREATE TABLE performances (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_id INTERGER,
  actor_id INTERGER,
  character_name TEXT
);

CREATE TABLE studios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  studio_name TEXT
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary

--Add Movie Data

INSERT INTO movies (
    title,
    year,
    rating,
    studio_id
)
VALUES (
    "Batman Begins",
    "2005",
    "PG-13",
    1
);

INSERT INTO movies (
    title,
    year,
    rating,
    studio_id
)
VALUES (
    "The Dark Knight",
    "2008",
    "PG-13",
    1
);

INSERT INTO movies (
    title,
    year,
    rating,
    studio_id
)
VALUES (
    "The Dark Knight Rises",
    "2012",
    "PG-13",
    1
);

-- Add Actor Data
INSERT INTO actors (
    first_name,
    last_name
)
VALUES (
    "Christian",
    "Bale"
);

INSERT INTO actors (
    first_name,
    last_name
)
VALUES (
    "Michael",
    "Caine"
);

INSERT INTO actors (
    first_name,
    last_name
)
VALUES (
    "Liam",
    "Neeson"
);

INSERT INTO actors (
    first_name,
    last_name
)
VALUES (
    "Katie",
    "Holmes"
);

INSERT INTO actors (
    first_name,
    last_name
)
VALUES (
    "Gary",
    "Oldman"
);

INSERT INTO actors (
    first_name,
    last_name
)
VALUES (
    "Heath",
    "Ledger"
);

INSERT INTO actors (
    first_name,
    last_name
)
VALUES (
    "Aaron",
    "Eckhart"
);

INSERT INTO actors (
    first_name,
    last_name
)
VALUES (
    "Maggie",
    "Gyllenhaal"
);

INSERT INTO actors (
    first_name,
    last_name
)
VALUES (
    "Tom",
    "Hardy"
);

INSERT INTO actors (
    first_name,
    last_name
)
VALUES (
    "Joseph",
    "Gordon-Levitt"
);

INSERT INTO actors (
    first_name,
    last_name
)
VALUES (
    "Anne",
    "Hathaway"
);

-- Add Performance Data

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    1,
    1,
    "Bruce Wayne"
);

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    1,
    2,
    "Alfred"
);

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    1,
    3,
    "Ra's Al Ghul"
);

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    1,
    4,
    "Rachel Dawes"
);

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    1,
    5,
    "Commissioner Gordon"
);

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    2,
    1,
    "Bruce Wayne"
);

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    2,
    6,
    "Joker"
);

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    2,
    7,
    "Harvey Dent"
);

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    2,
    2,
    "Alfred"
);

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    2,
    8,
    "Rachel Dawes"
);

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    3,
    1,
    "Bruce Wayne"
);

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    3,
    5,
    "Commissioner Gordon"
);

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    3,
    9,
    "Bane"
);

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    3,
    10,
    "John Blake"
);

INSERT INTO performances (
    movie_id,
    actor_id,
    character_name
)
VALUES (
    3,
    11,
    "Selina Kyle"
);

-- Add Studio Data
INSERT INTO studios (
    studio_name
)
VALUES (
    "Warner Bros."
);


--Commands that print tables for sanity checks (should be suppressed later)
.print ""
.print "All Movies"
.print "======"
.print ""
SELECT * from movies;

.print ""
.print "All Actors"
.print "======"
.print ""
SELECT * from actors;

.print ""
.print "All Performances"
.print "======"
.print ""
SELECT * from performances;

.print ""
.print "All Studios"
.print "======"
.print ""
SELECT * from studios;

-- Prints a header for the movies output
.print ""
.print "Movies [Output for HW]"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!

-- Prints a header for the cast output
.print ""
.print "Top Cast [Output for HW]"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!
