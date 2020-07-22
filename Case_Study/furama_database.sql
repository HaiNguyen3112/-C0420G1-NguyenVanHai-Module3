-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: furuma
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bophan`
--

DROP TABLE IF EXISTS `bophan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bophan` (
  `IDBoPhan` int NOT NULL AUTO_INCREMENT,
  `TenBoPhan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDBoPhan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bophan`
--

LOCK TABLES `bophan` WRITE;
/*!40000 ALTER TABLE `bophan` DISABLE KEYS */;
INSERT INTO `bophan` VALUES (1,'Sales-Marketing'),(2,'Hanh Chinh'),(3,'Phuc Vu'),(4,'Quan Ly');
/*!40000 ALTER TABLE `bophan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dichvu`
--

DROP TABLE IF EXISTS `dichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dichvu` (
  `IDDichVu` int NOT NULL AUTO_INCREMENT,
  `TenDichVu` varchar(45) DEFAULT NULL,
  `DienTich` int DEFAULT NULL,
  `SoTang` int DEFAULT NULL,
  `SoNguoi` int DEFAULT NULL,
  `ChiPhiThue` int DEFAULT NULL,
  `IDLoaiDichVu` int DEFAULT NULL,
  `IDKieuThue` int DEFAULT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDDichVu`),
  KEY `IDLoaiDichVu` (`IDLoaiDichVu`),
  KEY `IDKieuThue` (`IDKieuThue`),
  CONSTRAINT `dichvu_ibfk_1` FOREIGN KEY (`IDLoaiDichVu`) REFERENCES `loaidichvu` (`IDLoaiDichVu`),
  CONSTRAINT `dichvu_ibfk_2` FOREIGN KEY (`IDKieuThue`) REFERENCES `kieuthue` (`IDKieuThue`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dichvu`
--

LOCK TABLES `dichvu` WRITE;
/*!40000 ALTER TABLE `dichvu` DISABLE KEYS */;
INSERT INTO `dichvu` VALUES (1,'Villa1',150,3,5,1500000,1,1,'ok'),(2,'House1',100,2,3,1000000,2,3,'ok'),(3,'Room1',50,1,2,750000,3,2,'ok'),(5,'Villa2',150,4,5,1600000,4,2,'ok');
/*!40000 ALTER TABLE `dichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dichvudikem`
--

DROP TABLE IF EXISTS `dichvudikem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dichvudikem` (
  `IDDichVuDiKem` int NOT NULL AUTO_INCREMENT,
  `TenDichVuDiKem` varchar(45) DEFAULT NULL,
  `Gia` int DEFAULT NULL,
  `DonVi` int DEFAULT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDDichVuDiKem`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dichvudikem`
--

LOCK TABLES `dichvudikem` WRITE;
/*!40000 ALTER TABLE `dichvudikem` DISABLE KEYS */;
INSERT INTO `dichvudikem` VALUES (1,'Karaoke',150000,NULL,NULL),(2,'Food',200000,NULL,NULL),(3,'Massage',160000,NULL,NULL),(4,'Drink',100000,NULL,NULL);
/*!40000 ALTER TABLE `dichvudikem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopdong`
--

DROP TABLE IF EXISTS `hopdong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopdong` (
  `IDHopDong` int NOT NULL AUTO_INCREMENT,
  `IDNhanVien` int DEFAULT NULL,
  `IDKhachHang` int DEFAULT NULL,
  `IDDichVu` int DEFAULT NULL,
  `NgayLamHopDong` date DEFAULT NULL,
  `NgayKetThuc` date DEFAULT NULL,
  `TienDatCoc` int DEFAULT NULL,
  `TongTien` int DEFAULT NULL,
  PRIMARY KEY (`IDHopDong`),
  KEY `IDKhachHang` (`IDKhachHang`),
  KEY `IDDichVu` (`IDDichVu`),
  KEY `IDNhanVien` (`IDNhanVien`),
  CONSTRAINT `hopdong_ibfk_1` FOREIGN KEY (`IDKhachHang`) REFERENCES `khachhang` (`IDKhachHang`),
  CONSTRAINT `hopdong_ibfk_2` FOREIGN KEY (`IDDichVu`) REFERENCES `dichvu` (`IDDichVu`),
  CONSTRAINT `hopdong_ibfk_3` FOREIGN KEY (`IDNhanVien`) REFERENCES `nhanvien` (`IDNhanVien`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopdong`
--

LOCK TABLES `hopdong` WRITE;
/*!40000 ALTER TABLE `hopdong` DISABLE KEYS */;
INSERT INTO `hopdong` VALUES (13,1,1,1,'2019-01-23','2019-01-30',NULL,123123),(14,2,2,2,'2018-12-12','2018-12-20',NULL,123123),(15,3,3,3,'2020-03-03','2020-03-15',NULL,12),(16,1,1,1,'2019-06-03','2019-06-17',NULL,45),(17,2,5,1,'2019-08-06','2019-08-27',NULL,12),(18,1,6,2,'2019-02-05','2019-03-05',NULL,45),(19,4,1,1,'2019-12-30','2020-01-05',NULL,87),(20,3,2,3,'2019-10-19','2019-10-24',NULL,36),(24,1,2,5,'2018-05-05','2018-05-15',NULL,NULL),(25,1,1,1,'2019-06-03','2019-06-17',NULL,45);
/*!40000 ALTER TABLE `hopdong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopdongchitiet`
--

DROP TABLE IF EXISTS `hopdongchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopdongchitiet` (
  `IDHopDongChiTiet` int NOT NULL AUTO_INCREMENT,
  `IDHopDong` int DEFAULT NULL,
  `IDDichVuDiKem` int DEFAULT NULL,
  `SoLuong` int DEFAULT NULL,
  PRIMARY KEY (`IDHopDongChiTiet`),
  KEY `IDHopDong` (`IDHopDong`),
  KEY `IDDichVuDiKem` (`IDDichVuDiKem`),
  CONSTRAINT `hopdongchitiet_ibfk_1` FOREIGN KEY (`IDHopDong`) REFERENCES `hopdong` (`IDHopDong`),
  CONSTRAINT `hopdongchitiet_ibfk_2` FOREIGN KEY (`IDDichVuDiKem`) REFERENCES `dichvudikem` (`IDDichVuDiKem`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopdongchitiet`
--

LOCK TABLES `hopdongchitiet` WRITE;
/*!40000 ALTER TABLE `hopdongchitiet` DISABLE KEYS */;
INSERT INTO `hopdongchitiet` VALUES (1,13,1,2),(2,14,2,3),(3,15,3,5),(4,16,4,4),(5,17,1,3),(6,18,3,1),(7,19,4,1),(8,20,2,1),(9,20,2,1);
/*!40000 ALTER TABLE `hopdongchitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `IDKhachHang` int NOT NULL AUTO_INCREMENT,
  `IDLoaiKhach` int DEFAULT NULL,
  `HoTen` varchar(45) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `SoCMND` varchar(45) DEFAULT NULL,
  `SDT` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `DiaChi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDKhachHang`),
  KEY `IDLoaiKhach` (`IDLoaiKhach`),
  CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`IDLoaiKhach`) REFERENCES `loaikhach` (`IDLoaiKhach`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,1,'Jame','1995-10-23','123465789','232323232','jame123@gamil.com','Quang Tri'),(2,3,'Ronaldo','1985-10-15','12346523','2356523232','ronaldo123@gamil.com','Da Nang'),(3,2,'Rooney','1987-10-15','123123','2356232','rooney@gamil.com','Ha Nam'),(4,2,'Rashford','2000-09-23','12312233','235623267','rashford@gamil.com','Dong Nai'),(5,4,'Hai','1994-12-31','1654623','23562267','nguyenhai@gamil.com','Da Nang'),(6,4,'asd','1950-12-12','123123','123123','sdfsdf','Quang Tri'),(7,4,'Hai','2000-12-23','2654564','6544891','asdad','Ha Nam'),(8,1,'Hai','2000-12-23','2654564','6544891','asdad','Vinh');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kieuthue`
--

DROP TABLE IF EXISTS `kieuthue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kieuthue` (
  `IDKieuThue` int NOT NULL AUTO_INCREMENT,
  `TenKieuThue` varchar(45) DEFAULT NULL,
  `Gia` int DEFAULT NULL,
  PRIMARY KEY (`IDKieuThue`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kieuthue`
--

LOCK TABLES `kieuthue` WRITE;
/*!40000 ALTER TABLE `kieuthue` DISABLE KEYS */;
INSERT INTO `kieuthue` VALUES (1,'Year',1000000),(2,'Month',120000),(3,'Day',10000),(4,'Hours',5000);
/*!40000 ALTER TABLE `kieuthue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaidichvu`
--

DROP TABLE IF EXISTS `loaidichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaidichvu` (
  `IDLoaiDichVu` int NOT NULL AUTO_INCREMENT,
  `TenDichVu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDLoaiDichVu`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaidichvu`
--

LOCK TABLES `loaidichvu` WRITE;
/*!40000 ALTER TABLE `loaidichvu` DISABLE KEYS */;
INSERT INTO `loaidichvu` VALUES (1,'Villa'),(2,'House'),(3,'Room'),(4,'Normal');
/*!40000 ALTER TABLE `loaidichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaikhach`
--

DROP TABLE IF EXISTS `loaikhach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaikhach` (
  `IDLoaiKhach` int NOT NULL AUTO_INCREMENT,
  `TenLoaiKhach` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDLoaiKhach`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaikhach`
--

LOCK TABLES `loaikhach` WRITE;
/*!40000 ALTER TABLE `loaikhach` DISABLE KEYS */;
INSERT INTO `loaikhach` VALUES (1,'Diamond'),(2,'Platinum'),(3,'Gold'),(4,'Silver'),(5,'Member');
/*!40000 ALTER TABLE `loaikhach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `IDNhanVien` int NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(45) DEFAULT NULL,
  `IDViTri` int DEFAULT NULL,
  `IDTrinhDo` int DEFAULT NULL,
  `IDBoPhan` int DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `SoCMND` varchar(45) DEFAULT NULL,
  `Luong` varchar(45) DEFAULT NULL,
  `SDT` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `DiaChi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDNhanVien`),
  KEY `IDViTri` (`IDViTri`),
  KEY `IDTrinhDo` (`IDTrinhDo`),
  KEY `IDBoPhan` (`IDBoPhan`),
  CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`IDViTri`) REFERENCES `vitri` (`IDViTri`),
  CONSTRAINT `nhanvien_ibfk_2` FOREIGN KEY (`IDTrinhDo`) REFERENCES `trinhdo` (`IDTrinhDo`),
  CONSTRAINT `nhanvien_ibfk_3` FOREIGN KEY (`IDBoPhan`) REFERENCES `bophan` (`IDBoPhan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'Hai',4,1,1,'1994-12-31','168547999','32213212','0389716547','nguyenhai@gmail.com','Da Nang'),(2,'Khanh',2,2,2,'1995-12-31','265168686','123123','0564935733','khanhtran@gmail.com','Quang Tri'),(3,'Huong',6,3,4,'2000-10-19','123123345','4574645','0565935733','huongmiu@gmail.com','Quang Nam'),(4,'Thao',2,3,4,'2000-10-20','123124234','23423412','0563322333','thaotran@gmail.com','Bien Hoa'),(5,'An',2,3,4,'1996-12-12','123124234','123123','0389322333','hungtran@gmail.com','Dong Nai'),(6,'King Van Duongggggg',1,2,3,'1996-12-12','123124234','123123','0389322333','hungtran@gmail.com','Dong Nai');
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trinhdo`
--

DROP TABLE IF EXISTS `trinhdo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trinhdo` (
  `IDTrinhDo` int NOT NULL AUTO_INCREMENT,
  `TrinhDo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDTrinhDo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trinhdo`
--

LOCK TABLES `trinhdo` WRITE;
/*!40000 ALTER TABLE `trinhdo` DISABLE KEYS */;
INSERT INTO `trinhdo` VALUES (1,'Trung Cap'),(2,'Cao Dang'),(3,'Dai Hoc'),(4,'Sau Dai Hoc');
/*!40000 ALTER TABLE `trinhdo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vitri`
--

DROP TABLE IF EXISTS `vitri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vitri` (
  `IDViTri` int NOT NULL AUTO_INCREMENT,
  `TenViTri` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDViTri`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitri`
--

LOCK TABLES `vitri` WRITE;
/*!40000 ALTER TABLE `vitri` DISABLE KEYS */;
INSERT INTO `vitri` VALUES (1,'Le Tan'),(2,'Phuc Vu'),(3,'Chuyen Vien'),(4,'Giam Sat'),(5,'Quan Ly'),(6,'Giam Doc');
/*!40000 ALTER TABLE `vitri` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-22 15:23:19
