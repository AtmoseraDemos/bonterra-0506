/*
Database application MySQL version 8 or higher
This script contains commands for creating and querying batabase table in the 'inventory' database.
Details of the tables are as follows:
- Categories table: This table stores the product categories.
- Products table: This table stores the product details such as product name, price, and category.
- There is a foreign key constraint between the 'category_id' column in the 'products' table and the 'id' column in the 'categories' table.
Assumptions:
1. The database 'inventory' is already created.
2. The user has the necessary privileges to create and query tables in the 'inventory' database.
*/

-- set the current database to 'inventory'
USE inventory;


/**
 * Creates a table to store categories.
 * 
 * The `categories` table has the following columns:
 * - id: INT (auto-incremented primary key)
 * - name: VARCHAR(50) (not null)
 * - description: VARCHAR(255)
 */
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

/**
 * Creates a table to store products.
 * 
 * The `products` table has the following columns:
 * - id: INT (auto-incremented primary key)
 * - name: VARCHAR(50) (not null)
 * - price: DECIMAL(10, 2) (not null)
 * - category_id: INT (foreign key to categories.id)
 */
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)

);

/**
 * Inserts sample data into the `categories` table.
 */
INSERT INTO categories (name, description) VALUES
('Electronics', 'Electronic gadgets and devices'),
('Clothing', 'Apparel and fashion accessories'),
('Books', 'Books and reading materials');

/**
 * Inserts sample data into the `products` table.
 */
INSERT INTO products (name, price, category_id) VALUES
('PC', 779.89, 1),
('Phone', 99.99, 1),
('T-shirt', 19.99, 2),
('Jeans', 39.99, 2),
('Fiction Book', 14.99, 3),
('Non-Fiction Book', 19.99, 3);

/**
 * Queries all categories from the `categories` table.
 */
SELECT * FROM categories;

/**
 * Queries all products from the `products` table.
 */
SELECT * FROM products;

/**
 * Queries products with their corresponding category names.
 */
SELECT p.name AS product_name, p.price, c.name AS category_name
FROM products p
JOIN categories c ON p.category_id = c.id;

/**
 * Queries the total number of products in each category.
 */
SELECT c.name AS category_name, COUNT(p.id) AS total_products
FROM categories c
LEFT JOIN products p ON c.id = p.category_id
GROUP BY c.name;

/**
 * Queries the average price of products in each category.
 */
SELECT c.name AS category_name, AVG(p.price) AS avg_price
FROM categories c
LEFT JOIN products p ON c.id = p.category_id
GROUP BY c.name;

/**
 * Queries the total price of products in each category.
 */
SELECT c.name AS category_name, SUM(p.price) AS total_price
FROM categories c
LEFT JOIN products p ON c.id = p.category_id
GROUP BY c.name;

/**
 * Queries the category with the highest total price of products.
 */
SELECT c.name AS category_name, SUM(p.price) AS total_price
FROM categories c
LEFT JOIN products p ON c.id = p.category_id
GROUP BY c.name
ORDER BY total_price DESC
LIMIT 1;

