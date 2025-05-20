-- Here are the SQL queries and transformations needed to achieve 1NF and 2NF from the provided tables:

-- Question 1: Achieving 1NF

--Original Table: ProductDetail
-- Violation: Products column contains multiple comma-separated values.

-- Goal: Create a new table where each product is in its own row, eliminating repeating groups.

-- SQL Query to achieve 1NF:
-- Create the new table in 1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insert transformed data (split products into individual rows)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');



-- Question 2: Achieving 2NF
-- Original Table: OrderDetails
-- Violation: CustomerName depends only on OrderID, not on the full composite key (OrderID, Product).

-- Goal: Separate customer info from order-product info to remove partial dependencies.

-- SQL Steps to achieve 2NF:
-- Step 1: Create Orders table to store customer info (depends only on OrderID)

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

