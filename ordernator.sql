DROP TABLE IF EXISTS orders_products;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS accounts;

CREATE TABLE products (
	sku VARCHAR(36) NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (sku),
    UNIQUE KEY (name)
);

CREATE TABLE accounts (
	id VARCHAR(36) NOT NULL,
	email_address VARCHAR(255) NOT NULL,
	full_name VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (email_address)
 );

CREATE TABLE orders (
	id VARCHAR(36) NOT NULL,
    account_id VARCHAR(36) NOT NULL,
    create_date DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES accounts (id)
);

CREATE TABLE orders_products (
	order_id VARCHAR(36) NOT NULL,
    product_sku VARCHAR(36) NOT NULL,
    quantity INT UNSIGNED,
    FOREIGN KEY (order_id) REFERENCES orders (id),
    FOREIGN KEY (product_sku) REFERENCES products (sku)
);