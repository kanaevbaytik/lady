CREATE DATABASE productsdb;
GO
USE productsdb;
CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    Manufacturer NVARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price MONEY NOT NULL
);
CREATE TABLE History 
(
    Id INT IDENTITY PRIMARY KEY,
    ProductId INT NOT NULL,
    Operation NVARCHAR(200) NOT NULL,
    CreateAt DATETIME NOT NULL DEFAULT GETDATE(),
);

USE productsdb
GO
CREATE TRIGGER Products_INSERT
ON Products
AFTER INSERT
AS
INSERT INTO History (ProductId, Operation)
SELECT Id, 'Добавлен товар ' + ProductName + '   фирма ' + Manufacturer
FROM INSERTED


USE productsdb;
INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
VALUES('iPhone X', 'Apple', 2, 79900)
 
SELECT * FROM History

CREATE PROCEDURE update_price
  @id int,
  @new_price int
AS
BEGIN
  UPDATE Products
  SET price = @new_price
  WHERE id = @id
END

CREATE TRIGGER instead_of_update_price
ON employees
INSTEAD OF UPDATE OF price
AS
BEGIN
  RAISERROR('Вы не можете обновить столбец цены напрямую. Вместо этого используйте хранимую процедуру update_price.', 16, 1)
END

