/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50617
Source Host           : entertry.com:3306
Source Database       : webqt

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-10-20 19:08:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for advert
-- ----------------------------
DROP TABLE IF EXISTS `advert`;
CREATE TABLE `advert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ordernum` int(10) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bit(1) NOT NULL DEFAULT b'0',
  `imgpath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for navicon
-- ----------------------------
DROP TABLE IF EXISTS `navicon`;
CREATE TABLE `navicon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ordernum` int(10) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bit(1) NOT NULL DEFAULT b'0',
  `imgpath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for slide
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ordernum` int(10) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bit(1) NOT NULL DEFAULT b'0',
  `imgpath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
