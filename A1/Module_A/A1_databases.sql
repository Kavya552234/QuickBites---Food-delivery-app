CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.45, for macos15 (arm64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `address_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `house_no` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (501,101,'12-4-56','Madhapur','Hyderabad','500081','Near Metro'),(502,102,'45-2-11','Gachibowli','Hyderabad','500032','Opposite Mall'),(503,103,'8-1-22','Kukatpally','Hyderabad','500072',NULL),(504,104,'2-3-90','Banjara Hills','Hyderabad','500034','Road No 12'),(505,105,'10-5-18','Ameerpet','Hyderabad','500016',NULL),(506,106,'1-9-30','Begumpet','Hyderabad','500003','Near Airport Road'),(507,107,'4-6-77','Hitech City','Hyderabad','500081','Cyber Towers'),(508,108,'6-3-44','Manikonda','Hyderabad','500089','Near Park'),(509,109,'3-2-88','Kondapur','Hyderabad','500084','Opp IT Park'),(510,110,'7-8-99','Jubilee Hills','Hyderabad','500033','Near Checkpost'),(511,111,'9-1-55','Secunderabad','Hyderabad','500003','Near Station'),(512,112,'2-4-66','Miyapur','Hyderabad','500049','Near Bus Stop'),(513,113,'5-6-78','LB Nagar','Hyderabad','500074','Near Temple'),(514,114,'8-9-11','Dilsukhnagar','Hyderabad','500060','Opp Hospital'),(515,115,'3-5-12','Shamshabad','Hyderabad','500409','Near Airport');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `category_id` int NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `is_veg` tinyint(1) NOT NULL,
  `description` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (601,'Biryani',0,'Traditional rice dish with spices'),(602,'Pizza',1,'Italian baked flatbread with toppings'),(603,'Burger',0,'Grilled patty served inside buns'),(604,'South Indian',1,'Dosa, Idli, and regional dishes'),(605,'Chinese',1,'Indo-Chinese style dishes'),(606,'Desserts',1,'Sweet dishes and sweets'),(607,'Beverages',1,NULL),(608,'North Indian',1,'Curries and tandoor dishes'),(609,'Snacks',1,NULL),(610,'Seafood',0,'Fish and prawn based dishes');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `customer_id` int NOT NULL,
  `member_id` int NOT NULL,
  `signup_date` date NOT NULL,
  `loyalty_points` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `member_id` (`member_id`),
  CONSTRAINT `fk_customer_member` FOREIGN KEY (`member_id`) REFERENCES `Member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chk_loyalty_points` CHECK ((`loyalty_points` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (101,1,'2024-01-01',120),(102,2,'2024-01-05',80),(103,3,'2024-01-10',200),(104,4,'2024-01-15',50),(105,5,'2024-02-01',160),(106,6,'2024-02-10',NULL),(107,7,'2024-02-15',90),(108,8,'2024-03-01',40),(109,9,'2024-03-05',110),(110,10,'2024-03-10',75),(111,11,'2024-03-15',60),(112,12,'2024-04-01',140),(113,13,'2024-04-10',20),(114,14,'2024-04-15',100),(115,15,'2024-05-01',55);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delivery`
--

DROP TABLE IF EXISTS `Delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delivery` (
  `delivery_id` int NOT NULL,
  `order_id` int NOT NULL,
  `partner_id` int NOT NULL,
  `delivery_status` varchar(30) DEFAULT NULL,
  `delivery_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `order_id` (`order_id`),
  KEY `fk_delivery_partner` (`partner_id`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `DeliveryPartner` (`partner_id`),
  CONSTRAINT `fk_delivery_partner` FOREIGN KEY (`partner_id`) REFERENCES `DeliveryPartner` (`partner_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chk_delivery_status` CHECK ((`delivery_status` in (_utf8mb4'ASSIGNED',_utf8mb4'PICKED_UP',_utf8mb4'OUT_FOR_DELIVERY',_utf8mb4'DELIVERED',_utf8mb4'FAILED')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery`
--

LOCK TABLES `Delivery` WRITE;
/*!40000 ALTER TABLE `Delivery` DISABLE KEYS */;
INSERT INTO `Delivery` VALUES (1201,901,201,'ASSIGNED','2024-05-01 07:30:00'),(1202,902,202,'DELIVERED','2024-05-02 08:30:00'),(1203,904,203,'DELIVERED','2024-05-04 11:00:00'),(1204,905,204,'OUT_FOR_DELIVERY',NULL),(1205,906,205,'DELIVERED','2024-05-06 12:30:00'),(1206,907,206,'DELIVERED','2024-05-07 13:30:00'),(1207,908,207,'ASSIGNED',NULL),(1208,909,208,'DELIVERED','2024-05-09 15:30:00'),(1209,910,209,'OUT_FOR_DELIVERY','2024-05-10 16:30:00'),(1210,911,210,'DELIVERED','2024-05-11 06:30:00'),(1211,912,201,'ASSIGNED',NULL),(1212,913,202,'OUT_FOR_DELIVERY','2024-05-13 09:00:00'),(1213,914,203,'DELIVERED','2024-05-14 10:00:00'),(1214,915,204,'ASSIGNED',NULL),(1215,903,205,'FAILED',NULL);
/*!40000 ALTER TABLE `Delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeliveryLocation`
--

DROP TABLE IF EXISTS `DeliveryLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeliveryLocation` (
  `location_id` int NOT NULL,
  `delivery_id` int NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `recorded_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `fk_location_delivery` (`delivery_id`),
  CONSTRAINT `deliverylocation_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `Delivery` (`delivery_id`),
  CONSTRAINT `fk_location_delivery` FOREIGN KEY (`delivery_id`) REFERENCES `Delivery` (`delivery_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeliveryLocation`
--

LOCK TABLES `DeliveryLocation` WRITE;
/*!40000 ALTER TABLE `DeliveryLocation` DISABLE KEYS */;
INSERT INTO `DeliveryLocation` VALUES (1301,1201,17.450000,78.380000,'2024-05-01 07:35:00'),(1302,1201,17.455000,78.385000,'2024-05-01 07:40:00'),(1303,1202,17.460000,78.390000,'2024-05-02 08:40:00'),(1304,1202,17.465000,78.395000,'2024-05-02 08:50:00'),(1305,1203,17.470000,78.400000,'2024-05-04 11:05:00'),(1306,1204,17.475000,78.405000,NULL),(1307,1205,17.480000,78.410000,'2024-05-06 12:40:00'),(1308,1206,17.485000,78.415000,'2024-05-07 13:40:00'),(1309,1207,17.490000,78.420000,NULL),(1310,1208,17.495000,78.425000,'2024-05-09 15:40:00'),(1311,1209,17.500000,78.430000,'2024-05-10 16:40:00'),(1312,1210,17.505000,78.435000,'2024-05-11 06:40:00'),(1313,1211,17.510000,78.440000,NULL),(1314,1212,17.515000,78.445000,'2024-05-13 09:10:00'),(1315,1213,17.520000,78.450000,'2024-05-14 10:10:00'),(1316,1214,17.525000,78.455000,NULL),(1317,1215,17.530000,78.460000,NULL),(1318,1203,17.535000,78.465000,'2024-05-04 11:15:00'),(1319,1206,17.540000,78.470000,'2024-05-07 13:50:00'),(1320,1210,17.545000,78.475000,'2024-05-11 06:50:00');
/*!40000 ALTER TABLE `DeliveryLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeliveryPartner`
--

DROP TABLE IF EXISTS `DeliveryPartner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeliveryPartner` (
  `partner_id` int NOT NULL,
  `member_id` int NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `availability_status` varchar(20) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`partner_id`),
  UNIQUE KEY `member_id` (`member_id`),
  CONSTRAINT `deliverypartner_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `Member` (`member_id`),
  CONSTRAINT `chk_partner_rating` CHECK ((`rating` between 1 and 5)),
  CONSTRAINT `chk_vehicle_type` CHECK ((`vehicle_type` in (_utf8mb4'BIKE',_utf8mb4'SCOOTER',_utf8mb4'CAR',_utf8mb4'BICYCLE')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeliveryPartner`
--

LOCK TABLES `DeliveryPartner` WRITE;
/*!40000 ALTER TABLE `DeliveryPartner` DISABLE KEYS */;
INSERT INTO `DeliveryPartner` VALUES (201,11,'BIKE','AVAILABLE',4.5),(202,12,'SCOOTER','AVAILABLE',4.2),(203,13,'CAR','BUSY',4.8),(204,16,'BIKE','AVAILABLE',4.1),(205,17,'SCOOTER','BUSY',4.6),(206,18,'BIKE','AVAILABLE',4.3),(207,19,'CAR','AVAILABLE',NULL),(208,20,'SCOOTER','BUSY',4.4),(209,5,'BIKE','AVAILABLE',4.0),(210,6,'CAR','AVAILABLE',4.7);
/*!40000 ALTER TABLE `DeliveryPartner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeliveryReview`
--

DROP TABLE IF EXISTS `DeliveryReview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeliveryReview` (
  `delivery_review_id` int NOT NULL,
  `order_id` int NOT NULL,
  `partner_id` int NOT NULL,
  `rating` int NOT NULL,
  `comments` text,
  `review_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`delivery_review_id`),
  UNIQUE KEY `uq_deliveryreview_order` (`order_id`),
  KEY `fk_deliveryreview_partner` (`partner_id`),
  CONSTRAINT `deliveryreview_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deliveryreview_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `DeliveryPartner` (`partner_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_deliveryreview_partner` FOREIGN KEY (`partner_id`) REFERENCES `DeliveryPartner` (`partner_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeliveryReview`
--

LOCK TABLES `DeliveryReview` WRITE;
/*!40000 ALTER TABLE `DeliveryReview` DISABLE KEYS */;
INSERT INTO `DeliveryReview` VALUES (1501,901,201,5,'Very fast delivery','2024-05-01 08:35:00'),(1502,902,202,4,'Polite delivery partner','2024-05-02 09:35:00'),(1503,903,205,1,'Delivery failed',NULL),(1504,904,203,5,'On time delivery','2024-05-04 11:40:00'),(1505,905,204,4,NULL,'2024-05-05 12:40:00'),(1506,906,205,3,'Average service','2024-05-06 13:40:00'),(1507,907,206,5,'Very professional','2024-05-07 14:40:00'),(1508,908,207,4,'Good communication','2024-05-08 15:40:00'),(1509,909,208,4,NULL,'2024-05-09 16:40:00'),(1510,910,209,3,'Slightly delayed','2024-05-10 17:40:00'),(1511,911,210,5,'Excellent service','2024-05-11 07:40:00'),(1512,912,201,4,'Smooth delivery',NULL),(1513,913,202,3,'Okay experience','2024-05-13 10:40:00'),(1514,914,203,5,'Very quick','2024-05-14 12:10:00'),(1515,915,204,4,NULL,NULL);
/*!40000 ALTER TABLE `DeliveryReview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FoodReview`
--

DROP TABLE IF EXISTS `FoodReview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FoodReview` (
  `food_review_id` int NOT NULL,
  `order_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `rating` int NOT NULL,
  `comments` text,
  `review_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`food_review_id`),
  KEY `order_id` (`order_id`),
  KEY `fk_foodreview_restaurant` (`restaurant_id`),
  CONSTRAINT `fk_foodreview_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurant` (`restaurant_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foodreview_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `foodreview_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurant` (`restaurant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FoodReview`
--

LOCK TABLES `FoodReview` WRITE;
/*!40000 ALTER TABLE `FoodReview` DISABLE KEYS */;
INSERT INTO `FoodReview` VALUES (1401,901,401,5,'Excellent taste and packaging','2024-05-01 08:30:00'),(1402,902,402,4,'Good pizza but slightly cold','2024-05-02 09:30:00'),(1403,903,403,2,'Order was cancelled',NULL),(1404,904,404,5,'Amazing biryani','2024-05-04 11:30:00'),(1405,905,405,4,NULL,'2024-05-05 12:30:00'),(1406,906,406,3,'Food was okay','2024-05-06 13:30:00'),(1407,907,407,5,'Loved the seafood','2024-05-07 14:30:00'),(1408,908,408,4,'Desserts were fresh','2024-05-08 15:30:00'),(1409,909,409,4,NULL,'2024-05-09 16:30:00'),(1410,910,410,3,'Snacks were average','2024-05-10 17:30:00'),(1411,911,401,5,'Great service and taste','2024-05-11 07:30:00'),(1412,912,402,4,'Nice experience',NULL),(1413,913,403,3,'Burger was decent','2024-05-13 10:30:00'),(1414,914,404,5,'Highly recommended','2024-05-14 12:00:00'),(1415,915,405,4,NULL,NULL);
/*!40000 ALTER TABLE `FoodReview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Member`
--

DROP TABLE IF EXISTS `Member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Member` (
  `member_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `image_url` text,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Member`
--

LOCK TABLES `Member` WRITE;
/*!40000 ALTER TABLE `Member` DISABLE KEYS */;
INSERT INTO `Member` VALUES (1,'Aarav Sharma','aarav@gmail.com','9876500001',22,'images/m1.jpg'),(2,'Priya Reddy','priya@gmail.com','9876500002',25,'images/m2.jpg'),(3,'Rahul Verma','rahul@gmail.com','9876500003',28,NULL),(4,'Sneha Iyer','sneha@gmail.com','9876500004',23,'images/m4.jpg'),(5,'Arjun Mehta','arjun@gmail.com','9876500005',30,'images/m5.jpg'),(6,'Kavya Nair','kavya@gmail.com','9876500006',24,'images/m6.jpg'),(7,'Vikram Singh','vikram@gmail.com','9876500007',27,'images/m7.jpg'),(8,'Ananya Das','ananya@gmail.com','9876500008',21,'images/m8.jpg'),(9,'Rohan Gupta','rohan@gmail.com','9876500009',29,NULL),(10,'Meera Joshi','meera@gmail.com','9876500010',26,'images/m10.jpg'),(11,'Sanjay Kumar','sanjay@gmail.com','9876500011',31,'images/m11.jpg'),(12,'Divya Patel','divya@gmail.com','9876500012',22,'images/m12.jpg'),(13,'Aditya Rao','aditya@gmail.com','9876500013',28,'images/m13.jpg'),(14,'Neha Kapoor','neha@gmail.com','9876500014',24,'images/m14.jpg'),(15,'Kiran Babu','kiran@gmail.com','9876500015',27,'images/m15.jpg'),(16,'Manoj Kumar','manoj@gmail.com','9876500016',32,'images/m16.jpg'),(17,'Pooja Singh','pooja@gmail.com','9876500017',23,'images/m17.jpg'),(18,'Nikhil Jain','nikhil@gmail.com','9876500018',29,'images/m18.jpg'),(19,'Swathi Rao','swathi@gmail.com','9876500019',26,'images/m19.jpg'),(20,'Tarun Varma','tarun@gmail.com','9876500020',28,'images/m20.jpg');
/*!40000 ALTER TABLE `Member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MenuItem`
--

DROP TABLE IF EXISTS `MenuItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MenuItem` (
  `item_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `item_name` varchar(150) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `category_id` int DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  `image_url` text,
  PRIMARY KEY (`item_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `fk_menu_category` (`category_id`),
  CONSTRAINT `fk_menu_category` FOREIGN KEY (`category_id`) REFERENCES `Category` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `menuitem_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurant` (`restaurant_id`),
  CONSTRAINT `menuitem_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `Category` (`category_id`),
  CONSTRAINT `chk_price` CHECK ((`price` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuItem`
--

LOCK TABLES `MenuItem` WRITE;
/*!40000 ALTER TABLE `MenuItem` DISABLE KEYS */;
INSERT INTO `MenuItem` VALUES (701,401,'Chicken Biryani',250.00,601,1,'images/biryani1.jpg'),(702,401,'Veg Biryani',180.00,601,1,'images/biryani2.jpg'),(703,402,'Margherita Pizza',299.00,602,1,'images/pizza1.jpg'),(704,402,'Farmhouse Pizza',399.00,602,1,'images/pizza2.jpg'),(705,403,'Cheese Burger',149.00,603,1,'images/burger1.jpg'),(706,403,'Chicken Burger',199.00,603,1,NULL),(707,409,'Masala Dosa',120.00,604,1,'images/dosa1.jpg'),(708,406,'Paneer Butter Masala',220.00,608,1,'images/paneer1.jpg'),(709,405,'Hakka Noodles',180.00,605,1,'images/noodles1.jpg'),(710,405,'Fried Rice',170.00,605,1,'images/rice1.jpg'),(711,408,'Gulab Jamun',90.00,606,1,'images/gulab.jpg'),(712,408,'Ice Cream',80.00,606,1,NULL),(713,408,'Cold Coffee',110.00,607,1,'images/coffee.jpg'),(714,406,'Chole Bhature',160.00,608,1,'images/chole.jpg'),(715,410,'Pani Puri',60.00,609,1,'images/panipuri.jpg'),(716,407,'Fish Curry',320.00,610,1,'images/fish.jpg'),(717,406,'Tandoori Chicken',350.00,608,1,'images/tandoori.jpg'),(718,405,'Veg Manchurian',190.00,605,1,'images/manchurian.jpg'),(719,408,'Chocolate Cake',250.00,606,1,'images/cake.jpg'),(720,401,'Lassi',70.00,607,1,'images/lassi.jpg');
/*!40000 ALTER TABLE `MenuItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Offer`
--

DROP TABLE IF EXISTS `Offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Offer` (
  `offer_id` int NOT NULL,
  `offer_code` varchar(50) NOT NULL,
  `discount_type` varchar(20) NOT NULL,
  `discount_value` decimal(6,2) NOT NULL,
  `min_order_amount` decimal(10,2) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`offer_id`),
  UNIQUE KEY `offer_code` (`offer_code`),
  CONSTRAINT `chk_discount_value` CHECK ((`discount_value` > 0)),
  CONSTRAINT `chk_min_order` CHECK ((`min_order_amount` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Offer`
--

LOCK TABLES `Offer` WRITE;
/*!40000 ALTER TABLE `Offer` DISABLE KEYS */;
INSERT INTO `Offer` VALUES (801,'WELCOME10','PERCENTAGE',10.00,500.00,1),(802,'BIRYANI20','PERCENTAGE',20.00,600.00,1),(803,'PIZZA15','PERCENTAGE',15.00,700.00,1),(804,'BURGER5','PERCENTAGE',5.00,300.00,1),(805,'NEWUSER25','PERCENTAGE',25.00,800.00,1),(806,'FLAT100','FLAT',100.00,NULL,1),(807,'SWEET10','PERCENTAGE',10.00,400.00,1),(808,'LUNCH50','FLAT',50.00,500.00,NULL),(809,'DINNER15','PERCENTAGE',15.00,600.00,1),(810,'SAVE30','FLAT',30.00,200.00,1);
/*!40000 ALTER TABLE `Offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItem`
--

DROP TABLE IF EXISTS `OrderItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderItem` (
  `order_item_id` int NOT NULL,
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL,
  `item_price` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `fk_orderitem_order` (`order_id`),
  KEY `fk_orderitem_menu` (`item_id`),
  CONSTRAINT `fk_orderitem_menu` FOREIGN KEY (`item_id`) REFERENCES `MenuItem` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `MenuItem` (`item_id`),
  CONSTRAINT `chk_quantity` CHECK ((`quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItem`
--

LOCK TABLES `OrderItem` WRITE;
/*!40000 ALTER TABLE `OrderItem` DISABLE KEYS */;
INSERT INTO `OrderItem` VALUES (1001,901,701,2,250.00),(1002,901,720,1,70.00),(1003,902,703,1,299.00),(1004,902,704,1,399.00),(1005,903,705,2,149.00),(1006,904,701,2,250.00),(1007,904,717,1,350.00),(1008,905,709,2,180.00),(1009,906,714,3,160.00),(1010,907,716,2,320.00),(1011,908,711,2,90.00),(1012,909,707,2,120.00),(1013,910,715,3,60.00),(1014,911,702,2,180.00),(1015,912,703,2,299.00),(1016,913,705,1,149.00),(1017,914,701,3,250.00),(1018,914,719,1,250.00),(1019,915,710,2,170.00),(1020,915,718,1,NULL);
/*!40000 ALTER TABLE `OrderItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `address_id` int NOT NULL,
  `order_time` timestamp NOT NULL,
  `order_status` varchar(30) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `offer_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `address_id` (`address_id`),
  KEY `fk_order_offer` (`offer_id`),
  CONSTRAINT `fk_order_offer` FOREIGN KEY (`offer_id`) REFERENCES `Offer` (`offer_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `Restaurant` (`restaurant_id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`),
  CONSTRAINT `chk_order_status` CHECK ((`order_status` in (_utf8mb4'PLACED',_utf8mb4'PREPARING',_utf8mb4'OUT_FOR_DELIVERY',_utf8mb4'DELIVERED',_utf8mb4'CANCELLED'))),
  CONSTRAINT `chk_total_amount` CHECK ((`total_amount` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (901,101,401,501,'2024-05-01 07:00:00','PLACED',800.00,801),(902,102,402,502,'2024-05-02 07:30:00','DELIVERED',650.00,803),(903,103,403,503,'2024-05-03 08:45:00','CANCELLED',300.00,NULL),(904,104,404,504,'2024-05-04 10:15:00','DELIVERED',900.00,802),(905,105,405,505,'2024-05-05 10:40:00','PREPARING',500.00,808),(906,106,406,506,'2024-05-06 11:50:00','OUT_FOR_DELIVERY',750.00,809),(907,107,407,507,'2024-05-07 12:35:00','DELIVERED',1200.00,805),(908,108,408,508,'2024-05-08 13:30:00','PLACED',400.00,807),(909,109,409,509,'2024-05-09 14:40:00','DELIVERED',350.00,804),(910,110,410,510,'2024-05-10 16:00:00','PREPARING',250.00,810),(911,111,401,511,'2024-05-11 05:55:00','DELIVERED',670.00,801),(912,112,402,512,'2024-05-12 07:10:00','PLACED',720.00,803),(913,113,403,513,'2024-05-13 08:20:00','OUT_FOR_DELIVERY',480.00,804),(914,114,404,514,'2024-05-14 09:05:00','DELIVERED',890.00,802),(915,115,405,515,'2024-05-15 10:25:00','PLACED',NULL,808);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `payment_id` int NOT NULL,
  `order_id` int NOT NULL,
  `payment_mode` varchar(30) NOT NULL,
  `payment_status` varchar(30) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `refund_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `uq_payment_order` (`order_id`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `chk_amount` CHECK ((`amount` >= 0)),
  CONSTRAINT `chk_payment_status` CHECK ((`payment_status` in (_utf8mb4'PENDING',_utf8mb4'SUCCESS',_utf8mb4'FAILED',_utf8mb4'REFUNDED'))),
  CONSTRAINT `chk_refund_amount` CHECK ((`refund_amount` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1101,901,'UPI','SUCCESS',800.00,NULL),(1102,902,'CARD','SUCCESS',650.00,NULL),(1103,903,'UPI','REFUNDED',300.00,300.00),(1104,904,'CARD','SUCCESS',900.00,NULL),(1105,905,'CASH','PENDING',500.00,NULL),(1106,906,'UPI','SUCCESS',750.00,NULL),(1107,907,'CARD','SUCCESS',1200.00,NULL),(1108,908,'UPI','SUCCESS',400.00,NULL),(1109,909,'CARD','SUCCESS',350.00,NULL),(1110,910,'CASH','PENDING',250.00,NULL),(1111,911,'UPI','SUCCESS',670.00,NULL),(1112,912,'CARD','SUCCESS',720.00,NULL),(1113,913,'UPI','SUCCESS',480.00,NULL),(1114,914,'CARD','SUCCESS',890.00,NULL),(1115,915,'UPI',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Restaurant`
--

DROP TABLE IF EXISTS `Restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Restaurant` (
  `restaurant_id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `location` varchar(200) NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`restaurant_id`),
  KEY `fk_restaurant_owner` (`owner_id`),
  CONSTRAINT `fk_restaurant_owner` FOREIGN KEY (`owner_id`) REFERENCES `RestaurantOwner` (`owner_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chk_restaurant_rating` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurant`
--

LOCK TABLES `Restaurant` WRITE;
/*!40000 ALTER TABLE `Restaurant` DISABLE KEYS */;
INSERT INTO `Restaurant` VALUES (401,'Spice Hub','Hyderabad',1,'9000000001',4.3,301),(402,'Pizza Palace','Hyderabad',1,'9000000002',4.1,301),(403,'Burger Town','Hyderabad',1,'9000000003',4.5,302),(404,'Biryani House','Hyderabad',1,'9000000004',4.7,302),(405,'Green Bowl','Hyderabad',1,'9000000005',NULL,303),(406,'Tandoori Treats','Hyderabad',1,'9000000006',4.2,304),(407,'Sushi Spot','Hyderabad',1,'9000000007',4.6,305),(408,'Cafe Delight','Hyderabad',1,'9000000008',4.4,306),(409,'Dosa Corner','Hyderabad',1,'9000000009',4.3,307),(410,'Chaat Express','Hyderabad',1,'9000000010',4.1,308);
/*!40000 ALTER TABLE `Restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RestaurantOwner`
--

DROP TABLE IF EXISTS `RestaurantOwner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RestaurantOwner` (
  `owner_id` int NOT NULL,
  `member_id` int NOT NULL,
  `role_start_date` date NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`owner_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `restaurantowner_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `Member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RestaurantOwner`
--

LOCK TABLES `RestaurantOwner` WRITE;
/*!40000 ALTER TABLE `RestaurantOwner` DISABLE KEYS */;
INSERT INTO `RestaurantOwner` VALUES (301,14,'2023-01-01',1),(302,15,'2023-06-01',1),(303,16,'2023-09-01',1),(304,17,'2023-02-01',1),(305,18,'2023-03-01',NULL),(306,19,'2023-04-01',1),(307,20,'2023-05-01',1),(308,1,'2023-06-01',1),(309,2,'2023-07-01',1),(310,3,'2023-08-01',1);
/*!40000 ALTER TABLE `RestaurantOwner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-15 16:11:56
