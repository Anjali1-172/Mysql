
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    name TEXT,
    price REAL
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO customers VALUES (1, 'Alice', 'alice@example.com');
INSERT INTO customers VALUES (2, 'Bob', 'bob@example.com');

INSERT INTO products VALUES (1, 'Laptop', 1000.00);
INSERT INTO products VALUES (2, 'Mouse', 25.50);
INSERT INTO products VALUES (3, 'Keyboard', 45.00);

INSERT INTO orders VALUES (1, 1, '2023-06-01');
INSERT INTO orders VALUES (2, 1, '2023-06-15');
INSERT INTO orders VALUES (3, 2, '2023-07-01');

INSERT INTO order_items VALUES (1, 1, 1, 1);
INSERT INTO order_items VALUES (2, 1, 2, 2);
INSERT INTO order_items VALUES (3, 2, 3, 1);
INSERT INTO order_items VALUES (4, 3, 1, 1);
INSERT INTO order_items VALUES (5, 3, 3, 1);

SELECT * FROM customers;

        SELECT orders.order_id, customers.name AS customer_name, order_date
        FROM orders
        JOIN customers ON orders.customer_id = customers.customer_id;
    

        SELECT customers.name, SUM(products.price * order_items.quantity) AS total_spent
        FROM customers
        JOIN orders ON customers.customer_id = orders.customer_id
        JOIN order_items ON orders.order_id = order_items.order_id
        JOIN products ON order_items.product_id = products.product_id
        GROUP BY customers.name;
    
SELECT AVG(price) AS average_price FROM products;

        SELECT order_id, product_id, quantity
        FROM order_items
        ORDER BY quantity DESC;
    