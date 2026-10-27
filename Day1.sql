
CREATE DATABASE  ecommerce_db;

USE ecommerce_db;

-- 1. Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100),
    signup_date DATE,
    segment VARCHAR(50)
);

-- 2. Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    price DECIMAL(10,2),
    cost DECIMAL(10,2)
);

-- 3. Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(50),
    channel VARCHAR(100),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- 4. Order Items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- 5. Payments
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT UNIQUE,
    payment_method VARCHAR(100),
    payment_status VARCHAR(50),
    amount DECIMAL(12,2),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

-- 6. Deliveries
CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT UNIQUE,
    dispatch_date DATE,
    delivery_date DATE NULL,
    delivery_status VARCHAR(50),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);
