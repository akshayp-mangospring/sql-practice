DROP DATABASE IF EXISTS book_shop;
CREATE DATABASE book_shop;
USE book_shop;

CREATE TABLE books (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100),
  author_fname VARCHAR(100),
  author_lname VARCHAR(100),
  release_year INT,
  stock_qty INT,
  pages INT
);

INSERT INTO books (title, author_fname, author_lname, release_year, stock_qty, pages) VALUES
  ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
  ('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
  ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
  ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
  ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
  ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
  ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
  ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
  ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
  ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
  ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
  ("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
  ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
  ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
  ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
  ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

DESC books;
SELECT * FROM books;

-- String functions on standalone strings
SELECT CHAR_LENGTH('Jabroni Beating Pie Eating');
SELECT CONCAT('jAB', 'rONI');

-- String functions on Data in Tables
SELECT LCASE(title) AS 'Lowercase Title' FROM books;

SELECT
  CONCAT_WS(' ', author_fname, author_lname) AS 'Full Name'
FROM books;

SELECT
  author_fname AS 'First',
  author_lname AS 'Last',
  CONCAT_WS(' ', author_fname, author_lname) AS 'Full Name'
FROM books;

SELECT SUBSTRING(
  TRIM('      Hello, World!    '),
  1, 4
) AS 'First 4 Chars';

SELECT CONCAT(
  SUBSTR(title, 1, 10),
  '...'
) AS 'Truncated Title' FROM books;

-- Aliases used
SELECT b.title,
  CHAR_LENGTH(b.title) AS 'Title Length',
  2 + 2 AS 'Sum'
FROM books AS b
ORDER BY b.release_year DESC;

-- Palindrome in SQL
SET @palindrome_string = 'madam';
SELECT CONCAT(
  @palindrome_string, ' ', REVERSE(@palindrome_string)
) AS 'Palindrome';

INSERT INTO books (title, author_fname, author_lname, release_year, stock_qty, pages) VALUES
  ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
  ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
  ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

-- Latest 5 books released
SELECT title, release_year FROM books ORDER BY release_year DESC LIMIT 5;

-- Latest 15 books released with alphabetically descending titles
SELECT
  title, release_year FROM books
  ORDER BY release_year DESC, title DESC
LIMIT 15;

SELECT
  title,
  CONCAT_WS(' ', author_fname, author_lname) AS author
FROM books
  WHERE
    author_fname LIKE '%d%v%' AND
    title LIKE 'a%'
  ORDER BY title
LIMIT 5;

SELECT title FROM books
  WHERE title LIKE '%the%';

SELECT
  title,
  CONCAT_WS(' ', author_fname, author_lname) AS author
FROM books
  WHERE author_fname LIKE '%d_v%';

-- Match special character %
SELECT
  title,
  CONCAT_WS(' ', author_fname, author_lname) AS author
FROM books
  WHERE title LIKE '%\%%';

SELECT
  title,
  CONCAT_WS(' ', author_fname, author_lname) AS author
FROM books
  WHERE title LIKE '10\%%';
