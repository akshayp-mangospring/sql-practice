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
