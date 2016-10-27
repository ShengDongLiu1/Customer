/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : 127.0.0.1:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-10-27 08:10:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for development
-- ----------------------------
DROP TABLE IF EXISTS `development`;
CREATE TABLE `development` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saleChanceId` int(11) DEFAULT NULL,
  `planItem` varchar(100) DEFAULT NULL,
  `planDate` date DEFAULT NULL,
  `exeAffect` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t_cus_dev_plan` (`saleChanceId`),
  CONSTRAINT `FK_t_cus_dev_plan` FOREIGN KEY (`saleChanceId`) REFERENCES `marketing` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of development
-- ----------------------------
INSERT INTO `development` VALUES ('28', '1', '开发计划', '2016-10-19', '开发结果');

-- ----------------------------
-- Table structure for marketing
-- ----------------------------
DROP TABLE IF EXISTS `marketing`;
CREATE TABLE `marketing` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售机会信息表',
  `chanceSource` varchar(300) DEFAULT NULL,
  `customerName` int(11) DEFAULT NULL,
  `cgjl` int(11) DEFAULT NULL,
  `overview` varchar(300) DEFAULT NULL,
  `linkMan` varchar(100) DEFAULT NULL,
  `linkPhone` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `createMan` varchar(100) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `assignMan` int(11) DEFAULT NULL,
  `assignTime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `devResult` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_id` (`customerName`),
  KEY `fk_user_id` (`assignMan`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`customerName`) REFERENCES `customer` (`kid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`assignMan`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of marketing
-- ----------------------------
INSERT INTO `marketing` VALUES ('1', '机会来源', '1', '100', '概要', '联系人', '联系人电话', '机会描述', '创建人', '2016-10-10 15:26:34', '1', '2016-10-10 15:28:34', '0', '1');
INSERT INTO `marketing` VALUES ('36', '谷歌', null, '11', null, '他', '12121', null, '系统管理员', null, null, null, null, null);
INSERT INTO `marketing` VALUES ('39', '1111111', '1', '11111111', '1111111111', '1111111', '111111111', '111111111111', '系统管理员', '2016-10-26 10:47:50', '3', null, '1', '0');
INSERT INTO `marketing` VALUES ('42', '1111111111', '2', '11111111', '1111111111', '111', '11111111', '111111111111', '系统管理员', '2016-10-26 18:54:48', '2', null, '1', '0');
INSERT INTO `marketing` VALUES ('45', '3333333333', '1', '133333333', '111111111111', '33333', '33333333', '1111111111', '系统管理员', '2016-10-26 20:41:59', '2', null, '0', '0');
