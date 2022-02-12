SELECT
  UPPER(
    REVERSE('Why does my cat look at me with such hatred?')
  ) AS 'Upper Reversed';

-- I-like-cats

SELECT
  REPLACE(title, ' ', '->') AS title
FROM books;

SELECT
  author_lname AS forwards,
  REVERSE(author_lname) AS backwards
FROM books;

SELECT
  UPPER(
    CONCAT_WS(' ', author_fname, author_lname)
  ) AS 'full name in caps'
FROM books;

SELECT
  CONCAT_WS(' ', title, 'was released in', release_year) AS blurb
FROM books;

SELECT
  title,
  CHAR_LENGTH(title) AS 'character count'
FROM books;

SELECT
  CONCAT(SUBSTR(title, 1, 10), '...') AS short_title,
  CONCAT_WS(',', author_lname, author_fname) AS author,
  CONCAT(stock_qty, ' in stock') AS quantity
FROM books;
