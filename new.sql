DROP TABLE IF EXISTS `sentiment_history`;

CREATE TABLE `sentiment_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logged_at` date DEFAULT NULL,
  `pos_perc` decimal(10,2) DEFAULT NULL,
  `hour` int(11) DEFAULT NULL,
  `neg_perc` decimal(10,2) DEFAULT NULL,
  `topic` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sentiment_history` WRITE;
/*!40000 ALTER TABLE `sentiment_history` DISABLE KEYS */;

INSERT INTO `sentiment_history` (`id`, `logged_at`, `pos_perc`, `hour`, `neg_perc`, `topic`)
VALUES
	(2,'2013-11-26',19.00,9,18.00,'dc'),
	(4,'2013-11-26',19.00,12,19.00,'dc'),
	(5,'2013-11-26',21.00,19,20.00,'dc'),
	(6,'2013-11-26',22.00,23,23.00,'dc'),
	(7,'2013-11-26',30.00,9,34.34,'gwu'),
	(8,'2013-11-26',32.34,12,35.34,'gwu'),
	(9,'2013-11-26',23.23,19,23.23,'gwu'),
	(10,'2013-11-26',45.34,23,54.34,'gwu');