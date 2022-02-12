SELECT title FROM books
  WHERE title LIKE '%stories%';

SELECT title, pages FROM books
  ORDER BY pages DESC LIMIT 1;

SELECT
  CONCAT_WS(' - ', title, release_year) AS summary
FROM books
  ORDER BY release_year DESC
  LIMIT 3;

SELECT
  title, author_lname
FROM books
  WHERE author_lname LIKE '% %';

SELECT
  title, release_year, stock_qty
FROM books
  ORDER BY stock_qty
LIMIT 3;

SELECT title, author_lname FROM books
  ORDER BY author_lname, title;

SELECT
  UPPER(
    CONCAT('My favorite author is ', author_fname, ' ', author_lname, '!')
  ) AS yell
FROM books
  ORDER BY author_lname;
