START TRANSACTION;
SET @a = 10;
SET @b = 15;
SET @c = 0;

IF @c >= 0 THEN
    SET @sum = @a + @b;
    SELECT @sum AS '����� a � b';
ELSE
    ROLLBACK;
END IF;

COMMIT;
