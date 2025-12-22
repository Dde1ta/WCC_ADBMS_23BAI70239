CREATE TABLE Triangle (
	x INT,
	y INT,
	z INT,
	PRIMARY KEY (x, y, z)
);
 
-- Insert sample data
INSERT INTO Triangle (x, y, z) VALUES
(13, 15, 10),
(10, 20, 44);

SELECT X, Y, Z,
	CASE 
		WHEN X > Y AND X > Z THEN
			CASE 
				WHEN y + z > X THEN 'YES' ELSE 'NO'
			END
		WHEN Y > Z AND Y > X THEN
			CASE 
				WHEN x + z > Y THEN 'YES' ELSE 'NO'
			END
		WHEN Z > Y AND Z > X THEN
			CASE 
				WHEN y + X > Z THEN 'YES' ELSE 'NO'
			END
	END AS is_triange_possible
FROM triangle
