-- Display email according to order date
SELECT o.order_date, c.email
FROM customers AS c INNER JOIN orders AS o
ON c.id = o.customer_id;

-- Get orders from Boy George
-- Using Subquery
SELECT *
FROM orders
WHERE customer_id=(
  SELECT id
  FROM customers
  WHERE first_name='Boy' AND last_name='George'
);

-- Using Join
-- It's considered bad practice to use aliases only when necessary.
-- We should use them consistently in the entire query

-- Bad Practice
SELECT
  o.id,
  order_date,
  amount,
  CONCAT_WS(' ', c.first_name, c.last_name) AS 'Name'
FROM orders AS o INNER JOIN customers AS c
ON c.id = o.customer_id
WHERE c.first_name='Boy' AND c.last_name='George';

-- Good practice
SELECT
  o.id,
  o.order_date,
  o.amount,
  CONCAT_WS(' ', c.first_name, c.last_name) AS 'Name'
FROM orders AS o INNER JOIN customers AS c
ON c.id = o.customer_id
WHERE c.first_name='Boy' AND c.last_name='George';

-- Get names of customers next to their orders
SELECT
  o.id,
  o.order_date,
  o.amount,
  CONCAT_WS(' ', c.first_name, c.last_name) AS 'Name'
FROM orders AS o INNER JOIN customers AS c
ON c.id = o.customer_id;

-- Get order count from George
SELECT c.first_name, COUNT(*) AS 'Total Orders'
FROM customers AS c INNER JOIN orders AS o
ON c.id = o.customer_id
WHERE c.first_name='George';

-- Get Order count of each customer
SELECT
  CONCAT_WS(' ', c.first_name, c.last_name) AS 'Name',
  COUNT(*) AS 'Total Orders'
FROM customers AS c INNER JOIN orders AS o
ON c.id = o.customer_id
GROUP BY o.customer_id;

-- Get the amount on all orders on each customer
SELECT
  CONCAT_WS(' ', c.first_name, c.last_name) AS 'Name',
  SUM(o.amount) AS 'Total Amount'
FROM customers AS c INNER JOIN orders AS o
ON c.id = o.customer_id
GROUP BY o.customer_id;
