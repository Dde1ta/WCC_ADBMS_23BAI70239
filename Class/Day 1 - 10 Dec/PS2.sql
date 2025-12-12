CREATE TABLE customers(
	C_id int PRIMARY KEY,
	C_name varchar(30) NOT NULL
);

DROP Table ORDERS;

CREATE TABLE orders (
	O_id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	O_amount int DEFAULT 0,
	C_id int DEFAULT 0 NOT NULL REFERENCES customers(C_ID) ON DELETE CASCADE
);

INSERT INTO customers(c_id, c_name) VALUES
(0, 'Dummy Customer'),
(1, 'Divyansh'),
(2, 'Karan'),
(3, 'Jaya'),
(4, 'Shub');

-- Testing invaild insert

INSERT INTO orders(O_id, C_id) VALUES (-1, NULL);

-- Inserting Values

INSERT INTO orders(O_amount, C_id) VALUES 
(123323, 1),
(2323, 2),
(23, 3),
(4440, 4),
(22, 2),
(1334, 2),
(443, 1),
(442, 1),
(234342, 4);

-- CASCADING DELETE

DELETE FROM customers WHERE c_id = 2;

select * from ORDERS;