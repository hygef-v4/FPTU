-- Insert 10 records into Publishers table
INSERT INTO publishers (pub_id, pub_name) VALUES
(1001, 'Penguin Books'),
(1002, 'HarperCollins'),
(1003, 'Simon & Schuster'),
(1004, 'Hachette Book Group'),
(1005, 'Macmillan Publishers'),
(1006, 'Random House'),
(1007, 'Scholastic'),
(1008, 'Oxford University Press'),
(1009, 'Cambridge University Press'),
(1010, 'Pearson Education');

-- Insert 20 records into Titles table
INSERT INTO titles (title_id, title_name, pub_id) VALUES
(2001, 'The Great Gatsby', 1001),
(2002, 'To Kill a Mockingbird', 1002),
(2003, '1984', 1003),
(2004, 'Pride and Prejudice', 1004),
(2005, 'The Catcher in the Rye', 1005),
(2006, 'Moby Dick', 1006),
(2007, 'War and Peace', 1007),
(2008, 'The Odyssey', 1008),
(2009, 'The Iliad', 1009),
(2010, 'The Divine Comedy', 1010),
(2011, 'The Hobbit', 1001),
(2012, 'Brave New World', 1002),
(2013, 'The Brothers Karamazov', 1003),
(2014, 'Crime and Punishment', 1004),
(2015, 'Frankenstein', 1005),
(2016, 'Dracula', 1006),
(2017, 'The Picture of Dorian Gray', 1007),
(2018, 'Wuthering Heights', 1008),
(2019, 'The Scarlet Letter', 1009),
(2020, 'Les Misérables', 1010);

-- Insert 10 records into Authors table
INSERT INTO authors (au_id, au_name) VALUES
(3001, 'F. Scott Fitzgerald'),
(3002, 'Harper Lee'),
(3003, 'George Orwell'),
(3004, 'Jane Austen'),
(3005, 'J.D. Salinger'),
(3006, 'Herman Melville'),
(3007, 'Leo Tolstoy'),
(3008, 'Homer'),
(3009, 'Dante Alighieri'),
(3010, 'J.R.R. Tolkien');

-- Insert 20 records into TitleAuthor table
INSERT INTO titleauthor (au_id, title_id) VALUES
(3001, 2001),
(3002, 2002),
(3003, 2003),
(3004, 2004),
(3005, 2005),
(3006, 2006),
(3007, 2007),
(3008, 2008),
(3009, 2009),
(3010, 2010),
(3001, 2011),
(3002, 2012),
(3003, 2013),
(3004, 2014),
(3005, 2015),
(3006, 2016),
(3007, 2017),
(3008, 2018),
(3009, 2019),
(3010, 2020);

-- Insert 10 records into Stores table
INSERT INTO stores (stor_id, stor_name) VALUES
(4001, 'Downtown Bookstore'),
(4002, 'Uptown Bookstore'),
(4003, 'Suburban Books'),
(4004, 'City Center Bookshop'),
(4005, 'Riverside Books'),
(4006, 'Books & Beyond'),
(4007, 'Campus Bookstore'),
(4008, 'Old Town Bookstore'),
(4009, 'Mall Bookshop'),
(4010, 'City Library Bookstore');

-- Insert 20 records into Sales table
INSERT INTO sales (sale_id, stor_id, title_id, sale_date, quantity_sold) VALUES
(5001, 4001, 2001, '2024-01-10', 20),
(5002, 4002, 2002, '2024-02-15', 15),
(5003, 4003, 2003, '2024-03-20', 10),
(5004, 4004, 2004, '2024-04-25', 30),
(5005, 4005, 2005, '2024-05-30', 25),
(5006, 4006, 2006, '2024-06-10', 18),
(5007, 4007, 2007, '2024-07-15', 22),
(5008, 4008, 2008, '2024-08-20', 12),
(5009, 4009, 2009, '2024-09-25', 27),
(5010, 4010, 2010, '2024-10-30', 31),
(5011, 4001, 2011, '2024-11-10', 20),
(5012, 4002, 2012, '2024-12-15', 15),
(5013, 4003, 2013, '2024-01-12', 10),
(5014, 4004, 2014, '2024-02-18', 30),
(5015, 4005, 2015, '2024-03-20', 25),
(5016, 4006, 2016, '2024-04-12', 18),
(5017, 4007, 2017, '2024-05-15', 22),
(5018, 4008, 2018, '2024-06-18', 12),
(5019, 4009, 2019, '2024-07-25', 27),
(5020, 4010, 2020, '2024-08-10', 31);

-- Insert 5 records into Discounts table
INSERT INTO discounts (discount_id, stor_id, discount_value) VALUES
(6001, 4001, 10.00),
(6002, 4002, 15.00),
(6003, 4003, 20.00),
(6004, 4004, 25.00),
(6005, 4005, 30.00);

-- Insert 5 records into Jobs table
INSERT INTO jobs (job_id, job_title) VALUES
(7001, 'Manager'),
(7002, 'Sales Associate'),
(7003, 'Cashier'),
(7004, 'Inventory Specialist'),
(7005, 'Customer Service');

-- Insert 20 records into Employee table
INSERT INTO employee (emp_id, emp_name, emp_phone, emp_address, job_id, stor_id) VALUES
(8001, 'Alice Smith', '1234567890', '123 Main St', 7001, 4001),
(8002, 'Bob Johnson', '2345678901', '456 Elm St', 7002, 4002),
(8003, 'Carol White', '3456789012', '789 Oak St', 7003, 4003),
(8004, 'David Black', '4567890123', '321 Maple St', 7004, 4004),
(8005, 'Eve Brown', '5678901234', '654 Pine St', 7005, 4005),
(8006, 'Frank Green', '6789012345', '789 Birch St', 7001, 4006),
(8007, 'Grace Park', '7890123456', '159 Cedar St', 7002, 4007),
(8008, 'Hank Lewis', '8901234567', '951 Walnut St', 7003, 4008),
(8009, 'Isabel Wright', '9012345678', '357 Spruce St', 7004, 4009),
(8010, 'Jack King', '0123456789', '753 Poplar St', 7005, 4010),
(8011, 'Lena Adams', '1122334455', '456 Oak St', 7001, 4001),
(8012, 'Mason Ford', '2233445566', '321 Elm St', 7002, 4002),
(8013, 'Nina Shaw', '3344556677', '654 Birch St', 7003, 4003),
(8014, 'Oscar Grant', '4455667788', '789 Pine St', 7004, 4004),
(8015, 'Paula King', '5566778899', '159 Maple St', 7005, 4005),
(8016, 'Quincy Lee', '6677889900', '123 Walnut St', 7001, 4006),
(8017, 'Riley Moore', '7788990011', '951 Cedar St', 7002, 4007),
(8018, 'Sophie Martin', '8899001122', '357 Birch St', 7003, 4008),
(8019, 'Tyler Scott', '9900112233', '753 Oak St', 7004, 4009),
(8020, 'Uma Collins', '1011223344', '159 Pine St', 7005, 4010);
