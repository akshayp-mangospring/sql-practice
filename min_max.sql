-- Book with Maximum Pages

-- With Subquery
SELECT title, pages FROM books
WHERE pages=(
  SELECT MAX(pages) FROM books
);
-- With Order by & Limit
SELECT title, pages FROM books
ORDER BY pages DESC
LIMIT 1;

-- Book with Minimum Pages

-- With Subquery
SELECT title, pages FROM books
WHERE pages=(
  SELECT MIN(pages) FROM books
);
-- With Order by & Limit
SELECT title, pages FROM books
ORDER BY pages
LIMIT 1;

-- First Book release by each author
SELECT
  author_fname AS 'First name',
  author_lname AS 'Last name',
  MIN(release_year) AS 'First Book Release'
FROM books
GROUP BY author_fname, author_lname
ORDER BY release_year;

-- Latest Book release by each author
SELECT
  author_fname AS 'First name',
  author_lname AS 'Last name',
  MAX(release_year) AS 'Latest Book Release'
FROM books
GROUP BY author_fname, author_lname
ORDER BY release_year DESC;

-- Longest Page Count for Each Author
SELECT
  author_fname AS 'First name',
  author_lname AS 'Last name',
  MAX(pages) AS 'Longest Book Pagecount'
FROM books
GROUP BY author_fname, author_lname
ORDER BY MAX(pages) DESC;

-- Shortest Page Count for Each Author
SELECT
  author_fname AS 'First name',
  author_lname AS 'Last name',
  MIN(pages) AS 'Shortest Book Pagecount'
FROM books
GROUP BY author_fname, author_lname
ORDER BY MIN(pages);
