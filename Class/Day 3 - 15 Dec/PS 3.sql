drop table Employees;
drop table Departments;

CREATE TABLE Employees (
    emp_id     INT PRIMARY KEY,
    name       VARCHAR(50),
    dept_id    INT,
    salary     INT
);


CREATE TABLE Departments (
    dept_id     INT PRIMARY KEY,
    dept_name   VARCHAR(50)
);

INSERT INTO Employees (emp_id, name, dept_id, salary) VALUES
(1, 'Asha', 10, 50000),
(2, 'Rohan', 10, 70000),
(3, 'Meera', 20, 40000),
(4, 'Kabir', 20, 55000),
(5, 'Isha', 30, 90000);

INSERT INTO Departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'Finance'),
(30, 'IT');


SELECT *,
	(SELECT AVG(salary) FROM Employees WHERE dept_id = e.dept_id) :: numeric(10,2) AS Dept_Avg
FROM Employees e
WHERE emp_id in(
	SELECT emp_id
	FROM Employees
	WHERE dept_id = e.dept_id
	ORDER BY 
		ABS(salary - (SELECT AVG(salary) FROM Employees WHERE dept_id = e.dept_id)),
		salary DESC
	LIMIT 1
)

