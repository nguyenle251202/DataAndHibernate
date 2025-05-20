-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: springdatahibermate
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `auditing`
--

DROP TABLE IF EXISTS `auditing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditing` (
  `idProduct` int NOT NULL,
  `createDate` varchar(10) NOT NULL,
  `lastModifiedDate` varchar(10) NOT NULL,
  PRIMARY KEY (`idProduct`),
  CONSTRAINT `auditing_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditing`
--

LOCK TABLES `auditing` WRITE;
/*!40000 ALTER TABLE `auditing` DISABLE KEYS */;
INSERT INTO `auditing` VALUES (0,'2025-05-20','2025-05-20'),(1,'2025-05-10','2025-05-20'),(2,'2025-05-20','2025-05-20'),(3,'2025-05-20','2025-05-20'),(4,'2025-05-20','2025-05-20'),(5,'2025-05-20','2025-05-20'),(6,'2025-05-20','2025-05-20'),(7,'2025-05-20','2025-05-20'),(8,'2025-05-20','2025-05-20'),(9,'2025-05-20','2025-05-20'),(10,'2025-05-20','2025-05-20');
/*!40000 ALTER TABLE `auditing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `idCustomer` int NOT NULL,
  `nameCustomer` varchar(45) NOT NULL,
  PRIMARY KEY (`idCustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (0,'admin'),(1,'user1'),(2,'user2'),(3,'user3'),(4,'user4'),(5,'user5'),(7,'user7');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customertotalspending`
--

DROP TABLE IF EXISTS `customertotalspending`;
/*!50001 DROP VIEW IF EXISTS `customertotalspending`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customertotalspending` AS SELECT 
 1 AS `idCustomer`,
 1 AS `nameCustomer`,
 1 AS `totalpriceCustomer`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `monthlysales`
--

DROP TABLE IF EXISTS `monthlysales`;
/*!50001 DROP VIEW IF EXISTS `monthlysales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `monthlysales` AS SELECT 
 1 AS `month`,
 1 AS `totalpriceMonth`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `idOrder` int NOT NULL,
  `dateOrder` varchar(45) NOT NULL,
  `totalPriceOrder` double NOT NULL,
  `customer_idCustomer` int NOT NULL,
  `isDeleted` tinyint DEFAULT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `order_ibfk_1` (`customer_idCustomer`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_idCustomer`) REFERENCES `customer` (`idCustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2023-01-15',350,1,0),(2,'2023-01-16',520,2,0),(3,'2023-02-17',275,3,0),(4,'2023-02-18',630,4,0),(5,'2023-03-19',410,5,1),(6,'2023-03-20',675,2,0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `orderbymonth`
--

DROP TABLE IF EXISTS `orderbymonth`;
/*!50001 DROP VIEW IF EXISTS `orderbymonth`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orderbymonth` AS SELECT 
 1 AS `month`,
 1 AS `totalpriceMonth`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orderdisplay`
--

DROP TABLE IF EXISTS `orderdisplay`;
/*!50001 DROP VIEW IF EXISTS `orderdisplay`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orderdisplay` AS SELECT 
 1 AS `idOrder`,
 1 AS `dateOrder`,
 1 AS `nameCustome`,
 1 AS `danh_sach_OrderItem`,
 1 AS `totalpriceOrder`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `idOrderItem` int NOT NULL,
  `nameProduct` varchar(45) NOT NULL,
  `quantity` double NOT NULL,
  `priceOrder` double NOT NULL,
  `order_idOrder` int NOT NULL,
  `product_idProduct` int NOT NULL,
  PRIMARY KEY (`idOrderItem`),
  KEY `order_idOrder` (`order_idOrder`),
  KEY `product_idProduct` (`product_idProduct`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_idOrder`) REFERENCES `order` (`idOrder`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`product_idProduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,'Product0',2,100,1,0),(2,'Product5',1,150,1,5),(3,'Product2',3,120,2,2),(4,'Product6',1,160,2,6),(5,'Product9',1,115,3,9),(6,'Product7',1,160,3,7),(7,'Product3',4,130,4,3),(8,'Product1',1,110,4,1),(9,'Product4',2,140,5,4),(10,'Product8',1,130,5,8),(11,'Product10',3,105,6,10),(12,'Product2',3,120,6,2);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `orderitemdisplay`
--

DROP TABLE IF EXISTS `orderitemdisplay`;
/*!50001 DROP VIEW IF EXISTS `orderitemdisplay`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orderitemdisplay` AS SELECT 
 1 AS `idOrderItem`,
 1 AS `Product_nameProduct`,
 1 AS `quantity`,
 1 AS `priceOrder`,
 1 AS `Order_idOrder`,
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idProduct` int NOT NULL,
  `nameProduct` varchar(45) NOT NULL,
  `priceProduct` double NOT NULL,
  `totalQuantity` double NOT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (0,'Product0',100,2),(1,'Product1',110,1),(2,'Product2',120,6),(3,'Product3',130,4),(4,'Product4',140,2),(5,'Product5',150,1),(6,'Product6',145,1),(7,'Product7',135,1),(8,'Product8',125,1),(9,'Product9',115,1),(10,'Product10',105,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `productsalessummary`
--

DROP TABLE IF EXISTS `productsalessummary`;
/*!50001 DROP VIEW IF EXISTS `productsalessummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productsalessummary` AS SELECT 
 1 AS `idProduct`,
 1 AS `ProductName`,
 1 AS `TotalQuantitySold`,
 1 AS `TotalRevenue`,
 1 AS `CurrentPrice`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `productwithaudit`
--

DROP TABLE IF EXISTS `productwithaudit`;
/*!50001 DROP VIEW IF EXISTS `productwithaudit`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productwithaudit` AS SELECT 
 1 AS `idProduct`,
 1 AS `nameProduct`,
 1 AS `priceProduct`,
 1 AS `totalQuantity`,
 1 AS `createDate`,
 1 AS `lastModifiedDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `customertotalspending`
--

/*!50001 DROP VIEW IF EXISTS `customertotalspending`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `customertotalspending` AS select `c`.`idCustomer` AS `idCustomer`,`c`.`nameCustomer` AS `nameCustomer`,coalesce(sum(`o`.`totalPriceOrder`),0) AS `totalpriceCustomer` from (`customer` `c` left join `order` `o` on(((`c`.`idCustomer` = `o`.`customer_idCustomer`) and (`o`.`isDeleted` = 0)))) group by `c`.`idCustomer`,`c`.`nameCustomer` order by `totalpriceCustomer` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `monthlysales`
--

/*!50001 DROP VIEW IF EXISTS `monthlysales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `monthlysales` AS select date_format(str_to_date(`o`.`dateOrder`,'%Y-%m-%d'),'%Y-%m') AS `month`,sum(`o`.`totalPriceOrder`) AS `totalpriceMonth` from `order` `o` where ((`o`.`dateOrder` is not null) and regexp_like(`o`.`dateOrder`,'^[0-9]{4}-[0-9]{2}-[0-9]{2}$') and (`o`.`isDeleted` = 0)) group by date_format(str_to_date(`o`.`dateOrder`,'%Y-%m-%d'),'%Y-%m') order by `month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderbymonth`
--

/*!50001 DROP VIEW IF EXISTS `orderbymonth`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `orderbymonth` AS select date_format(str_to_date(`o`.`dateOrder`,'%Y-%m-%d'),'%Y-%m') AS `month`,sum(`o`.`totalPriceOrder`) AS `totalpriceMonth` from `order` `o` where ((`o`.`dateOrder` is not null) and regexp_like(`o`.`dateOrder`,'^[0-9]{4}-[0-9]{2}-[0-9]{2}$')) group by date_format(str_to_date(`o`.`dateOrder`,'%Y-%m-%d'),'%Y-%m') order by `month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderdisplay`
--

/*!50001 DROP VIEW IF EXISTS `orderdisplay`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `orderdisplay` AS select `o`.`idOrder` AS `idOrder`,`o`.`dateOrder` AS `dateOrder`,`c`.`nameCustomer` AS `nameCustome`,(select group_concat(concat(`oi`.`nameProduct`,' (',`oi`.`quantity`,' x ',`oi`.`priceOrder`,')') separator ', ') from `orderitem` `oi` where (`oi`.`order_idOrder` = `o`.`idOrder`) group by `oi`.`order_idOrder`) AS `danh_sach_OrderItem`,`o`.`totalPriceOrder` AS `totalpriceOrder` from (`order` `o` join `customer` `c` on((`o`.`customer_idCustomer` = `c`.`idCustomer`))) where (`o`.`isDeleted` = 0) order by `o`.`idOrder` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderitemdisplay`
--

/*!50001 DROP VIEW IF EXISTS `orderitemdisplay`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `orderitemdisplay` AS select `oi`.`idOrderItem` AS `idOrderItem`,`oi`.`nameProduct` AS `Product_nameProduct`,`oi`.`quantity` AS `quantity`,`oi`.`priceOrder` AS `priceOrder`,`oi`.`order_idOrder` AS `Order_idOrder`,(`oi`.`quantity` * `oi`.`priceOrder`) AS `total_price` from (`orderitem` `oi` join `order` `o` on((`oi`.`order_idOrder` = `o`.`idOrder`))) where (`o`.`isDeleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productsalessummary`
--

/*!50001 DROP VIEW IF EXISTS `productsalessummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `productsalessummary` AS select `p`.`idProduct` AS `idProduct`,`p`.`nameProduct` AS `ProductName`,sum(`oi`.`quantity`) AS `TotalQuantitySold`,sum((`oi`.`quantity` * `oi`.`priceOrder`)) AS `TotalRevenue`,`p`.`priceProduct` AS `CurrentPrice` from ((`product` `p` join `orderitem` `oi` on((`p`.`idProduct` = `oi`.`product_idProduct`))) join `order` `o` on((`oi`.`order_idOrder` = `o`.`idOrder`))) where (`o`.`isDeleted` = 0) group by `p`.`idProduct`,`p`.`nameProduct`,`p`.`priceProduct` order by `TotalQuantitySold` desc,`TotalRevenue` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productwithaudit`
--

/*!50001 DROP VIEW IF EXISTS `productwithaudit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `productwithaudit` AS select `p`.`idProduct` AS `idProduct`,`p`.`nameProduct` AS `nameProduct`,`p`.`priceProduct` AS `priceProduct`,`p`.`totalQuantity` AS `totalQuantity`,`a`.`createDate` AS `createDate`,`a`.`lastModifiedDate` AS `lastModifiedDate` from (`product` `p` join `auditing` `a` on((`p`.`idProduct` = `a`.`idProduct`))) order by `p`.`idProduct` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-20 14:41:53
