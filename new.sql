CREATE  TABLE `sentiment`.`sentiment_history` (
      `id` INT NOT NULL AUTO_INCREMENT ,
      `logged_at` DATE NULL ,
      `hour` INT NULL ,
      `pos_perc` VARCHAR(45) NULL ,
      PRIMARY KEY (`id`) );

