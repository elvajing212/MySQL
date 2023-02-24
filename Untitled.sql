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
SELECT order_id, a.product_id, quantity, a.unit_price 
FROM order_items a
JOIN products b
ON a.product_id = b.product_id 
