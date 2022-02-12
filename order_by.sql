-- Latest 5 books released
SELECT title, release_year FROM books ORDER BY release_year DESC LIMIT 5;

-- Latest 15 books released with alphabetically descending titles
SELECT
  title, release_year FROM books
  ORDER BY release_year DESC, title DESC
LIMIT 15;
