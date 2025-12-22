CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    Salary INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);


INSERT INTO Departments (DeptID, DeptName, Location) VALUES
(10, 'HR', 'Delhi'),
(20, 'IT', 'Mumbai'),
(30, 'Finance', 'Pune'),
(50, 'Marketing', 'Chennai');

INSERT INTO Employees (EmpID, EmpName, DeptID, Salary) VALUES
(1, 'Akash', 10, 50000),
(2, 'Nisha', 20, 60000),
(4, 'Simran', 30, 70000),
(5, 'Meena', 30, 55000);

SELECT DeptName,
	COUNT(EmpID) AS Total_employees,
	AVG(Salary) :: NUMERIC(10, 3) as Average_salary,
	CASE 
		WHEN (AVG(Salary) >= 60000) THEN 'Average - High'
		WHEN (AVG(Salary) >= 50000) AND AVG(Salary) <= 59999 THEN 'Average - Medium'
		WHEN (AVG(Salary) < 50000) AND AVG(Salary) != -1 THEN 'Average - Low'
		WHEN (AVG(Salary) IS NULL) THEN 'No Employee'
	END AS Salary_cat
FROM Departments d
LEFT JOIN Employees e
ON d.DeptID = e.DeptID
GROUP BY d.deptID, DeptName;

