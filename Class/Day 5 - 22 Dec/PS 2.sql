DROP TABLE customers;
CREATE TABLE customers (
    id INT PRIMARY KEY,
    email VARCHAR(100)
);

INSERT INTO customers (id, email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com'),
(4, 'bob@example.com'),
(5, 'customers@example.com'),
(6, 'email@example.com'),
(7, 'customers@example.com'),
(8, 'id@example.com');

SELECT * FROM customers;


WITH CTE1 AS (
SELECT 
	id,
	email,
	RANK() OVER (PARTITION BY email ORDER BY id) AS og
FROM customers
)

SELECT id, email
FROM CTE1
WHERE og > 1
ORDER BY id;