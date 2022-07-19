-- Define the structure of your database, here.
DROP TABLE IF EXISTS recipes;

--Define your schema here:

CREATE TABLE recipes (
  id serial,
  title VARCHAR(255) NOT NULL
);

CREATE TABLE comments (
  id serial,
  comment VARCHAR(255) NOT NULL
);