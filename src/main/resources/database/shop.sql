/*
Navicat MySQL Data Transfer

Source Server         : RemoteShop
Source Server Version : 50158
Source Host           : 117.18.100.171:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50158
File Encoding         : 65001

Date: 2015-11-05 21:40:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `alias` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address_sheng` varchar(50) NOT NULL,
  `address_shi` varchar(50) NOT NULL,
  `address_xian` varchar(50) NOT NULL,
  `address_zhen` varchar(50) NOT NULL,
  `address_detail` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `is_default` varchar(3) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('2', '10', 'Alan', '曾迎颖', '珠海', '', '', '', '1', '18688163699', 'no');
INSERT INTO `address` VALUES ('3', '10', 'Alan1', '曾迎颖', '珠海', '', '', '', '1', '18688163699', 'on');
INSERT INTO `address` VALUES ('6', '10', '123', '123', '123', '', '', '', '1', '11111111111', 'no');
INSERT INTO `address` VALUES ('7', '1', '吉大', '蒋风浪', '广东省珠海市香洲区', '', '', '', '九州大道', '15989752900', 'on');
INSERT INTO `address` VALUES ('8', '1', '柠溪', '蒋风浪', '广东省珠海市香洲区', '', '', '', '锦柠路388号', '17099897770', 'no');
INSERT INTO `address` VALUES ('9', '1', '海虹', '蒋风浪', '广东省珠海市香洲区', '', '', '', '海虹路1号', '17099897770', 'no');
INSERT INTO `address` VALUES ('10', '112', 'Alan', '曾迎颖', '广东', '珠海', '金湾区', '', '海虹路', '18688163699', 'on');
INSERT INTO `address` VALUES ('11', '112', 'Alan1', '曾迎颖', '内蒙古', '阿拉善', '额济纳旗', '马鬃山苏木', '海虹路', '18665154404', 'no');
INSERT INTO `address` VALUES ('12', '112', 'Alan2', '曾迎颖', '江苏', '淮安', '涟水', '黄营乡', '海虹路', '18677208052', 'no');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productCount` int(11) NOT NULL,
  `createTime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('8', '3', '3333', '333', '2015-11-03');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(200) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'root', null);
INSERT INTO `category` VALUES ('2', '即食海鲜', '1');
INSERT INTO `category` VALUES ('3', '海蜇', '2');
INSERT INTO `category` VALUES ('4', '鳗鱼丝', '2');
INSERT INTO `category` VALUES ('5', '海苔', '2');
INSERT INTO `category` VALUES ('6', '麻辣蟹子', '2');
INSERT INTO `category` VALUES ('7', '虾皮', '2');
INSERT INTO `category` VALUES ('8', '虾米', '2');
INSERT INTO `category` VALUES ('9', '香脆鱼排', '2');
INSERT INTO `category` VALUES ('10', '海鲜干货', '1');
INSERT INTO `category` VALUES ('11', '海参系列', '10');
INSERT INTO `category` VALUES ('12', '海鲜零食', '10');
INSERT INTO `category` VALUES ('13', '虾类干货', '10');
INSERT INTO `category` VALUES ('14', '干贝/元贝', '10');
INSERT INTO `category` VALUES ('15', '鱼唇', '10');
INSERT INTO `category` VALUES ('16', '裙边', '10');
INSERT INTO `category` VALUES ('17', '花椒/鱼肚', '10');
INSERT INTO `category` VALUES ('18', '鱼类干货', '10');
INSERT INTO `category` VALUES ('19', '冷冻海鲜', '1');
INSERT INTO `category` VALUES ('20', '冰鲜鱼虾贝', '19');
INSERT INTO `category` VALUES ('21', '三文鱼', '19');
INSERT INTO `category` VALUES ('22', '鲫鱼', '19');
INSERT INTO `category` VALUES ('23', '蟹类', '19');
INSERT INTO `category` VALUES ('24', '刺身系列', '19');
INSERT INTO `category` VALUES ('25', '即食海参', '19');
INSERT INTO `category` VALUES ('26', '日本料理', '19');
INSERT INTO `category` VALUES ('27', '丸类', '19');
INSERT INTO `category` VALUES ('28', '火锅系列', '19');
INSERT INTO `category` VALUES ('29', '鲜活海鲜', '1');
INSERT INTO `category` VALUES ('30', '虾类干货', '29');
INSERT INTO `category` VALUES ('31', '蟹类', '29');
INSERT INTO `category` VALUES ('32', '鱼类', '29');
INSERT INTO `category` VALUES ('33', '贝类', '29');
INSERT INTO `category` VALUES ('34', '龟鳖', '29');
INSERT INTO `category` VALUES ('35', '藻类', '29');
INSERT INTO `category` VALUES ('36', '软体类', '29');
INSERT INTO `category` VALUES ('37', '手机', '1');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `stars` int(11) NOT NULL,
  `comment_text` varchar(1000) NOT NULL,
  `create_time` varchar(30) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('15', '1', '1', '1', '5', '评论测试', '2015-11-03 11:10:54 GMT+08:00', null);
INSERT INTO `comment` VALUES ('16', '1', '7', '166', '5', '非常好吃111', '2015-11-03 11:24:50 GMT+08:00', null);
INSERT INTO `comment` VALUES ('17', '1', '8', '166', '5', '非常好吃222', '2015-11-03 11:25:45 GMT+08:00', null);
INSERT INTO `comment` VALUES ('18', '1', '9', '166', '5', '非常好吃333', '2015-11-03 11:25:52 GMT+08:00', null);

-- ----------------------------
-- Table structure for favorites
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `createTime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favorites
-- ----------------------------

-- ----------------------------
-- Table structure for menutable
-- ----------------------------
DROP TABLE IF EXISTS `menutable`;
CREATE TABLE `menutable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menutable
-- ----------------------------
INSERT INTO `menutable` VALUES ('1', null, null, '', null, 'root', null);
INSERT INTO `menutable` VALUES ('2', '16', '1', '', null, 'link', '首页');
INSERT INTO `menutable` VALUES ('3', '2', '1', 'product/productList?id=2', null, 'category', '即食海鲜');
INSERT INTO `menutable` VALUES ('4', '3', '3', 'product/productList?id=3', null, 'category', '海蜇');
INSERT INTO `menutable` VALUES ('5', '4', '3', 'product/productList?id=4', null, 'category', '鳗鱼丝');
INSERT INTO `menutable` VALUES ('6', '5', '3', 'product/productList?id=5', null, 'category', '海苔');
INSERT INTO `menutable` VALUES ('7', '6', '3', 'product/productList?id=6', null, 'category', '麻辣蟹子');
INSERT INTO `menutable` VALUES ('8', '7', '3', 'product/productList?id=7', null, 'category', '虾皮');
INSERT INTO `menutable` VALUES ('9', '8', '3', 'product/productList?id=8', null, 'category', '虾米');
INSERT INTO `menutable` VALUES ('10', '9', '3', 'product/productList?id=9', null, 'category', '香脆鱼排');
INSERT INTO `menutable` VALUES ('11', '10', '1', 'product/productList?id=10', null, 'category', '海鲜干货');
INSERT INTO `menutable` VALUES ('12', '11', '11', 'product/productList?id=11', null, 'category', '海参系列');
INSERT INTO `menutable` VALUES ('13', '12', '11', 'product/productList?id=12', null, 'category', '海鲜零食');
INSERT INTO `menutable` VALUES ('14', '13', '11', 'product/productList?id=13', null, 'category', '虾类干货');
INSERT INTO `menutable` VALUES ('15', '14', '11', 'product/productList?id=14', null, 'category', '干贝/元贝');
INSERT INTO `menutable` VALUES ('16', '15', '11', 'product/productList?id=15', null, 'category', '鱼唇');
INSERT INTO `menutable` VALUES ('17', '16', '11', 'product/productList?id=16', null, 'category', '裙边');
INSERT INTO `menutable` VALUES ('18', '17', '11', 'product/productList?id=17', null, 'category', '花椒/鱼肚');
INSERT INTO `menutable` VALUES ('19', '18', '11', 'product/productList?id=18', null, 'category', '鱼类干货');
INSERT INTO `menutable` VALUES ('20', '17', '1', '', null, 'link', '海鲜知识');
INSERT INTO `menutable` VALUES ('21', '18', '1', '', null, 'link', '联系我们');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `createTime` varchar(255) NOT NULL,
  `orderStatus` varchar(255) NOT NULL,
  `payStatus` varchar(255) NOT NULL,
  `orderPrice` varchar(255) NOT NULL,
  `shipPrice` varchar(255) NOT NULL,
  `allPrice` varchar(255) NOT NULL,
  `deliverTime` varchar(255) NOT NULL,
  `shipName` varchar(255) DEFAULT NULL,
  `shipOrderNumber` varchar(255) DEFAULT NULL,
  `payTime` varchar(255) DEFAULT NULL,
  `addressId` int(11) NOT NULL,
  `comment` text,
  `evaluationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `productCount` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('1', '4', '2', '1');
INSERT INTO `orderdetail` VALUES ('2', '5', '2', '1');
INSERT INTO `orderdetail` VALUES ('3', '6', '2', '1');
INSERT INTO `orderdetail` VALUES ('4', '7', '2', '1');
INSERT INTO `orderdetail` VALUES ('5', '8', '2', '1');
INSERT INTO `orderdetail` VALUES ('6', '9', '2', '1');
INSERT INTO `orderdetail` VALUES ('7', '7', '2', '2');
INSERT INTO `orderdetail` VALUES ('8', '8', '2', '2');
INSERT INTO `orderdetail` VALUES ('9', '9', '2', '2');
INSERT INTO `orderdetail` VALUES ('10', '7', '2', '3');
INSERT INTO `orderdetail` VALUES ('11', '8', '2', '3');
INSERT INTO `orderdetail` VALUES ('12', '9', '2', '3');
INSERT INTO `orderdetail` VALUES ('13', '7', '2', '4');
INSERT INTO `orderdetail` VALUES ('14', '8', '2', '4');
INSERT INTO `orderdetail` VALUES ('15', '9', '2', '4');
INSERT INTO `orderdetail` VALUES ('16', '7', '2', '5');
INSERT INTO `orderdetail` VALUES ('17', '8', '2', '5');
INSERT INTO `orderdetail` VALUES ('18', '9', '2', '5');
INSERT INTO `orderdetail` VALUES ('19', '7', '2', '6');
INSERT INTO `orderdetail` VALUES ('20', '8', '2', '6');
INSERT INTO `orderdetail` VALUES ('21', '9', '2', '6');
INSERT INTO `orderdetail` VALUES ('22', '7', '2', '7');
INSERT INTO `orderdetail` VALUES ('23', '8', '2', '7');
INSERT INTO `orderdetail` VALUES ('24', '9', '2', '7');
INSERT INTO `orderdetail` VALUES ('25', '7', '2', '8');
INSERT INTO `orderdetail` VALUES ('26', '8', '2', '8');
INSERT INTO `orderdetail` VALUES ('27', '9', '2', '8');
INSERT INTO `orderdetail` VALUES ('28', '7', '2', '9');
INSERT INTO `orderdetail` VALUES ('29', '8', '2', '9');
INSERT INTO `orderdetail` VALUES ('30', '9', '2', '9');
INSERT INTO `orderdetail` VALUES ('31', '7', '2', '10');
INSERT INTO `orderdetail` VALUES ('32', '8', '2', '10');
INSERT INTO `orderdetail` VALUES ('33', '9', '2', '10');
INSERT INTO `orderdetail` VALUES ('34', '7', '2', '11');
INSERT INTO `orderdetail` VALUES ('35', '8', '2', '11');
INSERT INTO `orderdetail` VALUES ('36', '9', '2', '11');
INSERT INTO `orderdetail` VALUES ('37', '7', '2', '12');
INSERT INTO `orderdetail` VALUES ('38', '8', '2', '12');
INSERT INTO `orderdetail` VALUES ('39', '9', '2', '12');
INSERT INTO `orderdetail` VALUES ('40', '7', '2', '13');
INSERT INTO `orderdetail` VALUES ('41', '8', '2', '13');
INSERT INTO `orderdetail` VALUES ('42', '9', '2', '13');
INSERT INTO `orderdetail` VALUES ('43', '7', '2', '14');
INSERT INTO `orderdetail` VALUES ('44', '8', '2', '14');
INSERT INTO `orderdetail` VALUES ('45', '9', '2', '14');
INSERT INTO `orderdetail` VALUES ('46', '7', '2', '15');
INSERT INTO `orderdetail` VALUES ('47', '8', '2', '15');
INSERT INTO `orderdetail` VALUES ('48', '9', '2', '15');
INSERT INTO `orderdetail` VALUES ('49', '7', '2', '16');
INSERT INTO `orderdetail` VALUES ('50', '8', '2', '16');
INSERT INTO `orderdetail` VALUES ('51', '9', '2', '16');
INSERT INTO `orderdetail` VALUES ('52', '7', '2', '17');
INSERT INTO `orderdetail` VALUES ('53', '8', '2', '17');
INSERT INTO `orderdetail` VALUES ('54', '9', '2', '17');
INSERT INTO `orderdetail` VALUES ('55', '7', '2', '18');
INSERT INTO `orderdetail` VALUES ('56', '8', '2', '18');
INSERT INTO `orderdetail` VALUES ('57', '9', '2', '18');
INSERT INTO `orderdetail` VALUES ('58', '7', '2', '19');
INSERT INTO `orderdetail` VALUES ('59', '8', '2', '19');
INSERT INTO `orderdetail` VALUES ('60', '9', '2', '19');
INSERT INTO `orderdetail` VALUES ('61', '7', '2', '20');
INSERT INTO `orderdetail` VALUES ('62', '8', '2', '20');
INSERT INTO `orderdetail` VALUES ('63', '9', '2', '20');
INSERT INTO `orderdetail` VALUES ('64', '7', '2', '21');
INSERT INTO `orderdetail` VALUES ('65', '8', '2', '21');
INSERT INTO `orderdetail` VALUES ('66', '9', '2', '21');
INSERT INTO `orderdetail` VALUES ('67', '7', '2', '22');
INSERT INTO `orderdetail` VALUES ('68', '8', '2', '22');
INSERT INTO `orderdetail` VALUES ('69', '9', '2', '22');
INSERT INTO `orderdetail` VALUES ('70', '7', '2', '23');
INSERT INTO `orderdetail` VALUES ('71', '8', '2', '23');
INSERT INTO `orderdetail` VALUES ('72', '9', '2', '23');
INSERT INTO `orderdetail` VALUES ('73', '7', '2', '24');
INSERT INTO `orderdetail` VALUES ('74', '8', '2', '24');
INSERT INTO `orderdetail` VALUES ('75', '9', '2', '24');
INSERT INTO `orderdetail` VALUES ('76', '7', '2', '25');
INSERT INTO `orderdetail` VALUES ('77', '8', '2', '25');
INSERT INTO `orderdetail` VALUES ('78', '9', '2', '25');
INSERT INTO `orderdetail` VALUES ('79', '7', '2', '26');
INSERT INTO `orderdetail` VALUES ('80', '8', '2', '26');
INSERT INTO `orderdetail` VALUES ('81', '9', '2', '26');
INSERT INTO `orderdetail` VALUES ('82', '7', '2', '27');
INSERT INTO `orderdetail` VALUES ('83', '8', '2', '27');
INSERT INTO `orderdetail` VALUES ('84', '9', '2', '27');
INSERT INTO `orderdetail` VALUES ('85', '7', '2', '28');
INSERT INTO `orderdetail` VALUES ('86', '8', '2', '28');
INSERT INTO `orderdetail` VALUES ('87', '9', '2', '28');
INSERT INTO `orderdetail` VALUES ('88', '7', '2', '29');
INSERT INTO `orderdetail` VALUES ('89', '8', '2', '29');
INSERT INTO `orderdetail` VALUES ('90', '9', '2', '29');
INSERT INTO `orderdetail` VALUES ('91', '7', '2', '30');
INSERT INTO `orderdetail` VALUES ('92', '8', '2', '30');
INSERT INTO `orderdetail` VALUES ('93', '9', '2', '30');
INSERT INTO `orderdetail` VALUES ('94', '7', '2', '31');
INSERT INTO `orderdetail` VALUES ('95', '8', '2', '31');
INSERT INTO `orderdetail` VALUES ('96', '9', '2', '31');
INSERT INTO `orderdetail` VALUES ('97', '7', '2', '32');
INSERT INTO `orderdetail` VALUES ('98', '8', '2', '32');
INSERT INTO `orderdetail` VALUES ('99', '9', '2', '32');
INSERT INTO `orderdetail` VALUES ('100', '7', '2', '33');
INSERT INTO `orderdetail` VALUES ('101', '8', '2', '33');
INSERT INTO `orderdetail` VALUES ('102', '9', '2', '33');
INSERT INTO `orderdetail` VALUES ('103', '7', '2', '34');
INSERT INTO `orderdetail` VALUES ('104', '8', '2', '34');
INSERT INTO `orderdetail` VALUES ('105', '9', '2', '34');
INSERT INTO `orderdetail` VALUES ('106', '7', '2', '35');
INSERT INTO `orderdetail` VALUES ('107', '8', '2', '35');
INSERT INTO `orderdetail` VALUES ('108', '9', '2', '35');
INSERT INTO `orderdetail` VALUES ('109', '7', '2', '36');
INSERT INTO `orderdetail` VALUES ('110', '8', '2', '36');
INSERT INTO `orderdetail` VALUES ('111', '9', '2', '36');
INSERT INTO `orderdetail` VALUES ('112', '7', '2', '37');
INSERT INTO `orderdetail` VALUES ('113', '8', '2', '37');
INSERT INTO `orderdetail` VALUES ('114', '9', '2', '37');
INSERT INTO `orderdetail` VALUES ('115', '7', '2', '38');
INSERT INTO `orderdetail` VALUES ('116', '8', '2', '38');
INSERT INTO `orderdetail` VALUES ('117', '9', '2', '38');
INSERT INTO `orderdetail` VALUES ('118', '7', '2', '39');
INSERT INTO `orderdetail` VALUES ('119', '8', '2', '39');
INSERT INTO `orderdetail` VALUES ('120', '9', '2', '39');
INSERT INTO `orderdetail` VALUES ('121', '7', '2', '40');
INSERT INTO `orderdetail` VALUES ('122', '8', '2', '40');
INSERT INTO `orderdetail` VALUES ('123', '9', '2', '40');
INSERT INTO `orderdetail` VALUES ('124', '7', '2', '41');
INSERT INTO `orderdetail` VALUES ('125', '8', '2', '41');
INSERT INTO `orderdetail` VALUES ('126', '9', '2', '41');
INSERT INTO `orderdetail` VALUES ('127', '7', '2', '42');
INSERT INTO `orderdetail` VALUES ('128', '8', '2', '42');
INSERT INTO `orderdetail` VALUES ('129', '9', '2', '42');
INSERT INTO `orderdetail` VALUES ('130', '7', '2', '43');
INSERT INTO `orderdetail` VALUES ('131', '8', '2', '43');
INSERT INTO `orderdetail` VALUES ('132', '9', '2', '43');
INSERT INTO `orderdetail` VALUES ('133', '7', '2', '44');
INSERT INTO `orderdetail` VALUES ('134', '8', '2', '44');
INSERT INTO `orderdetail` VALUES ('135', '9', '2', '44');
INSERT INTO `orderdetail` VALUES ('136', '7', '2', '45');
INSERT INTO `orderdetail` VALUES ('137', '8', '2', '45');
INSERT INTO `orderdetail` VALUES ('138', '9', '2', '45');
INSERT INTO `orderdetail` VALUES ('139', '7', '2', '46');
INSERT INTO `orderdetail` VALUES ('140', '8', '2', '46');
INSERT INTO `orderdetail` VALUES ('141', '9', '2', '46');
INSERT INTO `orderdetail` VALUES ('142', '7', '2', '47');
INSERT INTO `orderdetail` VALUES ('143', '8', '2', '47');
INSERT INTO `orderdetail` VALUES ('144', '9', '2', '47');
INSERT INTO `orderdetail` VALUES ('145', '7', '2', '48');
INSERT INTO `orderdetail` VALUES ('146', '8', '2', '48');
INSERT INTO `orderdetail` VALUES ('147', '9', '2', '48');
INSERT INTO `orderdetail` VALUES ('148', '7', '2', '49');
INSERT INTO `orderdetail` VALUES ('149', '8', '2', '49');
INSERT INTO `orderdetail` VALUES ('150', '9', '2', '49');
INSERT INTO `orderdetail` VALUES ('151', '7', '2', '50');
INSERT INTO `orderdetail` VALUES ('152', '8', '2', '50');
INSERT INTO `orderdetail` VALUES ('153', '9', '2', '50');
INSERT INTO `orderdetail` VALUES ('154', '7', '2', '51');
INSERT INTO `orderdetail` VALUES ('155', '8', '2', '51');
INSERT INTO `orderdetail` VALUES ('156', '9', '2', '51');
INSERT INTO `orderdetail` VALUES ('157', '7', '2', '52');
INSERT INTO `orderdetail` VALUES ('158', '8', '2', '52');
INSERT INTO `orderdetail` VALUES ('159', '9', '2', '52');
INSERT INTO `orderdetail` VALUES ('160', '7', '2', '53');
INSERT INTO `orderdetail` VALUES ('161', '8', '2', '53');
INSERT INTO `orderdetail` VALUES ('162', '9', '2', '53');
INSERT INTO `orderdetail` VALUES ('163', '7', '2', '54');
INSERT INTO `orderdetail` VALUES ('164', '8', '2', '54');
INSERT INTO `orderdetail` VALUES ('165', '9', '2', '54');
INSERT INTO `orderdetail` VALUES ('166', '7', '2', '55');
INSERT INTO `orderdetail` VALUES ('167', '8', '2', '55');
INSERT INTO `orderdetail` VALUES ('168', '9', '2', '55');
INSERT INTO `orderdetail` VALUES ('169', '7', '2', '56');
INSERT INTO `orderdetail` VALUES ('170', '8', '2', '56');
INSERT INTO `orderdetail` VALUES ('171', '9', '2', '56');
INSERT INTO `orderdetail` VALUES ('172', '7', '2', '57');
INSERT INTO `orderdetail` VALUES ('173', '8', '2', '57');
INSERT INTO `orderdetail` VALUES ('174', '9', '2', '57');
INSERT INTO `orderdetail` VALUES ('175', '7', '2', '58');
INSERT INTO `orderdetail` VALUES ('176', '8', '2', '58');
INSERT INTO `orderdetail` VALUES ('177', '9', '2', '58');
INSERT INTO `orderdetail` VALUES ('178', '7', '2', '59');
INSERT INTO `orderdetail` VALUES ('179', '8', '2', '59');
INSERT INTO `orderdetail` VALUES ('180', '9', '2', '59');
INSERT INTO `orderdetail` VALUES ('181', '7', '2', '60');
INSERT INTO `orderdetail` VALUES ('182', '8', '2', '60');
INSERT INTO `orderdetail` VALUES ('183', '9', '2', '60');
INSERT INTO `orderdetail` VALUES ('184', '7', '2', '61');
INSERT INTO `orderdetail` VALUES ('185', '8', '2', '61');
INSERT INTO `orderdetail` VALUES ('186', '9', '2', '61');
INSERT INTO `orderdetail` VALUES ('187', '7', '2', '62');
INSERT INTO `orderdetail` VALUES ('188', '8', '2', '62');
INSERT INTO `orderdetail` VALUES ('189', '9', '2', '62');
INSERT INTO `orderdetail` VALUES ('190', '7', '2', '63');
INSERT INTO `orderdetail` VALUES ('191', '8', '2', '63');
INSERT INTO `orderdetail` VALUES ('192', '9', '2', '63');
INSERT INTO `orderdetail` VALUES ('193', '7', '2', '64');
INSERT INTO `orderdetail` VALUES ('194', '8', '2', '64');
INSERT INTO `orderdetail` VALUES ('195', '9', '2', '64');
INSERT INTO `orderdetail` VALUES ('196', '7', '2', '65');
INSERT INTO `orderdetail` VALUES ('197', '8', '2', '65');
INSERT INTO `orderdetail` VALUES ('198', '9', '2', '65');
INSERT INTO `orderdetail` VALUES ('199', '7', '2', '66');
INSERT INTO `orderdetail` VALUES ('200', '8', '2', '66');
INSERT INTO `orderdetail` VALUES ('201', '9', '2', '66');
INSERT INTO `orderdetail` VALUES ('202', '7', '2', '67');
INSERT INTO `orderdetail` VALUES ('203', '8', '2', '67');
INSERT INTO `orderdetail` VALUES ('204', '9', '2', '67');
INSERT INTO `orderdetail` VALUES ('205', '7', '2', '68');
INSERT INTO `orderdetail` VALUES ('206', '8', '2', '68');
INSERT INTO `orderdetail` VALUES ('207', '9', '2', '68');
INSERT INTO `orderdetail` VALUES ('208', '7', '2', '69');
INSERT INTO `orderdetail` VALUES ('209', '8', '2', '69');
INSERT INTO `orderdetail` VALUES ('210', '9', '2', '69');
INSERT INTO `orderdetail` VALUES ('211', '7', '2', '70');
INSERT INTO `orderdetail` VALUES ('212', '8', '2', '70');
INSERT INTO `orderdetail` VALUES ('213', '9', '2', '70');
INSERT INTO `orderdetail` VALUES ('214', '7', '2', '71');
INSERT INTO `orderdetail` VALUES ('215', '8', '2', '71');
INSERT INTO `orderdetail` VALUES ('216', '9', '2', '71');
INSERT INTO `orderdetail` VALUES ('217', '7', '2', '72');
INSERT INTO `orderdetail` VALUES ('218', '8', '2', '72');
INSERT INTO `orderdetail` VALUES ('219', '9', '2', '72');
INSERT INTO `orderdetail` VALUES ('220', '7', '2', '73');
INSERT INTO `orderdetail` VALUES ('221', '8', '2', '73');
INSERT INTO `orderdetail` VALUES ('222', '9', '2', '73');
INSERT INTO `orderdetail` VALUES ('223', '7', '2', '74');
INSERT INTO `orderdetail` VALUES ('224', '8', '2', '74');
INSERT INTO `orderdetail` VALUES ('225', '9', '2', '74');
INSERT INTO `orderdetail` VALUES ('226', '7', '2', '75');
INSERT INTO `orderdetail` VALUES ('227', '8', '2', '75');
INSERT INTO `orderdetail` VALUES ('228', '9', '2', '75');
INSERT INTO `orderdetail` VALUES ('229', '7', '2', '76');
INSERT INTO `orderdetail` VALUES ('230', '8', '2', '76');
INSERT INTO `orderdetail` VALUES ('231', '9', '2', '76');
INSERT INTO `orderdetail` VALUES ('232', '7', '2', '77');
INSERT INTO `orderdetail` VALUES ('233', '8', '2', '77');
INSERT INTO `orderdetail` VALUES ('234', '9', '2', '77');
INSERT INTO `orderdetail` VALUES ('235', '7', '2', '78');
INSERT INTO `orderdetail` VALUES ('236', '8', '2', '78');
INSERT INTO `orderdetail` VALUES ('237', '9', '2', '78');
INSERT INTO `orderdetail` VALUES ('238', '7', '2', '79');
INSERT INTO `orderdetail` VALUES ('239', '8', '2', '79');
INSERT INTO `orderdetail` VALUES ('240', '9', '2', '79');
INSERT INTO `orderdetail` VALUES ('241', '7', '2', '80');
INSERT INTO `orderdetail` VALUES ('242', '8', '2', '80');
INSERT INTO `orderdetail` VALUES ('243', '9', '2', '80');
INSERT INTO `orderdetail` VALUES ('244', '7', '2', '81');
INSERT INTO `orderdetail` VALUES ('245', '8', '2', '81');
INSERT INTO `orderdetail` VALUES ('246', '9', '2', '81');
INSERT INTO `orderdetail` VALUES ('247', '7', '2', '82');
INSERT INTO `orderdetail` VALUES ('248', '8', '2', '82');
INSERT INTO `orderdetail` VALUES ('249', '9', '2', '82');
INSERT INTO `orderdetail` VALUES ('250', '7', '2', '83');
INSERT INTO `orderdetail` VALUES ('251', '8', '2', '83');
INSERT INTO `orderdetail` VALUES ('252', '9', '2', '83');
INSERT INTO `orderdetail` VALUES ('253', '7', '2', '84');
INSERT INTO `orderdetail` VALUES ('254', '8', '2', '84');
INSERT INTO `orderdetail` VALUES ('255', '9', '2', '84');
INSERT INTO `orderdetail` VALUES ('256', '7', '2', '85');
INSERT INTO `orderdetail` VALUES ('257', '8', '2', '85');
INSERT INTO `orderdetail` VALUES ('258', '9', '2', '85');
INSERT INTO `orderdetail` VALUES ('259', '7', '2', '86');
INSERT INTO `orderdetail` VALUES ('260', '8', '2', '86');
INSERT INTO `orderdetail` VALUES ('261', '9', '2', '86');
INSERT INTO `orderdetail` VALUES ('262', '7', '2', '87');
INSERT INTO `orderdetail` VALUES ('263', '8', '2', '87');
INSERT INTO `orderdetail` VALUES ('264', '9', '2', '87');
INSERT INTO `orderdetail` VALUES ('265', '7', '2', '88');
INSERT INTO `orderdetail` VALUES ('266', '8', '2', '88');
INSERT INTO `orderdetail` VALUES ('267', '9', '2', '88');
INSERT INTO `orderdetail` VALUES ('268', '7', '2', '89');
INSERT INTO `orderdetail` VALUES ('269', '8', '2', '89');
INSERT INTO `orderdetail` VALUES ('270', '9', '2', '89');
INSERT INTO `orderdetail` VALUES ('271', '7', '2', '90');
INSERT INTO `orderdetail` VALUES ('272', '8', '2', '90');
INSERT INTO `orderdetail` VALUES ('273', '9', '2', '90');
INSERT INTO `orderdetail` VALUES ('274', '7', '2', '91');
INSERT INTO `orderdetail` VALUES ('275', '8', '2', '91');
INSERT INTO `orderdetail` VALUES ('276', '9', '2', '91');
INSERT INTO `orderdetail` VALUES ('277', '7', '2', '92');
INSERT INTO `orderdetail` VALUES ('278', '8', '2', '92');
INSERT INTO `orderdetail` VALUES ('279', '9', '2', '92');
INSERT INTO `orderdetail` VALUES ('280', '7', '2', '93');
INSERT INTO `orderdetail` VALUES ('281', '8', '2', '93');
INSERT INTO `orderdetail` VALUES ('282', '9', '2', '93');
INSERT INTO `orderdetail` VALUES ('283', '7', '2', '94');
INSERT INTO `orderdetail` VALUES ('284', '8', '2', '94');
INSERT INTO `orderdetail` VALUES ('285', '9', '2', '94');
INSERT INTO `orderdetail` VALUES ('286', '7', '2', '95');
INSERT INTO `orderdetail` VALUES ('287', '8', '2', '95');
INSERT INTO `orderdetail` VALUES ('288', '9', '2', '95');
INSERT INTO `orderdetail` VALUES ('289', '7', '2', '96');
INSERT INTO `orderdetail` VALUES ('290', '8', '2', '96');
INSERT INTO `orderdetail` VALUES ('291', '9', '2', '96');
INSERT INTO `orderdetail` VALUES ('292', '7', '2', '97');
INSERT INTO `orderdetail` VALUES ('293', '8', '2', '97');
INSERT INTO `orderdetail` VALUES ('294', '9', '2', '97');
INSERT INTO `orderdetail` VALUES ('295', '7', '2', '98');
INSERT INTO `orderdetail` VALUES ('296', '8', '2', '98');
INSERT INTO `orderdetail` VALUES ('297', '9', '2', '98');
INSERT INTO `orderdetail` VALUES ('298', '7', '2', '99');
INSERT INTO `orderdetail` VALUES ('299', '8', '2', '99');
INSERT INTO `orderdetail` VALUES ('300', '9', '2', '99');
INSERT INTO `orderdetail` VALUES ('301', '7', '2', '100');
INSERT INTO `orderdetail` VALUES ('302', '8', '2', '100');
INSERT INTO `orderdetail` VALUES ('303', '9', '2', '100');
INSERT INTO `orderdetail` VALUES ('304', '7', '2', '101');
INSERT INTO `orderdetail` VALUES ('305', '8', '2', '101');
INSERT INTO `orderdetail` VALUES ('306', '9', '2', '101');
INSERT INTO `orderdetail` VALUES ('307', '7', '2', '102');
INSERT INTO `orderdetail` VALUES ('308', '8', '2', '102');
INSERT INTO `orderdetail` VALUES ('309', '9', '2', '102');
INSERT INTO `orderdetail` VALUES ('310', '7', '2', '103');
INSERT INTO `orderdetail` VALUES ('311', '8', '2', '103');
INSERT INTO `orderdetail` VALUES ('312', '9', '2', '103');
INSERT INTO `orderdetail` VALUES ('313', '7', '2', '104');
INSERT INTO `orderdetail` VALUES ('314', '8', '2', '104');
INSERT INTO `orderdetail` VALUES ('315', '9', '2', '104');
INSERT INTO `orderdetail` VALUES ('316', '7', '2', '105');
INSERT INTO `orderdetail` VALUES ('317', '8', '2', '105');
INSERT INTO `orderdetail` VALUES ('318', '9', '2', '105');
INSERT INTO `orderdetail` VALUES ('319', '7', '2', '106');
INSERT INTO `orderdetail` VALUES ('320', '8', '2', '106');
INSERT INTO `orderdetail` VALUES ('321', '9', '2', '106');
INSERT INTO `orderdetail` VALUES ('322', '7', '2', '107');
INSERT INTO `orderdetail` VALUES ('323', '8', '2', '107');
INSERT INTO `orderdetail` VALUES ('324', '9', '2', '107');
INSERT INTO `orderdetail` VALUES ('325', '7', '2', '108');
INSERT INTO `orderdetail` VALUES ('326', '8', '2', '108');
INSERT INTO `orderdetail` VALUES ('327', '9', '2', '108');
INSERT INTO `orderdetail` VALUES ('328', '7', '2', '109');
INSERT INTO `orderdetail` VALUES ('329', '8', '2', '109');
INSERT INTO `orderdetail` VALUES ('330', '9', '2', '109');
INSERT INTO `orderdetail` VALUES ('331', '7', '2', '110');
INSERT INTO `orderdetail` VALUES ('332', '8', '2', '110');
INSERT INTO `orderdetail` VALUES ('333', '9', '2', '110');
INSERT INTO `orderdetail` VALUES ('334', '7', '2', '111');
INSERT INTO `orderdetail` VALUES ('335', '8', '2', '111');
INSERT INTO `orderdetail` VALUES ('336', '9', '2', '111');
INSERT INTO `orderdetail` VALUES ('337', '7', '2', '112');
INSERT INTO `orderdetail` VALUES ('338', '8', '2', '112');
INSERT INTO `orderdetail` VALUES ('339', '9', '2', '112');
INSERT INTO `orderdetail` VALUES ('340', '7', '2', '113');
INSERT INTO `orderdetail` VALUES ('341', '8', '2', '113');
INSERT INTO `orderdetail` VALUES ('342', '9', '2', '113');
INSERT INTO `orderdetail` VALUES ('343', '7', '2', '114');
INSERT INTO `orderdetail` VALUES ('344', '8', '2', '114');
INSERT INTO `orderdetail` VALUES ('345', '9', '2', '114');
INSERT INTO `orderdetail` VALUES ('346', '7', '2', '115');
INSERT INTO `orderdetail` VALUES ('347', '8', '2', '115');
INSERT INTO `orderdetail` VALUES ('348', '9', '2', '115');
INSERT INTO `orderdetail` VALUES ('349', '7', '2', '116');
INSERT INTO `orderdetail` VALUES ('350', '8', '2', '116');
INSERT INTO `orderdetail` VALUES ('351', '9', '2', '116');
INSERT INTO `orderdetail` VALUES ('352', '7', '2', '117');
INSERT INTO `orderdetail` VALUES ('353', '8', '2', '117');
INSERT INTO `orderdetail` VALUES ('354', '9', '2', '117');
INSERT INTO `orderdetail` VALUES ('355', '7', '2', '118');
INSERT INTO `orderdetail` VALUES ('356', '8', '2', '118');
INSERT INTO `orderdetail` VALUES ('357', '9', '2', '118');
INSERT INTO `orderdetail` VALUES ('358', '7', '2', '119');
INSERT INTO `orderdetail` VALUES ('359', '8', '2', '119');
INSERT INTO `orderdetail` VALUES ('360', '9', '2', '119');
INSERT INTO `orderdetail` VALUES ('361', '7', '2', '120');
INSERT INTO `orderdetail` VALUES ('362', '8', '2', '120');
INSERT INTO `orderdetail` VALUES ('363', '9', '2', '120');
INSERT INTO `orderdetail` VALUES ('364', '7', '2', '121');
INSERT INTO `orderdetail` VALUES ('365', '8', '2', '121');
INSERT INTO `orderdetail` VALUES ('366', '9', '2', '121');
INSERT INTO `orderdetail` VALUES ('367', '7', '2', '122');
INSERT INTO `orderdetail` VALUES ('368', '8', '2', '122');
INSERT INTO `orderdetail` VALUES ('369', '9', '2', '122');
INSERT INTO `orderdetail` VALUES ('370', '7', '2', '123');
INSERT INTO `orderdetail` VALUES ('371', '8', '2', '123');
INSERT INTO `orderdetail` VALUES ('372', '9', '2', '123');
INSERT INTO `orderdetail` VALUES ('373', '7', '2', '124');
INSERT INTO `orderdetail` VALUES ('374', '8', '2', '124');
INSERT INTO `orderdetail` VALUES ('375', '9', '2', '124');
INSERT INTO `orderdetail` VALUES ('376', '7', '2', '125');
INSERT INTO `orderdetail` VALUES ('377', '8', '2', '125');
INSERT INTO `orderdetail` VALUES ('378', '9', '2', '125');
INSERT INTO `orderdetail` VALUES ('379', '7', '2', '126');
INSERT INTO `orderdetail` VALUES ('380', '8', '2', '126');
INSERT INTO `orderdetail` VALUES ('381', '9', '2', '126');
INSERT INTO `orderdetail` VALUES ('382', '7', '2', '127');
INSERT INTO `orderdetail` VALUES ('383', '8', '2', '127');
INSERT INTO `orderdetail` VALUES ('384', '9', '2', '127');
INSERT INTO `orderdetail` VALUES ('385', '7', '2', '128');
INSERT INTO `orderdetail` VALUES ('386', '8', '2', '128');
INSERT INTO `orderdetail` VALUES ('387', '9', '2', '128');
INSERT INTO `orderdetail` VALUES ('388', '7', '2', '129');
INSERT INTO `orderdetail` VALUES ('389', '8', '2', '129');
INSERT INTO `orderdetail` VALUES ('390', '9', '2', '129');
INSERT INTO `orderdetail` VALUES ('391', '7', '2', '130');
INSERT INTO `orderdetail` VALUES ('392', '8', '2', '130');
INSERT INTO `orderdetail` VALUES ('393', '9', '2', '130');
INSERT INTO `orderdetail` VALUES ('394', '7', '2', '131');
INSERT INTO `orderdetail` VALUES ('395', '8', '2', '131');
INSERT INTO `orderdetail` VALUES ('396', '9', '2', '131');
INSERT INTO `orderdetail` VALUES ('397', '7', '2', '132');
INSERT INTO `orderdetail` VALUES ('398', '8', '2', '132');
INSERT INTO `orderdetail` VALUES ('399', '9', '2', '132');
INSERT INTO `orderdetail` VALUES ('400', '7', '2', '133');
INSERT INTO `orderdetail` VALUES ('401', '8', '2', '133');
INSERT INTO `orderdetail` VALUES ('402', '9', '2', '133');
INSERT INTO `orderdetail` VALUES ('403', '7', '2', '134');
INSERT INTO `orderdetail` VALUES ('404', '8', '2', '134');
INSERT INTO `orderdetail` VALUES ('405', '9', '2', '134');
INSERT INTO `orderdetail` VALUES ('406', '7', '2', '135');
INSERT INTO `orderdetail` VALUES ('407', '8', '2', '135');
INSERT INTO `orderdetail` VALUES ('408', '9', '2', '135');
INSERT INTO `orderdetail` VALUES ('409', '7', '2', '136');
INSERT INTO `orderdetail` VALUES ('410', '8', '2', '136');
INSERT INTO `orderdetail` VALUES ('411', '9', '2', '136');
INSERT INTO `orderdetail` VALUES ('412', '7', '2', '137');
INSERT INTO `orderdetail` VALUES ('413', '8', '2', '137');
INSERT INTO `orderdetail` VALUES ('414', '9', '2', '137');
INSERT INTO `orderdetail` VALUES ('415', '7', '2', '138');
INSERT INTO `orderdetail` VALUES ('416', '8', '2', '138');
INSERT INTO `orderdetail` VALUES ('417', '9', '2', '138');
INSERT INTO `orderdetail` VALUES ('418', '7', '2', '139');
INSERT INTO `orderdetail` VALUES ('419', '8', '2', '139');
INSERT INTO `orderdetail` VALUES ('420', '9', '2', '139');
INSERT INTO `orderdetail` VALUES ('421', '7', '2', '140');
INSERT INTO `orderdetail` VALUES ('422', '8', '2', '140');
INSERT INTO `orderdetail` VALUES ('423', '9', '2', '140');
INSERT INTO `orderdetail` VALUES ('424', '7', '2', '141');
INSERT INTO `orderdetail` VALUES ('425', '8', '2', '141');
INSERT INTO `orderdetail` VALUES ('426', '9', '2', '141');
INSERT INTO `orderdetail` VALUES ('427', '7', '2', '142');
INSERT INTO `orderdetail` VALUES ('428', '8', '2', '142');
INSERT INTO `orderdetail` VALUES ('429', '9', '2', '142');
INSERT INTO `orderdetail` VALUES ('430', '7', '2', '143');
INSERT INTO `orderdetail` VALUES ('431', '8', '2', '143');
INSERT INTO `orderdetail` VALUES ('432', '9', '2', '143');
INSERT INTO `orderdetail` VALUES ('433', '7', '2', '144');
INSERT INTO `orderdetail` VALUES ('434', '8', '2', '144');
INSERT INTO `orderdetail` VALUES ('435', '9', '2', '144');
INSERT INTO `orderdetail` VALUES ('436', '7', '2', '145');
INSERT INTO `orderdetail` VALUES ('437', '8', '2', '145');
INSERT INTO `orderdetail` VALUES ('438', '9', '2', '145');
INSERT INTO `orderdetail` VALUES ('439', '7', '2', '146');
INSERT INTO `orderdetail` VALUES ('440', '8', '2', '146');
INSERT INTO `orderdetail` VALUES ('441', '9', '2', '146');
INSERT INTO `orderdetail` VALUES ('442', '7', '2', '147');
INSERT INTO `orderdetail` VALUES ('443', '8', '2', '147');
INSERT INTO `orderdetail` VALUES ('444', '9', '2', '147');
INSERT INTO `orderdetail` VALUES ('445', '7', '2', '148');
INSERT INTO `orderdetail` VALUES ('446', '8', '2', '148');
INSERT INTO `orderdetail` VALUES ('447', '9', '2', '148');
INSERT INTO `orderdetail` VALUES ('448', '7', '2', '149');
INSERT INTO `orderdetail` VALUES ('449', '8', '2', '149');
INSERT INTO `orderdetail` VALUES ('450', '9', '2', '149');
INSERT INTO `orderdetail` VALUES ('451', '7', '2', '150');
INSERT INTO `orderdetail` VALUES ('452', '8', '2', '150');
INSERT INTO `orderdetail` VALUES ('453', '9', '2', '150');
INSERT INTO `orderdetail` VALUES ('454', '7', '2', '151');
INSERT INTO `orderdetail` VALUES ('455', '8', '2', '151');
INSERT INTO `orderdetail` VALUES ('456', '9', '2', '151');
INSERT INTO `orderdetail` VALUES ('457', '7', '2', '152');
INSERT INTO `orderdetail` VALUES ('458', '8', '2', '152');
INSERT INTO `orderdetail` VALUES ('459', '9', '2', '152');
INSERT INTO `orderdetail` VALUES ('460', '7', '2', '153');
INSERT INTO `orderdetail` VALUES ('461', '8', '2', '153');
INSERT INTO `orderdetail` VALUES ('462', '9', '2', '153');
INSERT INTO `orderdetail` VALUES ('463', '7', '2', '154');
INSERT INTO `orderdetail` VALUES ('464', '8', '2', '154');
INSERT INTO `orderdetail` VALUES ('465', '9', '2', '154');
INSERT INTO `orderdetail` VALUES ('466', '7', '2', '155');
INSERT INTO `orderdetail` VALUES ('467', '8', '2', '155');
INSERT INTO `orderdetail` VALUES ('468', '9', '2', '155');
INSERT INTO `orderdetail` VALUES ('469', '7', '2', '156');
INSERT INTO `orderdetail` VALUES ('470', '8', '2', '156');
INSERT INTO `orderdetail` VALUES ('471', '9', '2', '156');
INSERT INTO `orderdetail` VALUES ('472', '7', '2', '157');
INSERT INTO `orderdetail` VALUES ('473', '8', '2', '157');
INSERT INTO `orderdetail` VALUES ('474', '9', '2', '157');
INSERT INTO `orderdetail` VALUES ('475', '7', '2', '158');
INSERT INTO `orderdetail` VALUES ('476', '8', '2', '158');
INSERT INTO `orderdetail` VALUES ('477', '9', '2', '158');
INSERT INTO `orderdetail` VALUES ('478', '7', '2', '159');
INSERT INTO `orderdetail` VALUES ('479', '8', '2', '159');
INSERT INTO `orderdetail` VALUES ('480', '9', '2', '159');
INSERT INTO `orderdetail` VALUES ('481', '7', '2', '160');
INSERT INTO `orderdetail` VALUES ('482', '8', '2', '160');
INSERT INTO `orderdetail` VALUES ('483', '9', '2', '160');
INSERT INTO `orderdetail` VALUES ('484', '7', '2', '161');
INSERT INTO `orderdetail` VALUES ('485', '8', '2', '161');
INSERT INTO `orderdetail` VALUES ('486', '9', '2', '161');
INSERT INTO `orderdetail` VALUES ('487', '7', '2', '162');
INSERT INTO `orderdetail` VALUES ('488', '8', '2', '162');
INSERT INTO `orderdetail` VALUES ('489', '9', '2', '162');
INSERT INTO `orderdetail` VALUES ('490', '7', '2', '163');
INSERT INTO `orderdetail` VALUES ('491', '8', '2', '163');
INSERT INTO `orderdetail` VALUES ('492', '9', '2', '163');
INSERT INTO `orderdetail` VALUES ('493', '7', '2', '164');
INSERT INTO `orderdetail` VALUES ('494', '8', '2', '164');
INSERT INTO `orderdetail` VALUES ('495', '9', '2', '164');
INSERT INTO `orderdetail` VALUES ('496', '7', '2', '165');
INSERT INTO `orderdetail` VALUES ('497', '8', '2', '165');
INSERT INTO `orderdetail` VALUES ('498', '9', '2', '165');
INSERT INTO `orderdetail` VALUES ('499', '7', '2', '166');
INSERT INTO `orderdetail` VALUES ('500', '8', '2', '166');
INSERT INTO `orderdetail` VALUES ('501', '9', '2', '166');
INSERT INTO `orderdetail` VALUES ('502', '7', '2', '167');
INSERT INTO `orderdetail` VALUES ('503', '8', '2', '167');
INSERT INTO `orderdetail` VALUES ('504', '9', '2', '167');
INSERT INTO `orderdetail` VALUES ('505', '7', '2', '168');
INSERT INTO `orderdetail` VALUES ('506', '8', '2', '168');
INSERT INTO `orderdetail` VALUES ('507', '9', '2', '168');
INSERT INTO `orderdetail` VALUES ('508', '7', '2', '169');
INSERT INTO `orderdetail` VALUES ('509', '8', '2', '169');
INSERT INTO `orderdetail` VALUES ('510', '9', '2', '169');
INSERT INTO `orderdetail` VALUES ('511', '7', '2', '170');
INSERT INTO `orderdetail` VALUES ('512', '8', '2', '170');
INSERT INTO `orderdetail` VALUES ('513', '9', '2', '170');
INSERT INTO `orderdetail` VALUES ('514', '7', '2', '171');
INSERT INTO `orderdetail` VALUES ('515', '8', '2', '171');
INSERT INTO `orderdetail` VALUES ('516', '9', '2', '171');
INSERT INTO `orderdetail` VALUES ('517', '4', '2', '172');
INSERT INTO `orderdetail` VALUES ('518', '5', '2', '172');
INSERT INTO `orderdetail` VALUES ('519', '6', '2', '172');
INSERT INTO `orderdetail` VALUES ('520', '7', '2', '172');
INSERT INTO `orderdetail` VALUES ('521', '8', '2', '172');
INSERT INTO `orderdetail` VALUES ('522', '19', '1', '172');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `createTime` varchar(255) NOT NULL,
  `orderStatus` varchar(255) NOT NULL,
  `payStatus` varchar(255) NOT NULL,
  `orderPrice` varchar(255) NOT NULL,
  `shipPrice` varchar(255) NOT NULL,
  `allPrice` varchar(255) NOT NULL,
  `deliverTime` varchar(255) DEFAULT NULL,
  `shipName` varchar(255) DEFAULT NULL,
  `shipOrderNumber` varchar(255) DEFAULT NULL,
  `payTime` varchar(255) DEFAULT NULL,
  `addressId` int(11) NOT NULL,
  `comment` text,
  `evaluationId` int(11) DEFAULT NULL,
  `receiveStatus` int(11) DEFAULT NULL,
  `payStyle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 'THX1445485266982', '1', '2015-10-22', '发货', '支付', '11988.0', '0.0', '11988.0', '2015-10-28 21:46:32 GMT+08:00', 'YUNDA', '1901315209781', '2015-11-03 11:10:56 GMT+08:00', '7', '', '1', '0', '支付宝支付');
INSERT INTO `orders` VALUES ('2', 'THX1445824762533', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', '0', '0', null);
INSERT INTO `orders` VALUES ('3', 'THX1445824762700', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', '0', '0', null);
INSERT INTO `orders` VALUES ('4', 'THX1445824762872', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', '0', '0', null);
INSERT INTO `orders` VALUES ('5', 'THX1445824763027', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', '0', '0', null);
INSERT INTO `orders` VALUES ('6', 'THX1445824763195', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', '0', '0', null);
INSERT INTO `orders` VALUES ('7', 'THX1445824763358', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', '0', '0', null);
INSERT INTO `orders` VALUES ('8', 'THX1445824763521', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', '0', '0', null);
INSERT INTO `orders` VALUES ('9', 'THX1445824763680', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', '0', '0', null);
INSERT INTO `orders` VALUES ('10', 'THX1445824763847', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', '0', '0', null);
INSERT INTO `orders` VALUES ('11', 'THX1445824764302', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', '0', '0', null);
INSERT INTO `orders` VALUES ('12', 'THX1445824851149', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', '0', '0', null);
INSERT INTO `orders` VALUES ('13', 'THX1445824851300', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', '0', '0', null);
INSERT INTO `orders` VALUES ('14', 'THX1445824851463', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', '0', '0', null);
INSERT INTO `orders` VALUES ('15', 'THX1445824851652', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', '0', '0', null);
INSERT INTO `orders` VALUES ('16', 'THX1445824851869', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', '0', '0', null);
INSERT INTO `orders` VALUES ('17', 'THX1445824852031', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', '0', '0', null);
INSERT INTO `orders` VALUES ('18', 'THX1445824852216', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', '0', '0', null);
INSERT INTO `orders` VALUES ('19', 'THX1445824852374', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', '0', '0', null);
INSERT INTO `orders` VALUES ('20', 'THX1445824852539', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', '0', '0', null);
INSERT INTO `orders` VALUES ('21', 'THX1445824852693', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', '0', '0', null);
INSERT INTO `orders` VALUES ('22', 'THX1445827799885', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', '0', '0', null);
INSERT INTO `orders` VALUES ('23', 'THX1445827800359', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', '0', '0', null);
INSERT INTO `orders` VALUES ('24', 'THX1445827800831', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', '0', '0', null);
INSERT INTO `orders` VALUES ('25', 'THX1445827801439', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', '0', '0', null);
INSERT INTO `orders` VALUES ('26', 'THX1445827801965', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', '0', '0', null);
INSERT INTO `orders` VALUES ('27', 'THX1445827802117', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', '0', '0', null);
INSERT INTO `orders` VALUES ('28', 'THX1445827802278', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', '0', '0', null);
INSERT INTO `orders` VALUES ('29', 'THX1445827803644', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', '0', '0', null);
INSERT INTO `orders` VALUES ('30', 'THX1445827804111', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', '0', '0', null);
INSERT INTO `orders` VALUES ('31', 'THX1445827805558', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', '0', '0', null);
INSERT INTO `orders` VALUES ('32', 'THX1445863088100', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', null, '0', null);
INSERT INTO `orders` VALUES ('33', 'THX1445863121894', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', null, '0', null);
INSERT INTO `orders` VALUES ('34', 'THX1445863178814', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', null, '0', null);
INSERT INTO `orders` VALUES ('35', 'THX1445863179305', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', null, '0', null);
INSERT INTO `orders` VALUES ('36', 'THX1445863180305', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', null, '0', null);
INSERT INTO `orders` VALUES ('37', 'THX1445863181006', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', null, '0', null);
INSERT INTO `orders` VALUES ('38', 'THX1445863181534', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', null, '0', null);
INSERT INTO `orders` VALUES ('39', 'THX1445863182091', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', null, '0', null);
INSERT INTO `orders` VALUES ('40', 'THX1445863182656', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', null, '0', null);
INSERT INTO `orders` VALUES ('41', 'THX1445863183741', '1', '2015-10-26', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', null, '0', null);
INSERT INTO `orders` VALUES ('42', 'THX1445917326657', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', null, '0', null);
INSERT INTO `orders` VALUES ('43', 'THX1445917326778', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', null, '0', null);
INSERT INTO `orders` VALUES ('44', 'THX1445917326897', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', null, '0', null);
INSERT INTO `orders` VALUES ('45', 'THX1445917327028', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', null, '0', null);
INSERT INTO `orders` VALUES ('46', 'THX1445917327180', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', null, '0', null);
INSERT INTO `orders` VALUES ('47', 'THX1445917327307', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', null, '0', null);
INSERT INTO `orders` VALUES ('48', 'THX1445917327427', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', null, '0', null);
INSERT INTO `orders` VALUES ('49', 'THX1445917327551', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', null, '0', null);
INSERT INTO `orders` VALUES ('50', 'THX1445917327671', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', null, '0', null);
INSERT INTO `orders` VALUES ('51', 'THX1445917327795', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', null, '0', null);
INSERT INTO `orders` VALUES ('52', 'THX1445920932485', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', null, '0', null);
INSERT INTO `orders` VALUES ('53', 'THX1445920932616', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', null, '0', null);
INSERT INTO `orders` VALUES ('54', 'THX1445920932755', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', null, '0', null);
INSERT INTO `orders` VALUES ('55', 'THX1445920932887', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', null, '0', null);
INSERT INTO `orders` VALUES ('56', 'THX1445920933026', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', null, '0', null);
INSERT INTO `orders` VALUES ('57', 'THX1445920933154', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', null, '0', null);
INSERT INTO `orders` VALUES ('58', 'THX1445920933285', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', null, '0', null);
INSERT INTO `orders` VALUES ('59', 'THX1445920933409', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', null, '0', null);
INSERT INTO `orders` VALUES ('60', 'THX1445920933539', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', null, '0', null);
INSERT INTO `orders` VALUES ('61', 'THX1445920933672', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', null, '0', null);
INSERT INTO `orders` VALUES ('62', 'THX1445932729745', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', null, '0', null);
INSERT INTO `orders` VALUES ('63', 'THX1445932729897', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', null, '0', null);
INSERT INTO `orders` VALUES ('64', 'THX1445932730055', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', null, '0', null);
INSERT INTO `orders` VALUES ('65', 'THX1445932730200', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', null, '0', null);
INSERT INTO `orders` VALUES ('66', 'THX1445932730363', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', null, '0', null);
INSERT INTO `orders` VALUES ('67', 'THX1445932730520', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', null, '0', null);
INSERT INTO `orders` VALUES ('68', 'THX1445932730667', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', null, '0', null);
INSERT INTO `orders` VALUES ('69', 'THX1445932730818', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', null, '0', null);
INSERT INTO `orders` VALUES ('70', 'THX1445932730970', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', null, '0', null);
INSERT INTO `orders` VALUES ('71', 'THX1445932731115', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', null, '0', null);
INSERT INTO `orders` VALUES ('72', 'THX1445934015709', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', null, '0', null);
INSERT INTO `orders` VALUES ('73', 'THX1445934015846', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', null, '0', null);
INSERT INTO `orders` VALUES ('74', 'THX1445934015983', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', null, '0', null);
INSERT INTO `orders` VALUES ('75', 'THX1445934016397', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', null, '0', null);
INSERT INTO `orders` VALUES ('76', 'THX1445934016520', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', null, '0', null);
INSERT INTO `orders` VALUES ('77', 'THX1445934016648', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', null, '0', null);
INSERT INTO `orders` VALUES ('78', 'THX1445934016771', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', null, '0', null);
INSERT INTO `orders` VALUES ('79', 'THX1445934016894', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', null, '0', null);
INSERT INTO `orders` VALUES ('80', 'THX1445934017013', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', null, '0', null);
INSERT INTO `orders` VALUES ('81', 'THX1445934017145', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', null, '0', null);
INSERT INTO `orders` VALUES ('82', 'THX1445936124168', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', null, '0', null);
INSERT INTO `orders` VALUES ('83', 'THX1445936125031', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', null, '0', null);
INSERT INTO `orders` VALUES ('84', 'THX1445936125891', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', null, '0', null);
INSERT INTO `orders` VALUES ('85', 'THX1445936126749', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', null, '0', null);
INSERT INTO `orders` VALUES ('86', 'THX1445936127594', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', null, '0', null);
INSERT INTO `orders` VALUES ('87', 'THX1445936128012', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', null, '0', null);
INSERT INTO `orders` VALUES ('88', 'THX1445936128886', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', null, '0', null);
INSERT INTO `orders` VALUES ('89', 'THX1445936129325', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', null, '0', null);
INSERT INTO `orders` VALUES ('90', 'THX1445936129463', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', null, '0', null);
INSERT INTO `orders` VALUES ('91', 'THX1445936129596', '1', '2015-10-27', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', null, '0', null);
INSERT INTO `orders` VALUES ('92', 'THX1445993423241', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', null, '0', null);
INSERT INTO `orders` VALUES ('93', 'THX1445993423506', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', null, '0', null);
INSERT INTO `orders` VALUES ('94', 'THX1445993423802', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', null, '0', null);
INSERT INTO `orders` VALUES ('95', 'THX1445993424079', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', null, '0', null);
INSERT INTO `orders` VALUES ('96', 'THX1445993424336', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', null, '0', null);
INSERT INTO `orders` VALUES ('97', 'THX1445993424597', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', null, '0', null);
INSERT INTO `orders` VALUES ('98', 'THX1445993424897', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', null, '0', null);
INSERT INTO `orders` VALUES ('99', 'THX1445993425238', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', null, '0', null);
INSERT INTO `orders` VALUES ('100', 'THX1445993425534', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', null, '0', null);
INSERT INTO `orders` VALUES ('101', 'THX1445993425842', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', null, '0', null);
INSERT INTO `orders` VALUES ('102', 'THX1445993465453', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', null, '0', null);
INSERT INTO `orders` VALUES ('103', 'THX1445993466047', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', null, '0', null);
INSERT INTO `orders` VALUES ('104', 'THX1445993466346', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', null, '0', null);
INSERT INTO `orders` VALUES ('105', 'THX1445993466599', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', null, '0', null);
INSERT INTO `orders` VALUES ('106', 'THX1445993466930', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', null, '0', null);
INSERT INTO `orders` VALUES ('107', 'THX1445993467174', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', null, '0', null);
INSERT INTO `orders` VALUES ('108', 'THX1445993467456', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', null, '0', null);
INSERT INTO `orders` VALUES ('109', 'THX1445993467702', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', null, '0', null);
INSERT INTO `orders` VALUES ('110', 'THX1445993467953', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', null, '0', null);
INSERT INTO `orders` VALUES ('111', 'THX1445993468232', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', null, '0', null);
INSERT INTO `orders` VALUES ('112', 'THX1445997218252', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', null, '0', null);
INSERT INTO `orders` VALUES ('113', 'THX1445997218507', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', null, '0', null);
INSERT INTO `orders` VALUES ('114', 'THX1445997218738', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', null, '0', null);
INSERT INTO `orders` VALUES ('115', 'THX1445997219015', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', null, '0', null);
INSERT INTO `orders` VALUES ('116', 'THX1445997219248', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', null, '0', null);
INSERT INTO `orders` VALUES ('117', 'THX1445997219484', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', null, '0', null);
INSERT INTO `orders` VALUES ('118', 'THX1445997219730', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', null, '0', null);
INSERT INTO `orders` VALUES ('119', 'THX1445997219974', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', null, '0', null);
INSERT INTO `orders` VALUES ('120', 'THX1445997220213', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', null, '0', null);
INSERT INTO `orders` VALUES ('121', 'THX1445997220452', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', null, '0', null);
INSERT INTO `orders` VALUES ('122', 'THX1446011334935', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', null, '0', null);
INSERT INTO `orders` VALUES ('123', 'THX1446011335240', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', null, '0', null);
INSERT INTO `orders` VALUES ('124', 'THX1446011335563', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', null, '0', null);
INSERT INTO `orders` VALUES ('125', 'THX1446011335882', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', null, '0', null);
INSERT INTO `orders` VALUES ('126', 'THX1446011336225', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', null, '0', null);
INSERT INTO `orders` VALUES ('127', 'THX1446011336532', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', null, '0', null);
INSERT INTO `orders` VALUES ('128', 'THX1446011336847', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', null, '0', null);
INSERT INTO `orders` VALUES ('129', 'THX1446011337180', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', null, '0', null);
INSERT INTO `orders` VALUES ('130', 'THX1446011337840', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', null, '0', null);
INSERT INTO `orders` VALUES ('131', 'THX1446011338154', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', null, '0', null);
INSERT INTO `orders` VALUES ('132', 'THX1446016170870', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', null, '0', null);
INSERT INTO `orders` VALUES ('133', 'THX1446016171181', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', null, '0', null);
INSERT INTO `orders` VALUES ('134', 'THX1446016171439', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', null, '0', null);
INSERT INTO `orders` VALUES ('135', 'THX1446016171691', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', null, '0', null);
INSERT INTO `orders` VALUES ('136', 'THX1446016171932', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', null, '0', null);
INSERT INTO `orders` VALUES ('137', 'THX1446016172180', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', null, '0', null);
INSERT INTO `orders` VALUES ('138', 'THX1446016172455', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', null, '0', null);
INSERT INTO `orders` VALUES ('139', 'THX1446016172708', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', null, '0', null);
INSERT INTO `orders` VALUES ('140', 'THX1446016172984', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', null, '0', null);
INSERT INTO `orders` VALUES ('141', 'THX1446016173233', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', null, '0', null);
INSERT INTO `orders` VALUES ('142', 'THX1446040000237', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', null, '0', null);
INSERT INTO `orders` VALUES ('143', 'THX1446040000520', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', null, '0', null);
INSERT INTO `orders` VALUES ('144', 'THX1446040000772', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', null, '0', null);
INSERT INTO `orders` VALUES ('145', 'THX1446040001049', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', null, '0', null);
INSERT INTO `orders` VALUES ('146', 'THX1446040001319', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', null, '0', null);
INSERT INTO `orders` VALUES ('147', 'THX1446040001691', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', null, '0', null);
INSERT INTO `orders` VALUES ('148', 'THX1446040002055', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', null, '0', null);
INSERT INTO `orders` VALUES ('149', 'THX1446040002364', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', null, '0', null);
INSERT INTO `orders` VALUES ('150', 'THX1446040002740', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', null, '0', null);
INSERT INTO `orders` VALUES ('151', 'THX1446040003329', '1', '2015-10-28', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', null, '0', null);
INSERT INTO `orders` VALUES ('152', 'THX1446425753080', '1', '2015-11-02 08:55:53 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', null, '0', null);
INSERT INTO `orders` VALUES ('153', 'THX1446425753250', '1', '2015-11-02 08:55:53 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', null, '0', null);
INSERT INTO `orders` VALUES ('154', 'THX1446425753400', '1', '2015-11-02 08:55:53 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', null, '0', null);
INSERT INTO `orders` VALUES ('155', 'THX1446425753560', '1', '2015-11-02 08:55:53 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', null, '0', null);
INSERT INTO `orders` VALUES ('156', 'THX1446425753707', '1', '2015-11-02 08:55:53 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', null, '0', null);
INSERT INTO `orders` VALUES ('157', 'THX1446425753847', '1', '2015-11-02 08:55:53 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', null, '0', null);
INSERT INTO `orders` VALUES ('158', 'THX1446425754007', '1', '2015-11-02 08:55:54 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', null, '0', null);
INSERT INTO `orders` VALUES ('159', 'THX1446425754157', '1', '2015-11-02 08:55:54 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', null, '0', null);
INSERT INTO `orders` VALUES ('160', 'THX1446425754347', '1', '2015-11-02 08:55:54 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', null, '0', null);
INSERT INTO `orders` VALUES ('161', 'THX1446425754527', '1', '2015-11-02 08:55:54 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', null, '0', null);
INSERT INTO `orders` VALUES ('162', 'THX1446520261400', '1', '2015-11-03 11:11:01 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递0', null, '0', null);
INSERT INTO `orders` VALUES ('163', 'THX1446520261568', '1', '2015-11-03 11:11:01 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递1', null, '0', null);
INSERT INTO `orders` VALUES ('164', 'THX1446520261729', '1', '2015-11-03 11:11:01 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递2', null, '0', null);
INSERT INTO `orders` VALUES ('165', 'THX1446520261882', '1', '2015-11-03 11:11:01 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递3', null, '0', null);
INSERT INTO `orders` VALUES ('166', 'THX1446520262030', '1', '2015-11-03 11:11:02 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递4', null, '0', null);
INSERT INTO `orders` VALUES ('167', 'THX1446520262211', '1', '2015-11-03 11:11:02 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递5', null, '0', null);
INSERT INTO `orders` VALUES ('168', 'THX1446520262384', '1', '2015-11-03 11:11:02 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递6', null, '0', null);
INSERT INTO `orders` VALUES ('169', 'THX1446520262599', '1', '2015-11-03 11:11:02 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递7', null, '0', null);
INSERT INTO `orders` VALUES ('170', 'THX1446520262760', '1', '2015-11-03 11:11:02 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递8', null, '0', null);
INSERT INTO `orders` VALUES ('171', 'THX1446520262919', '1', '2015-11-03 11:11:02 GMT+08:00', '未发货', '未支付', '5994.0', '0.0', '5994.0', null, 'YUNDA', '1901315209781', null, '7', '给我发邮政快递9', null, '0', null);
INSERT INTO `orders` VALUES ('172', 'THX1446600891519', '1', '2015-11-04 09:34:51 GMT+08:00', '未发货', '未支付', '9998.2', '0.0', '9998.2', null, null, null, null, '8', '', null, '0', null);

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `picturepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pictureProduct` (`productId`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', '1', 'bizfile/apple.jpg');
INSERT INTO `picture` VALUES ('2', '1', 'bizfile/apple.jpg');
INSERT INTO `picture` VALUES ('4', '2', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('3', '1', 'bizfile/apple.jpg');
INSERT INTO `picture` VALUES ('5', '2', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('6', '2', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('7', '3', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('8', '3', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('9', '3', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('10', '4', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('11', '4', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('12', '4', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('13', '5', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('14', '5', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('15', '5', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('16', '6', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('17', '6', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('18', '6', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('19', '7', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('20', '7', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('21', '7', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('22', '8', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('23', '8', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('24', '8', 'bizfile/fish.jpg');
INSERT INTO `picture` VALUES ('25', '19', 'bizfile/TB2tWuKepXXXXblXXXXXXXXXXXX_!!25420649.jpg');
INSERT INTO `picture` VALUES ('26', '19', 'bizfile/TB2QQ5zepXXXXXvXpXXXXXXXXXX_!!25420649.jpg');
INSERT INTO `picture` VALUES ('27', '19', 'bizfile/TB2KOusepXXXXaJXpXXXXXXXXXX_!!25420649.jpg');
INSERT INTO `picture` VALUES ('28', '20', 'bizfile/TB2MPpYgXXXXXcjXpXXXXXXXXXX_!!13569366.jpg');
INSERT INTO `picture` VALUES ('29', '20', 'bizfile/TB2mZN0gXXXXXbWXpXXXXXXXXXX_!!13569366.jpg');
INSERT INTO `picture` VALUES ('30', '20', 'bizfile/TB2ZBoVdFXXXXcyXXXXXXXXXXXX_!!13569366.jpg');
INSERT INTO `picture` VALUES ('31', '22', 'bizfile/u=76558352,2677716262&fm=15&gp=0.jpg');
INSERT INTO `picture` VALUES ('32', '22', 'bizfile/item-5533F7C0..jpg');
INSERT INTO `picture` VALUES ('33', '23', 'bizfile/TB2N_iOXVXXXXcEXXXXXXXXXXXX_!!880409635.jpg');
INSERT INTO `picture` VALUES ('34', '23', 'bizfile/TB2OZZFfXXXXXbFXpXXXXXXXXXX_!!1056032495.jpg');
INSERT INTO `picture` VALUES ('35', '24', 'bizfile/TB2Zxd_dVXXXXbOXXXXXXXXXXXX_!!2220331760.jpg');
INSERT INTO `picture` VALUES ('36', '24', 'bizfile/TB19G6sIFXXXXcVXFXXXXXXXXXX_!!0-item_pic.jpg');
INSERT INTO `picture` VALUES ('37', '25', 'bizfile/TB2nWRhfVXXXXaYXXXXXXXXXXXX_!!2588290662.jpg');
INSERT INTO `picture` VALUES ('38', '25', 'bizfile/TB2QGgZfFXXXXbHXpXXXXXXXXXX_!!2588290662.jpg');
INSERT INTO `picture` VALUES ('39', '20', 'bizfile/TB2MPpYgXXXXXcjXpXXXXXXXXXX_!!13569366.jpg');
INSERT INTO `picture` VALUES ('40', '20', 'bizfile/TB2MPpYgXXXXXcjXpXXXXXXXXXX_!!13569366.jpg');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currentPrice` double DEFAULT NULL,
  `standardPrice` double DEFAULT NULL,
  `name` tinytext,
  `shortDescription` text,
  `details` text,
  `defaultPicturePath` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `datetime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '89', '108', 'Apple iPhone 6s (A1700)', ' 64G 金色 移动联通电信4G手机   订单会根据仓库到货情况陆续发出，请您耐心等待！\r\n<font color=\'red\'>选联通0元购，媲美裸机的价格，选136套餐，月享1G全国流量+500分钟全国通话</font>', '<table class=\"Ptable\" border=\"0\" width=\"100%\" cellspacing=\"1\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<th class=\"tdTitle\" colspan=\"2\">主体</th>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">品牌</td>\r\n<td>Apple</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">型号</td>\r\n<td>iPhone 6S</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">颜色</td>\r\n<td>金色</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">上市年份</td>\r\n<td>2015年</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">上市月份</td>\r\n<td>9月</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">输入方式</td>\r\n<td>触控</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">智能机</td>\r\n<td>是</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">操作系统</td>\r\n<td>苹果（IOS）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">操作系统版本</td>\r\n<td>IOS</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">CPU品牌</td>\r\n<td>苹果</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">CPU说明</td>\r\n<td>64 位架构的 A9 芯片，嵌入式 M9 运动协处理器</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">运营商标志或内容</td>\r\n<td>无</td>\r\n</tr>\r\n<tr>\r\n<th class=\"tdTitle\" colspan=\"2\">网络</th>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">4G网络制式</td>\r\n<td>移动4G(TD-LTE)/联通4G(FDD-LTE)/电信4G(FDD-LTE)</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">3G网络制式</td>\r\n<td>移动3G(TD-SCDMA)/联通3G(WCDMA)/电信3G（CDMA2000）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">2G网络制式</td>\r\n<td>移动2G/联通2G(GSM)/电信2G(CDMA)</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">网络频率</td>\r\n<td>FDD-LTE (频段 1, 2, 3, 4, 5, 7, 8, 12, 13, 17, 18, 19, 20, 25, 26, 27, 28, 29)\r\nTD-LTE (频段 38, 39, 40, 41)\r\nTD-SCDMA 1900 (F), 2000 (A)\r\nCDMA EV-DO Rev. A (800, 1700/2100, 1900, 2100 MHz)\r\nUMTS(WCDMA)/HSPA+/DC-HSDPA (850, 900, 1700/2100, 1900, 2100 MHz)\r\nGSM/EDGE (850, 900, 1800, 1900 MHz)</td>\r\n</tr>\r\n<tr>\r\n<th class=\"tdTitle\" colspan=\"2\">存储</th>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">机身内存</td>\r\n<td>64GB ROM</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">储存卡类型</td>\r\n<td>不支持</td>\r\n</tr>\r\n<tr>\r\n<th class=\"tdTitle\" colspan=\"2\">显示</th>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">屏幕尺寸</td>\r\n<td>4.7英寸</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">触摸屏</td>\r\n<td>具备 3D Touch 技术的 Retina HD 显示屏\r\n1400：1 对比度 (标准)\r\n500 cd/m2 最大亮度 (标准)\r\n全 sRGB 标准\r\n支持广阔视角的双域像素\r\n正面采用防油渍防指纹涂层\r\n支持多种语言文字同时显示\r\n放大显示\r\n便捷访问功能</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">分辨率</td>\r\n<td>1334 x 750</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">PPI</td>\r\n<td>326</td>\r\n</tr>\r\n<tr>\r\n<th class=\"tdTitle\" colspan=\"2\">感应器</th>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">GPS模块</td>\r\n<td>支持</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">重力感应</td>\r\n<td>支持</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">光线感应</td>\r\n<td>支持</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">距离感应</td>\r\n<td>支持</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">陀螺仪</td>\r\n<td>支持</td>\r\n</tr>\r\n<tr>\r\n<th class=\"tdTitle\" colspan=\"2\">摄像功能</th>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">后置摄像头</td>\r\n<td>1200万像素</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">前置摄像头</td>\r\n<td>500万像素</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">闪光灯</td>\r\n<td>True Tone 闪光灯</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">自动对焦</td>\r\n<td>Focus Pixels 自动对焦</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">其他性能</td>\r\n<td>全新 1200 万像素 iSight 摄像头，单个像素尺寸为 1.22 微米\r\nLive Photos\r\n全景模式 (高达 6300 万像素)\r\n自动 HDR 照片\r\n曝光控制\r\n连拍快照模式\r\n计时模式\r\nF/2.2 光圈\r\n五镜式镜头\r\n混合红外线滤镜\r\n背照式感光元件\r\n蓝宝石水晶镜头表面\r\n自动图像防抖功能\r\n优化的局部色调映射功能\r\n优化的降噪功能\r\n面部识别功能\r\n照片地理标记功能</td>\r\n</tr>\r\n<tr>\r\n<th class=\"tdTitle\" colspan=\"2\">娱乐功能</th>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">音乐播放</td>\r\n<td>AAC (8 至 320 Kbps)、Protected AAC (来自 iTunes Store)、HE-AAC、MP3 (8 至 320 Kbps)、MP3 VBR、Audible (格式 2、3、4，Audible Enhanced Audio、AAX 与 AAX+)、Apple Lossless、AIFF 与 WAV</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">视频播放</td>\r\n<td>H.264 视频，最高可达 1080p，60 fps；High Profile level 4.2 和 AAC-LC 音频，最高可达 160 Kbps，48kHz；立体声音频，文件格式为 .m4v、.mp4 和 .mov；MPEG-4 视频，最高可达 2.5 Mbps，640 x 480 像素，30 fps；Simple Profile 和 AAC-LC 音频，每声道最高可达 160 Kbps，48kHz，立体声音频，文件格式为 .m4v, .mp4 和 .mov；Motion JPEG (M-JPEG)，最高可达 35 Mbps，1280 x 720 像素，30 fps；ulaw 音频和 PCM 立体声音频，文件格式为 .avi</td>\r\n</tr>\r\n<tr>\r\n<th class=\"tdTitle\" colspan=\"2\">传输功能</th>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">Wi-Fi</td>\r\n<td>支持</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">蓝牙</td>\r\n<td>支持</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">NFC(近场通讯)</td>\r\n<td>支持</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">WIFI热点</td>\r\n<td>支持</td>\r\n</tr>\r\n<tr>\r\n<th class=\"tdTitle\" colspan=\"2\">其他</th>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">SIM卡尺寸</td>\r\n<td>Nano SIM卡</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">电池类型</td>\r\n<td>锂电池</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">电池容量（mAh）</td>\r\n<td>理论待机时间长达10天</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">电池更换</td>\r\n<td>不支持</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">理论通话时间（小时）</td>\r\n<td>3G 网络时长达 14 小时</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">理论待机时间（小时）</td>\r\n<td>长达 10 天 (250 小时)</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">数据线</td>\r\n<td>Lightning</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">耳机接口</td>\r\n<td>3.5mm</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">机身尺寸（mm）</td>\r\n<td>138.3*67.1*7.1</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">机身重量（g）</td>\r\n<td>143</td>\r\n</tr>\r\n<tr>\r\n<td class=\"tdTitle\">其他</td>\r\n<td>* 要识别你的 iPhone 的型号，请参阅 http：//support.apple.com/kb/HT3939。4G LTE Advanced 和 4G LTE 功能适用于特定国家或地区的特定运营商。有关 4G LTE 支持的详情，请联系你的运营商并查看 www.apple.com/iphone/LTE/。\r\n1. 1GB = 10 亿字节； 内置主内存容量 16GB / 64GB/ 128GB (依所购机型而定)；格式化之后的实际容量可能较小。\r\n2. 实际尺寸和重量依配置和制造工艺的不同可能有所差异。\r\n3. FaceTime 视频通话要求通话双方使用支持 FaceTime 的设备和无线网络连接。能否通过蜂窝网络使用此功能，取决于运营商政策；可能需要支付数据费用。\r\n4. Siri 可能仅支持部分语言或地区，并且功能可能因地区而异。需使用互联网接入。可能需要支付蜂窝网络数据费用。\r\n5. 所有电池性能信息取决于网络设置和许多其他因素，实际结果可能有所不同。电池充电周期次数有限，最终可能需由 Apple 服务提供商更换。 电池使用时间和充电周期次数依设置和使用情况的不同而可能有所差异。详情请参阅 http：//www.apple.com/cn/batteries/ 和 http：//www.apple.com/cn/iphone/battery.html。\r\n6. 2013 年 9 月 1 日或之后初次激活且符合条件，并兼容 iOS 9 的设备，可从 App Store 免费下载 iMovie、Pages、Numbers 和 Keynote。2014 年 9 月 1 日或之后初次激活且符合条件，并兼容 iOS 9 的设备，可从 App Store 免费下载 GarageBand。请参阅 www.apple.com/cn/ios/whats-new/ 了解兼容 iOS 9 的设备。下载 app 需要使用 Apple ID。\r\n7. 推荐使用无线宽带网络；可能需要付费。\r\n8. 基于接收方和 app 的自定义建议功能不适用于中文 (简体、繁体) 和日语。</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'bizfile/apple.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('4', '999', '1099', '罗非鱼', '现货供应踏板鱼 踏板鱼干货 营养高 海产品厂家直销 送礼的首选', '<table>\r\n<tbody>\r\n<tr>\r\n<td class=\"de-feature\">品牌</td>\r\n<td class=\"de-value\">阳光水产</td>\r\n<td class=\"de-feature\">产品类别</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n<td class=\"de-feature\">是否进口</td>\r\n<td class=\"de-value\">否</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">原产地</td>\r\n<td class=\"de-value\">山东</td>\r\n<td class=\"de-feature\">售卖方式</td>\r\n<td class=\"de-value\">包装</td>\r\n<td class=\"de-feature\">原料与配料</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">等级</td>\r\n<td class=\"de-value\">一级</td>\r\n<td class=\"de-feature\">特产</td>\r\n<td class=\"de-value\">是</td>\r\n<td class=\"de-feature\">保质期</td>\r\n<td class=\"de-value\">730（天）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">生产日期</td>\r\n<td class=\"de-value\">2014.12</td>\r\n<td class=\"de-feature\">生产厂家</td>\r\n<td class=\"de-value\">日照阳光水产冷藏厂</td>\r\n<td class=\"de-feature\">储藏方法</td>\r\n<td class=\"de-value\">10摄氏度以下</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">净重（规格）</td>\r\n<td class=\"de-value\">10000（g）</td>\r\n<td class=\"de-feature\">包装规格</td>\r\n<td class=\"de-value\">1*10000,1*2500</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n1. 鱼肉含有叶酸、维生素B2、维生素B12等维生素，有滋补健胃、利水消肿、通乳、清热解毒、止嗽下气的功效，对各种水肿、浮肿、腹胀、少尿、黄疸、乳汁不通皆有效；\r\n\r\n2. 食用鱼肉对孕妇胎动不安、妊娠性水肿有很好的疗效；\r\n\r\n3. 鱼肉含有丰富的镁元素，对心血管系统有很好的保护作用，有利于预防高血压、心肌梗死等心血管疾病；\r\n4. 鱼肉中富含维生素A、铁、钙、磷等，常吃鱼还有养肝补血、泽肤养发的功效。\r\n\r\n5.含有丰富的完全蛋白质。鱼肉含有大量的蛋白质，如黄鱼含17.6%、带鱼含18.1%、鲐鱼含21.4%、鲢鱼含18.6%、鲤鱼含17.3%、鲫鱼含13%。鱼肉所含的蛋白质都是完全蛋白质，而且蛋白质所含必需氨基酸的量和比值最适合人体需要，容易被人体消化吸收。\r\n\r\n6. 脂肪含量较低，且多为不饱和脂肪酸。鱼肉的脂肪含量一般比较低，大多数只有1%--4%，如黄鱼含0.8%、带鱼含3.8%、鲐鱼含4%、鲢鱼含 4.3%、鲤鱼含5%鲫鱼含1.1%鳙鱼（胖头鱼）只含0.9%、墨斗鱼只含0.7%。鱼肉的脂肪多由不饱和脂肪酸组成，不饱和脂肪酸的碳链较长，具有降 低胆固醇的作用。\r\n\r\n7.无机盐、维生素含量较高。海水鱼和淡水鱼都含有丰富的磺，还含有磷、钙、铁等无机盐。鱼肉还含有大量的维生素A、维生素D、维生素B1、尼克酸。这些都是人体需要的营养素。\r\n\r\n另外，鱼肉的肌纤维比较短，蛋白质组织结构松散，水分含量比较多，因此，肉质比较鲜嫩，和禽畜肉相比，吃起来更觉软嫩，也更容易消化吸收。所以，可以看出，鱼类具有高蛋白、低脂肪、维生素、矿物质含量丰富，口味好、易于消化吸收的优点', 'bizfile/fish.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('2', '999', '1099', '踏板鱼', '现货供应踏板鱼 踏板鱼干货 营养高 海产品厂家直销 送礼的首选', '<table>\r\n<tbody>\r\n<tr>\r\n<td class=\"de-feature\">品牌</td>\r\n<td class=\"de-value\">阳光水产</td>\r\n<td class=\"de-feature\">产品类别</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n<td class=\"de-feature\">是否进口</td>\r\n<td class=\"de-value\">否</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">原产地</td>\r\n<td class=\"de-value\">山东</td>\r\n<td class=\"de-feature\">售卖方式</td>\r\n<td class=\"de-value\">包装</td>\r\n<td class=\"de-feature\">原料与配料</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">等级</td>\r\n<td class=\"de-value\">一级</td>\r\n<td class=\"de-feature\">特产</td>\r\n<td class=\"de-value\">是</td>\r\n<td class=\"de-feature\">保质期</td>\r\n<td class=\"de-value\">730（天）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">生产日期</td>\r\n<td class=\"de-value\">2014.12</td>\r\n<td class=\"de-feature\">生产厂家</td>\r\n<td class=\"de-value\">日照阳光水产冷藏厂</td>\r\n<td class=\"de-feature\">储藏方法</td>\r\n<td class=\"de-value\">10摄氏度以下</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">净重（规格）</td>\r\n<td class=\"de-value\">10000（g）</td>\r\n<td class=\"de-feature\">包装规格</td>\r\n<td class=\"de-value\">1*10000,1*2500</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n1. 鱼肉含有叶酸、维生素B2、维生素B12等维生素，有滋补健胃、利水消肿、通乳、清热解毒、止嗽下气的功效，对各种水肿、浮肿、腹胀、少尿、黄疸、乳汁不通皆有效；\r\n\r\n2. 食用鱼肉对孕妇胎动不安、妊娠性水肿有很好的疗效；\r\n\r\n3. 鱼肉含有丰富的镁元素，对心血管系统有很好的保护作用，有利于预防高血压、心肌梗死等心血管疾病；\r\n4. 鱼肉中富含维生素A、铁、钙、磷等，常吃鱼还有养肝补血、泽肤养发的功效。\r\n\r\n5.含有丰富的完全蛋白质。鱼肉含有大量的蛋白质，如黄鱼含17.6%、带鱼含18.1%、鲐鱼含21.4%、鲢鱼含18.6%、鲤鱼含17.3%、鲫鱼含13%。鱼肉所含的蛋白质都是完全蛋白质，而且蛋白质所含必需氨基酸的量和比值最适合人体需要，容易被人体消化吸收。\r\n\r\n6. 脂肪含量较低，且多为不饱和脂肪酸。鱼肉的脂肪含量一般比较低，大多数只有1%--4%，如黄鱼含0.8%、带鱼含3.8%、鲐鱼含4%、鲢鱼含 4.3%、鲤鱼含5%鲫鱼含1.1%鳙鱼（胖头鱼）只含0.9%、墨斗鱼只含0.7%。鱼肉的脂肪多由不饱和脂肪酸组成，不饱和脂肪酸的碳链较长，具有降 低胆固醇的作用。\r\n\r\n7.无机盐、维生素含量较高。海水鱼和淡水鱼都含有丰富的磺，还含有磷、钙、铁等无机盐。鱼肉还含有大量的维生素A、维生素D、维生素B1、尼克酸。这些都是人体需要的营养素。\r\n\r\n另外，鱼肉的肌纤维比较短，蛋白质组织结构松散，水分含量比较多，因此，肉质比较鲜嫩，和禽畜肉相比，吃起来更觉软嫩，也更容易消化吸收。所以，可以看出，鱼类具有高蛋白、低脂肪、维生素、矿物质含量丰富，口味好、易于消化吸收的优点', 'bizfile/fish.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('3', '999', '1099', '草鱼', '现货供应踏板鱼 踏板鱼干货 营养高 海产品厂家直销 送礼的首选', '<table>\r\n<tbody>\r\n<tr>\r\n<td class=\"de-feature\">品牌</td>\r\n<td class=\"de-value\">阳光水产</td>\r\n<td class=\"de-feature\">产品类别</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n<td class=\"de-feature\">是否进口</td>\r\n<td class=\"de-value\">否</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">原产地</td>\r\n<td class=\"de-value\">山东</td>\r\n<td class=\"de-feature\">售卖方式</td>\r\n<td class=\"de-value\">包装</td>\r\n<td class=\"de-feature\">原料与配料</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">等级</td>\r\n<td class=\"de-value\">一级</td>\r\n<td class=\"de-feature\">特产</td>\r\n<td class=\"de-value\">是</td>\r\n<td class=\"de-feature\">保质期</td>\r\n<td class=\"de-value\">730（天）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">生产日期</td>\r\n<td class=\"de-value\">2014.12</td>\r\n<td class=\"de-feature\">生产厂家</td>\r\n<td class=\"de-value\">日照阳光水产冷藏厂</td>\r\n<td class=\"de-feature\">储藏方法</td>\r\n<td class=\"de-value\">10摄氏度以下</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">净重（规格）</td>\r\n<td class=\"de-value\">10000（g）</td>\r\n<td class=\"de-feature\">包装规格</td>\r\n<td class=\"de-value\">1*10000,1*2500</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n1. 鱼肉含有叶酸、维生素B2、维生素B12等维生素，有滋补健胃、利水消肿、通乳、清热解毒、止嗽下气的功效，对各种水肿、浮肿、腹胀、少尿、黄疸、乳汁不通皆有效；\r\n\r\n2. 食用鱼肉对孕妇胎动不安、妊娠性水肿有很好的疗效；\r\n\r\n3. 鱼肉含有丰富的镁元素，对心血管系统有很好的保护作用，有利于预防高血压、心肌梗死等心血管疾病；\r\n4. 鱼肉中富含维生素A、铁、钙、磷等，常吃鱼还有养肝补血、泽肤养发的功效。\r\n\r\n5.含有丰富的完全蛋白质。鱼肉含有大量的蛋白质，如黄鱼含17.6%、带鱼含18.1%、鲐鱼含21.4%、鲢鱼含18.6%、鲤鱼含17.3%、鲫鱼含13%。鱼肉所含的蛋白质都是完全蛋白质，而且蛋白质所含必需氨基酸的量和比值最适合人体需要，容易被人体消化吸收。\r\n\r\n6. 脂肪含量较低，且多为不饱和脂肪酸。鱼肉的脂肪含量一般比较低，大多数只有1%--4%，如黄鱼含0.8%、带鱼含3.8%、鲐鱼含4%、鲢鱼含 4.3%、鲤鱼含5%鲫鱼含1.1%鳙鱼（胖头鱼）只含0.9%、墨斗鱼只含0.7%。鱼肉的脂肪多由不饱和脂肪酸组成，不饱和脂肪酸的碳链较长，具有降 低胆固醇的作用。\r\n\r\n7.无机盐、维生素含量较高。海水鱼和淡水鱼都含有丰富的磺，还含有磷、钙、铁等无机盐。鱼肉还含有大量的维生素A、维生素D、维生素B1、尼克酸。这些都是人体需要的营养素。\r\n\r\n另外，鱼肉的肌纤维比较短，蛋白质组织结构松散，水分含量比较多，因此，肉质比较鲜嫩，和禽畜肉相比，吃起来更觉软嫩，也更容易消化吸收。所以，可以看出，鱼类具有高蛋白、低脂肪、维生素、矿物质含量丰富，口味好、易于消化吸收的优点', 'bizfile/fish.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('5', '999', '1099', '鲤鱼', '现货供应踏板鱼 踏板鱼干货 营养高 海产品厂家直销 送礼的首选', '<table>\r\n<tbody>\r\n<tr>\r\n<td class=\"de-feature\">品牌</td>\r\n<td class=\"de-value\">阳光水产</td>\r\n<td class=\"de-feature\">产品类别</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n<td class=\"de-feature\">是否进口</td>\r\n<td class=\"de-value\">否</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">原产地</td>\r\n<td class=\"de-value\">山东</td>\r\n<td class=\"de-feature\">售卖方式</td>\r\n<td class=\"de-value\">包装</td>\r\n<td class=\"de-feature\">原料与配料</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">等级</td>\r\n<td class=\"de-value\">一级</td>\r\n<td class=\"de-feature\">特产</td>\r\n<td class=\"de-value\">是</td>\r\n<td class=\"de-feature\">保质期</td>\r\n<td class=\"de-value\">730（天）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">生产日期</td>\r\n<td class=\"de-value\">2014.12</td>\r\n<td class=\"de-feature\">生产厂家</td>\r\n<td class=\"de-value\">日照阳光水产冷藏厂</td>\r\n<td class=\"de-feature\">储藏方法</td>\r\n<td class=\"de-value\">10摄氏度以下</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">净重（规格）</td>\r\n<td class=\"de-value\">10000（g）</td>\r\n<td class=\"de-feature\">包装规格</td>\r\n<td class=\"de-value\">1*10000,1*2500</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n1. 鱼肉含有叶酸、维生素B2、维生素B12等维生素，有滋补健胃、利水消肿、通乳、清热解毒、止嗽下气的功效，对各种水肿、浮肿、腹胀、少尿、黄疸、乳汁不通皆有效；\r\n\r\n2. 食用鱼肉对孕妇胎动不安、妊娠性水肿有很好的疗效；\r\n\r\n3. 鱼肉含有丰富的镁元素，对心血管系统有很好的保护作用，有利于预防高血压、心肌梗死等心血管疾病；\r\n4. 鱼肉中富含维生素A、铁、钙、磷等，常吃鱼还有养肝补血、泽肤养发的功效。\r\n\r\n5.含有丰富的完全蛋白质。鱼肉含有大量的蛋白质，如黄鱼含17.6%、带鱼含18.1%、鲐鱼含21.4%、鲢鱼含18.6%、鲤鱼含17.3%、鲫鱼含13%。鱼肉所含的蛋白质都是完全蛋白质，而且蛋白质所含必需氨基酸的量和比值最适合人体需要，容易被人体消化吸收。\r\n\r\n6. 脂肪含量较低，且多为不饱和脂肪酸。鱼肉的脂肪含量一般比较低，大多数只有1%--4%，如黄鱼含0.8%、带鱼含3.8%、鲐鱼含4%、鲢鱼含 4.3%、鲤鱼含5%鲫鱼含1.1%鳙鱼（胖头鱼）只含0.9%、墨斗鱼只含0.7%。鱼肉的脂肪多由不饱和脂肪酸组成，不饱和脂肪酸的碳链较长，具有降 低胆固醇的作用。\r\n\r\n7.无机盐、维生素含量较高。海水鱼和淡水鱼都含有丰富的磺，还含有磷、钙、铁等无机盐。鱼肉还含有大量的维生素A、维生素D、维生素B1、尼克酸。这些都是人体需要的营养素。\r\n\r\n另外，鱼肉的肌纤维比较短，蛋白质组织结构松散，水分含量比较多，因此，肉质比较鲜嫩，和禽畜肉相比，吃起来更觉软嫩，也更容易消化吸收。所以，可以看出，鱼类具有高蛋白、低脂肪、维生素、矿物质含量丰富，口味好、易于消化吸收的优点', 'bizfile/fish.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('6', '999', '1099', '多宝鱼', '现货供应踏板鱼 踏板鱼干货 营养高 海产品厂家直销 送礼的首选', '<table>\r\n<tbody>\r\n<tr>\r\n<td class=\"de-feature\">品牌</td>\r\n<td class=\"de-value\">阳光水产</td>\r\n<td class=\"de-feature\">产品类别</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n<td class=\"de-feature\">是否进口</td>\r\n<td class=\"de-value\">否</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">原产地</td>\r\n<td class=\"de-value\">山东</td>\r\n<td class=\"de-feature\">售卖方式</td>\r\n<td class=\"de-value\">包装</td>\r\n<td class=\"de-feature\">原料与配料</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">等级</td>\r\n<td class=\"de-value\">一级</td>\r\n<td class=\"de-feature\">特产</td>\r\n<td class=\"de-value\">是</td>\r\n<td class=\"de-feature\">保质期</td>\r\n<td class=\"de-value\">730（天）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">生产日期</td>\r\n<td class=\"de-value\">2014.12</td>\r\n<td class=\"de-feature\">生产厂家</td>\r\n<td class=\"de-value\">日照阳光水产冷藏厂</td>\r\n<td class=\"de-feature\">储藏方法</td>\r\n<td class=\"de-value\">10摄氏度以下</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">净重（规格）</td>\r\n<td class=\"de-value\">10000（g）</td>\r\n<td class=\"de-feature\">包装规格</td>\r\n<td class=\"de-value\">1*10000,1*2500</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n1. 鱼肉含有叶酸、维生素B2、维生素B12等维生素，有滋补健胃、利水消肿、通乳、清热解毒、止嗽下气的功效，对各种水肿、浮肿、腹胀、少尿、黄疸、乳汁不通皆有效；\r\n\r\n2. 食用鱼肉对孕妇胎动不安、妊娠性水肿有很好的疗效；\r\n\r\n3. 鱼肉含有丰富的镁元素，对心血管系统有很好的保护作用，有利于预防高血压、心肌梗死等心血管疾病；\r\n4. 鱼肉中富含维生素A、铁、钙、磷等，常吃鱼还有养肝补血、泽肤养发的功效。\r\n\r\n5.含有丰富的完全蛋白质。鱼肉含有大量的蛋白质，如黄鱼含17.6%、带鱼含18.1%、鲐鱼含21.4%、鲢鱼含18.6%、鲤鱼含17.3%、鲫鱼含13%。鱼肉所含的蛋白质都是完全蛋白质，而且蛋白质所含必需氨基酸的量和比值最适合人体需要，容易被人体消化吸收。\r\n\r\n6. 脂肪含量较低，且多为不饱和脂肪酸。鱼肉的脂肪含量一般比较低，大多数只有1%--4%，如黄鱼含0.8%、带鱼含3.8%、鲐鱼含4%、鲢鱼含 4.3%、鲤鱼含5%鲫鱼含1.1%鳙鱼（胖头鱼）只含0.9%、墨斗鱼只含0.7%。鱼肉的脂肪多由不饱和脂肪酸组成，不饱和脂肪酸的碳链较长，具有降 低胆固醇的作用。\r\n\r\n7.无机盐、维生素含量较高。海水鱼和淡水鱼都含有丰富的磺，还含有磷、钙、铁等无机盐。鱼肉还含有大量的维生素A、维生素D、维生素B1、尼克酸。这些都是人体需要的营养素。\r\n\r\n另外，鱼肉的肌纤维比较短，蛋白质组织结构松散，水分含量比较多，因此，肉质比较鲜嫩，和禽畜肉相比，吃起来更觉软嫩，也更容易消化吸收。所以，可以看出，鱼类具有高蛋白、低脂肪、维生素、矿物质含量丰富，口味好、易于消化吸收的优点', 'bizfile/fish.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('7', '999', '1099', '电鳗', '现货供应踏板鱼 踏板鱼干货 营养高 海产品厂家直销 送礼的首选', '<table>\r\n<tbody>\r\n<tr>\r\n<td class=\"de-feature\">品牌</td>\r\n<td class=\"de-value\">阳光水产</td>\r\n<td class=\"de-feature\">产品类别</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n<td class=\"de-feature\">是否进口</td>\r\n<td class=\"de-value\">否</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">原产地</td>\r\n<td class=\"de-value\">山东</td>\r\n<td class=\"de-feature\">售卖方式</td>\r\n<td class=\"de-value\">包装</td>\r\n<td class=\"de-feature\">原料与配料</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">等级</td>\r\n<td class=\"de-value\">一级</td>\r\n<td class=\"de-feature\">特产</td>\r\n<td class=\"de-value\">是</td>\r\n<td class=\"de-feature\">保质期</td>\r\n<td class=\"de-value\">730（天）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">生产日期</td>\r\n<td class=\"de-value\">2014.12</td>\r\n<td class=\"de-feature\">生产厂家</td>\r\n<td class=\"de-value\">日照阳光水产冷藏厂</td>\r\n<td class=\"de-feature\">储藏方法</td>\r\n<td class=\"de-value\">10摄氏度以下</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">净重（规格）</td>\r\n<td class=\"de-value\">10000（g）</td>\r\n<td class=\"de-feature\">包装规格</td>\r\n<td class=\"de-value\">1*10000,1*2500</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n1. 鱼肉含有叶酸、维生素B2、维生素B12等维生素，有滋补健胃、利水消肿、通乳、清热解毒、止嗽下气的功效，对各种水肿、浮肿、腹胀、少尿、黄疸、乳汁不通皆有效；\r\n\r\n2. 食用鱼肉对孕妇胎动不安、妊娠性水肿有很好的疗效；\r\n\r\n3. 鱼肉含有丰富的镁元素，对心血管系统有很好的保护作用，有利于预防高血压、心肌梗死等心血管疾病；\r\n4. 鱼肉中富含维生素A、铁、钙、磷等，常吃鱼还有养肝补血、泽肤养发的功效。\r\n\r\n5.含有丰富的完全蛋白质。鱼肉含有大量的蛋白质，如黄鱼含17.6%、带鱼含18.1%、鲐鱼含21.4%、鲢鱼含18.6%、鲤鱼含17.3%、鲫鱼含13%。鱼肉所含的蛋白质都是完全蛋白质，而且蛋白质所含必需氨基酸的量和比值最适合人体需要，容易被人体消化吸收。\r\n\r\n6. 脂肪含量较低，且多为不饱和脂肪酸。鱼肉的脂肪含量一般比较低，大多数只有1%--4%，如黄鱼含0.8%、带鱼含3.8%、鲐鱼含4%、鲢鱼含 4.3%、鲤鱼含5%鲫鱼含1.1%鳙鱼（胖头鱼）只含0.9%、墨斗鱼只含0.7%。鱼肉的脂肪多由不饱和脂肪酸组成，不饱和脂肪酸的碳链较长，具有降 低胆固醇的作用。\r\n\r\n7.无机盐、维生素含量较高。海水鱼和淡水鱼都含有丰富的磺，还含有磷、钙、铁等无机盐。鱼肉还含有大量的维生素A、维生素D、维生素B1、尼克酸。这些都是人体需要的营养素。\r\n\r\n另外，鱼肉的肌纤维比较短，蛋白质组织结构松散，水分含量比较多，因此，肉质比较鲜嫩，和禽畜肉相比，吃起来更觉软嫩，也更容易消化吸收。所以，可以看出，鱼类具有高蛋白、低脂肪、维生素、矿物质含量丰富，口味好、易于消化吸收的优点', 'bizfile/fish.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('8', '999', '1099', '金枪鱼', '现货供应踏板鱼 踏板鱼干货 营养高 海产品厂家直销 送礼的首选', '<table>\r\n<tbody>\r\n<tr>\r\n<td class=\"de-feature\">品牌</td>\r\n<td class=\"de-value\">阳光水产</td>\r\n<td class=\"de-feature\">产品类别</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n<td class=\"de-feature\">是否进口</td>\r\n<td class=\"de-value\">否</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">原产地</td>\r\n<td class=\"de-value\">山东</td>\r\n<td class=\"de-feature\">售卖方式</td>\r\n<td class=\"de-value\">包装</td>\r\n<td class=\"de-feature\">原料与配料</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">等级</td>\r\n<td class=\"de-value\">一级</td>\r\n<td class=\"de-feature\">特产</td>\r\n<td class=\"de-value\">是</td>\r\n<td class=\"de-feature\">保质期</td>\r\n<td class=\"de-value\">730（天）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">生产日期</td>\r\n<td class=\"de-value\">2014.12</td>\r\n<td class=\"de-feature\">生产厂家</td>\r\n<td class=\"de-value\">日照阳光水产冷藏厂</td>\r\n<td class=\"de-feature\">储藏方法</td>\r\n<td class=\"de-value\">10摄氏度以下</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">净重（规格）</td>\r\n<td class=\"de-value\">10000（g）</td>\r\n<td class=\"de-feature\">包装规格</td>\r\n<td class=\"de-value\">1*10000,1*2500</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n1. 鱼肉含有叶酸、维生素B2、维生素B12等维生素，有滋补健胃、利水消肿、通乳、清热解毒、止嗽下气的功效，对各种水肿、浮肿、腹胀、少尿、黄疸、乳汁不通皆有效；\r\n\r\n2. 食用鱼肉对孕妇胎动不安、妊娠性水肿有很好的疗效；\r\n\r\n3. 鱼肉含有丰富的镁元素，对心血管系统有很好的保护作用，有利于预防高血压、心肌梗死等心血管疾病；\r\n4. 鱼肉中富含维生素A、铁、钙、磷等，常吃鱼还有养肝补血、泽肤养发的功效。\r\n\r\n5.含有丰富的完全蛋白质。鱼肉含有大量的蛋白质，如黄鱼含17.6%、带鱼含18.1%、鲐鱼含21.4%、鲢鱼含18.6%、鲤鱼含17.3%、鲫鱼含13%。鱼肉所含的蛋白质都是完全蛋白质，而且蛋白质所含必需氨基酸的量和比值最适合人体需要，容易被人体消化吸收。\r\n\r\n6. 脂肪含量较低，且多为不饱和脂肪酸。鱼肉的脂肪含量一般比较低，大多数只有1%--4%，如黄鱼含0.8%、带鱼含3.8%、鲐鱼含4%、鲢鱼含 4.3%、鲤鱼含5%鲫鱼含1.1%鳙鱼（胖头鱼）只含0.9%、墨斗鱼只含0.7%。鱼肉的脂肪多由不饱和脂肪酸组成，不饱和脂肪酸的碳链较长，具有降 低胆固醇的作用。\r\n\r\n7.无机盐、维生素含量较高。海水鱼和淡水鱼都含有丰富的磺，还含有磷、钙、铁等无机盐。鱼肉还含有大量的维生素A、维生素D、维生素B1、尼克酸。这些都是人体需要的营养素。\r\n\r\n另外，鱼肉的肌纤维比较短，蛋白质组织结构松散，水分含量比较多，因此，肉质比较鲜嫩，和禽畜肉相比，吃起来更觉软嫩，也更容易消化吸收。所以，可以看出，鱼类具有高蛋白、低脂肪、维生素、矿物质含量丰富，口味好、易于消化吸收的优点', 'bizfile/fish.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('9', '999', '1099', '带鱼', '现货供应踏板鱼 踏板鱼干货 营养高 海产品厂家直销 送礼的首选', '<table>\r\n<tbody>\r\n<tr>\r\n<td class=\"de-feature\">品牌</td>\r\n<td class=\"de-value\">阳光水产</td>\r\n<td class=\"de-feature\">产品类别</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n<td class=\"de-feature\">是否进口</td>\r\n<td class=\"de-value\">否</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">原产地</td>\r\n<td class=\"de-value\">山东</td>\r\n<td class=\"de-feature\">售卖方式</td>\r\n<td class=\"de-value\">包装</td>\r\n<td class=\"de-feature\">原料与配料</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">等级</td>\r\n<td class=\"de-value\">一级</td>\r\n<td class=\"de-feature\">特产</td>\r\n<td class=\"de-value\">是</td>\r\n<td class=\"de-feature\">保质期</td>\r\n<td class=\"de-value\">730（天）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">生产日期</td>\r\n<td class=\"de-value\">2014.12</td>\r\n<td class=\"de-feature\">生产厂家</td>\r\n<td class=\"de-value\">日照阳光水产冷藏厂</td>\r\n<td class=\"de-feature\">储藏方法</td>\r\n<td class=\"de-value\">10摄氏度以下</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">净重（规格）</td>\r\n<td class=\"de-value\">10000（g）</td>\r\n<td class=\"de-feature\">包装规格</td>\r\n<td class=\"de-value\">1*10000,1*2500</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n1. 鱼肉含有叶酸、维生素B2、维生素B12等维生素，有滋补健胃、利水消肿、通乳、清热解毒、止嗽下气的功效，对各种水肿、浮肿、腹胀、少尿、黄疸、乳汁不通皆有效；\r\n\r\n2. 食用鱼肉对孕妇胎动不安、妊娠性水肿有很好的疗效；\r\n\r\n3. 鱼肉含有丰富的镁元素，对心血管系统有很好的保护作用，有利于预防高血压、心肌梗死等心血管疾病；\r\n4. 鱼肉中富含维生素A、铁、钙、磷等，常吃鱼还有养肝补血、泽肤养发的功效。\r\n\r\n5.含有丰富的完全蛋白质。鱼肉含有大量的蛋白质，如黄鱼含17.6%、带鱼含18.1%、鲐鱼含21.4%、鲢鱼含18.6%、鲤鱼含17.3%、鲫鱼含13%。鱼肉所含的蛋白质都是完全蛋白质，而且蛋白质所含必需氨基酸的量和比值最适合人体需要，容易被人体消化吸收。\r\n\r\n6. 脂肪含量较低，且多为不饱和脂肪酸。鱼肉的脂肪含量一般比较低，大多数只有1%--4%，如黄鱼含0.8%、带鱼含3.8%、鲐鱼含4%、鲢鱼含 4.3%、鲤鱼含5%鲫鱼含1.1%鳙鱼（胖头鱼）只含0.9%、墨斗鱼只含0.7%。鱼肉的脂肪多由不饱和脂肪酸组成，不饱和脂肪酸的碳链较长，具有降 低胆固醇的作用。\r\n\r\n7.无机盐、维生素含量较高。海水鱼和淡水鱼都含有丰富的磺，还含有磷、钙、铁等无机盐。鱼肉还含有大量的维生素A、维生素D、维生素B1、尼克酸。这些都是人体需要的营养素。\r\n\r\n另外，鱼肉的肌纤维比较短，蛋白质组织结构松散，水分含量比较多，因此，肉质比较鲜嫩，和禽畜肉相比，吃起来更觉软嫩，也更容易消化吸收。所以，可以看出，鱼类具有高蛋白、低脂肪、维生素、矿物质含量丰富，口味好、易于消化吸收的优点', 'bizfile/fish.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('10', '999', '1099', '秋刀鱼', '现货供应踏板鱼 踏板鱼干货 营养高 海产品厂家直销 送礼的首选', '<table>\r\n<tbody>\r\n<tr>\r\n<td class=\"de-feature\">品牌</td>\r\n<td class=\"de-value\">阳光水产</td>\r\n<td class=\"de-feature\">产品类别</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n<td class=\"de-feature\">是否进口</td>\r\n<td class=\"de-value\">否</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">原产地</td>\r\n<td class=\"de-value\">山东</td>\r\n<td class=\"de-feature\">售卖方式</td>\r\n<td class=\"de-value\">包装</td>\r\n<td class=\"de-feature\">原料与配料</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">等级</td>\r\n<td class=\"de-value\">一级</td>\r\n<td class=\"de-feature\">特产</td>\r\n<td class=\"de-value\">是</td>\r\n<td class=\"de-feature\">保质期</td>\r\n<td class=\"de-value\">730（天）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">生产日期</td>\r\n<td class=\"de-value\">2014.12</td>\r\n<td class=\"de-feature\">生产厂家</td>\r\n<td class=\"de-value\">日照阳光水产冷藏厂</td>\r\n<td class=\"de-feature\">储藏方法</td>\r\n<td class=\"de-value\">10摄氏度以下</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">净重（规格）</td>\r\n<td class=\"de-value\">10000（g）</td>\r\n<td class=\"de-feature\">包装规格</td>\r\n<td class=\"de-value\">1*10000,1*2500</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n1. 鱼肉含有叶酸、维生素B2、维生素B12等维生素，有滋补健胃、利水消肿、通乳、清热解毒、止嗽下气的功效，对各种水肿、浮肿、腹胀、少尿、黄疸、乳汁不通皆有效；\r\n\r\n2. 食用鱼肉对孕妇胎动不安、妊娠性水肿有很好的疗效；\r\n\r\n3. 鱼肉含有丰富的镁元素，对心血管系统有很好的保护作用，有利于预防高血压、心肌梗死等心血管疾病；\r\n4. 鱼肉中富含维生素A、铁、钙、磷等，常吃鱼还有养肝补血、泽肤养发的功效。\r\n\r\n5.含有丰富的完全蛋白质。鱼肉含有大量的蛋白质，如黄鱼含17.6%、带鱼含18.1%、鲐鱼含21.4%、鲢鱼含18.6%、鲤鱼含17.3%、鲫鱼含13%。鱼肉所含的蛋白质都是完全蛋白质，而且蛋白质所含必需氨基酸的量和比值最适合人体需要，容易被人体消化吸收。\r\n\r\n6. 脂肪含量较低，且多为不饱和脂肪酸。鱼肉的脂肪含量一般比较低，大多数只有1%--4%，如黄鱼含0.8%、带鱼含3.8%、鲐鱼含4%、鲢鱼含 4.3%、鲤鱼含5%鲫鱼含1.1%鳙鱼（胖头鱼）只含0.9%、墨斗鱼只含0.7%。鱼肉的脂肪多由不饱和脂肪酸组成，不饱和脂肪酸的碳链较长，具有降 低胆固醇的作用。\r\n\r\n7.无机盐、维生素含量较高。海水鱼和淡水鱼都含有丰富的磺，还含有磷、钙、铁等无机盐。鱼肉还含有大量的维生素A、维生素D、维生素B1、尼克酸。这些都是人体需要的营养素。\r\n\r\n另外，鱼肉的肌纤维比较短，蛋白质组织结构松散，水分含量比较多，因此，肉质比较鲜嫩，和禽畜肉相比，吃起来更觉软嫩，也更容易消化吸收。所以，可以看出，鱼类具有高蛋白、低脂肪、维生素、矿物质含量丰富，口味好、易于消化吸收的优点', 'bizfile/fish.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('11', '999', '1099', '鲳鱼', '现货供应踏板鱼 踏板鱼干货 营养高 海产品厂家直销 送礼的首选', '<table>\r\n<tbody>\r\n<tr>\r\n<td class=\"de-feature\">品牌</td>\r\n<td class=\"de-value\">阳光水产</td>\r\n<td class=\"de-feature\">产品类别</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n<td class=\"de-feature\">是否进口</td>\r\n<td class=\"de-value\">否</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">原产地</td>\r\n<td class=\"de-value\">山东</td>\r\n<td class=\"de-feature\">售卖方式</td>\r\n<td class=\"de-value\">包装</td>\r\n<td class=\"de-feature\">原料与配料</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">等级</td>\r\n<td class=\"de-value\">一级</td>\r\n<td class=\"de-feature\">特产</td>\r\n<td class=\"de-value\">是</td>\r\n<td class=\"de-feature\">保质期</td>\r\n<td class=\"de-value\">730（天）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">生产日期</td>\r\n<td class=\"de-value\">2014.12</td>\r\n<td class=\"de-feature\">生产厂家</td>\r\n<td class=\"de-value\">日照阳光水产冷藏厂</td>\r\n<td class=\"de-feature\">储藏方法</td>\r\n<td class=\"de-value\">10摄氏度以下</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">净重（规格）</td>\r\n<td class=\"de-value\">10000（g）</td>\r\n<td class=\"de-feature\">包装规格</td>\r\n<td class=\"de-value\">1*10000,1*2500</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n1. 鱼肉含有叶酸、维生素B2、维生素B12等维生素，有滋补健胃、利水消肿、通乳、清热解毒、止嗽下气的功效，对各种水肿、浮肿、腹胀、少尿、黄疸、乳汁不通皆有效；\r\n\r\n2. 食用鱼肉对孕妇胎动不安、妊娠性水肿有很好的疗效；\r\n\r\n3. 鱼肉含有丰富的镁元素，对心血管系统有很好的保护作用，有利于预防高血压、心肌梗死等心血管疾病；\r\n4. 鱼肉中富含维生素A、铁、钙、磷等，常吃鱼还有养肝补血、泽肤养发的功效。\r\n\r\n5.含有丰富的完全蛋白质。鱼肉含有大量的蛋白质，如黄鱼含17.6%、带鱼含18.1%、鲐鱼含21.4%、鲢鱼含18.6%、鲤鱼含17.3%、鲫鱼含13%。鱼肉所含的蛋白质都是完全蛋白质，而且蛋白质所含必需氨基酸的量和比值最适合人体需要，容易被人体消化吸收。\r\n\r\n6. 脂肪含量较低，且多为不饱和脂肪酸。鱼肉的脂肪含量一般比较低，大多数只有1%--4%，如黄鱼含0.8%、带鱼含3.8%、鲐鱼含4%、鲢鱼含 4.3%、鲤鱼含5%鲫鱼含1.1%鳙鱼（胖头鱼）只含0.9%、墨斗鱼只含0.7%。鱼肉的脂肪多由不饱和脂肪酸组成，不饱和脂肪酸的碳链较长，具有降 低胆固醇的作用。\r\n\r\n7.无机盐、维生素含量较高。海水鱼和淡水鱼都含有丰富的磺，还含有磷、钙、铁等无机盐。鱼肉还含有大量的维生素A、维生素D、维生素B1、尼克酸。这些都是人体需要的营养素。\r\n\r\n另外，鱼肉的肌纤维比较短，蛋白质组织结构松散，水分含量比较多，因此，肉质比较鲜嫩，和禽畜肉相比，吃起来更觉软嫩，也更容易消化吸收。所以，可以看出，鱼类具有高蛋白、低脂肪、维生素、矿物质含量丰富，口味好、易于消化吸收的优点', 'bizfile/fish.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('12', '999', '1099', '鲫鱼', '现货供应踏板鱼 踏板鱼干货 营养高 海产品厂家直销 送礼的首选', '<table>\r\n<tbody>\r\n<tr>\r\n<td class=\"de-feature\">品牌</td>\r\n<td class=\"de-value\">阳光水产</td>\r\n<td class=\"de-feature\">产品类别</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n<td class=\"de-feature\">是否进口</td>\r\n<td class=\"de-value\">否</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">原产地</td>\r\n<td class=\"de-value\">山东</td>\r\n<td class=\"de-feature\">售卖方式</td>\r\n<td class=\"de-value\">包装</td>\r\n<td class=\"de-feature\">原料与配料</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">等级</td>\r\n<td class=\"de-value\">一级</td>\r\n<td class=\"de-feature\">特产</td>\r\n<td class=\"de-value\">是</td>\r\n<td class=\"de-feature\">保质期</td>\r\n<td class=\"de-value\">730（天）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">生产日期</td>\r\n<td class=\"de-value\">2014.12</td>\r\n<td class=\"de-feature\">生产厂家</td>\r\n<td class=\"de-value\">日照阳光水产冷藏厂</td>\r\n<td class=\"de-feature\">储藏方法</td>\r\n<td class=\"de-value\">10摄氏度以下</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">净重（规格）</td>\r\n<td class=\"de-value\">10000（g）</td>\r\n<td class=\"de-feature\">包装规格</td>\r\n<td class=\"de-value\">1*10000,1*2500</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n1. 鱼肉含有叶酸、维生素B2、维生素B12等维生素，有滋补健胃、利水消肿、通乳、清热解毒、止嗽下气的功效，对各种水肿、浮肿、腹胀、少尿、黄疸、乳汁不通皆有效；\r\n\r\n2. 食用鱼肉对孕妇胎动不安、妊娠性水肿有很好的疗效；\r\n\r\n3. 鱼肉含有丰富的镁元素，对心血管系统有很好的保护作用，有利于预防高血压、心肌梗死等心血管疾病；\r\n4. 鱼肉中富含维生素A、铁、钙、磷等，常吃鱼还有养肝补血、泽肤养发的功效。\r\n\r\n5.含有丰富的完全蛋白质。鱼肉含有大量的蛋白质，如黄鱼含17.6%、带鱼含18.1%、鲐鱼含21.4%、鲢鱼含18.6%、鲤鱼含17.3%、鲫鱼含13%。鱼肉所含的蛋白质都是完全蛋白质，而且蛋白质所含必需氨基酸的量和比值最适合人体需要，容易被人体消化吸收。\r\n\r\n6. 脂肪含量较低，且多为不饱和脂肪酸。鱼肉的脂肪含量一般比较低，大多数只有1%--4%，如黄鱼含0.8%、带鱼含3.8%、鲐鱼含4%、鲢鱼含 4.3%、鲤鱼含5%鲫鱼含1.1%鳙鱼（胖头鱼）只含0.9%、墨斗鱼只含0.7%。鱼肉的脂肪多由不饱和脂肪酸组成，不饱和脂肪酸的碳链较长，具有降 低胆固醇的作用。\r\n\r\n7.无机盐、维生素含量较高。海水鱼和淡水鱼都含有丰富的磺，还含有磷、钙、铁等无机盐。鱼肉还含有大量的维生素A、维生素D、维生素B1、尼克酸。这些都是人体需要的营养素。\r\n\r\n另外，鱼肉的肌纤维比较短，蛋白质组织结构松散，水分含量比较多，因此，肉质比较鲜嫩，和禽畜肉相比，吃起来更觉软嫩，也更容易消化吸收。所以，可以看出，鱼类具有高蛋白、低脂肪、维生素、矿物质含量丰富，口味好、易于消化吸收的优点', 'bizfile/fish.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('13', '999', '1099', '金鱼', '现货供应踏板鱼 踏板鱼干货 营养高 海产品厂家直销 送礼的首选', '<table>\r\n<tbody>\r\n<tr>\r\n<td class=\"de-feature\">品牌</td>\r\n<td class=\"de-value\">阳光水产</td>\r\n<td class=\"de-feature\">产品类别</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n<td class=\"de-feature\">是否进口</td>\r\n<td class=\"de-value\">否</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">原产地</td>\r\n<td class=\"de-value\">山东</td>\r\n<td class=\"de-feature\">售卖方式</td>\r\n<td class=\"de-value\">包装</td>\r\n<td class=\"de-feature\">原料与配料</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">等级</td>\r\n<td class=\"de-value\">一级</td>\r\n<td class=\"de-feature\">特产</td>\r\n<td class=\"de-value\">是</td>\r\n<td class=\"de-feature\">保质期</td>\r\n<td class=\"de-value\">730（天）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">生产日期</td>\r\n<td class=\"de-value\">2014.12</td>\r\n<td class=\"de-feature\">生产厂家</td>\r\n<td class=\"de-value\">日照阳光水产冷藏厂</td>\r\n<td class=\"de-feature\">储藏方法</td>\r\n<td class=\"de-value\">10摄氏度以下</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">净重（规格）</td>\r\n<td class=\"de-value\">10000（g）</td>\r\n<td class=\"de-feature\">包装规格</td>\r\n<td class=\"de-value\">1*10000,1*2500</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n1. 鱼肉含有叶酸、维生素B2、维生素B12等维生素，有滋补健胃、利水消肿、通乳、清热解毒、止嗽下气的功效，对各种水肿、浮肿、腹胀、少尿、黄疸、乳汁不通皆有效；\r\n\r\n2. 食用鱼肉对孕妇胎动不安、妊娠性水肿有很好的疗效；\r\n\r\n3. 鱼肉含有丰富的镁元素，对心血管系统有很好的保护作用，有利于预防高血压、心肌梗死等心血管疾病；\r\n4. 鱼肉中富含维生素A、铁、钙、磷等，常吃鱼还有养肝补血、泽肤养发的功效。\r\n\r\n5.含有丰富的完全蛋白质。鱼肉含有大量的蛋白质，如黄鱼含17.6%、带鱼含18.1%、鲐鱼含21.4%、鲢鱼含18.6%、鲤鱼含17.3%、鲫鱼含13%。鱼肉所含的蛋白质都是完全蛋白质，而且蛋白质所含必需氨基酸的量和比值最适合人体需要，容易被人体消化吸收。\r\n\r\n6. 脂肪含量较低，且多为不饱和脂肪酸。鱼肉的脂肪含量一般比较低，大多数只有1%--4%，如黄鱼含0.8%、带鱼含3.8%、鲐鱼含4%、鲢鱼含 4.3%、鲤鱼含5%鲫鱼含1.1%鳙鱼（胖头鱼）只含0.9%、墨斗鱼只含0.7%。鱼肉的脂肪多由不饱和脂肪酸组成，不饱和脂肪酸的碳链较长，具有降 低胆固醇的作用。\r\n\r\n7.无机盐、维生素含量较高。海水鱼和淡水鱼都含有丰富的磺，还含有磷、钙、铁等无机盐。鱼肉还含有大量的维生素A、维生素D、维生素B1、尼克酸。这些都是人体需要的营养素。\r\n\r\n另外，鱼肉的肌纤维比较短，蛋白质组织结构松散，水分含量比较多，因此，肉质比较鲜嫩，和禽畜肉相比，吃起来更觉软嫩，也更容易消化吸收。所以，可以看出，鱼类具有高蛋白、低脂肪、维生素、矿物质含量丰富，口味好、易于消化吸收的优点', 'bizfile/fish.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('14', '999', '1099', '雄鱼', '现货供应踏板鱼 踏板鱼干货 营养高 海产品厂家直销 送礼的首选', '<table>\r\n<tbody>\r\n<tr>\r\n<td class=\"de-feature\">品牌</td>\r\n<td class=\"de-value\">阳光水产</td>\r\n<td class=\"de-feature\">产品类别</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n<td class=\"de-feature\">是否进口</td>\r\n<td class=\"de-value\">否</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">原产地</td>\r\n<td class=\"de-value\">山东</td>\r\n<td class=\"de-feature\">售卖方式</td>\r\n<td class=\"de-value\">包装</td>\r\n<td class=\"de-feature\">原料与配料</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">等级</td>\r\n<td class=\"de-value\">一级</td>\r\n<td class=\"de-feature\">特产</td>\r\n<td class=\"de-value\">是</td>\r\n<td class=\"de-feature\">保质期</td>\r\n<td class=\"de-value\">730（天）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">生产日期</td>\r\n<td class=\"de-value\">2014.12</td>\r\n<td class=\"de-feature\">生产厂家</td>\r\n<td class=\"de-value\">日照阳光水产冷藏厂</td>\r\n<td class=\"de-feature\">储藏方法</td>\r\n<td class=\"de-value\">10摄氏度以下</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">净重（规格）</td>\r\n<td class=\"de-value\">10000（g）</td>\r\n<td class=\"de-feature\">包装规格</td>\r\n<td class=\"de-value\">1*10000,1*2500</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n1. 鱼肉含有叶酸、维生素B2、维生素B12等维生素，有滋补健胃、利水消肿、通乳、清热解毒、止嗽下气的功效，对各种水肿、浮肿、腹胀、少尿、黄疸、乳汁不通皆有效；\r\n\r\n2. 食用鱼肉对孕妇胎动不安、妊娠性水肿有很好的疗效；\r\n\r\n3. 鱼肉含有丰富的镁元素，对心血管系统有很好的保护作用，有利于预防高血压、心肌梗死等心血管疾病；\r\n4. 鱼肉中富含维生素A、铁、钙、磷等，常吃鱼还有养肝补血、泽肤养发的功效。\r\n\r\n5.含有丰富的完全蛋白质。鱼肉含有大量的蛋白质，如黄鱼含17.6%、带鱼含18.1%、鲐鱼含21.4%、鲢鱼含18.6%、鲤鱼含17.3%、鲫鱼含13%。鱼肉所含的蛋白质都是完全蛋白质，而且蛋白质所含必需氨基酸的量和比值最适合人体需要，容易被人体消化吸收。\r\n\r\n6. 脂肪含量较低，且多为不饱和脂肪酸。鱼肉的脂肪含量一般比较低，大多数只有1%--4%，如黄鱼含0.8%、带鱼含3.8%、鲐鱼含4%、鲢鱼含 4.3%、鲤鱼含5%鲫鱼含1.1%鳙鱼（胖头鱼）只含0.9%、墨斗鱼只含0.7%。鱼肉的脂肪多由不饱和脂肪酸组成，不饱和脂肪酸的碳链较长，具有降 低胆固醇的作用。\r\n\r\n7.无机盐、维生素含量较高。海水鱼和淡水鱼都含有丰富的磺，还含有磷、钙、铁等无机盐。鱼肉还含有大量的维生素A、维生素D、维生素B1、尼克酸。这些都是人体需要的营养素。\r\n\r\n另外，鱼肉的肌纤维比较短，蛋白质组织结构松散，水分含量比较多，因此，肉质比较鲜嫩，和禽畜肉相比，吃起来更觉软嫩，也更容易消化吸收。所以，可以看出，鱼类具有高蛋白、低脂肪、维生素、矿物质含量丰富，口味好、易于消化吸收的优点', 'bizfile/fish.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('15', '999', '1099', '鲢鱼', '现货供应踏板鱼 踏板鱼干货 营养高 海产品厂家直销 送礼的首选', '<table>\r\n<tbody>\r\n<tr>\r\n<td class=\"de-feature\">品牌</td>\r\n<td class=\"de-value\">阳光水产</td>\r\n<td class=\"de-feature\">产品类别</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n<td class=\"de-feature\">是否进口</td>\r\n<td class=\"de-value\">否</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">原产地</td>\r\n<td class=\"de-value\">山东</td>\r\n<td class=\"de-feature\">售卖方式</td>\r\n<td class=\"de-value\">包装</td>\r\n<td class=\"de-feature\">原料与配料</td>\r\n<td class=\"de-value\">龙利鱼</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">等级</td>\r\n<td class=\"de-value\">一级</td>\r\n<td class=\"de-feature\">特产</td>\r\n<td class=\"de-value\">是</td>\r\n<td class=\"de-feature\">保质期</td>\r\n<td class=\"de-value\">730（天）</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">生产日期</td>\r\n<td class=\"de-value\">2014.12</td>\r\n<td class=\"de-feature\">生产厂家</td>\r\n<td class=\"de-value\">日照阳光水产冷藏厂</td>\r\n<td class=\"de-feature\">储藏方法</td>\r\n<td class=\"de-value\">10摄氏度以下</td>\r\n</tr>\r\n<tr>\r\n<td class=\"de-feature\">净重（规格）</td>\r\n<td class=\"de-value\">10000（g）</td>\r\n<td class=\"de-feature\">包装规格</td>\r\n<td class=\"de-value\">1*10000,1*2500</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n1. 鱼肉含有叶酸、维生素B2、维生素B12等维生素，有滋补健胃、利水消肿、通乳、清热解毒、止嗽下气的功效，对各种水肿、浮肿、腹胀、少尿、黄疸、乳汁不通皆有效；\r\n\r\n2. 食用鱼肉对孕妇胎动不安、妊娠性水肿有很好的疗效；\r\n\r\n3. 鱼肉含有丰富的镁元素，对心血管系统有很好的保护作用，有利于预防高血压、心肌梗死等心血管疾病；\r\n4. 鱼肉中富含维生素A、铁、钙、磷等，常吃鱼还有养肝补血、泽肤养发的功效。\r\n\r\n5.含有丰富的完全蛋白质。鱼肉含有大量的蛋白质，如黄鱼含17.6%、带鱼含18.1%、鲐鱼含21.4%、鲢鱼含18.6%、鲤鱼含17.3%、鲫鱼含13%。鱼肉所含的蛋白质都是完全蛋白质，而且蛋白质所含必需氨基酸的量和比值最适合人体需要，容易被人体消化吸收。\r\n\r\n6. 脂肪含量较低，且多为不饱和脂肪酸。鱼肉的脂肪含量一般比较低，大多数只有1%--4%，如黄鱼含0.8%、带鱼含3.8%、鲐鱼含4%、鲢鱼含 4.3%、鲤鱼含5%鲫鱼含1.1%鳙鱼（胖头鱼）只含0.9%、墨斗鱼只含0.7%。鱼肉的脂肪多由不饱和脂肪酸组成，不饱和脂肪酸的碳链较长，具有降 低胆固醇的作用。\r\n\r\n7.无机盐、维生素含量较高。海水鱼和淡水鱼都含有丰富的磺，还含有磷、钙、铁等无机盐。鱼肉还含有大量的维生素A、维生素D、维生素B1、尼克酸。这些都是人体需要的营养素。\r\n\r\n另外，鱼肉的肌纤维比较短，蛋白质组织结构松散，水分含量比较多，因此，肉质比较鲜嫩，和禽畜肉相比，吃起来更觉软嫩，也更容易消化吸收。所以，可以看出，鱼类具有高蛋白、低脂肪、维生素、矿物质含量丰富，口味好、易于消化吸收的优点', 'bizfile/fish.jpg', 'product', null, null);
INSERT INTO `product` VALUES ('16', null, null, '首页', null, null, null, 'link', '', null);
INSERT INTO `product` VALUES ('17', null, null, '海鲜知识', null, null, null, 'link', '', null);
INSERT INTO `product` VALUES ('18', null, null, '联系我们', null, null, null, 'link', '', null);
INSERT INTO `product` VALUES ('19', '8.2', '12.8', '即食海蜇头', '三江秘制，谨防假冒。三江海味家的海蜇是秘制的哦！因为海蜇头质量新鲜好吃。方便携带，自带小调料包！打开就可以直接食用，非常实惠方便~不可错过的佳品哦~', '<table><tbody><tr class=\"firstRow\"><td>生产许可证编号:&nbsp;330222010287</td><td>产品标准号:&nbsp;</td><td>厂名:&nbsp;宁波市鄞州老沈海鲜食品有限公司</td></tr><tr><td>厂址:&nbsp;宁波市鄞州区洞桥镇洞桥工业区洞欣路</td><td>厂家联系方式:&nbsp;13777076615</td><td>配料表:&nbsp;海蜇</td></tr><tr><td>储藏方法:&nbsp;</td><td>保质期:&nbsp;无</td><td>食品添加剂:&nbsp;180</td></tr><tr><td>净含量:&nbsp;200g</td><td>包装方式:&nbsp;包装</td><td>食品工艺:&nbsp;腌制水产</td></tr><tr><td>产地:&nbsp;中国大陆</td><td>省份:&nbsp;浙江省</td><td>城市:&nbsp;宁波市</td></tr></tbody></table><p><br/></p><p style=\"text-align: center;\"><span style=\"font-size: 36.0px;\"><strong><span style=\"color: #ff0000;\"><span style=\"background-color: #00ff00;\">三江海味---来自大海洋的美味，您身边的美味食府</span></span></strong></span></p><p><br/></p><p style=\"text-align: center;\"><span style=\"font-size: 48.0px;\"><strong><span style=\"color: #0000ff;\"><span style=\"background-color: #ffd966;\">美味即食海蜇头</span></span></strong></span></p><p><br/></p><p style=\"text-align: center;\"><span style=\"font-size: 48.0px;\"><strong><span style=\"color: #0000ff;\"><span style=\"background-color: #00ff00;\"></span><span style=\"background-color: #0000ff;\"><span style=\"background-color: #ffd966;\">全国部分省市 &nbsp;4份包邮</span></span></span></strong></span></p><p><br/></p><p style=\"text-align: center;\"><span style=\"font-size: 48.0px;\"><strong><span style=\"color: #0000ff;\"><span style=\"background-color: #0000ff;\"><span style=\"background-color: #ffd966;\"></span></span></span></strong></span><strong><span style=\"color: #ff0000;\"><span style=\"font-size: 48.0px; line-height: 72.0px; background-color: #00ff00;\"><span style=\"background-color: #ffffff;\">这款海蜇头最大的特色就是爽脆可口、无沙，是极好的冷菜哦！</span></span></span></strong><span style=\"line-height: 1.5;\">&nbsp;</span></p>', 'bizfile/TB10zpRJpXXXXaHXXXXXXXXXXXX_!!0-item_pic.jpg', 'product', null, '2015-10-27 15:45:26');
INSERT INTO `product` VALUES ('20', '38.8', '66.8', '海蜇头海蜇丝礼盒', '【节日送礼】福寿林脆爽即食海蜇 海蜇头海蜇丝礼盒6袋装1200g', '<table>\r\n		<tr>\r\n			<td title=\"370622020045\">生产许可证编号:&nbsp;370622020045</td>\r\n			<td title=\"Q/FLS0002S\">产品标准号:&nbsp;Q/FLS0002S</td>\r\n			<td title=\"烟台福林海洋食品有限责任公司\">厂名:&nbsp;烟台福林海洋食品有限责任公司</td>\r\n		</tr>\r\n		<tr>\r\n			<td title=\"福山区门楼镇(原斗余镇政府驻地)\">厂址:&nbsp;福山区门楼镇(原斗余镇政府驻地)</td>\r\n			<td title=\"0535-6327177\">厂家联系方式:&nbsp;0535-6327177</td>\r\n			<td title=\"海蜇头、丝、饮用水、老醋、食用盐\">配料表:&nbsp;海蜇头、丝、饮用水、老醋、食用盐</td>\r\n		</tr>\r\n		<tr>\r\n			<td title=\"常温避光阴凉干燥处\">储藏方法:&nbsp;常温避光阴凉干燥处</td>\r\n			<td title=\"365\">保质期:&nbsp;365</td>\r\n			<td title=\"山梨酸钾\">食品添加剂:&nbsp;山梨酸钾</td>\r\n		</tr>\r\n		<tr>\r\n			<td title=\"1200g\">净含量:&nbsp;1200g</td>\r\n			<td title=\"包装\">包装方式:&nbsp;包装</td>\r\n			<td title=\"福寿林\">品牌:&nbsp;福寿林</td>\r\n		</tr>\r\n		<tr>\r\n			<td title=\"单品\">售卖方式:&nbsp;单品</td>\r\n			<td title=\"腌制水产\">食品工艺:&nbsp;腌制水产</td>\r\n			<td title=\"中国大陆\">产地:&nbsp;中国大陆</td>\r\n		</tr>\r\n		<tr>\r\n			<td title=\"山东省\">省份:&nbsp;山东省</td>\r\n			<td title=\"烟台市\">城市:&nbsp;烟台市</td>\r\n			<td title=\"3人份\">套餐份量:&nbsp;3人份</td>\r\n		</tr>\r\n		<tr>\r\n			<td title=\"1周\">套餐周期:&nbsp;1周</td>\r\n			<td title=\"1周1次\">配送频次:&nbsp;1周1次</td>\r\n			<td title=\"三矾海蜇\">特产品类:&nbsp;三矾海蜇</td>\r\n		</tr>\r\n	</table>', 'bizfile/TB1wUwgJVXXXXcMXXXXXXXXXXXX_!!0-item_pic.jpg', 'product', null, '2015-10-27 15:45:27');
INSERT INTO `product` VALUES ('22', '34.9', '68.8', '老鲜生 芝麻蜜汁香辣鳗鱼丝', '老鲜生 芝麻蜜汁香辣鳗鱼丝500g 日式海鲜零食香辣味烤鳗鱼条干', '<table id=\"J_Attrtable\">\r\n	<tr>\r\n		<td title=\"210222020208\">生产许可证编号：210222020208</td>\r\n		<td title=\"Q/XSD 0001S\">产品标准号：Q/XSD 0001S</td>\r\n		<td title=\"大连旅顺新顺水产食品有限公司\">厂名：大连旅顺新顺水产食品有限公司</td>\r\n	</tr>\r\n	<tr>\r\n		<td title=\"大连市旅顺口区水师营镇大王村\">厂址：大连市旅顺口区水师营镇大王村</td>\r\n		<td title=\"4000411278\">厂家联系方式：4000411278</td>\r\n		<td title=\"海水鳗鱼、白砂糖、食用盐、味精\">配料表：海水鳗鱼、白砂糖、食用盐、味精</td>\r\n	</tr>\r\n	<tr>\r\n		<td title=\"请存放于干燥阴凉处，避免阳光直射。\">储藏方法：请存放于干燥阴凉处，避免阳光直射。</td>\r\n		<td title=\"240\">保质期：240 天</td>\r\n		<td title=\"谷氨酸钠\">食品添加剂：谷氨酸钠</td>\r\n	</tr>\r\n	<tr>\r\n		<td title=\"&nbsp;500g\">净含量:&nbsp;500g</td>\r\n		<td title=\"&nbsp;包装\">包装方式:&nbsp;包装</td>\r\n		<td id=\"J_attrBrandName\" title=\"&nbsp;老鲜生\">品牌:&nbsp;老鲜生</td>\r\n	</tr>\r\n	<tr>\r\n		<td title=\"&nbsp;鳗鱼丝500g\">系列:&nbsp;鳗鱼丝500g</td>\r\n		<td title=\"&nbsp;6959752100091\">商品条形码:&nbsp;6959752100091</td>\r\n		<td title=\"&nbsp;鱼丝\">鱼制品种类:&nbsp;鱼丝</td>\r\n	</tr>\r\n	<tr>\r\n		<td title=\"&nbsp;鳗鱼\">水产类品种:&nbsp;鳗鱼</td>\r\n		<td title=\"&nbsp;含糖\">是否含糖:&nbsp;含糖</td>\r\n		<td title=\"&nbsp;中国大陆\">产地:&nbsp;中国大陆</td>\r\n	</tr>\r\n	<tr>\r\n		<td title=\"&nbsp;辽宁省\">省份:&nbsp;辽宁省</td>\r\n		<td title=\"&nbsp;大连市\">城市:&nbsp;大连市</td>\r\n	</tr>\r\n</table>', 'bizfile/m2uoqjbwj2t.jpg', 'product', null, '2015-10-27 15:45:26');
INSERT INTO `product` VALUES ('23', '34.5', '32.5', '波力海苔', '波力海苔桶装原味75g罐即食紫菜脆片休闲办公室零食', '<table class=\"attributes-tdst\">\r\n	<tr>\r\n		<td title=\"320522010002\">生产许可证编号:&nbsp;320522010002</td>\r\n		<td title=\"GB/T23596\">产品标准号:&nbsp;GB/T23596</td>\r\n		<td title=\"波力食品工业(昆山)有限公司\">厂名:&nbsp;波力食品工业(昆山)有限公司</td>\r\n	</tr>\r\n	<tr>\r\n		<td title=\"江苏省苏州市昆山市玉山镇新南西路126号\">厂址:&nbsp;江苏省苏州市昆山市玉山镇新南西路126号</td>\r\n		<td title=\"0512-57532658\">厂家联系方式:&nbsp;0512-57532658</td>\r\n		<td title=\"紫菜、香菇汁、白砂糖、食盐、生姜、麦芽糊精、酱油、辣椒\">配料表:&nbsp;紫菜、香菇汁、白砂糖、食盐、生姜、麦芽糊精、酱油、辣椒</td>\r\n	</tr>\r\n	<tr>\r\n		<td title=\"开封后直接进食，请避免高温、潮湿及阳光直\">储藏方法:&nbsp;开封后直接进食，请避免高温、潮湿及阳光直</td>\r\n		<td title=\"365\">保质期:&nbsp;365</td>\r\n		<td title=\"见包装\">食品添加剂:&nbsp;见包装</td>\r\n	</tr>\r\n	<tr>\r\n		<td title=\"75g\">净含量:&nbsp;75g</td>\r\n		<td title=\"包装\">包装方式:&nbsp;包装</td>\r\n		<td title=\"中国大陆地区\">原产地:&nbsp;中国大陆地区</td>\r\n	</tr>\r\n	<tr>\r\n		<td title=\"波力\">品牌:&nbsp;波力</td>\r\n		<td title=\"海苔原味75g塑罐\">系列:&nbsp;海苔原味75g塑罐</td>\r\n		<td title=\"6918598021823\">商品条形码:&nbsp;6918598021823</td>\r\n	</tr>\r\n	<tr>\r\n		<td title=\"原味\">口味:&nbsp;原味</td>\r\n		<td title=\"含糖\">是否含糖:&nbsp;含糖</td>\r\n		<td title=\"中国大陆\">产地:&nbsp;中国大陆</td>\r\n	</tr>\r\n	<tr>\r\n		<td title=\"江苏省\">省份:&nbsp;江苏省</td>\r\n		<td title=\"昆山市\">城市:&nbsp;昆山市</td>\r\n	</tr>\r\n</table>', 'bizfile/TB1aCnKHpXXXXboXpXXXXXXXXXX_!!0-item_pic.jpg', 'product', null, '2015-10-27 15:45:26');
INSERT INTO `product` VALUES ('24', '19.8', '42', '【掌鲜生活】即食红蟹子', '【掌鲜生活】 即食红蟹子日本寿司材料蟹子100g', '<table class=\"attributes-tdst\">\r\n    <tr>\r\n        <td title=\"\">生产许可证编号:&nbsp;</td>\r\n        <td title=\"\">产品标准号:&nbsp;</td>\r\n        <td title=\"山东美佳集团有限公司\">厂名:&nbsp;山东美佳集团有限公司</td>\r\n        <td title=\"日照海滨一路59号；日照海滨一路119号\">厂址:&nbsp;日照海滨一路59号；日照海滨一路119号</td>\r\n    </tr><tr>\r\n        <td title=\"0755-28761786\">厂家联系方式:&nbsp;0755-28761786</td>\r\n        <td title=\"请以收到实物为准\">配料表:&nbsp;请以收到实物为准</td>\r\n        <td title=\"-18°C或以下冷冻储藏\">储藏方法:&nbsp;-18°C或以下冷冻储藏</td>\r\n    </tr><tr>\r\n        <td title=\"540\">保质期:&nbsp;540</td>\r\n        <td title=\"无任何添加\">食品添加剂:&nbsp;无任何添加</td>\r\n        <td title=\"100g\">净含量:&nbsp;100g</td>\r\n    </tr><tr>\r\n        <td title=\"散装\">包装方式:&nbsp;散装</td>\r\n        <td title=\"掌鲜生活\">品牌:&nbsp;掌鲜生活</td>\r\n        <td title=\"冷冻水产\">食品工艺:&nbsp;冷冻水产</td>\r\n    </tr><tr>\r\n        <td title=\"中国大陆\">产地:&nbsp;中国大陆</td>\r\n        <td title=\"山东省\">省份:&nbsp;山东省</td>\r\n        <td title=\"日照市\">城市:&nbsp;日照市</td>\r\n    </tr><tr>\r\n        <td title=\"2人份\">套餐份量:&nbsp;2人份</td>\r\n        <td title=\"1周\">套餐周期:&nbsp;1周</td>\r\n        <td title=\"1周2次\">配送频次:&nbsp;1周2次</td>\r\n    </tr>\r\n</table>', 'bizfile/TB2DmFVdVXXXXaUXpXXXXXXXXXX_!!2220331760.jpg', 'product', null, '2015-10-27 15:45:26');
INSERT INTO `product` VALUES ('25', '7.8', '10', '特级无盐虾皮', '特级无盐虾皮宝宝虾皮补钙虾皮淡干250g即食虾皮虾米海米虾皮干货', '<table class=\"attributes-tdst\">\r\n    <tr>\r\n        <td title=\"371122010237\">生产许可证编号:&nbsp;371122010237</td>\r\n        <td title=\"\">产品标准号:&nbsp;</td>\r\n        <td title=\"日照市金海龙海洋食品有限公司\">厂名:&nbsp;日照市金海龙海洋食品有限公司</td>\r\n    </tr><tr>\r\n        <td title=\"岚山区安东卫街道绣锦河工业园\">厂址:&nbsp;岚山区安东卫街道绣锦河工业园</td>\r\n        <td title=\"15206333138\">厂家联系方式:&nbsp;15206333138</td>\r\n        <td title=\"虾皮\">配料表:&nbsp;虾皮</td>\r\n    </tr><tr>\r\n        <td title=\"冷藏\">储藏方法:&nbsp;冷藏</td>\r\n        <td title=\"180\">保质期:&nbsp;180</td>\r\n        <td title=\"无\">食品添加剂:&nbsp;无</td>\r\n    </tr><tr>\r\n        <td title=\"250g\">净含量:&nbsp;250g</td>\r\n        <td title=\"散装\">包装方式:&nbsp;散装</td>\r\n        <td title=\"水产干货\">食品工艺:&nbsp;水产干货</td>\r\n    </tr><tr>\r\n        <td title=\"中国大陆\">产地:&nbsp;中国大陆</td>\r\n        <td title=\"山东省\">省份:&nbsp;山东省</td>\r\n        <td title=\"日照市\">城市:&nbsp;日照市</td>\r\n    </tr>\r\n</table>', 'bizfile/TB1aov4JVXXXXbrXVXXXXXXXXXX_!!0-item_pic.jpg', 'product', null, '2015-10-27 15:45:26');
INSERT INTO `product` VALUES ('26', '0', '0', '海鱼', 'test2323', '2312314214', null, null, null, null);
INSERT INTO `product` VALUES ('27', '0', '0', '海鱼', 'test2323', '2312314214', null, null, null, null);
INSERT INTO `product` VALUES ('28', '0', '0', '海鱼', 'test2323', '2312314214', null, null, null, null);
INSERT INTO `product` VALUES ('29', '0', '0', '海鱼', 'test2323', '2312314214', null, null, null, null);

-- ----------------------------
-- Table structure for productcategory
-- ----------------------------
DROP TABLE IF EXISTS `productcategory`;
CREATE TABLE `productcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product` (`productId`),
  KEY `fk_category` (`categoryId`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productcategory
-- ----------------------------
INSERT INTO `productcategory` VALUES ('1', '1', '6');
INSERT INTO `productcategory` VALUES ('2', '2', '14');
INSERT INTO `productcategory` VALUES ('3', '3', '14');
INSERT INTO `productcategory` VALUES ('4', '4', '14');
INSERT INTO `productcategory` VALUES ('5', '5', '14');
INSERT INTO `productcategory` VALUES ('6', '6', '14');
INSERT INTO `productcategory` VALUES ('7', '7', '14');
INSERT INTO `productcategory` VALUES ('8', '8', '14');
INSERT INTO `productcategory` VALUES ('9', '9', '14');
INSERT INTO `productcategory` VALUES ('10', '10', '14');
INSERT INTO `productcategory` VALUES ('11', '11', '14');
INSERT INTO `productcategory` VALUES ('12', '12', '14');
INSERT INTO `productcategory` VALUES ('13', '13', '14');
INSERT INTO `productcategory` VALUES ('14', '14', '14');
INSERT INTO `productcategory` VALUES ('15', '15', '14');
INSERT INTO `productcategory` VALUES ('16', '19', '3');
INSERT INTO `productcategory` VALUES ('17', '20', '3');
INSERT INTO `productcategory` VALUES ('18', '22', '4');
INSERT INTO `productcategory` VALUES ('19', '23', '5');
INSERT INTO `productcategory` VALUES ('20', '24', '6');
INSERT INTO `productcategory` VALUES ('21', '25', '7');
INSERT INTO `productcategory` VALUES ('22', '26', '6');
INSERT INTO `productcategory` VALUES ('23', '28', '6');

-- ----------------------------
-- Table structure for reset_password
-- ----------------------------
DROP TABLE IF EXISTS `reset_password`;
CREATE TABLE `reset_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `uuid` varchar(50) NOT NULL,
  `apply_time` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reset_password
-- ----------------------------
INSERT INTO `reset_password` VALUES ('1', 'alanzyy@foxmail.com', 'af090dfcb851403aba8196a3aded457c', '2015-10-27 11:32:32 GMT+08:00');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `supervisor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_1` (`supervisor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'Rainy', '1', 'Software', '3', '1');

-- ----------------------------
-- Table structure for suggestproduct
-- ----------------------------
DROP TABLE IF EXISTS `suggestproduct`;
CREATE TABLE `suggestproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suggestproduct
-- ----------------------------
INSERT INTO `suggestproduct` VALUES ('1', '19');
INSERT INTO `suggestproduct` VALUES ('2', '20');
INSERT INTO `suggestproduct` VALUES ('3', '22');
INSERT INTO `suggestproduct` VALUES ('4', '23');
INSERT INTO `suggestproduct` VALUES ('5', '4');
INSERT INTO `suggestproduct` VALUES ('6', '2');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `research_area` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', 'Addie', '0', 'English', 'How old are you ?');
INSERT INTO `teacher` VALUES ('2', null, null, null, null);

-- ----------------------------
-- Table structure for user
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
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('111', 'alan2531ae4e', 'alan2531ae4e@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('2', 'alan30b85f9f', 'alan30b85f9f@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('3', 'aland7faa968', 'aland7faa968@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('4', 'robert', 'alan2d70ec63@shop.com', '111111', '18603740467', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('5', 'alan1243e21b', 'alan1243e21b@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('6', 'alanfb0dbf7d', 'alanfb0dbf7d@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('7', 'alande19c371', 'alande19c371@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('8', 'alan84c7d2f2', 'alan84c7d2f2@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('9', 'alan9d10cf5a', 'alan9d10cf5a@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('10', 'alan12c34b12', 'alan12c34b12@shop.com', '111111', '18677208052', 'yes', null, '曾迎颖', '男', '1988', '', null, '186772080521', '');
INSERT INTO `user` VALUES ('11', 'alan820935a4', 'alan820935a4@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('12', 'alan1bddc343', 'alan1bddc343@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('13', 'alan50a434d9', 'alan50a434d9@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('14', 'alanc6b764d8', 'alanc6b764d8@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('15', 'alan52c6372e', 'alan52c6372e@shop.com', '111111', '18665154401', 'yes', null, '曾迎颖', '男', '', '', null, '', null);
INSERT INTO `user` VALUES ('16', 'alan2430920f', 'alan2430920f@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('17', 'alan8333affa', 'alan8333affa@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('18', 'aland58be64b', 'aland58be64b@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('19', 'alan6e982025', 'alan6e982025@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('20', 'aland635662d', 'aland635662d@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('21', 'alan7ead841f', 'alan7ead841f@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('22', 'tec_feng', 'alan50c775bb@shop.com', '111111', '18624566801', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('1', 'sunny', 'tec_feng@hotmail.com', '111111', '18674205751', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('112', 'alane21b4ab6', 'alane21b4ab6@shop.com', '111111', '18648442805', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('113', 'alan9356acd8', 'alan9356acd8@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('114', 'alanc7fa1913', 'alanc7fa1913@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('115', 'alan14d68a8c', 'alan14d68a8c@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('116', 'alanfbdcc0cc', 'alanfbdcc0cc@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('117', 'alan1461b164', 'alanzyy@foxmail.com', '111111', '18654458308', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('118', 'alan2f3bfdb4', 'alan2f3bfdb4@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('119', 'alan212614d1', 'alan212614d1@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('120', 'alan8bc0e546', 'alan8bc0e546@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('121', 'alanbedb6fec', 'alanbedb6fec@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('122', 'alanf6abcc53', 'alanf6abcc53@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('123', 'alanf9581ad9', 'alanf9581ad9@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('124', 'alana703b826', 'alana703b826@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('125', 'alan9934eaf2', 'alan9934eaf2@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('126', 'alan03af3055', 'alan03af3055@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('127', 'alane9975750', 'alane9975750@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('128', 'alan2c826477', 'alan2c826477@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('129', 'alanf7b5a970', 'alanf7b5a970@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('130', 'alan1305839d', 'alan1305839d@shop.com', 'alan2015', '18688163698', 'yes', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for user_image
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

-- ----------------------------
-- Procedure structure for pro_cre_childlist
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_cre_childlist`;
DELIMITER ;;
CREATE DEFINER=`shop`@`%` PROCEDURE `pro_cre_childlist`(IN rootId INT,IN nDepth INT)
BEGIN   
      DECLARE done INT DEFAULT 0;   
      DECLARE b INT;   
      DECLARE cur1 CURSOR FOR SELECT id FROM category WHERE parentId=rootId;   
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;   
      SET max_sp_recursion_depth=12;   
       
      INSERT INTO tmpLst VALUES (NULL,rootId,nDepth);   
       
      OPEN cur1;   
       
      FETCH cur1 INTO b;   
      WHILE done=0 DO   
              CALL pro_cre_childlist(b,nDepth+1);   
              FETCH cur1 INTO b;   
      END WHILE;   
       
      CLOSE cur1;   
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pro_cre_parentlist
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_cre_parentlist`;
DELIMITER ;;
CREATE DEFINER=`shop`@`%` PROCEDURE `pro_cre_parentlist`(IN rootId INT,IN nDepth INT)
BEGIN   
      DECLARE done INT DEFAULT 0;   
      DECLARE b INT;   
      DECLARE cur1 CURSOR FOR SELECT parentId FROM category WHERE id=rootId;   
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;   
      SET max_sp_recursion_depth=12;   
       
      INSERT INTO tmpLst VALUES (NULL,rootId,nDepth);   
       
      OPEN cur1;   
       
      FETCH cur1 INTO b;   
      WHILE done=0 DO   
              CALL pro_cre_parentlist(b,nDepth+1);   
              FETCH cur1 INTO b;   
      END WHILE;   
       
      CLOSE cur1;   
     END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pro_cre_pathlist
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_cre_pathlist`;
DELIMITER ;;
CREATE DEFINER=`shop`@`%` PROCEDURE `pro_cre_pathlist`(IN nid INT,IN delimit VARCHAR(10),INOUT pathstr VARCHAR(1000))
BEGIN                     
      DECLARE done INT DEFAULT 0;   
      DECLARE parentid INT DEFAULT 0;         
      DECLARE cur1 CURSOR FOR    
      SELECT t.parentId,CONCAT(CAST(t.parentId AS CHAR),delimit,pathstr)   
        FROM category AS t WHERE t.id = nid;   
           
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;   
      SET max_sp_recursion_depth=12;                     
       
      OPEN cur1;   
       
      FETCH cur1 INTO parentid,pathstr;   
      WHILE done=0 DO              
              CALL pro_cre_pathlist(parentid,delimit,pathstr);   
              FETCH cur1 INTO parentid,pathstr;   
      END WHILE;   
            
      CLOSE cur1;    
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pro_cre_pnlist
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_cre_pnlist`;
DELIMITER ;;
CREATE DEFINER=`shop`@`%` PROCEDURE `pro_cre_pnlist`(IN nid INT,IN delimit VARCHAR(10),INOUT pathstr VARCHAR(1000))
BEGIN                     
      DECLARE done INT DEFAULT 0;   
      DECLARE parentid INT DEFAULT 0;         
      DECLARE cur1 CURSOR FOR    
      SELECT t.parentId,CONCAT(t.cname,delimit,pathstr)   
        FROM category AS t WHERE t.id = nid;   
           
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;   
      SET max_sp_recursion_depth=12;                     
       
      OPEN cur1;   
       
      FETCH cur1 INTO parentid,pathstr;   
      WHILE done=0 DO              
              CALL pro_cre_pnlist(parentid,delimit,pathstr);   
              FETCH cur1 INTO parentid,pathstr;   
      END WHILE;   
            
      CLOSE cur1;    
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pro_show_childLst
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_show_childLst`;
DELIMITER ;;
CREATE DEFINER=`shop`@`%` PROCEDURE `pro_show_childLst`(IN rootId INT)
BEGIN   
      DROP TEMPORARY TABLE IF EXISTS tmpLst;   
      CREATE TEMPORARY TABLE  tmpLst    
       (sno INT PRIMARY KEY AUTO_INCREMENT,id INT,depth INT);         
       
      CALL pro_cre_childlist(rootId,0);   
       
      SELECT category.id,category.cname,category.parentId,tmpLst.depth,fn_tree_path(category.id,'/') path,fn_tree_pathname(category.id,'/') pathname   
      FROM tmpLst,category WHERE tmpLst.id=category.id ORDER BY tmpLst.sno;   
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for pro_show_parentLst
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_show_parentLst`;
DELIMITER ;;
CREATE DEFINER=`shop`@`%` PROCEDURE `pro_show_parentLst`(IN rootId INT)
BEGIN   
      DROP TEMPORARY TABLE IF EXISTS tmpLst;   
      CREATE TEMPORARY TABLE  tmpLst    
       (sno INT PRIMARY KEY AUTO_INCREMENT,id INT,depth INT);         
       
      CALL pro_cre_parentlist(rootId,0);   
      SELECT category.id,category.name,category.parentId,tmpLst.depth,fn_tree_path(category.id,'/') path,fn_tree_pathname(category.id,'/') pathname   
      FROM tmpLst,category WHERE tmpLst.id=category.id ORDER BY tmpLst.sno;   
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for fn_tree_path
-- ----------------------------
DROP FUNCTION IF EXISTS `fn_tree_path`;
DELIMITER ;;
CREATE DEFINER=`shop`@`%` FUNCTION `fn_tree_path`(nid INT,delimit VARCHAR(10)) RETURNS varchar(2000) CHARSET utf8
BEGIN     
  DECLARE pathid VARCHAR(1000);   
     
  SET @pathid=CAST(nid AS CHAR);   
  CALL pro_cre_pathlist(nid,delimit,@pathid);   
     
  RETURN @pathid;   
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for fn_tree_pathname
-- ----------------------------
DROP FUNCTION IF EXISTS `fn_tree_pathname`;
DELIMITER ;;
CREATE DEFINER=`shop`@`%` FUNCTION `fn_tree_pathname`(nid INT,delimit VARCHAR(10)) RETURNS varchar(2000) CHARSET utf8
BEGIN     
  DECLARE pathid VARCHAR(1000);   
  SET @pathid='';       
  CALL pro_cre_pnlist(nid,delimit,@pathid);   
  RETURN @pathid;   
END
;;
DELIMITER ;
