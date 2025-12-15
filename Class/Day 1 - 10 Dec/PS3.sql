CREATE TABLE Person(
 id int PRIMARY KEY,
 email varchar(100) NOT NULL
)

INSERT INTO Person (id, email) VALUES (1, 'john@example.com');
INSERT INTO Person (id, email) VALUES (2, 'bob@example.com');
INSERT INTO Person (id, email) VALUES (3, 'john@example.com');
INSERT INTO Person (id, email) VALUES (4, 'alice@example.com');
INSERT INTO Person (id, email) VALUES (5, 'john@example.com');

select * from person;

DELETE FROM Person p WHERE p.id NOT IN
(SELECT MIN(k.id)
 FROM Person k
 GROUP BY k.email);