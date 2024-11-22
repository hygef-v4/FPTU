-- Procedure 1: Get Total Sales by Title
CREATE PROCEDURE GetTotalSalesByTitle
AS
BEGIN
    SELECT t.title_name, SUM(s.quantity_sold) AS total_sales
    FROM titles t
    INNER JOIN sales s ON t.title_id = s.title_id
    GROUP BY t.title_name;
END;
GO

-- Procedure 2: Add New Author with Title Association
CREATE PROCEDURE AddAuthorWithTitle
    @au_name NVARCHAR(100),
    @title_id INT
AS
BEGIN
    DECLARE @new_au_id INT;
    
    -- Insert new author
    INSERT INTO authors (au_name) VALUES (@au_name);
    SET @new_au_id = SCOPE_IDENTITY();

    -- Associate the new author with a title
    INSERT INTO titleauthor (au_id, title_id) VALUES (@new_au_id, @title_id);
END;
GO
