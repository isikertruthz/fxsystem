/*
Navicat MySQL Data Transfer

Source Server         : entertry.com
Source Server Version : 50617
Source Host           : entertry.com:3306
Source Database       : webqt

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-11-05 08:52:09
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of advert
-- ----------------------------
INSERT INTO `advert` VALUES ('1', '3213', '', '1231', '', '');

-- ----------------------------
-- Table structure for composition
-- ----------------------------
DROP TABLE IF EXISTS `composition`;
CREATE TABLE `composition` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `imgpath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `isvisited` bit(1) NOT NULL DEFAULT b'1',
  `ordernum` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of composition
-- ----------------------------
INSERT INTO `composition` VALUES ('1', '搜索栏', 'search.jpg', '', '0');
INSERT INTO `composition` VALUES ('2', '幻灯栏', 'hdp.jpg', '', '1');
INSERT INTO `composition` VALUES ('3', '导航栏', 'nav.jpg', '', '7');
INSERT INTO `composition` VALUES ('4', '公告栏', 'gonggao.jpg', '', '2');
INSERT INTO `composition` VALUES ('5', '秒杀栏', 'miaoshalan.jpg', '', '6');
INSERT INTO `composition` VALUES ('6', '魔方栏', 'mofang.jpg', '', '3');
INSERT INTO `composition` VALUES ('7', '广告栏', 'gglan.jpg', '', '4');
INSERT INTO `composition` VALUES ('8', '推荐栏', 'tuijianlan.jpg', '', '5');

-- ----------------------------
-- Table structure for cube
-- ----------------------------
DROP TABLE IF EXISTS `cube`;
CREATE TABLE `cube` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `imgpath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ordernum` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cube
-- ----------------------------
INSERT INTO `cube` VALUES ('180', 'ff3ea57edc6548a1adee519dc487827d.jpeg', '3', '0');
INSERT INTO `cube` VALUES ('181', '9d68237ffae847c881ebd8a3837de70f.jpeg', '121312', '1');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `imgpath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `isrec` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('2', 'oeiN3IjgG6otowb3g6JIjpWNjpGPGB.jpg', 'iphone', '1');
INSERT INTO `goods` VALUES ('3', 'qjxXXg00eptPTqpe0XN0xxqtXpdXQH.jpg', 'iwatch', '1');
INSERT INTO `goods` VALUES ('4', 'oeiN3IjgG6otowb3g6JIjpWNjpGPGB.jpg', 'iphone', '1');
INSERT INTO `goods` VALUES ('5', 'JdDHM88Ijni82R7wdjH2HiwODdOhhj.jpg', 'iwatch', '1');
INSERT INTO `goods` VALUES ('6', 'oeiN3IjgG6otowb3g6JIjpWNjpGPGB.jpg', 'iwatch', '1');
INSERT INTO `goods` VALUES ('8', 'qjxXXg00eptPTqpe0XN0xxqtXpdXQH.jpg', 'iwatch', '1');
INSERT INTO `goods` VALUES ('9', 'JdDHM88Ijni82R7wdjH2HiwODdOhhj.jpg', 'iwatch', '1');
INSERT INTO `goods` VALUES ('13', 'oeiN3IjgG6otowb3g6JIjpWNjpGPGB.jpg', '折扣款iwatch', '1');
INSERT INTO `goods` VALUES ('14', 'JdDHM88Ijni82R7wdjH2HiwODdOhhj.jpg', 'BBphone', '1');
INSERT INTO `goods` VALUES ('15', 'qjxXXg00eptPTqpe0XN0xxqtXpdXQH.jpg', 'ggpad', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of navicon
-- ----------------------------
INSERT INTO `navicon` VALUES ('31', '21312', '3123123', '31231', '', '176bded8ab764404bc8b9a22bdcde3bd.jpeg');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ordernum` int(10) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bit(1) NOT NULL DEFAULT b'0',
  `imgpath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('54', '12313', '', '3123', '', '', '<p>请输fsdfsadfsdfasfsdfasaaa</p><p><strong>dsfasdfasdfsdf</strong></p><p><strong><img src=\"http://www.entertry.com/ueditor/php/upload/image/20181024/1540375593950442.jpg\" title=\"1540374223242785.jpg\" alt=\"头像.jpg\" width=\"190\" height=\"169\"/></strong></p>');
INSERT INTO `notice` VALUES ('56', '33335', '323231', '32323', '', '', '<p><span style=\"text-decoration: underline;\">21312</span></p>');
INSERT INTO `notice` VALUES ('57', '211', 'fsdf', '23123', '', '', '<p>dsfsdfsdaf</p>');

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES ('26', '123123', '3123123123123', '幻灯片2', '', 'c681b5feaf2d49d0a7068f236e2d73ca.jpeg');
INSERT INTO `slide` VALUES ('28', '23123', '31231231', '幻灯片3', '\0', 'afc2e3eee46547d5be3d63822afceb24.png');
INSERT INTO `slide` VALUES ('29', '124234', '23423424', '2342343242', '', 'aa73be7160064445b66f004826fbdcdf.png');
INSERT INTO `slide` VALUES ('32', '213123', 'fsafsdfsadfsdf', 'fsafsdf', '', 'e75c0ee7d1cf46309f9886f089d54138.png');
INSERT INTO `slide` VALUES ('41', '213123', 'dsfsdfsadfdas', 'fsdfsdfsd', '\0', '');
INSERT INTO `slide` VALUES ('50', '3333', '31231', '3123', '\0', '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('123', 'qt');
