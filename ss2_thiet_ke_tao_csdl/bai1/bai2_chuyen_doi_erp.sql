create database if not exists  m3_c0525l1;
use m3_c0525l1;
create table NHACC(
MaCC int primary key auto_increment,
TenNCC nvarchar(50),
DiaChi nchar(20),
SDT int
);
drop table if exists DONDH;
create table DONDH(
  SoDH int primary key auto_increment,
  NgayDH date,
  NHACC_MaCC int,
  foreign key (NHACC_MaCC) references NHACC(MaCC)
);
create table VATTU(
MaVTU int primary key auto_increment,
TenVT nvarchar(50)

);
drop table if exists DONDH_VATTU;
create table DONDH_VATTU(
DONDH_SoDH int,
VATTU_MaVTU int,
primary key(DONDH_SoDH,VATTU_MaVTU),
foreign key (DONDH_SoDH) references DONDH(SoDH),
foreign key (VATTU_MaVTU) references VATTU(MaVTU)
);
create table PHIEUXUAT(
SoPX int primary key auto_increment,
NgayXuat date
);
create table VATTU_PHIEUXUAT(
VATTU_MaVTU int,
PHIEUXUAT_SOPX int,
DGXuat nvarchar(50),
SLXuat int,
primary key(VATTU_MaVTU,PHIEUXUAT_SOPX),
foreign key(VATTU_MaVTU) references VATTU(MaVTU),
foreign key(PHIEUXUAT_SOPX) references PHIEUXUAT(SOPX)
);
create table PHIEUNHAP(
SoPN int primary key auto_increment,
NgayNhap int
);
create table PHIEUNHAP_VATTU(
PHIEUNHAP_SoPN int,
VATTU_MaVTU int,
primary key(PHIEUNHAP_SoPN,VATTU_MaVTU),
foreign key(PHIEUNHAP_SoPN) references PHIEUNHAP(SoPN),
foreign key(VATTU_MaVTU) references VATTU(MaVTU)
);