/*
Navicat MySQL Data Transfer

Source Server         : LOCALHOST
Source Server Version : 50137
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50137
File Encoding         : 65001

Date: 2015-10-13 16:32:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(200) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'root', null);
INSERT INTO `category` VALUES ('2', '导航', '1');
INSERT INTO `category` VALUES ('3', '欢迎', '12');
INSERT INTO `category` VALUES ('4', '公司简介', '13');
INSERT INTO `category` VALUES ('5', '商品', '2');
INSERT INTO `category` VALUES ('6', '手机', '5');
INSERT INTO `category` VALUES ('7', '奶粉', '5');
INSERT INTO `category` VALUES ('8', '三星', '6');
INSERT INTO `category` VALUES ('9', 'moto', '6');
INSERT INTO `category` VALUES ('10', '惠氏', '7');
INSERT INTO `category` VALUES ('11', '400g', '10');
INSERT INTO `category` VALUES ('12', '首页', '1');
INSERT INTO `category` VALUES ('13', 'mb525', '9');

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `picturepath` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pictureProduct` (`productId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', '1', 'default.jpg');
INSERT INTO `picture` VALUES ('2', '1', 'default.jpg');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currentPrice` double DEFAULT NULL,
  `standardPrice` double DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `shortDescription` varchar(50) DEFAULT NULL,
  `details` varchar(50) DEFAULT NULL,
  `defaultPicturePath` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '89', '109', 'mb525', 'Nice phone', 'this is a very good phone , 2GB memory', 'default.jpg');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productcategory
-- ----------------------------
INSERT INTO `productcategory` VALUES ('1', '1', '6');

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
-- Procedure structure for pro_cre_childlist
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_cre_childlist`;
DELIMITER ;;
CREATE DEFINER=`ace-uk`@`localhost` PROCEDURE `pro_cre_childlist`(IN rootId INT,IN nDepth INT)
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
CREATE DEFINER=`ace-uk`@`localhost` PROCEDURE `pro_cre_parentlist`(IN rootId INT,IN nDepth INT)
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
CREATE DEFINER=`ace-uk`@`localhost` PROCEDURE `pro_cre_pathlist`(IN nid INT,IN delimit VARCHAR(10),INOUT pathstr VARCHAR(1000))
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
CREATE DEFINER=`ace-uk`@`localhost` PROCEDURE `pro_cre_pnlist`(IN nid INT,IN delimit VARCHAR(10),INOUT pathstr VARCHAR(1000))
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
CREATE DEFINER=`ace-uk`@`localhost` PROCEDURE `pro_show_childLst`(IN rootId INT)
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
CREATE DEFINER=`ace-uk`@`localhost` PROCEDURE `pro_show_parentLst`(IN rootId INT)
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
CREATE DEFINER=`ace-uk`@`localhost` FUNCTION `fn_tree_path`(nid INT,delimit VARCHAR(10)) RETURNS varchar(2000) CHARSET utf8
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
CREATE DEFINER=`ace-uk`@`localhost` FUNCTION `fn_tree_pathname`(nid INT,delimit VARCHAR(10)) RETURNS varchar(2000) CHARSET utf8
BEGIN     
  DECLARE pathid VARCHAR(1000);   
  SET @pathid='';       
  CALL pro_cre_pnlist(nid,delimit,@pathid);   
  RETURN @pathid;   
END
;;
DELIMITER ;
