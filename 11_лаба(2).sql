CREATE TABLE customers (
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  with_debt BOOLEAN NOT NULL
);
CREATE TABLE orders (
  id INT NOT NULL PRIMARY KEY,
  customer_id INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- fill out tables
INSERT INTO customers (id, name, with_debt) VALUES (1, '����', false), (2, '����', true), (3, '�������', false);

-- two
START TRANSACTION;
INSERT INTO customers (id, with_debt) VALUES (4, false);
ROLLBACK;

