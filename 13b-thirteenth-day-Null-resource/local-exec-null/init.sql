-- Select the 'TerraTest' database (created by Terraform RDS)
USE TerraTest;

-- ============================
-- Create users table
-- ============================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,               -- Unique user ID (auto incremented)
    name VARCHAR(100) NOT NULL,                      -- User name (required)
    email VARCHAR(100) NOT NULL UNIQUE,              -- Email (must be unique and required)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP   -- Timestamp when record is created
);

-- ============================
-- Create products table
-- ============================
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,               -- Unique product ID
    name VARCHAR(100) NOT NULL,                      -- Product name (required)
    price DECIMAL(10, 2) NOT NULL,                   -- Price with 2 decimal places (e.g., 999.99)
    stock INT DEFAULT 0,                             -- Stock count (default is 0 if not provided)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP   -- Timestamp when product is added
);

-- ============================
-- Create orders table
-- ============================
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,               -- Unique order ID
    user_id INT,                                     -- ID of the user who placed the order
    order_date DATE,                                 -- Date when the order was placed
    total_amount DECIMAL(10, 2),                     -- Total value of the order
    FOREIGN KEY (user_id) REFERENCES users(id)       -- user_id must match an existing user ID
);
