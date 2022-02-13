-- Find out amount spent by All customers in Descending order - Highest spenders first
SELECT
  c.first_name,
  c.last_name,
  IFNULL(o.order_date, 'Unordered'),
  IFNULL(SUM(o.amount), 0) AS total_spent
FROM customers AS c LEFT JOIN orders AS o
ON c.id=o.customer_id
GROUP BY c.id
ORDER BY total_spent DESC;

-- Find people whose total expenditure is NULL
SELECT
  c.first_name,
  c.last_name,
  SUM(o.amount) as total_spent
FROM customers AS c LEFT JOIN orders AS o
ON c.id=o.customer_id
GROUP BY c.id
ORDER BY total_spent, c.first_name, c.last_name;

-- Find people whose expenditure is NULL
SELECT
  c.first_name,
  c.last_name
FROM customers AS c LEFT JOIN orders AS o
ON c.id=o.customer_id
WHERE o.amount IS NULL
GROUP BY c.id;

-- Find people whose expenditure is NOT NULL
SELECT
  c.first_name,
  c.last_name
FROM customers AS c LEFT JOIN orders AS o
ON c.id=o.customer_id
WHERE o.amount IS NOT NULL
GROUP BY c.id;

-- Find sum of customers whose expenditure is NOT NULL
SELECT
  c.first_name,
  c.last_name,
  SUM(o.amount) as total_spent
FROM customers AS c LEFT JOIN orders AS o
ON c.id=o.customer_id
WHERE o.amount IS NOT NULL
GROUP BY c.id
ORDER BY total_spent DESC;
