/*
Navicat MySQL Data Transfer

Source Server         : NAVM-5ZCW-5PER-KPFT
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-10-14 09:34:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `alias` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address_block` varchar(100) NOT NULL,
  `address_street` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `is_default` varchar(3) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for `reset_password`
-- ----------------------------
DROP TABLE IF EXISTS `reset_password`;
CREATE TABLE `reset_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `uuid` varchar(50) NOT NULL,
  `apply_time` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reset_password
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `gender` varchar(3) DEFAULT NULL,
  `birthday` varchar(10) DEFAULT NULL,
  `address_block` varchar(100) DEFAULT NULL,
  `address_street` varchar(100) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `weixin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'alan2531ae4e', 'alan2531ae4e@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `user_image`
-- ----------------------------
DROP TABLE IF EXISTS `user_image`;
CREATE TABLE `user_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_image
-- ----------------------------