/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.0.77 : Database - ocsearch_1.0
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`ocsearch` /*!40100 DEFAULT CHARACTER SET utf8 */;

CREATE USER ocsearch@'%' IDENTIFIED BY 'ocsearch';
grant all privileges on ocsearch.* to ocsearch@'%' IDENTIFIED BY 'ocsearch';
USE `ocsearch`;

/*Table structure for table `tables` */

DROP TABLE IF EXISTS `tables`;

CREATE TABLE `tables` (
  `name` varchar(255) NOT NULL,
  `hbase_table` varchar(255) NOT NULL,
  `solr_collection` varchar(255) NOT NULL,
  `store_type` varchar(1) NOT NULL,
  `store_period` decimal(22,0) NOT NULL,
  `partition` varchar(255) NOT NULL,
  PRIMARY KEY  (`name`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `df_act_class` */

LOCK TABLES `tables` WRITE;

UNLOCK TABLES;


/*Table structure for table `df_act_varible` */

DROP TABLE IF EXISTS `schemas`;

CREATE TABLE `schemas` (
  `name` varchar(255) NOT NULL,
  `indexed` varchar(5) NOT NULL,
  `contented` varchar(5) NOT NULL,
  `stored` varchar(5) NOT NULL,
  `hbase_column` varchar(255) NOT NULL,
  `hbase_family` varchar(255) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  UNIQUE KEY `ak_key_2_schemas` (`name`,`table_name`),
  KEY `schemas_fk_reference_table` (`table_name`),
  CONSTRAINT `fk_reference_table` FOREIGN KEY (`table_name`) REFERENCES `tables` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION

) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `schemas` */

LOCK TABLES `schemas` WRITE;

UNLOCK TABLES;



/*Table structure for table `base` */

DROP TABLE IF EXISTS `base`;

CREATE TABLE `base` (
  `name` varchar(255) NOT NULL,
  `isFast` varchar(5) NOT NULL,
  `table_name` varchar(255) NOT NULL,
   UNIQUE KEY `ak_key_2_base` (`name`,`table_name`),
   KEY `base_fk_reference_table` (`table_name`),
   CONSTRAINT `base_fk_reference_table` FOREIGN KEY (`table_name`) REFERENCES `tables` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `base` */

LOCK TABLES `base` WRITE;

UNLOCK TABLES;


/*Table structure for table `query` */

DROP TABLE IF EXISTS `query`;
CREATE TABLE `query` (
  `name` varchar(255) NOT NULL,
  `weight` decimal(22,0) NOT NULL,
  `table_name` varchar(255) NOT NULL,
  UNIQUE KEY `ak_key_2_query` (`name`,`table_name`),
  KEY `query_fk_reference_table` (`table_name`),
  CONSTRAINT `query_fk_reference_table` FOREIGN KEY (`table_name`) REFERENCES `tables` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `query` */

LOCK TABLES `query` WRITE;

UNLOCK TABLES;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;