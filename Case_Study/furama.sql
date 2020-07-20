CREATE DATABASE furama_management;
USE furama_management;

CREATE TABLE DichVu (
    IDDichVu INT AUTO_INCREMENT,
    TenDichVu VARCHAR(45),
    DienTich INT,
    SoTang INT,
    SoNguoi INT,
    ChiPhiThue INT,
    IDLoaiDichVu INT,
    IDKieuThue INT,
    TrangThai VARCHAR(45),
    PRIMARY KEY (IDDichVu)
);

CREATE TABLE KieuThue (
    IDKieuThue INT AUTO_INCREMENT,
    TenKieuThue VARCHAR(45),
    Gia int,
    PRIMARY KEY (IDKieuThue)
);

CREATE TABLE LoaiDichVu (
    IDLoaiDichVu INT AUTO_INCREMENT,
    TenDichVu VARCHAR(45),
    PRIMARY KEY (IDLoaiDichVu)
);

CREATE TABLE LoaiKhach (
    IDLoaiKhach INT AUTO_INCREMENT,
    TenLoaiKhach VARCHAR(45),
    PRIMARY KEY (IDLoaiKhach)
);

CREATE TABLE KhachHang (
    IDKhachHang INT AUTO_INCREMENT,
    IDLoaiKhach INT,
    HoTen VARCHAR(45),
    NgaySinh DATE,
    SoCMND VARCHAR(45),
    SDT VARCHAR(45),
    Email VARCHAR(45),
    DiaChi VARCHAR(45),
    PRIMARY KEY (IDKhachHang)
);
CREATE TABLE HopDong (
    IDHopDong INT AUTO_INCREMENT,
    IDNhanVien INT,
    IDKhachHang INT,
    IDDichVu INT,
    NgayLamHopDong DATE,
    NgayKetThuc DATE,
    TienDatCoc INT,
    TongTien INT,
    PRIMARY KEY (IDHopDong)
);

CREATE TABLE HopDongChiTiet (
    IDHopDongChiTiet INT AUTO_INCREMENT,
    IDHopDong INT,
    IDDichVuDiKem INT,
    SoLuong INT,
    PRIMARY KEY (IDHopDongChiTiet)
);

CREATE TABLE DichVuDiKem (
    IDDichVuDiKem INT AUTO_INCREMENT,
    TenDichVuDiKem VARCHAR(45),
    Gia INT,
    DonVi INT,
    TrangThai VARCHAR(45),
    PRIMARY KEY (IDDichVuDiKem)
);

CREATE TABLE NhanVien (
    IDNhanVien INT AUTO_INCREMENT,
    HoTen VARCHAR(45),
    IDViTri INT,
    IDTrinhDo INT,
    IDBoPhan INT,
    NgaySinh DATE,
    SoCMND VARCHAR(45),
    Luong VARCHAR(45),
    SDT VARCHAR(45),
    Email VARCHAR(45),
    DiaChi VARCHAR(45),
    PRIMARY KEY (IDNhanVien)
);

CREATE TABLE ViTri (
    IDViTri INT AUTO_INCREMENT,
    TenViTri VARCHAR(45),
    PRIMARY KEY (IDViTri)
);

CREATE TABLE TrinhDo (
    IDTrinhDo INT AUTO_INCREMENT,
    TrinhDo VARCHAR(45),
    PRIMARY KEY (IDTrinhDo)
);

CREATE TABLE BoPhan (
    IDBoPhan INT AUTO_INCREMENT,
    TenBoPhan VARCHAR(45),
    PRIMARY KEY (IDBoPhan)
);

ALTER TABLE DichVu ADD FOREIGN KEY(IDLoaiDichVu) REFERENCES LoaiDichVu(IDLoaiDichVu);
ALTER TABLE DichVu ADD FOREIGN KEY(IDKieuThue) REFERENCES KieuThue(IDKieuThue);

ALTER TABLE KhachHang ADD FOREIGN KEY(IDLoaiKhach) REFERENCES LoaiKhach(IDLoaiKhach);

ALTER TABLE HopDong ADD FOREIGN KEY(IDKhachHang) REFERENCES KhachHang(IDKhachHang);
ALTER TABLE HopDong ADD FOREIGN KEY(IDDichVu) REFERENCES DichVu(IDDichVu);
ALTER TABLE HopDong ADD FOREIGN KEY(IDNhanVien) REFERENCES NhanVien(IDNhanVien);

ALTER TABLE HopDongChiTiet ADD FOREIGN KEY(IDHopDong) REFERENCES HopDong(IDHopDong);
ALTER TABLE HopDongChiTiet ADD FOREIGN KEY(IDDichVuDiKem) REFERENCES DichVuDiKem(IDDichVuDiKem);

ALTER TABLE NhanVien ADD FOREIGN KEY(IDViTri) REFERENCES ViTri(IDViTri);
ALTER TABLE NhanVien ADD FOREIGN KEY(IDTrinhDo) REFERENCES TrinhDo(IDTrinhDo);
ALTER TABLE NhanVien ADD FOREIGN KEY(IDBoPhan) REFERENCES BoPhan(IDBoPhan);



insert into LoaiDichVu (TenDichVu) values ("Villa"),("House"),("Room");
insert into KieuThue (TenKieuThue,Gia) values ("Year",1000000),("Month",120000),("Day",10000),("Hours",5000);
insert into LoaiKhach(TenLoaiKhach) values("Diamond"),("Platinum"),("Gold"),("Silver"),("Member");
insert into ViTri(TenViTri) values("Le Tan"),("Phuc Vu"),("Chuyen Vien"),("Giam Sat"),("Quan Ly"),("Giam Doc");
insert into TrinhDo(TrinhDo) values("Trung Cap"),("Cao Dang"),("Dai Hoc"),("Sau Dai Hoc");
insert into BoPhan(TenBoPhan) values("Sales-Marketing"),("Hanh Chinh"),("Phuc Vu"),("Quan Ly");



