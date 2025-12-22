CREATE TABLE Persons (
	id INT PRIMARY KEY,
	name VARCHAR(50),
	age INT,
	email VARCHAR(100)
);
INSERT INTO Persons (id, name, age, email) VALUES
(1, 'Rajesh', 28, 'rajesh@gmail.com'),
(2, 'Priya', 25, 'priya@gmail.com'),
(3, 'Suresh', 30, 'rajesh@gmail.com'),
(4, 'Anjali', 24, 'priya@gmail.com');


SELECT id, name, age, coalesce(np.email, 'Duplicate')
FROM Persons p
LEFT JOIN (SELECT MIN(id) as mid, email FROM Persons GROUP BY email) AS np
ON p.id = np.mid;