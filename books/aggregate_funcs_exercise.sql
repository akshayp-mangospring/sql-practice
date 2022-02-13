-- Total Number of Books in DB
-- Using Sum & Count
SELECT SUM(b.Count) AS 'Total Books'
FROM (
  SELECT COUNT(*) AS 'Count'
  FROM books
  GROUP BY author_fname, author_lname
) AS b;

-- Simple approach of Count
SELECT COUNT(*) AS 'Total Books'
FROM books;

-- How many books were released in each year
SELECT
  release_year,
  COUNT(*) AS 'Book Release Count'
FROM books
GROUP BY release_year;

-- Total number of Books in Stock
SELECT SUM(stock_qty) AS 'Books in Stock'
FROM books;

-- Find the Average release_year for each Author
SELECT
  author_fname AS 'First Name',
  author_lname AS 'Last Name',
  AVG(release_year) AS avg_release_year
FROM books
GROUP BY author_fname, author_lname
ORDER BY avg_release_year;

-- Full name of the Author who wrote the longest book
SELECT
  CONCAT_WS(' ', author_fname, author_lname) AS 'Author',
  pages
FROM books
ORDER BY pages DESC
LIMIT 1;

-- Average number of pages in a year, Number of books in a year
SELECT
  release_year AS 'year',
  COUNT(*) AS '# books',
  AVG(pages) AS 'avg pages'
FROM books
GROUP BY release_year;
