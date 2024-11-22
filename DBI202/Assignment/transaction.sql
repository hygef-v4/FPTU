-- Transaction to update the stock in stores and rollback if any error occurs
BEGIN TRANSACTION;

BEGIN TRY
    -- Update quantity sold for a specific sale
    UPDATE sales
    SET quantity_sold = quantity_sold + 10
    WHERE sale_id = 1;

    -- Commit the transaction if no errors occur
    COMMIT;
END TRY
BEGIN CATCH
    -- Rollback transaction if an error occurs
    ROLLBACK;
    PRINT 'Transaction rolled back due to an error.';
END CATCH;
