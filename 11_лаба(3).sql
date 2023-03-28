START TRANSACTION;
DECLARE @with_debt BOOLEAN;
SELECT with_debt INTO @with_debt FROM customers WHERE id = 1;
IF @with_debt THEN
  ROLLBACK;
ELSE
  INSERT INTO orders (id, customer_id) VALUES (1, 1);
  COMMIT;
END IF;