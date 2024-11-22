-- Create Database
CREATE DATABASE BookStoreDB;
GO
USE BookStoreDB;
GO

-- Publishers Table
CREATE TABLE publishers (
    pub_id INT PRIMARY KEY,
    pub_name NVARCHAR(100) NOT NULL
);

-- Titles Table
CREATE TABLE titles (
    title_id INT PRIMARY KEY,
    title_name NVARCHAR(200) NOT NULL,
    pub_id INT,
    FOREIGN KEY (pub_id) REFERENCES publishers(pub_id)
);

-- Authors Table
CREATE TABLE authors (
    au_id INT PRIMARY KEY,
    au_name NVARCHAR(100) NOT NULL
);

-- TitleAuthor Table (Junction Table for Many-to-Many Relationship between authors and titles)
CREATE TABLE titleauthor (
    au_id INT,
    title_id INT,
    PRIMARY KEY (au_id, title_id),
    FOREIGN KEY (au_id) REFERENCES authors(au_id),
    FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

-- Stores Table
CREATE TABLE stores (
    stor_id INT PRIMARY KEY,
    stor_name NVARCHAR(100) NOT NULL
);

-- Sales Table (Junction Table for Many-to-Many Relationship between stores and titles)
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    stor_id INT,
    title_id INT,
    sale_date DATE NOT NULL,
    quantity_sold INT NOT NULL CHECK (quantity_sold > 0),
    FOREIGN KEY (stor_id) REFERENCES stores(stor_id),
    FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

-- Discounts Table
CREATE TABLE discounts (
    discount_id INT PRIMARY KEY,
    stor_id INT,
    discount_value DECIMAL(5, 2) NOT NULL CHECK (discount_value > 0),
    FOREIGN KEY (stor_id) REFERENCES stores(stor_id)
);

-- Jobs Table
CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title NVARCHAR(100) NOT NULL
);

-- Employee Table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name NVARCHAR(100) NOT NULL,
    emp_phone VARCHAR(10) UNIQUE NOT NULL,
    emp_address NVARCHAR(200),
    job_id INT,
    stor_id INT,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (stor_id) REFERENCES stores(stor_id)
);
