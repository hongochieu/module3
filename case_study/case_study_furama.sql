create database if not exists FuramaResort;
use FuramaResort;

-- TẠO BẢNG

CREATE TABLE vi_tri (
    ma_vi_tri INT AUTO_INCREMENT PRIMARY KEY,
    ten_vi_tri VARCHAR(50) NOT NULL
);
CREATE TABLE trinh_do (
	ma_trinh_do INT AUTO_INCREMENT KEY,
    ten_trinh_do VARCHAR(50) NOT NULL
);
CREATE TABLE bo_phan(
	ma_bo_phan INT AUTO_INCREMENT KEY,
    ten_bo_phan VARCHAR(50) NOT NULL
);
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
CREATE TABLE loai_khach (
    ma_loai_khach INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_khach VARCHAR(50) NOT NULL
);
CREATE TABLE khach_hang (
	ma_khach_hang INT AUTO_INCREMENT KEY,
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
CREATE TABLE kieu_thue (
    ma_kieu_thue INT AUTO_INCREMENT PRIMARY KEY,
    ten_kieu_thue VARCHAR(50) NOT NULL
);
CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(50) NOT NULL
);
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
CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(100) NOT NULL,
    don_vi VARCHAR(50),
    gia_tien DECIMAL(15,2)
);
CREATE TABLE hop_dong (
    ma_hop_dong INT AUTO_INCREMENT PRIMARY KEY,
    ma_khach_hang INT,
    ma_nhan_vien INT,
    ngay_lam_hop_dong DATE,
    ngay_ket_thuc DATE,
    tien_dat_coc DECIMAL(15,2),
    tong_tien DECIMAL(15,2),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien)
);
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT AUTO_INCREMENT PRIMARY KEY,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    so_luong INT,
    gia_tien DECIMAL(15,2),
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);

-- 