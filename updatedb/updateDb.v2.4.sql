-- MySQL Workbench Synchronization
-- Generated: 2017-05-04 19:38
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Daniel

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `likes` 
DROP FOREIGN KEY `fk_likes_users1`;

ALTER TABLE `configurations` 
CHANGE COLUMN `ffprobeDuration` `ffprobeDuration` VARCHAR(400) NULL DEFAULT NULL ,
CHANGE COLUMN `ffmpegImage` `ffmpegImage` VARCHAR(400) NULL DEFAULT NULL ,
CHANGE COLUMN `ffmpegMp4` `ffmpegMp4` VARCHAR(400) NULL DEFAULT NULL ,
CHANGE COLUMN `ffmpegWebm` `ffmpegWebm` VARCHAR(400) NULL DEFAULT NULL ,
CHANGE COLUMN `ffmpegMp3` `ffmpegMp3` VARCHAR(400) NULL DEFAULT NULL ,
CHANGE COLUMN `ffmpegOgg` `ffmpegOgg` VARCHAR(400) NULL DEFAULT NULL ,
CHANGE COLUMN `youtubeDl` `youtubeDl` VARCHAR(400) NULL DEFAULT NULL ;

ALTER TABLE `likes` 
DROP FOREIGN KEY `fk_likes_videos1`;

ALTER TABLE `likes` ADD CONSTRAINT `fk_likes_videos1`
  FOREIGN KEY (`videos_id`)
  REFERENCES `videos` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_likes_users1`
  FOREIGN KEY (`users_id`)
  REFERENCES `users` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

UPDATE configurations SET  version = '2.4', modified = now() WHERE id = 1;
