DROP TABLE IF EXISTS `sentiment_history`;

CREATE TABLE `sentiment_history` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `logged_at` date DEFAULT NULL,
      `pos_perc` decimal(10,2) DEFAULT NULL,
      `hour` int(11) DEFAULT NULL,
      `neg_perc` decimal(10,2) DEFAULT NULL,
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

