CREATE TABLE table_a (
    empid INT,
    ename VARCHAR(50),
    salary INT
);

CREATE TABLE table_b (
    empid INT,
    ename VARCHAR(50),
    salary INT
);

INSERT INTO table_a (empid, ename, salary) VALUES
(1, 'AA', 1000),
(2, 'BB', 300);

INSERT INTO table_b (empid, ename, salary) VALUES
(2, 'BB', 400),
(3, 'CC', 100);


WITH CTE 
AS (SELECT * FROM table_a
UNION ALL
SELECT * FROM table_b)

SELECT 
	empid,
	ename,
	MIN(salary) OVER (partition BY ename ORDER BY empid)
FROM CTE;