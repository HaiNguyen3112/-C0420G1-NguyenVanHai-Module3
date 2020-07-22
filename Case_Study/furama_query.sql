use furuma;
-- Bai 2:	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
SELECT 
    *
FROM
    NhanVien
WHERE
    HoTen REGEXP BINARY '^[HKT].{0,14}$';


-- Bai 3:	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

SELECT 
    IDKhachHang,
    HoTen,
    NgaySinh,
    TIMESTAMPDIFF(YEAR,
        NgaySinh,
        CURRENT_DATE()) AS 'Tuoi'
FROM
    KhachHang
WHERE
    DiaChi IN ('Quang Tri' , 'Da Nang')
HAVING (Tuoi > 18 AND Tuoi < 50);


-- Bai 4:	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT 
    kh.IDKhachHang,
    lk.TenLoaiKhach,
    HoTen,
    COUNT(hd.IDHopDong) AS 'So lan dat'
FROM
    khachhang kh
        INNER JOIN
    loaikhach lk ON kh.IDLoaiKhach = lk.IDLoaiKhach
        INNER JOIN
    hopdong hd ON kh.IDKhachHang = hd.IDKhachHang
WHERE
    lk.TenLoaiKhach = 'Diamond'
GROUP BY kh.IDKhachHang;

-- Bai 5: Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
-- (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng.  
-- (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
-- sum(dv.ChiPhiThue + dvdk.DonVi*dvdk.Gia) as "Tong tien"

SELECT 
    kh.IDKhachHang,
    kh.HoTen,
    lk.TenLoaiKhach,
    hd.IDHopDong,
    ldv.TenDichVu,
    hd.NgayLamHopDong,
    hd.NgayKetThuc,
    SUM(dv.ChiPhiThue + hdct.SoLuong * dvdk.Gia) AS 'Tong tien'
FROM
    khachhang kh
        LEFT JOIN
    loaikhach lk ON kh.IDLoaiKhach = lk.IDLoaiKhach
        LEFT JOIN
    hopdong hd ON kh.IDKhachHang = hd.IDKhachHang
        LEFT JOIN
    dichvu dv ON hd.IDDichVu = dv.IDDichVu
        LEFT JOIN
    loaidichvu ldv ON dv.IDLoaiDichVu = ldv.IDLoaiDichVu
        LEFT JOIN
    hopdongchitiet hdct ON hdct.IDHopDong = hd.IDHopDong
        LEFT JOIN
    dichvudikem dvdk ON dvdk.IDDichVuDiKem = hdct.IDDichVuDiKem
GROUP BY kh.IDKhachHang;

-- Bai 6:	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng 
-- thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

SELECT 
    dv.IDDichVu,
    ldv.TenDichVu,
    dv.DienTich,
    dv.ChiPhiThue,
    hd.NgayLamHopDong
FROM
    loaidichvu ldv
        LEFT JOIN
    dichvu dv ON dv.IDLoaiDichVu = ldv.IDLoaiDichVu
        LEFT JOIN
    hopdong hd ON dv.IDDichVu = hd.IDDichVu
WHERE
    YEAR(hd.NgayLamHopDong) = 2019
        AND MONTH(hd.NgayLamHopDong) IN (1 , 2, 3);
        
-- Bai 7: Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu 
-- của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.

SELECT 
    dv.IDDichVu,
    dv.TenDichVu,
    dv.DienTich,
    dv.SoNguoi,
    dv.ChiPhiThue,
    ldv.TenDichVu
FROM
    loaidichvu ldv
        LEFT JOIN
    dichvu dv ON dv.IDLoaiDichVu = ldv.IDLoaiDichVu
        LEFT JOIN
    hopdong hd ON dv.IDDichVu = hd.IDDichVu
WHERE
    YEAR(hd.NgayLamHopDong) = 2018
        AND dv.IDDichVu NOT IN (SELECT 
            dv.IDDichVu
        FROM
            loaidichvu ldv
                LEFT JOIN
            dichvu dv ON dv.IDLoaiDichVu = ldv.IDLoaiDichVu
                LEFT JOIN
            hopdong hd ON dv.IDDichVu = hd.IDDichVu
        WHERE
            YEAR(hd.NgayLamHopDong) = 2019);
            
-- Bai 8. Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoTenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên

-- Cach 1: 
SELECT DISTINCT
    HoTen
FROM
    khachhang;
    
-- Cach 2:
SELECT 
    hoten
FROM
    khachhang
GROUP BY HoTen;

-- Cach 3:
SELECT 
    hoten
FROM
    khachhang 
UNION SELECT 
    hoten
FROM
    khachhang;

-- Bai 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT 
    MONTH(hd.ngaylamhopdong),
    COUNT(hd.IDKhachHang),
    SUM(hd.TongTien)
FROM
    hopdong hd
WHERE
    YEAR(hd.ngaylamhopdong) = 2019
GROUP BY MONTH(hd.ngaylamhopdong);

-- Bai 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).

SELECT 
    hd.IDHopDong,
    hd.NgayLamHopDong,
    hd.NgayKetThuc,
    hd.TienDatCoc,
    COUNT(hdct.IDHopDongChiTiet) AS SoLuongDichVuDiKem
FROM
    furuma.hopdong hd
        INNER JOIN
    furuma.hopdongchitiet hdct ON hd.IDHopDong = hdct.IDHopDong
GROUP BY hd.IDHopDong;

-- Bai 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.

SELECT 
    kh.Hoten,
    kh.Diachi,
    lkh.TenLoaiKhach,
    dvdk.TenDichVuDiKem,
    dvdk.Gia,
    dvdk.DonVi
FROM
    KhachHang kh
        JOIN
    LoaiKhach lkh ON kh.IDLoaiKhach = lkh.IdLoaiKhach
        JOIN
    HopDong hd ON hd.IDKhachHang = kh.IDKhachHang
        JOIN
    HopDongChitiet hdct ON hdct.IDHopDong = hd.IDHopDong
        JOIN
    DichVuDiKem dvdk ON dvdk.IDDichVuDiKem = hdct.IDDichVuDiKem
WHERE
    lkh.TenLoaiKhach = 'Diamond'
        AND kh.DiaChi IN ('Vinh' , 'Quang Ngai');