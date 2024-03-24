-- Create a temporary table to store customer records
CREATE TEMP TABLE customer_data (
    customer_id INT,
    order_value DECIMAL(10, 2)
);

-- Insert sample customer data into the temporary table
INSERT INTO customer_data (customer_id, order_value)
VALUES
    (1, 120.50),
    (2, 80.00),
    (3, 40.00),
    -- Add more sample data as needed
    ;

-- Calculate the total number of customers
SELECT COUNT(*) AS total_customers
FROM customer_data;

-- Calculate the total order value
SELECT SUM(order_value) AS total_order_value
FROM customer_data;

-- Identify high spenders
WITH high_spenders AS (
    SELECT customer_id
    FROM customer_data
    WHERE order_value >= 150
)
SELECT COUNT(*) AS high_spender_count
FROM high_spenders;

-- Identify regular spenders
WITH regular_spenders AS (
    SELECT customer_id
    FROM customer_data
    WHERE order_value >= 80 AND order_value < 150
)
SELECT COUNT(*) AS regular_spender_count
FROM regular_spenders;

-- Identify occasional buyers
WITH occasional_buyers AS (
    SELECT customer_id
    FROM customer_data
    WHERE order_value < 80
)
SELECT COUNT(*) AS occasional_buyer_count
FROM occasional_buyers;

