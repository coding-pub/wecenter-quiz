-- debug info

DROP DATABASE IF EXISTS `aws_test`;
CREATE DATABASE `aws_test`;
USE `aws_test`;

-- quiz data tables

CREATE TABLE IF NOT EXISTS `aws_quiz` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '测试ID',
	`type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '测试类型',
	`category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
	`cover_img` varchar(255) DEFAULT NULL COMMENT '测试封面',
	`title` varchar(255) NOT NULL COMMENT '测试标题',
	`description` text NOT NULL COMMENT '测试详细描述',
	`content` text NOT NULL COMMENT '测试详细内容',
	`add_time` int(10) NOT NULL DEFAULT '0' COMMENT '测试添加时间',
	`has_attach` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否存在附件',
	PRIMARY KEY (`id`),
	KEY `type` (`type`),
	KEY `category_id` (`category_id`),
	KEY `add_time` (`add_time`),
	KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;