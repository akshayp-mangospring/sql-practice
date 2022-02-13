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
