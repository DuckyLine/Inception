/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: kuma
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB

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
-- Table structure for table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_key_user_id_foreign` (`user_id`),
  CONSTRAINT `api_key_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_key`
--

LOCK TABLES `api_key` WRITE;
/*!40000 ALTER TABLE `api_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docker_host`
--

DROP TABLE IF EXISTS `docker_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `docker_host` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `docker_daemon` varchar(255) DEFAULT NULL,
  `docker_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docker_host`
--

LOCK TABLES `docker_host` WRITE;
/*!40000 ALTER TABLE `docker_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `docker_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `weight` int(11) NOT NULL DEFAULT 1000,
  `status_page_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heartbeat`
--

DROP TABLE IF EXISTS `heartbeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `heartbeat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `important` tinyint(1) NOT NULL DEFAULT 0,
  `monitor_id` int(10) unsigned NOT NULL,
  `status` smallint(6) NOT NULL,
  `msg` text DEFAULT NULL,
  `time` datetime NOT NULL,
  `ping` int(11) DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `down_count` int(11) NOT NULL DEFAULT 0,
  `end_time` datetime DEFAULT NULL,
  `retries` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `heartbeat_important_index` (`important`),
  KEY `monitor_time_index` (`monitor_id`,`time`),
  KEY `heartbeat_monitor_id_index` (`monitor_id`),
  KEY `monitor_important_time_index` (`monitor_id`,`important`,`time`),
  CONSTRAINT `heartbeat_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incident`
--

DROP TABLE IF EXISTS `incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `style` varchar(30) NOT NULL DEFAULT 'warning',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `last_updated_date` datetime DEFAULT NULL,
  `pin` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `status_page_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incident`
--

LOCK TABLES `incident` WRITE;
/*!40000 ALTER TABLE `incident` DISABLE KEYS */;
/*!40000 ALTER TABLE `incident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knex_migrations`
--

DROP TABLE IF EXISTS `knex_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `knex_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knex_migrations`
--

LOCK TABLES `knex_migrations` WRITE;
/*!40000 ALTER TABLE `knex_migrations` DISABLE KEYS */;
INSERT INTO `knex_migrations` VALUES
(1,'2023-08-16-0000-create-uptime.js',1,'2025-05-28 13:35:23'),
(2,'2023-08-18-0301-heartbeat.js',1,'2025-05-28 13:35:23'),
(3,'2023-09-29-0000-heartbeat-retires.js',1,'2025-05-28 13:35:23'),
(4,'2023-10-08-0000-mqtt-query.js',1,'2025-05-28 13:35:23'),
(5,'2023-10-11-1915-push-token-to-32.js',1,'2025-05-28 13:35:23'),
(6,'2023-10-16-0000-create-remote-browsers.js',1,'2025-05-28 13:35:23'),
(7,'2023-12-20-0000-alter-status-page.js',1,'2025-05-28 13:35:23'),
(8,'2023-12-21-0000-stat-ping-min-max.js',1,'2025-05-28 13:35:23'),
(9,'2023-12-22-0000-hourly-uptime.js',1,'2025-05-28 13:35:23'),
(10,'2024-01-22-0000-stats-extras.js',1,'2025-05-28 13:35:23'),
(11,'2024-04-26-0000-snmp-monitor.js',1,'2025-05-28 13:35:23'),
(12,'2024-08-24-000-add-cache-bust.js',1,'2025-05-28 13:35:23'),
(13,'2024-08-24-0000-conditions.js',1,'2025-05-28 13:35:23'),
(14,'2024-10-1315-rabbitmq-monitor.js',1,'2025-05-28 13:35:24'),
(15,'2024-10-31-0000-fix-snmp-monitor.js',1,'2025-05-28 13:35:24'),
(16,'2024-11-27-1927-fix-info-json-data-type.js',1,'2025-05-28 13:35:24'),
(17,'2025-01-01-0000-add-smtp.js',1,'2025-05-28 13:35:24'),
(18,'2025-03-04-0000-ping-advanced-options.js',1,'2025-05-28 13:35:24'),
(19,'2025-03-25-0127-fix-5721.js',1,'2025-05-28 13:35:24'),
(20,'2025-05-09-0000-add-custom-url.js',1,'2025-05-28 13:35:24');
/*!40000 ALTER TABLE `knex_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knex_migrations_lock`
--

DROP TABLE IF EXISTS `knex_migrations_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `knex_migrations_lock` (
  `index` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_locked` int(11) DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knex_migrations_lock`
--

LOCK TABLES `knex_migrations_lock` WRITE;
/*!40000 ALTER TABLE `knex_migrations_lock` DISABLE KEYS */;
INSERT INTO `knex_migrations_lock` VALUES
(1,0);
/*!40000 ALTER TABLE `knex_migrations_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `strategy` varchar(50) NOT NULL DEFAULT 'single',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `weekdays` varchar(250) DEFAULT '[]',
  `days_of_month` text DEFAULT '[]',
  `interval_day` int(11) DEFAULT NULL,
  `cron` text DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_active_index` (`active`),
  KEY `manual_active` (`strategy`,`active`),
  KEY `maintenance_user_id` (`user_id`),
  CONSTRAINT `maintenance_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_status_page`
--

DROP TABLE IF EXISTS `maintenance_status_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_status_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_page_id` int(10) unsigned NOT NULL,
  `maintenance_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_status_page_status_page_id_foreign` (`status_page_id`),
  KEY `maintenance_status_page_maintenance_id_foreign` (`maintenance_id`),
  CONSTRAINT `maintenance_status_page_maintenance_id_foreign` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `maintenance_status_page_status_page_id_foreign` FOREIGN KEY (`status_page_id`) REFERENCES `status_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_status_page`
--

LOCK TABLES `maintenance_status_page` WRITE;
/*!40000 ALTER TABLE `maintenance_status_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_status_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor`
--

DROP TABLE IF EXISTS `monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` int(10) unsigned DEFAULT NULL,
  `interval` int(11) NOT NULL DEFAULT 20,
  `url` text DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `weight` int(11) DEFAULT 2000,
  `hostname` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `keyword` varchar(255) DEFAULT NULL,
  `maxretries` int(11) NOT NULL DEFAULT 0,
  `ignore_tls` tinyint(1) NOT NULL DEFAULT 0,
  `upside_down` tinyint(1) NOT NULL DEFAULT 0,
  `maxredirects` int(11) NOT NULL DEFAULT 10,
  `accepted_statuscodes_json` text NOT NULL DEFAULT '["200-299"]',
  `dns_resolve_type` varchar(5) DEFAULT NULL,
  `dns_resolve_server` varchar(255) DEFAULT NULL,
  `dns_last_result` varchar(255) DEFAULT NULL,
  `retry_interval` int(11) NOT NULL DEFAULT 0,
  `push_token` varchar(32) DEFAULT NULL,
  `method` text NOT NULL DEFAULT 'GET',
  `body` text DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `basic_auth_user` text DEFAULT NULL,
  `basic_auth_pass` text DEFAULT NULL,
  `docker_host` int(10) unsigned DEFAULT NULL,
  `docker_container` varchar(255) DEFAULT NULL,
  `proxy_id` int(10) unsigned DEFAULT NULL,
  `expiry_notification` tinyint(1) DEFAULT 1,
  `mqtt_topic` text DEFAULT NULL,
  `mqtt_success_message` varchar(255) DEFAULT NULL,
  `mqtt_username` varchar(255) DEFAULT NULL,
  `mqtt_password` varchar(255) DEFAULT NULL,
  `database_connection_string` varchar(2000) DEFAULT NULL,
  `database_query` text DEFAULT NULL,
  `auth_method` varchar(250) DEFAULT NULL,
  `auth_domain` text DEFAULT NULL,
  `auth_workstation` text DEFAULT NULL,
  `grpc_url` varchar(255) DEFAULT NULL,
  `grpc_protobuf` text DEFAULT NULL,
  `grpc_body` text DEFAULT NULL,
  `grpc_metadata` text DEFAULT NULL,
  `grpc_method` text DEFAULT NULL,
  `grpc_service_name` text DEFAULT NULL,
  `grpc_enable_tls` tinyint(1) NOT NULL DEFAULT 0,
  `radius_username` varchar(255) DEFAULT NULL,
  `radius_password` varchar(255) DEFAULT NULL,
  `radius_calling_station_id` varchar(50) DEFAULT NULL,
  `radius_called_station_id` varchar(50) DEFAULT NULL,
  `radius_secret` varchar(255) DEFAULT NULL,
  `resend_interval` int(11) NOT NULL DEFAULT 0,
  `packet_size` int(11) NOT NULL DEFAULT 56,
  `game` varchar(255) DEFAULT NULL,
  `http_body_encoding` varchar(25) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tls_ca` text DEFAULT NULL,
  `tls_cert` text DEFAULT NULL,
  `tls_key` text DEFAULT NULL,
  `parent` int(10) unsigned DEFAULT NULL,
  `invert_keyword` tinyint(1) NOT NULL DEFAULT 0,
  `json_path` text DEFAULT NULL,
  `expected_value` varchar(255) DEFAULT NULL,
  `kafka_producer_topic` varchar(255) DEFAULT NULL,
  `kafka_producer_brokers` text DEFAULT NULL,
  `kafka_producer_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `kafka_producer_allow_auto_topic_creation` tinyint(1) NOT NULL DEFAULT 0,
  `kafka_producer_sasl_options` text DEFAULT NULL,
  `kafka_producer_message` text DEFAULT NULL,
  `oauth_client_id` text DEFAULT NULL,
  `oauth_client_secret` text DEFAULT NULL,
  `oauth_token_url` text DEFAULT NULL,
  `oauth_scopes` text DEFAULT NULL,
  `oauth_auth_method` text DEFAULT NULL,
  `timeout` double NOT NULL DEFAULT 0,
  `gamedig_given_port_only` tinyint(1) NOT NULL DEFAULT 1,
  `mqtt_check_type` varchar(255) NOT NULL DEFAULT 'keyword',
  `remote_browser` int(10) unsigned DEFAULT NULL,
  `snmp_oid` varchar(255) DEFAULT NULL,
  `snmp_version` enum('1','2c','3') DEFAULT '2c',
  `json_path_operator` varchar(255) DEFAULT NULL,
  `cache_bust` tinyint(1) NOT NULL DEFAULT 0,
  `conditions` text NOT NULL DEFAULT '[]',
  `rabbitmq_nodes` text DEFAULT NULL,
  `rabbitmq_username` varchar(255) DEFAULT NULL,
  `rabbitmq_password` varchar(255) DEFAULT NULL,
  `smtp_security` varchar(255) DEFAULT NULL,
  `ping_count` int(11) NOT NULL DEFAULT 1,
  `ping_numeric` tinyint(1) NOT NULL DEFAULT 1,
  `ping_per_request_timeout` int(11) NOT NULL DEFAULT 2,
  PRIMARY KEY (`id`),
  KEY `monitor_user_id_foreign` (`user_id`),
  KEY `monitor_docker_host_foreign` (`docker_host`),
  KEY `monitor_proxy_id_foreign` (`proxy_id`),
  KEY `monitor_parent_foreign` (`parent`),
  KEY `monitor_remote_browser_index` (`remote_browser`),
  CONSTRAINT `monitor_docker_host_foreign` FOREIGN KEY (`docker_host`) REFERENCES `docker_host` (`id`),
  CONSTRAINT `monitor_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `monitor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `monitor_proxy_id_foreign` FOREIGN KEY (`proxy_id`) REFERENCES `proxy` (`id`),
  CONSTRAINT `monitor_remote_browser_foreign` FOREIGN KEY (`remote_browser`) REFERENCES `remote_browser` (`id`),
  CONSTRAINT `monitor_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor`
--

LOCK TABLES `monitor` WRITE;
/*!40000 ALTER TABLE `monitor` DISABLE KEYS */;
INSERT INTO `monitor` VALUES
(1,'wordpress',1,1,60,'https://nginx.com','http',2000,NULL,NULL,'2025-05-28 13:36:54',NULL,0,1,0,10,'[\"200-299\"]','A','1.1.1.1',NULL,60,NULL,'GET',NULL,NULL,NULL,NULL,NULL,'',NULL,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,56,NULL,'json',NULL,NULL,NULL,NULL,NULL,0,'$',NULL,NULL,'[]',0,0,'{\"mechanism\":\"None\"}',NULL,NULL,NULL,NULL,NULL,'client_secret_basic',48,1,'keyword',NULL,NULL,'2c','==',0,'[]','[]','','',NULL,3,1,2),
(2,'New Monitor',1,1,20,'https://','mysql',2000,NULL,NULL,'2025-05-28 13:38:09',NULL,0,0,0,10,'[\"200-299\"]','A','1.1.1.1',NULL,20,NULL,'GET',NULL,NULL,NULL,NULL,NULL,'',NULL,0,'','','','','mysql://tle-goff:1234@mariadb:3306/42db',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'$',NULL,NULL,'[]',0,0,'{\"mechanism\":\"None\"}',NULL,NULL,NULL,NULL,NULL,'client_secret_basic',16,1,'keyword',NULL,NULL,'2c','==',0,'[]','[]','','',NULL,3,1,2),
(3,'sftp',1,1,60,'https://','port',2000,'sftp',22,'2025-05-28 13:38:56',NULL,0,0,0,10,'[\"200-299\"]','A','1.1.1.1',NULL,60,NULL,'GET',NULL,NULL,NULL,NULL,NULL,'',NULL,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,56,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'$',NULL,NULL,'[]',0,0,'{\"mechanism\":\"None\"}',NULL,NULL,NULL,NULL,NULL,'client_secret_basic',48,1,'keyword',NULL,NULL,'2c','==',0,'[]','[]','','',NULL,3,1,2),
(4,'adminer',1,1,20,'http://adminer:8080','http',2000,NULL,NULL,'2025-05-28 13:39:46',NULL,0,1,0,10,'[\"200-299\"]','A','1.1.1.1',NULL,20,NULL,'GET',NULL,NULL,NULL,NULL,NULL,'',NULL,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,56,NULL,'json',NULL,NULL,NULL,NULL,NULL,0,'$',NULL,NULL,'[]',0,0,'{\"mechanism\":\"None\"}',NULL,NULL,NULL,NULL,NULL,'client_secret_basic',16,1,'keyword',NULL,NULL,'2c','==',0,'[]','[]','','',NULL,3,1,2);
/*!40000 ALTER TABLE `monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_group`
--

DROP TABLE IF EXISTS `monitor_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1000,
  `send_url` tinyint(1) NOT NULL DEFAULT 0,
  `custom_url` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_group_group_id_foreign` (`group_id`),
  KEY `fk` (`monitor_id`,`group_id`),
  CONSTRAINT `monitor_group_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monitor_group_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_group`
--

LOCK TABLES `monitor_group` WRITE;
/*!40000 ALTER TABLE `monitor_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitor_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_maintenance`
--

DROP TABLE IF EXISTS `monitor_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_maintenance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `maintenance_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_id_index2` (`maintenance_id`),
  KEY `monitor_id_index` (`monitor_id`),
  CONSTRAINT `monitor_maintenance_maintenance_id_foreign` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monitor_maintenance_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_maintenance`
--

LOCK TABLES `monitor_maintenance` WRITE;
/*!40000 ALTER TABLE `monitor_maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitor_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_notification`
--

DROP TABLE IF EXISTS `monitor_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_notification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `notification_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_notification_notification_id_foreign` (`notification_id`),
  KEY `monitor_notification_index` (`monitor_id`,`notification_id`),
  CONSTRAINT `monitor_notification_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monitor_notification_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_notification`
--

LOCK TABLES `monitor_notification` WRITE;
/*!40000 ALTER TABLE `monitor_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitor_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_tag`
--

DROP TABLE IF EXISTS `monitor_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_tag_monitor_id_foreign` (`monitor_id`),
  KEY `monitor_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `monitor_tag_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `monitor_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_tag`
--

LOCK TABLES `monitor_tag` WRITE;
/*!40000 ALTER TABLE `monitor_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitor_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_tls_info`
--

DROP TABLE IF EXISTS `monitor_tls_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor_tls_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `info_json` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monitor_tls_info_monitor_id_foreign` (`monitor_id`),
  CONSTRAINT `monitor_tls_info_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_tls_info`
--

LOCK TABLES `monitor_tls_info` WRITE;
/*!40000 ALTER TABLE `monitor_tls_info` DISABLE KEYS */;
INSERT INTO `monitor_tls_info` VALUES
(1,1,'{\"valid\":true,\"certInfo\":{\"subject\":{\"CN\":\"*.nginx.com\"},\"issuer\":{\"C\":\"US\",\"O\":\"Let\'s Encrypt\",\"CN\":\"E5\"},\"subjectaltname\":\"DNS:*.nginx.com, DNS:nginx.com\",\"infoAccess\":{\"OCSP - URI\":[\"http://e5.o.lencr.org\"],\"CA Issuers - URI\":[\"http://e5.i.lencr.org/\"]},\"ca\":false,\"bits\":256,\"pubkey\":{\"type\":\"Buffer\",\"data\":[4,164,207,97,94,169,14,58,197,89,133,247,221,170,69,76,120,189,92,186,246,187,20,26,67,163,205,88,70,18,158,240,107,176,231,213,250,185,115,128,253,50,246,11,10,24,138,227,155,98,158,16,12,198,198,130,42,209,8,72,112,62,79,54,112]},\"asn1Curve\":\"prime256v1\",\"nistCurve\":\"P-256\",\"valid_from\":\"May  6 18:53:39 2025 GMT\",\"valid_to\":\"Aug  4 18:53:38 2025 GMT\",\"fingerprint\":\"4C:3B:76:45:D7:5E:9F:43:83:17:25:08:FA:09:17:B3:10:53:1D:EA\",\"fingerprint256\":\"CE:19:B1:D2:5C:A4:2B:67:E0:88:4B:3C:8E:2A:11:0A:E3:75:30:FE:91:5B:02:F2:E5:34:EA:01:99:C4:31:3E\",\"fingerprint512\":\"1F:DA:48:6A:1C:AC:E2:E4:22:7A:D5:C1:CB:AF:C9:FB:6B:CF:52:68:20:CA:76:30:1E:38:8B:1C:0A:A7:68:D7:61:83:E4:64:44:5F:6A:A7:4F:71:70:9A:C8:E5:DE:E8:73:00:1B:36:45:0E:54:CB:B1:A9:04:74:4B:D2:3D:03\",\"ext_key_usage\":[\"1.3.6.1.5.5.7.3.1\",\"1.3.6.1.5.5.7.3.2\"],\"serialNumber\":\"05C95348525C52950E949C8A7DFF25841BE4\",\"raw\":{\"type\":\"Buffer\",\"data\":[48,130,3,178,48,130,3,55,160,3,2,1,2,2,18,5,201,83,72,82,92,82,149,14,148,156,138,125,255,37,132,27,228,48,10,6,8,42,134,72,206,61,4,3,3,48,50,49,11,48,9,6,3,85,4,6,19,2,85,83,49,22,48,20,6,3,85,4,10,19,13,76,101,116,39,115,32,69,110,99,114,121,112,116,49,11,48,9,6,3,85,4,3,19,2,69,53,48,30,23,13,50,53,48,53,48,54,49,56,53,51,51,57,90,23,13,50,53,48,56,48,52,49,56,53,51,51,56,90,48,22,49,20,48,18,6,3,85,4,3,12,11,42,46,110,103,105,110,120,46,99,111,109,48,89,48,19,6,7,42,134,72,206,61,2,1,6,8,42,134,72,206,61,3,1,7,3,66,0,4,164,207,97,94,169,14,58,197,89,133,247,221,170,69,76,120,189,92,186,246,187,20,26,67,163,205,88,70,18,158,240,107,176,231,213,250,185,115,128,253,50,246,11,10,24,138,227,155,98,158,16,12,198,198,130,42,209,8,72,112,62,79,54,112,163,130,2,71,48,130,2,67,48,14,6,3,85,29,15,1,1,255,4,4,3,2,7,128,48,29,6,3,85,29,37,4,22,48,20,6,8,43,6,1,5,5,7,3,1,6,8,43,6,1,5,5,7,3,2,48,12,6,3,85,29,19,1,1,255,4,2,48,0,48,29,6,3,85,29,14,4,22,4,20,242,207,164,243,49,234,91,210,26,41,223,27,51,107,219,81,199,22,229,81,48,31,6,3,85,29,35,4,24,48,22,128,20,159,43,95,207,60,33,79,157,4,183,237,43,44,196,198,112,139,210,215,13,48,85,6,8,43,6,1,5,5,7,1,1,4,73,48,71,48,33,6,8,43,6,1,5,5,7,48,1,134,21,104,116,116,112,58,47,47,101,53,46,111,46,108,101,110,99,114,46,111,114,103,48,34,6,8,43,6,1,5,5,7,48,2,134,22,104,116,116,112,58,47,47,101,53,46,105,46,108,101,110,99,114,46,111,114,103,47,48,33,6,3,85,29,17,4,26,48,24,130,11,42,46,110,103,105,110,120,46,99,111,109,130,9,110,103,105,110,120,46,99,111,109,48,19,6,3,85,29,32,4,12,48,10,48,8,6,6,103,129,12,1,2,1,48,46,6,3,85,29,31,4,39,48,37,48,35,160,33,160,31,134,29,104,116,116,112,58,47,47,101,53,46,99,46,108,101,110,99,114,46,111,114,103,47,49,48,49,46,99,114,108,48,130,1,3,6,10,43,6,1,4,1,214,121,2,4,2,4,129,244,4,129,241,0,239,0,118,0,221,220,202,52,149,215,225,22,5,231,149,50,250,199,159,248,61,28,80,223,219,0,58,20,18,118,10,44,172,187,200,42,0,0,1,150,167,39,222,8,0,0,4,3,0,71,48,69,2,32,33,251,106,118,189,218,139,167,20,201,11,213,53,101,64,172,251,201,162,168,16,39,78,112,55,26,152,85,190,43,209,72,2,33,0,211,74,89,162,160,141,10,252,173,124,172,63,67,24,141,16,128,89,158,238,236,253,201,128,133,244,66,213,249,239,118,211,0,117,0,237,60,75,214,232,6,194,164,162,0,87,219,203,36,226,56,1,223,81,47,237,196,134,197,112,15,32,221,183,62,63,224,0,0,1,150,167,39,221,193,0,0,4,3,0,70,48,68,2,32,37,114,160,49,172,4,209,125,156,1,12,127,68,16,165,23,159,4,39,64,58,72,193,50,168,215,76,66,174,193,197,137,2,32,39,106,212,93,3,112,4,179,36,36,126,137,32,184,49,105,114,115,246,121,23,94,13,94,14,116,227,146,36,139,48,147,48,10,6,8,42,134,72,206,61,4,3,3,3,105,0,48,102,2,49,0,153,171,176,151,62,78,175,24,57,174,238,57,54,77,100,173,78,199,143,154,20,189,223,29,144,90,125,135,30,0,146,92,128,131,133,106,104,196,212,224,191,236,209,31,16,111,130,168,2,49,0,128,42,46,13,192,58,170,4,78,76,206,85,7,106,215,65,51,10,173,226,139,45,91,203,82,205,198,25,4,70,250,203,9,26,199,153,227,138,246,121,10,183,80,40,2,244,136,131]},\"issuerCertificate\":{\"subject\":{\"C\":\"US\",\"O\":\"Let\'s Encrypt\",\"CN\":\"E5\"},\"issuer\":{\"C\":\"US\",\"O\":\"Internet Security Research Group\",\"CN\":\"ISRG Root X1\"},\"infoAccess\":{\"CA Issuers - URI\":[\"http://x1.i.lencr.org/\"]},\"ca\":true,\"bits\":384,\"pubkey\":{\"type\":\"Buffer\",\"data\":[4,13,11,58,138,107,97,142,182,239,220,95,88,231,198,66,69,84,171,99,246,102,97,72,10,46,89,117,180,129,2,55,80,183,63,22,121,220,152,236,161,40,151,114,32,28,44,207,213,124,82,32,78,84,120,91,132,20,107,192,144,174,133,236,192,81,65,60,90,135,127,6,77,212,254,96,209,250,108,45,225,125,149,16,136,162,8,84,15,153,26,76,230,234,10,172,216]},\"asn1Curve\":\"secp384r1\",\"nistCurve\":\"P-384\",\"valid_from\":\"Mar 13 00:00:00 2024 GMT\",\"valid_to\":\"Mar 12 23:59:59 2027 GMT\",\"fingerprint\":\"5F:28:D9:C5:89:EE:4B:F3:1A:11:B7:8C:72:B8:D1:3F:07:9D:DC:45\",\"fingerprint256\":\"5D:FD:B3:CF:31:B2:6F:23:D8:7C:09:F3:A0:CE:F6:42:F6:40:69:A9:FB:7C:FE:29:27:0B:B5:DC:0F:1E:16:BB\",\"fingerprint512\":\"4E:32:B7:EE:52:C9:BD:2A:15:B2:DF:3C:AE:5E:3B:06:0D:73:7D:71:FA:AA:AC:25:33:6C:5F:19:3C:BD:B5:2E:D2:FD:F3:8B:29:AE:A9:FB:97:F5:9C:8F:86:E7:5B:5C:36:43:09:A2:32:62:3A:99:E6:38:11:6E:D6:60:63:FD\",\"ext_key_usage\":[\"1.3.6.1.5.5.7.3.2\",\"1.3.6.1.5.5.7.3.1\"],\"serialNumber\":\"838F6C63CEB1398C6206628315C9FDDE\",\"raw\":{\"type\":\"Buffer\",\"data\":[48,130,4,87,48,130,2,63,160,3,2,1,2,2,17,0,131,143,108,99,206,177,57,140,98,6,98,131,21,201,253,222,48,13,6,9,42,134,72,134,247,13,1,1,11,5,0,48,79,49,11,48,9,6,3,85,4,6,19,2,85,83,49,41,48,39,6,3,85,4,10,19,32,73,110,116,101,114,110,101,116,32,83,101,99,117,114,105,116,121,32,82,101,115,101,97,114,99,104,32,71,114,111,117,112,49,21,48,19,6,3,85,4,3,19,12,73,83,82,71,32,82,111,111,116,32,88,49,48,30,23,13,50,52,48,51,49,51,48,48,48,48,48,48,90,23,13,50,55,48,51,49,50,50,51,53,57,53,57,90,48,50,49,11,48,9,6,3,85,4,6,19,2,85,83,49,22,48,20,6,3,85,4,10,19,13,76,101,116,39,115,32,69,110,99,114,121,112,116,49,11,48,9,6,3,85,4,3,19,2,69,53,48,118,48,16,6,7,42,134,72,206,61,2,1,6,5,43,129,4,0,34,3,98,0,4,13,11,58,138,107,97,142,182,239,220,95,88,231,198,66,69,84,171,99,246,102,97,72,10,46,89,117,180,129,2,55,80,183,63,22,121,220,152,236,161,40,151,114,32,28,44,207,213,124,82,32,78,84,120,91,132,20,107,192,144,174,133,236,192,81,65,60,90,135,127,6,77,212,254,96,209,250,108,45,225,125,149,16,136,162,8,84,15,153,26,76,230,234,10,172,216,163,129,248,48,129,245,48,14,6,3,85,29,15,1,1,255,4,4,3,2,1,134,48,29,6,3,85,29,37,4,22,48,20,6,8,43,6,1,5,5,7,3,2,6,8,43,6,1,5,5,7,3,1,48,18,6,3,85,29,19,1,1,255,4,8,48,6,1,1,255,2,1,0,48,29,6,3,85,29,14,4,22,4,20,159,43,95,207,60,33,79,157,4,183,237,43,44,196,198,112,139,210,215,13,48,31,6,3,85,29,35,4,24,48,22,128,20,121,180,89,230,123,182,229,228,1,115,128,8,136,200,26,88,246,233,155,110,48,50,6,8,43,6,1,5,5,7,1,1,4,38,48,36,48,34,6,8,43,6,1,5,5,7,48,2,134,22,104,116,116,112,58,47,47,120,49,46,105,46,108,101,110,99,114,46,111,114,103,47,48,19,6,3,85,29,32,4,12,48,10,48,8,6,6,103,129,12,1,2,1,48,39,6,3,85,29,31,4,32,48,30,48,28,160,26,160,24,134,22,104,116,116,112,58,47,47,120,49,46,99,46,108,101,110,99,114,46,111,114,103,47,48,13,6,9,42,134,72,134,247,13,1,1,11,5,0,3,130,2,1,0,31,114,157,52,69,66,65,218,164,208,178,178,184,210,38,76,167,81,37,141,66,218,236,54,72,150,163,186,26,164,200,99,216,240,47,179,206,203,159,103,233,160,158,25,234,212,13,138,85,3,146,202,67,132,157,70,241,213,204,186,223,186,193,2,40,113,247,186,254,109,204,27,100,206,172,76,50,26,18,184,145,252,242,228,232,178,172,244,23,180,186,133,113,128,226,131,114,145,189,178,240,247,220,159,134,244,183,31,191,82,189,150,224,230,73,56,6,233,115,69,32,222,111,124,142,96,179,249,76,63,42,35,16,199,72,204,175,91,149,201,118,255,91,202,196,239,22,24,39,35,190,196,53,156,159,207,194,223,11,65,144,95,56,92,149,92,255,46,108,10,127,106,237,221,115,129,10,88,111,76,59,156,220,199,90,147,247,227,87,68,103,85,91,17,175,152,17,81,1,168,220,136,199,215,48,77,89,184,105,164,223,241,142,146,128,12,237,153,35,102,105,94,202,137,15,212,177,179,153,242,92,81,223,108,237,231,174,215,255,127,122,14,87,149,119,127,231,145,173,98,48,12,248,46,3,27,152,187,121,163,106,114,109,133,251,44,88,32,251,122,113,182,237,97,83,73,8,103,199,90,161,196,67,129,88,74,213,50,22,123,252,178,60,170,83,204,169,129,150,141,39,214,149,113,100,136,8,179,136,19,95,208,191,254,232,42,201,217,9,98,125,219,172,20,233,26,134,212,230,15,24,232,181,206,224,1,132,188,58,213,203,143,84,52,246,242,116,18,253,238,179,247,151,9,94,173,30,43,80,92,104,158,159,37,155,38,110,52,96,15,154,119,154,241,31,230,247,80,51,179,2,18,245,52,180,118,236,199,98,57,152,113,201,160,0,71,111,194,149,6,5,169,254,87,23,25,104,150,105,227,178,7,180,79,248,231,195,182,248,182,58,198,169,197,120,149,238,243,85,179,183,204,150,180,99,99,88,232,41,170,166,155,39,39,6,240,42,215,128,4,110,220,139,177,87,206,75,174,129,241,170,100,120,85,246,53,142,23,60,70,21,225,148,130,123,197,71,62,183,107,17,25,54,192,130,198,221,63,196,26,100,136,144,38,21,80,196,167,142,98,93,85,0,253,23,163,90,255,236,230,92,39]},\"issuerCertificate\":{\"subject\":{\"C\":\"US\",\"O\":\"Internet Security Research Group\",\"CN\":\"ISRG Root X1\"},\"issuer\":{\"C\":\"US\",\"O\":\"Internet Security Research Group\",\"CN\":\"ISRG Root X1\"},\"ca\":true,\"modulus\":\"ADE82473F41437F39B9E2B57281C87BEDCB7DF38908C6E3CE657A078F775C2A2FEF56A6EF6004F28DBDE68866C4493B6B163FD14126BBF1FD2EA319B217ED1333CBA48F5DD79DFB3B8FF12F1219A4BC18A8671694A66666C8F7E3C70BFAD292206F3E4C0E680AEE24B8FB7997E94039FD347977C99482353E838AE4F0A6F832ED149578C8074B6DA2FD0388D7B0370211B75F2303CFA8FAEDDDA63ABEB164FC28E114B7ECF0BE8FFB5772EF4B27B4AE04C12250C708D0329A0E15324EC13D9EE19BF10B34A8C3F89A36151DEAC870794F46371EC2EE26F5B9881E1895C34796C76EF3B906279E6DBA49A2F26C5D010E10EDED9108E16FBB7F7A8F7C7E50207988F360895E7E237960D36759EFB0E72B11D9BBC03F94905D881DD05B42AD641E9AC0176950A0FD8DFD5BD121F352F28176CD298C1A80964776E4737BACEAC595E689D7F72D689C50641293E593EDD26F524C911A75AA34C401F46A199B5A73A516E863B9E7D72A712057859ED3E5178150B038F8DD02F05B23E7B4A1C4B730512FCC6EAE050137C439374B3CA74E78E1F0108D030D45B7136B407BAC130305C48B7823B98A67D608AA2A32982CCBABD83041BA2830341A1D605F11BC2B6F0A87C863B46A8482A88DC769A76BF1F6AA53D198FEB38F364DEC82B0D0A28FFF7DBE21542D422D0275DE179FE18E77088AD4EE6D98B3AC6DD27516EFFBC64F533434F\",\"bits\":4096,\"exponent\":\"0x10001\",\"pubkey\":{\"type\":\"Buffer\",\"data\":[48,130,2,34,48,13,6,9,42,134,72,134,247,13,1,1,1,5,0,3,130,2,15,0,48,130,2,10,2,130,2,1,0,173,232,36,115,244,20,55,243,155,158,43,87,40,28,135,190,220,183,223,56,144,140,110,60,230,87,160,120,247,117,194,162,254,245,106,110,246,0,79,40,219,222,104,134,108,68,147,182,177,99,253,20,18,107,191,31,210,234,49,155,33,126,209,51,60,186,72,245,221,121,223,179,184,255,18,241,33,154,75,193,138,134,113,105,74,102,102,108,143,126,60,112,191,173,41,34,6,243,228,192,230,128,174,226,75,143,183,153,126,148,3,159,211,71,151,124,153,72,35,83,232,56,174,79,10,111,131,46,209,73,87,140,128,116,182,218,47,208,56,141,123,3,112,33,27,117,242,48,60,250,143,174,221,218,99,171,235,22,79,194,142,17,75,126,207,11,232,255,181,119,46,244,178,123,74,224,76,18,37,12,112,141,3,41,160,225,83,36,236,19,217,238,25,191,16,179,74,140,63,137,163,97,81,222,172,135,7,148,244,99,113,236,46,226,111,91,152,129,225,137,92,52,121,108,118,239,59,144,98,121,230,219,164,154,47,38,197,208,16,225,14,222,217,16,142,22,251,183,247,168,247,199,229,2,7,152,143,54,8,149,231,226,55,150,13,54,117,158,251,14,114,177,29,155,188,3,249,73,5,216,129,221,5,180,42,214,65,233,172,1,118,149,10,15,216,223,213,189,18,31,53,47,40,23,108,210,152,193,168,9,100,119,110,71,55,186,206,172,89,94,104,157,127,114,214,137,197,6,65,41,62,89,62,221,38,245,36,201,17,167,90,163,76,64,31,70,161,153,181,167,58,81,110,134,59,158,125,114,167,18,5,120,89,237,62,81,120,21,11,3,143,141,208,47,5,178,62,123,74,28,75,115,5,18,252,198,234,224,80,19,124,67,147,116,179,202,116,231,142,31,1,8,208,48,212,91,113,54,180,7,186,193,48,48,92,72,183,130,59,152,166,125,96,138,162,163,41,130,204,186,189,131,4,27,162,131,3,65,161,214,5,241,27,194,182,240,168,124,134,59,70,168,72,42,136,220,118,154,118,191,31,106,165,61,25,143,235,56,243,100,222,200,43,13,10,40,255,247,219,226,21,66,212,34,208,39,93,225,121,254,24,231,112,136,173,78,230,217,139,58,198,221,39,81,110,255,188,100,245,51,67,79,2,3,1,0,1]},\"valid_from\":\"Jun  4 11:04:38 2015 GMT\",\"valid_to\":\"Jun  4 11:04:38 2035 GMT\",\"fingerprint\":\"CA:BD:2A:79:A1:07:6A:31:F2:1D:25:36:35:CB:03:9D:43:29:A5:E8\",\"fingerprint256\":\"96:BC:EC:06:26:49:76:F3:74:60:77:9A:CF:28:C5:A7:CF:E8:A3:C0:AA:E1:1A:8F:FC:EE:05:C0:BD:DF:08:C6\",\"fingerprint512\":\"3B:40:F2:7E:82:83:23:F5:B9:1F:89:09:88:3A:78:A2:1C:86:55:17:61:F2:7B:38:02:9F:AA:EC:14:AF:5B:7A:A9:6F:B9:F9:CC:93:EE:20:1B:5E:B1:D0:FE:F1:7B:29:07:47:E8:B8:39:D2:E4:9A:8F:36:C5:EB:F3:C7:C9:10\",\"serialNumber\":\"8210CFB0D240E3594463E0BB63828B00\",\"raw\":{\"type\":\"Buffer\",\"data\":[48,130,5,107,48,130,3,83,160,3,2,1,2,2,17,0,130,16,207,176,210,64,227,89,68,99,224,187,99,130,139,0,48,13,6,9,42,134,72,134,247,13,1,1,11,5,0,48,79,49,11,48,9,6,3,85,4,6,19,2,85,83,49,41,48,39,6,3,85,4,10,19,32,73,110,116,101,114,110,101,116,32,83,101,99,117,114,105,116,121,32,82,101,115,101,97,114,99,104,32,71,114,111,117,112,49,21,48,19,6,3,85,4,3,19,12,73,83,82,71,32,82,111,111,116,32,88,49,48,30,23,13,49,53,48,54,48,52,49,49,48,52,51,56,90,23,13,51,53,48,54,48,52,49,49,48,52,51,56,90,48,79,49,11,48,9,6,3,85,4,6,19,2,85,83,49,41,48,39,6,3,85,4,10,19,32,73,110,116,101,114,110,101,116,32,83,101,99,117,114,105,116,121,32,82,101,115,101,97,114,99,104,32,71,114,111,117,112,49,21,48,19,6,3,85,4,3,19,12,73,83,82,71,32,82,111,111,116,32,88,49,48,130,2,34,48,13,6,9,42,134,72,134,247,13,1,1,1,5,0,3,130,2,15,0,48,130,2,10,2,130,2,1,0,173,232,36,115,244,20,55,243,155,158,43,87,40,28,135,190,220,183,223,56,144,140,110,60,230,87,160,120,247,117,194,162,254,245,106,110,246,0,79,40,219,222,104,134,108,68,147,182,177,99,253,20,18,107,191,31,210,234,49,155,33,126,209,51,60,186,72,245,221,121,223,179,184,255,18,241,33,154,75,193,138,134,113,105,74,102,102,108,143,126,60,112,191,173,41,34,6,243,228,192,230,128,174,226,75,143,183,153,126,148,3,159,211,71,151,124,153,72,35,83,232,56,174,79,10,111,131,46,209,73,87,140,128,116,182,218,47,208,56,141,123,3,112,33,27,117,242,48,60,250,143,174,221,218,99,171,235,22,79,194,142,17,75,126,207,11,232,255,181,119,46,244,178,123,74,224,76,18,37,12,112,141,3,41,160,225,83,36,236,19,217,238,25,191,16,179,74,140,63,137,163,97,81,222,172,135,7,148,244,99,113,236,46,226,111,91,152,129,225,137,92,52,121,108,118,239,59,144,98,121,230,219,164,154,47,38,197,208,16,225,14,222,217,16,142,22,251,183,247,168,247,199,229,2,7,152,143,54,8,149,231,226,55,150,13,54,117,158,251,14,114,177,29,155,188,3,249,73,5,216,129,221,5,180,42,214,65,233,172,1,118,149,10,15,216,223,213,189,18,31,53,47,40,23,108,210,152,193,168,9,100,119,110,71,55,186,206,172,89,94,104,157,127,114,214,137,197,6,65,41,62,89,62,221,38,245,36,201,17,167,90,163,76,64,31,70,161,153,181,167,58,81,110,134,59,158,125,114,167,18,5,120,89,237,62,81,120,21,11,3,143,141,208,47,5,178,62,123,74,28,75,115,5,18,252,198,234,224,80,19,124,67,147,116,179,202,116,231,142,31,1,8,208,48,212,91,113,54,180,7,186,193,48,48,92,72,183,130,59,152,166,125,96,138,162,163,41,130,204,186,189,131,4,27,162,131,3,65,161,214,5,241,27,194,182,240,168,124,134,59,70,168,72,42,136,220,118,154,118,191,31,106,165,61,25,143,235,56,243,100,222,200,43,13,10,40,255,247,219,226,21,66,212,34,208,39,93,225,121,254,24,231,112,136,173,78,230,217,139,58,198,221,39,81,110,255,188,100,245,51,67,79,2,3,1,0,1,163,66,48,64,48,14,6,3,85,29,15,1,1,255,4,4,3,2,1,6,48,15,6,3,85,29,19,1,1,255,4,5,48,3,1,1,255,48,29,6,3,85,29,14,4,22,4,20,121,180,89,230,123,182,229,228,1,115,128,8,136,200,26,88,246,233,155,110,48,13,6,9,42,134,72,134,247,13,1,1,11,5,0,3,130,2,1,0,85,31,88,169,188,178,168,80,208,12,177,216,26,105,32,39,41,8,172,97,117,92,138,110,248,130,229,105,47,213,246,86,75,185,184,115,16,89,211,33,151,126,231,76,113,251,178,210,96,173,57,168,11,234,23,33,86,133,241,80,14,89,235,206,224,89,233,186,201,21,239,134,157,143,132,128,246,228,233,145,144,220,23,155,98,27,69,240,102,149,210,124,111,194,234,59,239,31,207,203,214,174,39,241,169,176,200,174,253,125,126,154,250,34,4,235,255,217,127,234,145,43,34,177,23,14,143,242,138,52,91,88,216,252,1,201,84,185,184,38,204,138,136,51,137,76,45,132,60,130,223,238,150,87,5,186,44,187,247,196,183,199,78,59,130,190,49,200,34,115,115,146,209,194,128,164,57,57,16,51,35,130,76,60,159,134,178,85,152,29,190,41,134,140,34,155,158,226,107,59,87,58,130,112,77,220,9,199,137,203,10,7,77,108,232,93,142,201,239,206,171,199,187,181,43,78,69,214,74,208,38,204,229,114,202,8,106,165,149,227,21,161,247,164,237,201,44,95,165,251,255,172,40,2,46,190,215,123,187,227,113,123,144,22,211,7,94,70,83,124,55,7,66,140,211,196,150,156,213,153,181,42,224,149,26,128,72,174,76,57,7,206,204,71,164,82,149,43,186,184,251,173,210,51,83,125,229,29,77,109,213,161,177,199,66,111,230,64,39,53,92,163,40,183,7,141,231,141,51,144,231,35,159,251,80,156,121,108,70,213,180,21,179,150,110,126,155,12,150,58,184,82,45,63,214,91,225,251,8,194,132,254,36,168,163,137,218,172,106,225,24,42,177,168,67,97,91,211,31,220,59,141,118,242,45,232,141,117,223,23,51,108,61,83,251,123,203,65,95,255,220,162,208,97,56,225,150,184,172,93,139,55,215,117,213,51,192,153,17,174,157,65,193,114,117,132,190,2,65,66,95,103,36,72,148,209,155,39,190,7,63,185,184,79,129,116,81,225,122,183,237,157,35,226,190,224,213,40,4,19,60,49,3,158,221,122,108,143,198,7,24,198,127,222,71,142,63,40,158,4,6,207,165,84,52,119,189,236,137,155,233,23,67,223,91,219,95,254,142,30,87,162,205,64,157,126,98,34,218,222,24,39]},\"issuerCertificate\":null,\"validTo\":\"2035-06-04T11:04:38.000Z\",\"daysRemaining\":3659,\"certType\":\"root CA\"},\"validTo\":\"2027-03-12T23:59:59.000Z\",\"daysRemaining\":653,\"certType\":\"intermediate CA\"},\"validTo\":\"2025-08-04T18:53:38.000Z\",\"validFor\":[\"*.nginx.com\",\"nginx.com\"],\"daysRemaining\":68,\"certType\":\"server\"}}');
/*!40000 ALTER TABLE `monitor_tls_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` int(10) unsigned DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `config` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_sent_history`
--

DROP TABLE IF EXISTS `notification_sent_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_sent_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `monitor_id` int(10) unsigned NOT NULL,
  `days` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notification_sent_history_type_monitor_id_days_unique` (`type`,`monitor_id`,`days`),
  KEY `good_index` (`type`,`monitor_id`,`days`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_sent_history`
--

LOCK TABLES `notification_sent_history` WRITE;
/*!40000 ALTER TABLE `notification_sent_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_sent_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy`
--

DROP TABLE IF EXISTS `proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `proxy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `protocol` varchar(10) NOT NULL,
  `host` varchar(255) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `auth` tinyint(1) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `proxy_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy`
--

LOCK TABLES `proxy` WRITE;
/*!40000 ALTER TABLE `proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remote_browser`
--

DROP TABLE IF EXISTS `remote_browser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `remote_browser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remote_browser`
--

LOCK TABLES `remote_browser` WRITE;
/*!40000 ALTER TABLE `remote_browser` DISABLE KEYS */;
/*!40000 ALTER TABLE `remote_browser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES
(1,'migrateAggregateTableState','\"migrated\"',NULL),
(2,'jwtSecret','$2a$10$RLGK9m62IH5hn9632w5pnepSycbcerhPYFUQ9VQT4DrQ0iWhlc4JC',NULL),
(3,'initServerTimezone','true',NULL),
(4,'serverTimezone','\"Europe/Paris\"','general');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_daily`
--

DROP TABLE IF EXISTS `stat_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stat_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `timestamp` int(11) NOT NULL COMMENT 'Unix timestamp rounded down to the nearest day',
  `ping` float(8,2) NOT NULL COMMENT 'Average ping in milliseconds',
  `up` smallint(6) NOT NULL,
  `down` smallint(6) NOT NULL,
  `ping_min` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Minimum ping during this period in milliseconds',
  `ping_max` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Maximum ping during this period in milliseconds',
  `extras` text DEFAULT NULL COMMENT 'Extra statistics during this time period',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_daily_monitor_id_timestamp_unique` (`monitor_id`,`timestamp`),
  CONSTRAINT `stat_daily_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This table contains the daily aggregate statistics for each monitor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_daily`
--

LOCK TABLES `stat_daily` WRITE;
/*!40000 ALTER TABLE `stat_daily` DISABLE KEYS */;
INSERT INTO `stat_daily` VALUES
(1,1,1748390400,2176.11,9,2,1916.00,2668.00,NULL),
(2,2,1748390400,2.76,25,0,1.00,5.00,NULL),
(3,3,1748390400,1.00,8,0,1.00,1.00,NULL),
(4,4,1748390400,18.20,20,1,14.00,34.00,NULL);
/*!40000 ALTER TABLE `stat_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_hourly`
--

DROP TABLE IF EXISTS `stat_hourly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stat_hourly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `timestamp` int(11) NOT NULL COMMENT 'Unix timestamp rounded down to the nearest hour',
  `ping` float(8,2) NOT NULL COMMENT 'Average ping in milliseconds',
  `ping_min` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Minimum ping during this period in milliseconds',
  `ping_max` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Maximum ping during this period in milliseconds',
  `up` smallint(6) NOT NULL,
  `down` smallint(6) NOT NULL,
  `extras` text DEFAULT NULL COMMENT 'Extra statistics during this time period',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_hourly_monitor_id_timestamp_unique` (`monitor_id`,`timestamp`),
  CONSTRAINT `stat_hourly_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This table contains the hourly aggregate statistics for each monitor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_hourly`
--

LOCK TABLES `stat_hourly` WRITE;
/*!40000 ALTER TABLE `stat_hourly` DISABLE KEYS */;
INSERT INTO `stat_hourly` VALUES
(1,1,1748437200,2176.11,1916.00,2668.00,9,2,NULL),
(2,2,1748437200,2.76,1.00,5.00,25,0,NULL),
(3,3,1748437200,1.00,1.00,1.00,8,0,NULL),
(4,4,1748437200,18.20,14.00,34.00,20,1,NULL);
/*!40000 ALTER TABLE `stat_hourly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_minutely`
--

DROP TABLE IF EXISTS `stat_minutely`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stat_minutely` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int(10) unsigned NOT NULL,
  `timestamp` int(11) NOT NULL COMMENT 'Unix timestamp rounded down to the nearest minute',
  `ping` float(8,2) NOT NULL COMMENT 'Average ping in milliseconds',
  `up` smallint(6) NOT NULL,
  `down` smallint(6) NOT NULL,
  `ping_min` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Minimum ping during this period in milliseconds',
  `ping_max` float(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Maximum ping during this period in milliseconds',
  `extras` text DEFAULT NULL COMMENT 'Extra statistics during this time period',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stat_minutely_monitor_id_timestamp_unique` (`monitor_id`,`timestamp`),
  CONSTRAINT `stat_minutely_monitor_id_foreign` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This table contains the minutely aggregate statistics for each monitor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_minutely`
--

LOCK TABLES `stat_minutely` WRITE;
/*!40000 ALTER TABLE `stat_minutely` DISABLE KEYS */;
INSERT INTO `stat_minutely` VALUES
(1,1,1748439360,0.00,0,1,0.00,0.00,NULL),
(2,1,1748439420,0.00,0,1,0.00,0.00,NULL),
(3,2,1748439480,4.00,4,0,3.00,5.00,NULL),
(4,1,1748439480,2195.00,2,0,2050.00,2340.00,NULL),
(5,3,1748439480,1.00,1,0,1.00,1.00,NULL),
(6,2,1748439540,3.00,3,0,2.00,4.00,NULL),
(7,1,1748439540,1916.00,1,0,1916.00,1916.00,NULL),
(8,4,1748439540,32.00,2,1,30.00,34.00,NULL),
(9,3,1748439540,1.00,1,0,1.00,1.00,NULL),
(10,2,1748439600,3.00,3,0,2.00,4.00,NULL),
(11,4,1748439600,17.67,3,0,17.00,18.00,NULL),
(12,1,1748439600,2112.00,1,0,2112.00,2112.00,NULL),
(13,3,1748439600,1.00,1,0,1.00,1.00,NULL),
(14,2,1748439660,2.33,3,0,2.00,3.00,NULL),
(15,4,1748439660,16.33,3,0,15.00,17.00,NULL),
(16,1,1748439660,2079.00,1,0,2079.00,2079.00,NULL),
(17,3,1748439660,1.00,1,0,1.00,1.00,NULL),
(18,2,1748439720,2.67,3,0,1.00,5.00,NULL),
(19,4,1748439720,16.33,3,0,14.00,20.00,NULL),
(20,1,1748439720,1997.00,1,0,1997.00,1997.00,NULL),
(21,3,1748439720,1.00,1,0,1.00,1.00,NULL),
(22,2,1748439780,2.00,3,0,1.00,3.00,NULL),
(23,4,1748439780,15.33,3,0,15.00,16.00,NULL),
(24,1,1748439780,2668.00,1,0,2668.00,2668.00,NULL),
(25,3,1748439780,1.00,1,0,1.00,1.00,NULL),
(26,2,1748439840,2.67,3,0,2.00,4.00,NULL),
(27,4,1748439840,19.33,3,0,16.00,26.00,NULL),
(28,1,1748439840,2284.00,1,0,2284.00,2284.00,NULL),
(29,3,1748439840,1.00,1,0,1.00,1.00,NULL),
(30,2,1748439900,2.00,3,0,2.00,2.00,NULL),
(31,4,1748439900,15.00,3,0,15.00,15.00,NULL),
(32,1,1748439900,2139.00,1,0,2139.00,2139.00,NULL),
(33,3,1748439900,1.00,1,0,1.00,1.00,NULL);
/*!40000 ALTER TABLE `stat_minutely` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_page`
--

DROP TABLE IF EXISTS `status_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) NOT NULL,
  `theme` varchar(30) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `search_engine_index` tinyint(1) NOT NULL DEFAULT 1,
  `show_tags` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `footer_text` text DEFAULT NULL,
  `custom_css` text DEFAULT NULL,
  `show_powered_by` tinyint(1) NOT NULL DEFAULT 1,
  `google_analytics_tag_id` varchar(255) DEFAULT NULL,
  `show_certificate_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `auto_refresh_interval` int(10) unsigned DEFAULT 300,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_page_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_page`
--

LOCK TABLES `status_page` WRITE;
/*!40000 ALTER TABLE `status_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_page_cname`
--

DROP TABLE IF EXISTS `status_page_cname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_page_cname` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_page_id` int(10) unsigned DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_page_cname_domain_unique` (`domain`),
  KEY `status_page_cname_status_page_id_foreign` (`status_page_id`),
  CONSTRAINT `status_page_cname_status_page_id_foreign` FOREIGN KEY (`status_page_id`) REFERENCES `status_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_page_cname`
--

LOCK TABLES `status_page_cname` WRITE;
/*!40000 ALTER TABLE `status_page_cname` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_page_cname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `timezone` varchar(150) DEFAULT NULL,
  `twofa_secret` varchar(64) DEFAULT NULL,
  `twofa_status` tinyint(1) NOT NULL DEFAULT 0,
  `twofa_last_token` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'tle-goff','$2a$10$T/hn9d/0K9f3hJJ31SOeC.3wcSR/phioCWz9Qn2P9WUhvmdZAUtbi',1,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-28 13:46:14
