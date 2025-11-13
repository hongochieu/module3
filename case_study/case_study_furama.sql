DROP DATABASE IF EXISTS FuramaResort;
CREATE DATABASE IF NOT EXISTS FuramaResort;
USE FuramaResort;

DROP TABLE IF EXISTS hop_dong_chi_tiet;
DROP TABLE IF EXISTS hop_dong;
DROP TABLE IF EXISTS dich_vu_di_kem;
DROP TABLE IF EXISTS dich_vu;
DROP TABLE IF EXISTS loai_dich_vu;
DROP TABLE IF EXISTS kieu_thue;
DROP TABLE IF EXISTS khach_hang;
DROP TABLE IF EXISTS loai_khach;
DROP TABLE IF EXISTS nhan_vien;
DROP TABLE IF EXISTS vi_tri;
DROP TABLE IF EXISTS trinh_do;
DROP TABLE IF EXISTS bo_phan;

-- 1. Bảng vi_tri
CREATE TABLE vi_tri (
    ma_vi_tri INT AUTO_INCREMENT PRIMARY KEY,
    ten_vi_tri VARCHAR(50) NOT NULL
);

-- 2. Bảng trinh_do
CREATE TABLE trinh_do (
    ma_trinh_do INT AUTO_INCREMENT PRIMARY KEY,
    ten_trinh_do VARCHAR(50) NOT NULL
);

-- 3. Bảng bo_phan
CREATE TABLE bo_phan (
    ma_bo_phan INT AUTO_INCREMENT PRIMARY KEY,
    ten_bo_phan VARCHAR(50) NOT NULL
);

-- 4. Bảng nhan_vien
CREATE TABLE nhan_vien (
    ma_nhan_vien INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    ngay_sinh DATE,
    so_cmnd VARCHAR(20),
    so_dien_thoai VARCHAR(20),
    email VARCHAR(100),
    dia_chi VARCHAR(200),
    ma_trinh_do INT,
    ma_bo_phan INT,
    ma_vi_tri INT,
    luong DECIMAL(15,2),
    FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
    FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan),
    FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri)
);

-- 5. Bảng loai_khach
CREATE TABLE loai_khach (
    ma_loai_khach INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_khach VARCHAR(50) NOT NULL
);

-- 6. Bảng khach_hang
CREATE TABLE khach_hang (
    ma_khach_hang INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    ngay_sinh DATE,
    gioi_tinh VARCHAR(10),
    so_cmnd VARCHAR(20),
    so_dien_thoai VARCHAR(20),
    email VARCHAR(100),
    dia_chi VARCHAR(200),
    ma_loai_khach INT,
    FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

-- 7. Bảng kieu_thue
CREATE TABLE kieu_thue (
    ma_kieu_thue INT AUTO_INCREMENT PRIMARY KEY,
    ten_kieu_thue VARCHAR(50) NOT NULL
);

-- 8. Bảng loai_dich_vu
CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(50) NOT NULL
);

-- 9. Bảng dich_vu
CREATE TABLE dich_vu (
    ma_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu VARCHAR(100) NOT NULL,
    dien_tich DECIMAL(10,2),
    chi_phi_thue DECIMAL(15,2),
    so_nguoi_toi_da INT,
    ma_loai_dich_vu INT,
    ma_kieu_thue INT,
    tieu_chuan_phong VARCHAR(50),
    mo_ta_tien_nghi VARCHAR(200),
    dien_tich_ho_boi DECIMAL(10,2),
    so_tang INT,
    dich_vu_mien_phi VARCHAR(100),
    FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu),
    FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue)
);

-- 10. Bảng dich_vu_di_kem
CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(100) NOT NULL,
    don_vi VARCHAR(50),
    gia_tien DECIMAL(15,2)
);

-- 11. Bảng hop_dong
CREATE TABLE hop_dong (
    ma_hop_dong INT AUTO_INCREMENT PRIMARY KEY,
    ma_khach_hang INT,
    ma_nhan_vien INT,
    ma_dich_vu INT,
    ngay_lam_hop_dong DATE,
    ngay_ket_thuc DATE,
    tien_dat_coc DECIMAL(15,2),
    tong_tien DECIMAL(15,2),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

-- 12. Bảng hop_dong_chi_tiet
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT AUTO_INCREMENT PRIMARY KEY,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    so_luong INT,
    gia_tien DECIMAL(15,2),
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);

--  DỮ LIỆU MẪU

INSERT INTO vi_tri (ten_vi_tri) VALUES ('Lễ tân'), ('Phục vụ'), ('Quản lý');
INSERT INTO trinh_do (ten_trinh_do) VALUES ('Trung cấp'), ('Cao đẳng'), ('Đại học'), ('Sau đại học');
INSERT INTO bo_phan (ten_bo_phan) VALUES ('Sale – Marketing'), ('Hành Chính'), ('Phục vụ'), ('Quản lý');

INSERT INTO nhan_vien (ho_ten, ngay_sinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_trinh_do, ma_bo_phan, ma_vi_tri, luong)
VALUES
('Hoang Van A', '1990-05-12', '123456789', '0901234567', 'hoa@example.com', 'Đà Nẵng', 3, 1, 1, 12000000),
('Tran Thi B', '1985-07-20', '987654321', '0907654321', 'tranb@example.com', 'Quảng Trị', 2, 2, 2, 10000000),
('Kim Van C', '1992-09-15', '456789123', '0904567891', 'kimc@example.com', 'Hải Châu', 4, 3, 3, 15000000);

INSERT INTO loai_khach (ten_loai_khach) VALUES ('Diamond'), ('Platinium'), ('Gold'), ('Silver'), ('Member');

INSERT INTO khach_hang (ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach)
VALUES
('Nguyen Van D', '1995-06-10', 'Nam', '111222333', '0911222333', 'nguyend@example.com', 'Đà Nẵng', 1),
('Le Thi E', '1980-03-25', 'Nữ', '444555666', '0911444555', 'leethe@example.com', 'Quảng Trị', 2),
('Pham Van F', '2000-11-12', 'Nam', '777888999', '0911778899', 'phamf@example.com', 'Huế', 3),
('Tran Quoc Vinh', '1993-09-10', 'Nam', '666777888', '0909988776', 'vinhtran@example.com', 'TP Vinh', 1),
('Le Thi Nga', '1988-07-22', 'Nữ', '123789456', '0911999888', 'nga@example.com', 'Quảng Ngãi', 1);

INSERT INTO kieu_thue (ten_kieu_thue) VALUES ('Theo giờ'), ('Theo ngày'), ('Theo tháng'), ('Theo năm');
INSERT INTO loai_dich_vu (ten_loai_dich_vu) VALUES ('Villa'), ('House'), ('Room');

INSERT INTO dich_vu (ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_loai_dich_vu, ma_kieu_thue, tieu_chuan_phong, mo_ta_tien_nghi, dien_tich_ho_boi, so_tang, dich_vu_mien_phi)
VALUES
('Villa Ocean', 120, 5000000, 5, 1, 2, 'VIP', 'Full tiện nghi', 50, 2, NULL),
('House Garden', 80, 3000000, 4, 2, 2, 'Standard', 'Tiện nghi cơ bản', NULL, 2, NULL),
('Room Deluxe', 30, 1000000, 2, 3, 1, NULL, NULL, NULL, NULL, 'Nước uống');

INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, don_vi, gia_tien)
VALUES ('Massage', 'Buổi', 200000),
       ('Karaoke', 'Giờ', 150000),
       ('Thức ăn', 'Phần', 50000),
       ('Thuê xe', 'Ngày', 300000);

INSERT INTO hop_dong (ma_khach_hang, ma_nhan_vien, ma_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien)
VALUES
(1, 1, 1, '2021-01-10', '2021-01-15', 1000000, 5500000),
(4, 2, 2, '2021-02-05', '2021-02-07', 500000, 2500000),
(5, 3, 3, '2021-03-10', '2021-03-12', 800000, 3200000);

INSERT INTO hop_dong_chi_tiet (ma_hop_dong, ma_dich_vu_di_kem, so_luong, gia_tien)
VALUES
(1, 1, 2, 200000),
(1, 3, 3, 50000),
(2, 2, 1, 150000),
(3, 4, 1, 300000);

-- TRUY VẤN

-- 2. Nhân viên tên bắt đầu H, T, K và tối đa 15 ký tự
SELECT *
FROM nhan_vien
WHERE (ho_ten LIKE 'H%' OR ho_ten LIKE 'T%' OR ho_ten LIKE 'K%')
  AND CHAR_LENGTH(ho_ten) <= 15;

-- 3. Khách hàng tuổi 18–50 và địa chỉ ở Đà Nẵng hoặc Quảng Trị
SELECT *
FROM khach_hang
WHERE YEAR(CURDATE()) - YEAR(ngay_sinh) BETWEEN 18 AND 50
  AND (dia_chi LIKE '%Đà Nẵng%' OR dia_chi LIKE '%Quảng Trị%');

-- 4. Đếm số lần đặt phòng khách hàng Diamond
SELECT k.ho_ten, COUNT(h.ma_hop_dong) AS so_lan_dat
FROM khach_hang k
JOIN hop_dong h ON k.ma_khach_hang = h.ma_khach_hang
JOIN loai_khach lk ON k.ma_loai_khach = lk.ma_loai_khach
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY k.ma_khach_hang, k.ho_ten
ORDER BY so_lan_dat ASC;

-- 5. Thông tin khách hàng và tổng tiền (bao gồm dịch vụ đi kèm)
SELECT k.ma_khach_hang, k.ho_ten, lk.ten_loai_khach, h.ma_hop_dong,
       d.ten_dich_vu, h.ngay_lam_hop_dong, h.ngay_ket_thuc,
       h.tong_tien + COALESCE(SUM(hct.so_luong * hct.gia_tien),0) AS tong_tien_thuc_te
FROM khach_hang k
LEFT JOIN hop_dong h ON k.ma_khach_hang = h.ma_khach_hang
LEFT JOIN hop_dong_chi_tiet hct ON h.ma_hop_dong = hct.ma_hop_dong
LEFT JOIN dich_vu d ON d.ma_dich_vu = h.ma_dich_vu
LEFT JOIN loai_khach lk ON k.ma_loai_khach = lk.ma_loai_khach
GROUP BY k.ma_khach_hang, h.ma_hop_dong;

-- 6. Dịch vụ chưa từng được đặt trong Quý 1 năm 2021
SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE dv.ma_dich_vu NOT IN (
    SELECT DISTINCT h.ma_dich_vu
    FROM hop_dong h
    WHERE QUARTER(h.ngay_lam_hop_dong) = 1 AND YEAR(h.ngay_lam_hop_dong) = 2021
);

-- 7. Dịch vụ đã được đặt năm 2020 nhưng chưa được đặt năm 2021
SELECT DISTINCT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da,
       dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE dv.ma_dich_vu IN (
    SELECT DISTINCT h.ma_dich_vu
    FROM hop_dong h
    WHERE YEAR(h.ngay_lam_hop_dong) = 2020
)
AND dv.ma_dich_vu NOT IN (
    SELECT DISTINCT h.ma_dich_vu
    FROM hop_dong h
    WHERE YEAR(h.ngay_lam_hop_dong) = 2021
);

-- 8. Danh sách họ tên khách hàng không trùng nhau
SELECT DISTINCT ho_ten FROM khach_hang;

-- 9. Thống kê số lượng khách đặt phòng theo tháng năm 2021
SELECT MONTH(ngay_lam_hop_dong) AS thang,
       COUNT(DISTINCT ma_khach_hang) AS so_khach_hang_dat
FROM hop_dong
WHERE YEAR(ngay_lam_hop_dong) = 2021
GROUP BY MONTH(ngay_lam_hop_dong)
ORDER BY thang;

-- 10. Số lượng dịch vụ đi kèm theo từng hợp đồng
SELECT h.ma_hop_dong, h.ngay_lam_hop_dong, h.ngay_ket_thuc, h.tien_dat_coc,
       COALESCE(SUM(hct.so_luong), 0) AS so_luong_dich_vu_di_kem
FROM hop_dong h
LEFT JOIN hop_dong_chi_tiet hct ON h.ma_hop_dong = hct.ma_hop_dong
GROUP BY h.ma_hop_dong;

-- 11. Dịch vụ đi kèm được dùng bởi khách hàng Diamond ở “Vinh” hoặc “Quảng Ngãi”
SELECT DISTINCT dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia_tien,
       k.ho_ten, k.dia_chi, lk.ten_loai_khach
FROM dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hct ON dvdk.ma_dich_vu_di_kem = hct.ma_dich_vu_di_kem
JOIN hop_dong h ON h.ma_hop_dong = hct.ma_hop_dong
JOIN khach_hang k ON h.ma_khach_hang = k.ma_khach_hang
JOIN loai_khach lk ON k.ma_loai_khach = lk.ma_loai_khach
WHERE lk.ten_loai_khach = 'Diamond'
  AND (k.dia_chi LIKE '%Vinh%' OR k.dia_chi LIKE '%Quảng Ngãi%');
