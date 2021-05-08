

CREATE DATABASE `blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

-- SHOW CREATE TABLE `user`; --Table

CREATE TABLE `user` (
  `id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'user id',
  `username` VARCHAR(60) NOT NULL COMMENT 'user name',
  `password` VARCHAR(60) NOT NULL COMMENT 'password',
  `sex` VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'sex',
  `age` INT(3) DEFAULT NULL COMMENT 'age',
  `signature` VARCHAR(200) DEFAULT NULL COMMENT 'signature',
  `open_id` VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'wechat id',
  `avator` VARCHAR(1000) DEFAULT NULL COMMENT 'address of image',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;


CREATE TABLE `blog` (
  `id` INT(10) NOT NULL COMMENT 'blog id',
  `title` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'blog title',
  `author_id` INT(10) NOT NULL COMMENT 'blog author(user id)',
  `category_id` INT(10) NOT NULL COMMENT 'blog category',
  `content` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'blog content',
  `create_time` DATETIME NOT NULL COMMENT 'create time',
  `update_time` DATETIME NOT NULL COMMENT 'update time',
  `love` INT(10) DEFAULT NULL COMMENT 'love number',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `category` (
  `id` INT(10) NOT NULL COMMENT 'category id',
  `category_name` VARCHAR(30) NOT NULL COMMENT 'category name',
  `create_user_id` INT(10) NOT NULL COMMENT 'user id',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `comment` (
  `id` INT(10) NOT NULL COMMENT 'comment id',
  `blog_id` INT(10) NOT NULL COMMENT 'blog id',
  `user_id` INT(10) NOT NULL COMMENT 'user id',
  `content` VARCHAR(2000) NOT NULL COMMENT 'comment content',
  `create_time` DATETIME NOT NULL COMMENT 'comment time',
  `user_id_parent` INT(10) NOT NULL COMMENT 'reply to whom',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `followers` (
  `id` INT(10) NOT NULL,
  `user_id` INT(10) NOT NULL COMMENT 'followed, user_id',
  `follower_id` INT(10) NOT NULL COMMENT 'follower, user_id',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `links` (
  `id` INT(10) NOT NULL COMMENT 'link id',
  `links` VARCHAR(50) NOT NULL COMMENT 'website',
  `href` VARCHAR(2000) NOT NULL COMMENT 'to link',
  `sort` INT(10) NOT NULL COMMENT 'sort',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;


