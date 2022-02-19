-- Show all ratings of all series
SELECT s.title, r.rating
FROM series AS s INNER JOIN reviews AS r
ON s.id=r.series_id;

-- Show average ratings of all series
SELECT s.title, AVG(r.rating) AS avg_rating
FROM series AS s INNER JOIN reviews AS r
ON s.id=r.series_id
GROUP BY s.id
ORDER BY avg_rating;

-- Show top 3 highest rated shows, along with their ratings
SELECT s.title, AVG(r.rating) AS avg_rating
FROM series AS s INNER JOIN reviews AS r
ON s.id=r.series_id
GROUP BY s.id
ORDER BY avg_rating DESC
LIMIT 3;

-- Show every rating given by a reviewer
SELECT rr.first_name, rr.last_name, re.rating
FROM reviewers AS rr INNER JOIN reviews AS re
ON rr.id=re.reviewer_id;

-- Show all the series which don't have any reviews
SELECT title AS 'unreviewed_series'
FROM series AS s LEFT JOIN reviews AS r
ON s.id=r.series_id
WHERE r.rating IS NULL;

-- Show average ratings of genres
SELECT
  s.genre,
  ROUND(
    AVG(r.rating), 2
  )
  AS avg_rating
FROM series AS s INNER JOIN reviews AS r
ON s.id=r.series_id
GROUP BY s.genre
ORDER BY avg_rating DESC;

-- Analytics/Stats for each reviewer & his ratings, show 'SUPER ACTIVE' users first
SELECT
  first_name,
  last_name,
  COUNT(re.rating) AS COUNT,
  IFNULL(MIN(re.rating), 0) AS MIN,
  IFNULL(MAX(re.rating), 0) AS MAX,
  ROUND(
    IFNULL(AVG(re.rating), 0), 2
  ) AS AVG,
  CASE
    WHEN COUNT(re.rating) >= 10 THEN 'SUPER ACTIVE'
    WHEN COUNT(re.rating) > 0 THEN 'ACTIVE'
    ELSE 'INACTIVE'
  END AS STATUS
FROM reviewers AS rr LEFT JOIN reviews AS re
ON rr.id=re.reviewer_id
GROUP BY rr.id
ORDER BY COUNT DESC, AVG DESC;

-- Multiple Table Joins
-- Select the rating of each show given by each reviewer
SELECT
  s.title,
  re.rating,
  CONCAT_WS(' ', rr.first_name, rr.last_name) AS reviewer
FROM series AS s INNER JOIN reviews AS re
ON s.id=re.series_id
INNER JOIN reviewers AS rr
ON rr.id=re.reviewer_id
ORDER BY s.title;
