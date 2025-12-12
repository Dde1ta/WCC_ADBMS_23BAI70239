
-- -- CLIENT TABLE
-- CREATE TABLE client_master (
--     client_id INT PRIMARY KEY,
--     client_name VARCHAR(100),
--     email VARCHAR(100)
-- );

-- -- SERVICE TABLE
-- CREATE TABLE service_catalog (
--     service_id INT PRIMARY KEY,
--     service_name VARCHAR(100),
--     hourly_rate NUMERIC(10,2)
-- );

-- -- INVOICE TABLE
-- CREATE TABLE invoice_details (
--     invoice_id INT PRIMARY KEY,
--     client_id INT REFERENCES client_master(client_id),
--     service_id INT REFERENCES service_catalog(service_id),
--     hours_worked INT,
--     discount_percent INT,
--     invoice_date DATE
-- );

Select *  From client_master;
Select *  From service_catalog;
Select * From invoice_details;


CREATE OR REPLACE VIEW vw_invoice_summary AS
SELECT 
	j.invoice_id, j.invoice_date, 
	c.client_name, j.service_name, 
	ROUND(j.total_bill - (j.total_bill * j.discount_percent / 100), 2) AS final_amount
FROM client_master c
INNER JOIN (
	SELECT 
		s.service_id, s.service_name, i.client_id,
		i.invoice_id, i.invoice_date, i.discount_percent,
		i.hours_worked * s.hourly_rate AS total_bill
	FROM invoice_details i
	INNER JOIN service_catalog s
	ON i.service_id = s.service_id
) AS j
ON c.client_id = j.client_id;

SELECT * FROM vw_invoice_summary;

CREATE ROLE ARJUN; 

-- CREATE USER tester
-- WITH login PASSWORD 'root';

GRANT SELECT ON vw_invoice_summary TO ARJUN;

REVOKE SELECT ON vw_invoice_summary FROM ARJUN;

