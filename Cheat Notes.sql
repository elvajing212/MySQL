-- OR 只能连接运算，如果是字符串，需要重写state the pattern
-- % any number of characters
-- %% for the string in anywhere
-- _ single charater
-- LIKE retrieve rows that match a specific string pattern
-- ^ refers to the beginning of the string
-- $ refers to the end of the string
-- | refers to logical or to apply multiple search patterns
-- [] refer to match any single characters listed in the brackets
-- [-] refer to a range of character e.g. SELECT * FROM customers WHERE last_name REGEXP '[a-h]e'
-- LIMIT 6,3 6 means offset（偏移量）to skip from the records, 3 means the number we need to pick
-- DO NOT use implicit join syntax
-- LEFT JOIN is selecting the table in 'FROM', RIGHT JOIN is selecting from the JOINED table
-- If the column name is exactly the same across different tables, we can replace the on clause as "USING (the column name)". APPLY for compound join too
-- CROSS JOIN is to combine all the records in different table
-- UNION combine rows with multiple tables 
-- 'SELECT last_insert_id() to select the just added added Data information to proceed multiple insert function

CREATE TABLE orders_archived AS
SELECT * FROM orders
