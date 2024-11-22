-- Trigger 1: Preventing high discount values on insertion or update
CREATE TRIGGER trg_check_discount_value
ON discounts
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted WHERE discount_value > 100
    )
    BEGIN
        PRINT 'Discount value cannot exceed 100.';
        ROLLBACK TRANSACTION;
    END
END;
GO

-- Trigger 2: Automatically updating the employee table when stores are deleted
CREATE TRIGGER trg_employee_store_nullify
ON stores
AFTER DELETE
AS
BEGIN
    UPDATE employee
    SET stor_id = NULL
    WHERE stor_id IN (SELECT stor_id FROM deleted);
END;
GO
