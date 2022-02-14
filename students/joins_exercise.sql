-- List grades in descending order for all papers & their students
SELECT
  s.first_name,
  p.title,
  p.grade
FROM students AS s INNER JOIN papers AS p
ON s.id = p.student_id
ORDER BY p.grade DESC;

-- List out all the students & their paper's title, along with grades
SELECT
  s.first_name,
  p.title,
  p.grade
FROM students AS s LEFT JOIN papers AS p
ON s.id = p.student_id;

-- List out all the students & their paper's title, along with grades with default values
SELECT
  s.first_name,
  IFNULL(p.title, UCASE('Missing')) AS title,
  IFNULL(p.grade, 0) AS grade
FROM students AS s LEFT JOIN papers AS p
ON s.id = p.student_id;

-- Average grade for each student
SELECT
  s.first_name,
  IFNULL(AVG(p.grade), 0) AS average
FROM students AS s LEFT JOIN papers AS p
ON s.id = p.student_id
GROUP BY s.id
ORDER BY average DESC;

-- Check if a student has passed or failed.
-- Passing average - 75
SELECT
  s.first_name,
  IFNULL(AVG(p.grade), 0) AS average,
  UCASE(
    IF(AVG(p.grade) > 74, 'Passing', 'Failing')
  ) AS passing_status
FROM students AS s LEFT JOIN papers AS p
ON s.id = p.student_id
GROUP BY s.id
ORDER BY average DESC;
