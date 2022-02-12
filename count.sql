SELECT
  COUNT(DISTINCT author_fname) AS 'Author Count'
FROM books;

SELECT
  COUNT(DISTINCT author_fname, author_lname) AS 'Author Count'
FROM books;

SELECT COUNT(*) AS 'Book titles having `the`'
FROM books
  WHERE title LIKE '%the%';
