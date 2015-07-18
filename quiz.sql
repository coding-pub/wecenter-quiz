-- debug info

-- DROP DATABASE IF EXISTS `aws_test`;
-- CREATE DATABASE `aws_test`;
-- USE `aws_test`;

USE `naokr`;

-- quiz data tables

CREATE TABLE IF NOT EXISTS `aws_quiz` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '测试ID',
	`type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '测试种类',
	`category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
	`cover_img` varchar(255) DEFAULT NULL COMMENT '测试封面',
	`title` varchar(255) NOT NULL COMMENT '测试标题',
	`description` text NOT NULL COMMENT '测试详细描述',
	`content` text NOT NULL COMMENT '测试详细内容',
	`quiz_count` int(4) NOT NULL COMMENT '题目数目',
	`add_time` int(10) NOT NULL DEFAULT '0' COMMENT '测试添加时间',
	`has_attach` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否存在附件',
	PRIMARY KEY (`id`),
	KEY `type` (`type`),
	KEY `category_id` (`category_id`),
	KEY `quiz_count` (`quiz_count`),
	KEY `add_time` (`add_time`),
	KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `aws_quiz_record` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '测试记录ID',
	`quiz_id` int(11) NOT NULL COMMENT '测试ID',
	`uid` int(11) NOT NULL COMMENT '用户ID',
	`add_time` int(10) NOT NULL COMMENT '测试时间',
	`score` int(10) NOT NULL COMMENT '测试分值',
	`user_answer` text NOT NULL COMMENT '用户提交的答案',
	`time_spend` int(10) DEFAULT '0' COMMENT '用户测试所耗费时间',
	PRIMARY KEY (`id`),
	KEY `quiz_id` (`quiz_id`),
	KEY `uid` (`uid`),
	KEY `add_time` (`add_time`),
	KEY `score` (`score`),
	KEY `time_spend` (`time_spend`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `aws_question_quiz` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '问题内嵌测试',
	`type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '题目类型',
	`content` text NOT NULL COMMENT '测试详细内容',
	`countdown` int(10) NOT NULL DEFAULT '0' COMMENT '答题时限',
	PRIMARY KEY (`id`),
	KEY `type` (`type`),
	KEY `countdown` (`countdown`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `aws_question_quiz_record` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '答题纪录ID',
	`question_id` int(11) NOT NULL COMMENT '问题ID',
	`uid` int(11) NOT NULL COMMENT '用户ID',
	`add_time` int(10) NOT NULL COMMENT '答题时间',
	`user_answer` text NOT NULL COMMENT '用户答案',
	`time_spend` int(10) DEFAULT '0' COMMENT '答题所耗费时间',
	PRIMARY KEY (`id`),
	KEY `question_id` (`question_id`),
	KEY `uid` (`uid`),
	KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `aws_solution` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '答案纪录ID',
	`question_id` int(11) NOT NULL COMMENT '问题ID',
	`uid` int(11) NOT NULL COMMENT '用户ID',
	`add_time` int(10) NOT NULL COMMENT '答案添加时间',
	`update_time`  int(10) NOT NULL COMMENT '答案更新时间',
	`content` text NOT NULL COMMENT '答案内容',
	`required_integral` int(10) NOT NULL COMMENT '查看答案所需积分',
	`view_count` int(11) NOT NULL DEFAULT '0' COMMENT '答案查看次数',
	`agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '赞同次数',
	`against_count` int(11) NOT NULL DEFAULT '0' COMMENT '反对次数',
	`has_attach` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有附件',
	PRIMARY KEY (`id`),
	KEY `question_id` (`question_id`),
	KEY `uid` (`uid`),
	KEY `add_time` (`add_time`),
	KEY `update_time` (`update_time`),
	KEY `required_integral` (`required_integral`),
	KEY `view_count` (`view_count`),
	KEY `agree_count` (`agree_count`),
	KEY `against_count` (`against_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `aws_solution_record` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '答案查看记录ID',
	`question_id` int(11) NOT NULL COMMENT '问题ID',
	`uid` int(11) NOT NULL COMMENT '用户ID',
	`add_time` int(10) NOT NULL COMMENT '查看时间',
	PRIMARY KEY (`id`),
	KEY `question_id` (`question_id`),
	KEY `uid` (`uid`),
	KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- asw_question表中需要添加的表项

ALTER TABLE `aws_question` ADD COLUMN `difficulty` tinyint(2) NOT NULL DEFAULT '0' COMMENT '问题难度';
ALTER TABLE `aws_question` ADD COLUMN `quiz_id` int(11) DEFAULT '0' COMMENT '问题内嵌测试ID';