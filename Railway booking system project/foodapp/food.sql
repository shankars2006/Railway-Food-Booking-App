-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: food
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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Chef'),(2,'Reporter');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,33),(2,2,34);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add station',7,'add_station'),(26,'Can change station',7,'change_station'),(27,'Can delete station',7,'delete_station'),(28,'Can view station',7,'view_station'),(29,'Can add menu',8,'add_menu'),(30,'Can change menu',8,'change_menu'),(31,'Can delete menu',8,'delete_menu'),(32,'Can view menu',8,'view_menu'),(33,'Can access Chef pages',3,'can_access_chef_page'),(34,'Can access Reporter pages',3,'can_access_reporter_page'),(35,'Can add order',9,'add_order'),(36,'Can change order',9,'change_order'),(37,'Can delete order',9,'delete_order'),(38,'Can view order',9,'view_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$letqLzf5wSvgNEMKOITWbc$ndTFUR78xDIlxDEM9u7BDt+V8tKZLTRvjrdew3OL0uM=','2025-08-29 16:58:04.493724',1,'admin','','','admin@gmail.com',1,1,'2025-08-26 09:02:51.481693'),(6,'pbkdf2_sha256$870000$kX7LZfQIbY06gk4ExYJLiC$9ctAXLDw1p1gUbqsuYwC0Q8OmsTbNkdLEFOM8dalRYo=','2025-08-30 16:41:39.777370',0,'chef','','','chef@gmail.com',0,1,'2025-08-29 17:01:01.000000'),(7,'pbkdf2_sha256$870000$NtrBG2zX5BPKuAFabGOAWN$basPKZIEycCsW47KXbHjmRUD0dVm44umKZ+Iyk7Hx/s=','2025-08-30 17:23:59.909456',0,'reporter','','','reporter@gmail.com',0,1,'2025-08-29 17:02:22.000000'),(8,'pbkdf2_sha256$870000$agaIJFg30ox7MzsPvRlU9K$Q20+6HBZ4SUVfmhbeedynUwgphVH4n/8hqYMO9o7kyk=',NULL,0,'Test','','','test@gmail.com',0,1,'2025-08-29 17:05:26.734772'),(9,'pbkdf2_sha256$870000$1PJrvf5BUubKkHZPzthYfp$VfTZ2mjTi4HoqED4ImHQFA0RRzHbZj94pvK6TRO7zwg=','2025-08-30 16:42:08.818485',0,'Shankar','','','example@mail.com',0,1,'2025-08-30 12:30:19.935259');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,6,1),(2,7,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-08-29 17:01:02.530768','6','Chef',1,'[{\"added\": {}}]',4,1),(2,'2025-08-29 17:02:23.257069','7','reporter',1,'[{\"added\": {}}]',4,1),(3,'2025-08-29 17:02:53.703542','7','reporter',2,'[]',4,1),(4,'2025-08-29 17:04:01.371538','6','Chef',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(5,'2025-08-29 17:04:13.585089','7','reporter',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(6,'2025-08-29 17:04:36.291818','5','Dell',3,'',4,1),(7,'2025-08-29 17:04:36.291852','3','Laser',3,'',4,1),(8,'2025-08-29 17:04:36.291871','2','shankar',3,'',4,1),(9,'2025-08-29 17:04:36.291886','4','Testuser',3,'',4,1),(10,'2025-08-29 17:06:06.915630','6','Chef',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(11,'2025-08-29 17:06:23.105865','6','chef',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',4,1),(12,'2025-08-29 17:06:44.027593','7','reporter',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'train','menu'),(9,'train','order'),(7,'train','station');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-08-24 08:48:42.701839'),(2,'auth','0001_initial','2025-08-24 08:48:43.326002'),(3,'admin','0001_initial','2025-08-24 08:48:43.476385'),(4,'admin','0002_logentry_remove_auto_add','2025-08-24 08:48:43.483748'),(5,'admin','0003_logentry_add_action_flag_choices','2025-08-24 08:48:43.491383'),(6,'contenttypes','0002_remove_content_type_name','2025-08-24 08:48:43.609834'),(7,'auth','0002_alter_permission_name_max_length','2025-08-24 08:48:43.677318'),(8,'auth','0003_alter_user_email_max_length','2025-08-24 08:48:43.703060'),(9,'auth','0004_alter_user_username_opts','2025-08-24 08:48:43.711882'),(10,'auth','0005_alter_user_last_login_null','2025-08-24 08:48:43.778404'),(11,'auth','0006_require_contenttypes_0002','2025-08-24 08:48:43.781333'),(12,'auth','0007_alter_validators_add_error_messages','2025-08-24 08:48:43.789664'),(13,'auth','0008_alter_user_username_max_length','2025-08-24 08:48:43.853535'),(14,'auth','0009_alter_user_last_name_max_length','2025-08-24 08:48:43.924879'),(15,'auth','0010_alter_group_name_max_length','2025-08-24 08:48:43.942647'),(16,'auth','0011_update_proxy_permissions','2025-08-24 08:48:43.949915'),(17,'auth','0012_alter_user_first_name_max_length','2025-08-24 08:48:44.022223'),(18,'sessions','0001_initial','2025-08-24 08:48:44.057636'),(20,'train','0002_alter_menu_options_alter_station_options_menu_slug_and_more','2025-08-25 14:28:00.537618'),(21,'train','0001_initial','2025-08-25 14:46:49.755614'),(22,'train','0002_alter_menu_options_alter_station_options_and_more','2025-08-25 14:46:49.782032'),(23,'train','0002_order','2025-08-30 12:25:44.859032'),(24,'train','0003_order_order_completed','2025-08-30 16:08:03.871147');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ak6lmk0ynhq93dsb3cyjr9b38mg4137l','.eJxVjEsOwjAMBe-SNYpCE7sxS_Y9Q2UnDi2gRupnhbg7VOoCtm9m3sv0vK1Dvy0692M2F0Pm9LsJp4dOO8h3nm7Vpjqt8yh2V-xBF9vVrM_r4f4dDLwM3xpCRCUKgc_iWozgBYqHUgg0RfLYFFBysYXEyi6rREQUbQIjOEHz_gDPeTec:1usOeW:75hVx4uP7Hb7LY8-vAIvJ9xyovL8DEMcl3ehG1ywL4c','2025-09-13 16:42:08.820742'),('ivhn6ccr8mu1hjvaneek5h0khtwrats4','.eJxVjDsOwjAQBe_iGlle_6GkzxmsXXuNAyiW8qkQd4dIKaB9M_NeIuG2trQtPKexiIsI4vS7EeYHTzsod5xuXeY-rfNIclfkQRc59MLP6-H-HTRc2rfG7FzNIRCBsg68Vv5MALEwR2MZKVYNAYOpAXSubDUY74ijZ-UzGvH-AOMRN8w:1usPJ1:kDvHy030m7Z1pXJv1i_FFiNp1qWCQl37xub-g6XOMnA','2025-09-13 17:23:59.913495');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_menu`
--

DROP TABLE IF EXISTS `train_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `description` longtext NOT NULL,
  `available_station_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `train_menu_available_station_id_2f4ebcdf_fk_train_station_id` (`available_station_id`),
  CONSTRAINT `train_menu_available_station_id_2f4ebcdf_fk_train_station_id` FOREIGN KEY (`available_station_id`) REFERENCES `train_station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_menu`
--

LOCK TABLES `train_menu` WRITE;
/*!40000 ALTER TABLE `train_menu` DISABLE KEYS */;
INSERT INTO `train_menu` VALUES (1,'burger',5.99,'A delicious burger with fresh ingredients.',1),(2,'pizza',8.99,'A cheesy pizza with your favorite toppings.',2),(3,'pasta',12.49,'A bowl of pasta with rich sauce.',3),(4,'sandwich',15.00,'A healthy sandwich with veggies.',4),(5,'salad',20.00,'A fresh salad with a variety of greens.',5),(6,'sushi',25.50,'A platter of assorted sushi.',6),(7,'taco',30.75,'A spicy taco with meat and salsa.',7),(8,'steak',35.00,'A juicy steak cooked to perfection.',8),(9,'noodles',40.99,'A bowl of noodles with flavorful broth.',9),(10,'curry',50.00,'A hearty curry with rice.',10);
/*!40000 ALTER TABLE `train_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_order`
--

DROP TABLE IF EXISTS `train_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_accepted` tinyint(1) NOT NULL,
  `dispatched` tinyint(1) NOT NULL,
  `ordered_at` datetime(6) NOT NULL,
  `customer_id` int NOT NULL,
  `item_id` bigint NOT NULL,
  `station_id` bigint NOT NULL,
  `order_completed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `train_order_customer_id_72bf19e7_fk_auth_user_id` (`customer_id`),
  KEY `train_order_item_id_b2e28d9a_fk_train_menu_id` (`item_id`),
  KEY `train_order_station_id_767ddb3a_fk_train_station_id` (`station_id`),
  CONSTRAINT `train_order_customer_id_72bf19e7_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `train_order_item_id_b2e28d9a_fk_train_menu_id` FOREIGN KEY (`item_id`) REFERENCES `train_menu` (`id`),
  CONSTRAINT `train_order_station_id_767ddb3a_fk_train_station_id` FOREIGN KEY (`station_id`) REFERENCES `train_station` (`id`),
  CONSTRAINT `train_order_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_order`
--

LOCK TABLES `train_order` WRITE;
/*!40000 ALTER TABLE `train_order` DISABLE KEYS */;
INSERT INTO `train_order` VALUES (1,1,15.00,1,1,'2025-08-30 13:24:58.574796',9,4,4,1),(2,5,29.95,1,1,'2025-08-30 16:42:20.673246',9,1,1,1);
/*!40000 ALTER TABLE `train_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_station`
--

DROP TABLE IF EXISTS `train_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_station` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `train_station_name_a5a60019_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_station`
--

LOCK TABLES `train_station` WRITE;
/*!40000 ALTER TABLE `train_station` DISABLE KEYS */;
INSERT INTO `train_station` VALUES (8,'Ahmedabad Junction'),(3,'Bangalore City'),(1,'Chennai Central'),(10,'Howrah Junction'),(6,'Hyderabad Deccan'),(9,'Jaipur Junction'),(5,'Kolkata'),(4,'Mumbai Central'),(2,'New Delhi'),(7,'Pune Junction');
/*!40000 ALTER TABLE `train_station` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-31 16:58:17
