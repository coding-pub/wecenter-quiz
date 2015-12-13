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
	`start_time` int(10) NOT NULL COMMENT '答题开始时间',
	`end_time` int(10) NOT NULL COMMENT '答题结束时间',
	`user_answer` text COMMENT '用户答案',
	`passed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否通过测试',
	`time_spend` int(10) NOT NULL DEFAULT '0' COMMENT '答题所耗费时间',
	PRIMARY KEY (`id`),
	KEY `question_id` (`question_id`),
	KEY `uid` (`uid`),
	KEY `start_time` (`start_time`),
	KEY `end_time` (`end_time`),
	KEY `passed` (`passed`),
	KEY `time_spend` (`time_spend`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `aws_question_solution` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '答案纪录ID',
	`add_time` int(10) NOT NULL COMMENT '答案添加时间',
	`update_time`  int(10) NOT NULL COMMENT '答案更新时间',
	`content` text NOT NULL COMMENT '答案内容',
	`has_attach` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有附件',
	PRIMARY KEY (`id`),
	KEY `add_time` (`add_time`),
	KEY `update_time` (`update_time`),
	KEY `has_attach` (`has_attach`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `aws_question_solution_record` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '答案查看记录ID',
	`question_id` int(11) NOT NULL COMMENT '问题ID',
	`uid` int(11) NOT NULL COMMENT '用户ID',
	`add_time` int(10) NOT NULL COMMENT '查看时间',
	PRIMARY KEY (`id`),
	KEY `question_id` (`question_id`),
	KEY `uid` (`uid`),
	KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `aws_slide` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '幻灯片记录ID',
	`link` varchar(255) NOT NULL COMMENT '幻灯片链接',
	`title` varchar(255) COMMENT '幻灯片标题',
	`description` text COMMENT '幻灯片描述',
	`order` int(4) NOT NULL DEFAULT '0' COMMENT '幻灯片顺序',
	`add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
	PRIMARY KEY (`id`),
	KEY `link` (`link`),
	KEY `order` (`order`),
	KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `aws_recommend_homepage` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '推荐ID',
	`item_type` varchar(255) NOT NULL COMMENT '推荐类型',
	`item_id` int(11) NOT NULL COMMENT '推荐项目ID',
	`add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
	PRIMARY KEY (`id`),
	KEY `item_id` (`item_id`),
	KEY `item_type` (`item_type`),
	KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `aws_sign_in` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '签到ID',
	`uid` int(11) NOT NULL COMMENT '签到用户ID',
	`sign_time` int(10) NOT NULL COMMENT '签到时间',
	`continous` int(6) NOT NULL DEFAULT '0' COMMENT '周期连续签到次数',
	`continous_all` int(6) NOT NULL DEFAULT '0' COMMENT '非周期签到次数',
	PRIMARY KEY (`id`),
	KEY `uid` (`uid`),
	KEY `sign_time` (`sign_time`),
	KEY `continous` (`continous`),
	KEY `continous_all` (`continous_all`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- asw_question表中需要添加的表项

ALTER TABLE `aws_question` ADD COLUMN `difficulty` tinyint(2) NOT NULL DEFAULT '0' COMMENT '问题难度';
ALTER TABLE `aws_question` ADD COLUMN `quiz_id` int(11) DEFAULT '0' COMMENT '问题内嵌测试ID';
ALTER TABLE `aws_question` ADD COLUMN `solution_id` int(11) DEFAULT '0' COMMENT '答案详细解析ID';
ALTER TABLE `aws_question` ADD COLUMN `is_first` tinyint(1) NOT NULL DEFAULT '0' COMMENT '出题者第一次回访';

ALTER TABLE `aws_question` ADD COLUMN `quiz_count_total` tinyint(11) NOT NULL DEFAULT '0' COMMENT '该问题被回答的次数';
ALTER TABLE `aws_question` ADD COLUMN `quiz_count_passed` tinyint(11) NOT NULL DEFAULT '0' COMMENT '该问题被回答正确的次数';
ALTER TABLE `aws_question` ADD COLUMN `quiz_count_timeout` tinyint(11) NOT NULL DEFAULT '0' COMMENT '该问题被回答超时的次数';
ALTER TABLE `aws_question` ADD COLUMN `quiz_count_POFT` tinyint(11) NOT NULL DEFAULT '0' COMMENT '该问题第一次就回答正确(Passed On First Try)次数';
ALTER TABLE `aws_question` ADD COLUMN `quiz_success_ratio` float NOT NULL DEFAULT '0' COMMENT '该问题的答题正确率';

-- aws_account表中需要添加的表项

ALTER TABLE `aws_users` ADD COLUMN `question_quiz_count_total` tinyint(11) NOT NULL DEFAULT '0' COMMENT '该用户答题次数';
ALTER TABLE `aws_users` ADD COLUMN `question_quiz_count_passed` tinyint(11) NOT NULL DEFAULT '0' COMMENT '该用户回答正确的次数';
ALTER TABLE `aws_users` ADD COLUMN `question_quiz_count_timeout` tinyint(11) NOT NULL DEFAULT '0' COMMENT '该用户答题超时的次数';
ALTER TABLE `aws_users` ADD COLUMN `question_quiz_count_POFT` tinyint(11) NOT NULL DEFAULT '0' COMMENT '该用户第一次就回答正确(Passed On First Try)次数';
ALTER TABLE `aws_users` ADD COLUMN `question_quiz_success_ratio` float NOT NULL DEFAULT '0' COMMENT '该用户答题正确率';

-- 新添的系统设置初始化

INSERT INTO `aws_system_setting` (`varname`, `value`) VALUES
('difficulty_level_1_text', 's:6:"休闲";'),
('difficulty_level_1_integral', 's:2:"50";'),
('difficulty_level_2_text', 's:6:"简单";'),
('difficulty_level_2_integral', 's:2:"80";'),
('difficulty_level_3_text', 's:6:"中等";'),
('difficulty_level_3_integral', 's:3:"100";'),
('difficulty_level_4_text', 's:6:"困难";'),
('difficulty_level_4_integral', 's:3:"150";'),
('difficulty_level_5_text', 's:6:"极难";'),
('difficulty_level_5_integral', 's:3:"200";'),
('question_quiz_correct_integral_coeffcient', 's:1:"1";'),
('question_quiz_wrong_integral_coeffcient', 's:2:"-1";'),
('question_quiz_timeout_integral_coeffcient', 's:2:"-2";'),
('question_quiz_retry_integral_coeffcient', 's:4:"-1.5";'),
('question_quiz_solution_integral_coeffcient', 's:2:"-2";'),
('user_quiz_message_interval', 's:3:"300";'),
('sign_integral_every_day', 's:3:"200";'),
('sign_integral_seventh_day', 's:3:"500"');