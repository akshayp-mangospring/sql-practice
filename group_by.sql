-- Query to count the number of books published by an author
-- Largest count shown first
SELECT author_fname, author_lname, COUNT(*)
FROM books
  GROUP BY author_fname
  ORDER BY COUNT(*) DESC, author_lname, author_fname;

-- Query to count the number of books released in a year.
-- Largest count shown first
SELECT release_year, COUNT(*)
FROM books
  GROUP BY release_year
  ORDER BY COUNT(*) DESC, release_year DESC;

-- Query to Sum up the number of pages written by an author
SELECT author_fname, author_lname, SUM(pages) AS 'Pages Written'
FROM books
  GROUP BY author_fname, author_lname
  ORDER BY SUM(pages) DESC;

-- Query to find the total number of pages written & the number of books written by an author
SELECT author_fname, author_lname, SUM(pages) AS 'Pages Written', COUNT(*) AS 'Books Written'
FROM books
  GROUP BY author_fname, author_lname
  ORDER BY SUM(pages) DESC, COUNT(*) DESC;
