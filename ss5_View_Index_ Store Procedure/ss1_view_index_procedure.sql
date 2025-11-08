CREATE DATABASE IF NOT EXISTS DemoDB;
USE DemoDB;

CREATE TABLE IF NOT EXISTS Products (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    productCode VARCHAR(20),
    productName VARCHAR(50),
    productPrice DECIMAL(10,2),
    productAmount INT,
    productDescription VARCHAR(255),
    productStatus BOOLEAN
);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus) VALUES
('P001', 'Laptop', 1500.00, 10, 'Laptop gaming', TRUE),
('P002', 'Mouse', 20.00, 50, 'Chuột quang', TRUE),
('P003', 'Keyboard', 45.50, 30, 'Bàn phím cơ', TRUE),
('P004', 'Monitor', 200.00, 15, 'Màn hình FullHD', TRUE),
('P005', 'Headset', 80.00, 25, 'Tai nghe gaming', TRUE);

-- Tạo Index
CREATE UNIQUE INDEX idx_productCode ON Products(productCode);
CREATE INDEX idx_name_price ON Products(productName, productPrice);

-- Kiểm tra Index
EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';
EXPLAIN SELECT * FROM Products WHERE productName = 'Laptop' AND productPrice = 1500.00;

-- Tạo View
CREATE VIEW vw_ProductInfo AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

-- Xem View
SELECT * FROM vw_ProductInfo;

-- Sửa View
CREATE OR REPLACE VIEW vw_ProductInfo AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM Products;

-- Xoá View
DROP VIEW IF EXISTS vw_ProductInfo;

-- Stored Procedure
DELIMITER //

CREATE PROCEDURE sp_GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //

CREATE PROCEDURE sp_AddProduct(
    IN pCode VARCHAR(20),
    IN pName VARCHAR(50),
    IN pPrice DECIMAL(10,2),
    IN pAmount INT,
    IN pDesc VARCHAR(255),
    IN pStatus BOOLEAN
)
BEGIN
    INSERT INTO Products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (pCode, pName, pPrice, pAmount, pDesc, pStatus);
END //

CREATE PROCEDURE sp_UpdateProduct(
    IN pId INT,
    IN pName VARCHAR(50),
    IN pPrice DECIMAL(10,2),
    IN pAmount INT,
    IN pDesc VARCHAR(255),
    IN pStatus BOOLEAN
)
BEGIN
    UPDATE Products
    SET productName = pName,
        productPrice = pPrice,
        productAmount = pAmount,
        productDescription = pDesc,
        productStatus = pStatus
    WHERE Id = pId;
END //

CREATE PROCEDURE sp_DeleteProduct(IN pId INT)
BEGIN
    DELETE FROM Products WHERE Id = pId;
END //

DELIMITER ;
