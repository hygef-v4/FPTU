-- (a) Query using INNER JOIN
-- select titles and their respective publisher names
SELECT t.title_name, p.pub_name
FROM titles t
INNER JOIN publishers p ON t.pub_id = p.pub_id;
GO

-- (b) Query using OUTER JOIN
-- select all stores and their corresponding discounts, even if no discount is available
SELECT s.stor_name, d.discount_value
FROM stores s
LEFT OUTER JOIN discounts d ON s.stor_id = d.stor_id;
GO

-- (c) Using subquery in WHERE
-- select authors who have written at least one book
SELECT au_name
FROM authors
WHERE au_id IN (SELECT au_id FROM titleauthor);
GO

-- (d) Using subquery in FROM
-- select the total number of titles available for each publisher
SELECT pub_name, COUNT(*) AS total_titles
FROM (
    SELECT p.pub_name, t.title_id
    FROM publishers p
    INNER JOIN titles t ON p.pub_id = t.pub_id
) AS publisher_titles
GROUP BY pub_name;
GO

-- (e) Query using GROUP BY and aggregate functions
-- Calculate the total quantity sold for each title
SELECT t.title_name, SUM(s.quantity_sold) AS total_quantity_sold
FROM titles t
INNER JOIN sales s ON t.title_id = s.title_id
GROUP BY t.title_name;
GO
