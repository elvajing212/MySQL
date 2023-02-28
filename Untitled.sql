-- Excercise Parking Lot
-- REGEXP excercise
-- SELECT * FROM customers
-- WHERE first_name LIKE 'elka' or first_name LIKE 'ambur'
-- WHERE first_name REGEXP 'elka|ambur'
-- WHERE last_name REGEXP 'EY$|ON$'
-- WHERE last_name REGEXP '^MY|se'
-- WHERE last_name REGEXP 'b[ru]'/'b[r|u]'

-- NULL
-- SELECT * FROM orders
-- WHERE shipped_date IS NULL

-- Order
-- SELECT *, quantity * unit_price AS total_price
-- FROM order_items
-- WHERE order_id = 2
-- ORDER BY total_price DESC

-- LIMIT always goes after the ORDER BY
-- SELECT * FROM customers
-- ORDER BY points DESC
-- LIMIT 3

-- JOIN ON

-- Join multiple tables:
-- USE sql_invoicing;
SELECT 
	p.date,
	p.invoice_id,
	p.amount,
	c.name,
	pm.name AS 'payment_method'
FROM payments p 
	JOIN clients c ON p.client_id = c.client_id 
    JOIN payment_methods pm ON p.payment_method = pm.payment_method_id
    
-- Compound JOIN Conditions
SELECT * FROM order_items oi
JOIN order_item_notes oin ON oi.order_id = oin.order_id AND oi.product_id = oin.product_id

-- Outer Joins(LEFT JOIN or RIGHT JOIN)
SELECT p.product_id, p.name, oi.quantity FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id

-- Outer Joins with multiple tables
SELECT o.order_date,o.order_id,c.first_name AS customer, sh.name AS shipper, os.name AS status
FROM orders o
LEFT JOIN customers c
	ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
LEFT JOIN order_statuses os
	ON o.status = os.order_status_id
ORDER BY os.name

-- USING claus for same column name
USE sql_invoicing;
SELECT p.date, c.name AS client, p.amount,pm.name AS method
FROM payments p
JOIN clients c USING (client_id)
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
    
-- CROSS JOIN
USE sql_store;
SELECT sh.name AS shipper,p.name AS product 
FROM shippers sh
CROSS JOIN products p
ORDER BY sh.name

-- UNION
SELECT customer_id, first_name, points, 'Bronze' AS type
FROM customers
WHERE points < 2000
UNION
SELECT customer_id, first_name, points, 'Silver' AS type
FROM customers
WHERE points BETWEEN 2000 and 3000
UNION
SELECT customer_id, first_name, points, 'Gold' AS type
FROM customers
WHERE points > 3000
ORDER BY first_name

-- INSERT Value
INSERT INTO products (name, quantity_in_stock,unit_price)
VALUES ('name 1',3,24),
	('name 2',12,67),
    ('name 3', 8,35)
    
-- INSERT value to multiple database
INSERT INTO orders (customer_id, order_date, status)
VALUES (1,'2019-01-02',1);

INSERT INTO order_items
VALUES (last_insert_id(), 1,1,2.95),
	   (last_insert_id(), 2,1,1.85)
       
-- Create a new table with selected data
USE sql_invoicing;
-- CREATE TABLE invoice_archived AS
CREATE TABLE invoices_archived AS
SELECT 
	i.invoice_id,
    i.number,
    c.name AS client,
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.payment_date,
    i.due_date
FROM invoices i
JOIN clients c
	USING (client_id)
WHERE i.payment_date is NOT NULL

-- Update 1 or more record in the table
UPDATE invoices
SET payment_total = invoice_total * 0.5, payment_date = due_date
WHERE invoice_id = 3

USE sql_store;
UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01'

-- Subqueries in updates
USE sql_invoicing;
UPDATE invoices
SET payment_total = invoice_total * 0.5, payment_date = due_date
WHERE client_id IN 
			(SELECT client_id
			FROM clients
			WHERE state IN ('CA','NY'))
            
USE sql_store;
UPDATE orders
SET comments = 'Golden'
WHERE customer_id  IN 
			(SELECT customer_id
			FROM customers
			WHERE points > 3000)
            
-- DELET ROW
DELETE FROM invoices
WHERE invoice_id = 1

-- RESTORE database
