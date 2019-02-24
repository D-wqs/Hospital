/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50556
 Source Host           : 127.0.0.1:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50556
 File Encoding         : 65001

 Date: 24/02/2019 22:59:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_id` int(11) NULL DEFAULT NULL,
  `doctor_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `medicine_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doctor_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES (1, 1, 1, 15, '葵花牌小儿止咳颗粒', 'tom', 'wqs', '2019-02-15 15:59:16');
INSERT INTO `application` VALUES (2, NULL, 1, 1, '|002003999感冒灵', 'tom', 'tom', '2019-02-24 22:23:57');
INSERT INTO `application` VALUES (3, NULL, 1, 15, '002||003||', 'tom', 'tom', '2019-02-24 22:23:57');
INSERT INTO `application` VALUES (4, NULL, 1, 15, '999感冒灵||新康泰克||', 'tom', 'wqs', '2019-02-24 22:28:46');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `doctor_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_dept_user_id`(`doctor_id`) USING BTREE,
  CONSTRAINT `FK_dept_user_id` FOREIGN KEY (`doctor_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '骨科', '2019-01-20 01:19:50', NULL);
INSERT INTO `department` VALUES (2, '呼吸内科', '2019-01-20 01:20:10', NULL);
INSERT INTO `department` VALUES (3, '耳鼻喉科', '2019-01-20 01:20:20', NULL);
INSERT INTO `department` VALUES (4, '眼科', '2019-01-20 01:20:27', NULL);

-- ----------------------------
-- Table structure for medicine
-- ----------------------------
DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` double NULL DEFAULT NULL,
  `type` int(3) NULL DEFAULT 0,
  `user_id` int(11) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `information` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of medicine
-- ----------------------------
INSERT INTO `medicine` VALUES (1, '葵花牌小儿止咳颗粒', '2019-02-14 17:28:24', 22.23, 1, 1, 100, '/ssmDemo/upload/999感冒灵.jpg', '用来治疗');
INSERT INTO `medicine` VALUES (2, '002', '2019-01-24 23:42:24', 33.23, 1, 1, 200, '/ssmDemo/upload/新康泰克.jpg', '治感冒');
INSERT INTO `medicine` VALUES (3, '003', '2019-01-29 11:13:04', 23, 1, 1, 120, '/ssmDemo\\upload\\急支糖浆.png', '治感冒');
INSERT INTO `medicine` VALUES (4, '004', '2019-01-29 11:13:06', 44.8, 1, 1, 30, '/ssmDemo\\upload\\急支糖浆.png', '消食');
INSERT INTO `medicine` VALUES (6, '急支糖浆', '2019-01-29 10:34:12', 30, 0, 1, 100, '/ssmDemo\\upload\\急支糖浆.png', '止咳化痰');
INSERT INTO `medicine` VALUES (7, '999感冒灵', '2019-01-29 10:42:26', 20, 0, 1, 4, '/ssmDemo\\upload\\999感冒灵.jpg', '治感冒');
INSERT INTO `medicine` VALUES (8, '新康泰克', '2019-01-29 10:46:44', 21, 0, 1, 20, '/ssmDemo\\upload\\新康泰克.jpg', '治感冒');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `age` int(3) NULL DEFAULT 0,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` int(3) NULL DEFAULT 0,
  `sex` int(3) NULL DEFAULT 0,
  `imgpath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'tom', '2019-02-14 11:08:00', 49, 'e10adc3949ba59abbe56e057f20f883e', '14栋402', '13156785025', '1137771728@qq.com', 1, 1, '/ssmDemo\\upload\\men.png');
INSERT INTO `user` VALUES (2, 'aim', '2019-01-23 15:50:12', 21, 'e10adc3949ba59abbe56e057f20f883e', '14栋403', '13156785026', '1137771729@qq.com', 2, 0, '/ssmDemo\\upload\\women.png');
INSERT INTO `user` VALUES (3, '王二', '2019-01-23 15:50:32', 24, '4297f44b13955235245b2497399d7a93', '14栋403', '13156785027', '1137771730@qq.com', 1, 1, '/ssmDemo\\upload\\men.png');
INSERT INTO `user` VALUES (5, 'aoe', '2019-01-23 15:50:21', 23, 'e10adc3949ba59abbe56e057f20f883e', '25栋505', '13156785028', '1137771731@qq.com', 1, 0, '/ssmDemo\\upload\\women.png');
INSERT INTO `user` VALUES (9, 'pwd', '2019-01-23 16:10:19', 26, 'e10adc3949ba59abbe56e057f20f883e', '14栋401', '13156785029', '1137771732@qq.com', 3, 1, '/ssmDemo\\upload\\men.png');
INSERT INTO `user` VALUES (10, '奥特曼', '2019-01-23 16:10:26', 99, '698d51a19d8a121ce581499d7b701668', '14栋403', '13156785030', '1137771733@qq.com', 0, 1, '/ssmDemo\\upload\\men.png');
INSERT INTO `user` VALUES (11, '飞剑', '2019-01-23 16:10:34', 22, 'e10adc3949ba59abbe56e057f20f883e', '25栋504', '13156785031', '1137771734@qq.com', 4, 1, '/ssmDemo\\upload\\men.png');
INSERT INTO `user` VALUES (12, 'top', '2019-01-22 15:03:18', 22, 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', 0, 1, '/ssmDemo\\upload\\default.jpg');
INSERT INTO `user` VALUES (13, '李白', '2019-01-23 16:10:42', 45, 'e10adc3949ba59abbe56e057f20f883e', '101室', '13156785032', '1137771735@qq.com', 3, 1, '/ssmDemo\\upload\\men.png');
INSERT INTO `user` VALUES (14, '普通用户', '2019-01-25 15:42:47', 22, 'e10adc3949ba59abbe56e057f20f883e', '14栋402', '13156785033', '1137771736@qq.com', 0, 1, '/ssmDemo\\upload\\men.png');
INSERT INTO `user` VALUES (15, 'wqs', '2019-02-09 22:31:38', 24, 'e10adc3949ba59abbe56e057f20f883e', '14栋403', '13156785034', '1137771737@qq.com', 0, 1, '/ssmDemo\\upload\\men.png');
INSERT INTO `user` VALUES (16, '新人', '2019-02-14 17:07:56', 25, 'e10adc3949ba59abbe56e057f20f883e', '25栋505', '13156785035', '1137771738@qq.com', 0, 0, '/ssmDemo\\upload\\women.png');

SET FOREIGN_KEY_CHECKS = 1;
