USE BookStoreDB;
GO

-- 1. Ensure each employee has a job assigned by making job_id NOT NULL
ALTER TABLE employee
ALTER COLUMN job_id INT NOT NULL;

-- 2. Set a unique constraint on titles so each title_name must be unique
ALTER TABLE titles
ADD CONSTRAINT unique_title_name UNIQUE (title_name);

-- 3. Ensure discounts do not exceed a maximum value of 100%
ALTER TABLE discounts
ADD CONSTRAINT check_discount_value CHECK (discount_value <= 100);
