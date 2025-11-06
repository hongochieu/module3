-- Tạo cơ sở dữ liệu
CREATE DATABASE IF NOT EXISTS QuanLyBanHang;
USE QuanLyBanHang;

-- Bảng Customer: lưu thông tin khách hàng
CREATE TABLE Customer (
    cID INT PRIMARY KEY AUTO_INCREMENT,
    cName VARCHAR(100) NOT NULL,
    cAge INT CHECK (cAge >= 0)
);

-- Bảng Product: lưu thông tin sản phẩm
CREATE TABLE Product (
    pID INT PRIMARY KEY AUTO_INCREMENT,
    pName VARCHAR(100) NOT NULL,
    pPrice DECIMAL(10,2) CHECK (pPrice >= 0)
);

-- Bảng Order: lưu thông tin đơn hàng
CREATE TABLE `Order` (
    oID INT PRIMARY KEY AUTO_INCREMENT,
    cID INT,
    oDate DATE,
    oTotalPrice DECIMAL(10,2) CHECK (oTotalPrice >= 0),
    FOREIGN KEY (cID) REFERENCES Customer(cID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Bảng OrderDetail: chi tiết đơn hàng (nhiều sản phẩm trong 1 đơn)
CREATE TABLE OrderDetail (
    oID INT,
    pID INT,
    odQTY INT CHECK (odQTY > 0),
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES `Order`(oID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (pID) REFERENCES Product(pID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
