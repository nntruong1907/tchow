-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: tchow
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sanpham` (`pid`),
  KEY `nguoimua` (`user_id`),
  CONSTRAINT `nguoimua` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `sanpham` FOREIGN KEY (`pid`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `number` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nguoigui` (`user_id`),
  CONSTRAINT `nguoigui` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,2,'User 1','user01@gmail.com','0123456789','Hello World!');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `number` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `total_products` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `doncua` (`user_id`),
  CONSTRAINT `doncua` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,'User 1','0123456789','u1@gmail.com','cod','Duong 19 XK NK CT',', K???o the v??? xo??i Playmore ( 1 ), S?? c?? la KitKat Chunky ( 1 )',47000,'27-Apr-2022','completed'),(2,2,'User 1','0123456789','u1@gmail.com','tindung','Duong 21 XK NK CT',', B??nh quy kem vi???t qu???t Oreo ( 1 ), Snack b???p ng???t Oishi ( 1 )',23000,'27-Apr-2022','pending');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `details` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'B??nh b??ng lan cu???n v??? d??u Solite','banhquy','B??nh b??ng lan cu???n v??? d??u Solite h???p 360g',47000,'B??nh b??ng lan cu???n v??? d??u Solite h???p 360g.jpg'),(2,'B??nh quy kem vi???t qu???t Oreo','banhquy','B??nh quy kem vi???t qu???t Oreo g??i 133g',18000,'B??nh quy kem vi???t qu???t Oreo g??i 133g.jpg'),(3,'B??nh tr???ng Tipo H???u Ngh???','banhquy','B??nh tr???ng Tipo H???u Ngh??? g??i 220g',39000,'B??nh tr???ng Tipo H???u Ngh??? g??i 220g.jpg'),(4,'?????u ph???ng v??? ph?? mai T??n T??n','saykho','?????u ph???ng v??? ph?? mai T??n T??n lon 200g',42000,'?????u ph???ng v??? ph?? mai T??n T??n lon 200g.jpg'),(5,'M??t s???y Vinamit','saykho','M??t s???y Vinamit g??i 100g',34000,'M??t s???y Vinamit g??i 100g.jpg'),(6,'?????u ph???ng da c?? T??n T??n','saykho','?????u ph???ng da c?? T??n T??n g??i 285g',34000,'?????u ph???ng da c?? T??n T??n g??i 285g.jpg'),(7,'K???o gum h????ng b???c h?? Doublemint','keo','K???o gum h????ng b???c h?? Doublemint h???p 58.4g',25000,'K???o gum h????ng b???c h?? Doublemint h???p 58.4g.jpg'),(8,'K???o the v??? xo??i Playmore','keo','K???o the v??? xo??i Playmore h?? 22g',32000,'K???o the v??? xo??i Playmore h?? 22g.jpg'),(9,'S?? c?? la KitKat Chunky','keo','S?? c?? la KitKat Chunky g??i 38g',15000,'S?? c?? la KitKat Chunky g??i 38g.jpg'),(10,'Snack khoai t??y v??? t??? nhi??n Slide','snack','Snack khoai t??y v??? t??? nhi??n Slide lon 75g',28000,'Snack khoai t??y v??? t??? nhi??n Slide lon 75g.jpg'),(11,'Snack b???p ng???t Oishi','snack','Snack b???p ng???t Oishi g??i 42g',5000,'Snack b???p ng???t Oishi g??i 42g.jpg'),(12,'Snack v??? b?? l??c l???c Poca','snack','Snack v??? b?? l??c l???c Poca g??i 75g',10000,'Snack v??? b?? l??c l???c Poca g??i 75g.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin 1','admin01@gmail.com','202cb962ac59075b964b07152d234b70','admin','avt1.png'),(2,'User 1','u1@gmail.com','202cb962ac59075b964b07152d234b70','user','avt3.png'),(3,'Admin 2','admin02@gmail.com','202cb962ac59075b964b07152d234b70','admin','avt16.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nguoithich` (`user_id`),
  KEY `thichsp` (`pid`),
  CONSTRAINT `nguoithich` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `thichsp` FOREIGN KEY (`pid`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,2,1,'B??nh b??ng lan cu???n v??? d??u Solite',47000,'B??nh b??ng lan cu???n v??? d??u Solite h???p 360g.jpg'),(2,2,3,'B??nh tr???ng Tipo H???u Ngh???',39000,'B??nh tr???ng Tipo H???u Ngh??? g??i 220g.jpg');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-28 12:09:59
