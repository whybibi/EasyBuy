/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : easybuy

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 17/12/2019 11:44:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `country` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '城市',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '中国', '山东省', '济南市');
INSERT INTO `address` VALUES (2, '中国', '山东省', '青岛市');
INSERT INTO `address` VALUES (3, '中国', '山东省', '日照市');
INSERT INTO `address` VALUES (4, '中国', '山东省', '潍坊市');
INSERT INTO `address` VALUES (5, '中国', '山东省', '临沂市');
INSERT INTO `address` VALUES (6, '中国', '山东省', '威海市');
INSERT INTO `address` VALUES (7, '中国', '山东省', '烟台市');
INSERT INTO `address` VALUES (8, '中国', '山东省', '枣庄市');
INSERT INTO `address` VALUES (9, '中国', '山东省', '德州市');
INSERT INTO `address` VALUES (10, '中国', '山东省', '菏泽市');
INSERT INTO `address` VALUES (11, '中国', '山东省', '济宁市');
INSERT INTO `address` VALUES (12, '中国', '台湾省', '钓鱼岛');

-- ----------------------------
-- Table structure for hotsearch
-- ----------------------------
DROP TABLE IF EXISTS `hotsearch`;
CREATE TABLE `hotsearch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hotsearch
-- ----------------------------
INSERT INTO `hotsearch` VALUES (1, '正宗山东煎饼', '#');
INSERT INTO `hotsearch` VALUES (2, '战神笔记本', '#');
INSERT INTO `hotsearch` VALUES (3, '华为p10', '#');
INSERT INTO `hotsearch` VALUES (4, '大王卡', '#');
INSERT INTO `hotsearch` VALUES (5, '年货糖果', '#');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '小家电赶大集', '赶大集，上易买', '2018-02-02 10:40:49');
INSERT INTO `news` VALUES (2, '800元红包等你拿', '800元红包等你拿，够胆你就来', '2018-02-02 10:41:09');
INSERT INTO `news` VALUES (3, '带着电视回家过年', '让您倍感有面子', '2018-02-02 10:42:10');
INSERT INTO `news` VALUES (4, '抢神券1000减500', '抢神券1000减500', '2018-02-02 10:42:17');
INSERT INTO `news` VALUES (5, '萌宠聚惠199减80', '萌宠聚惠199减80', '2018-02-02 10:42:37');
INSERT INTO `news` VALUES (6, '厨卫电工,购不停', '厨卫电工,购不停', '2018-02-02 10:42:46');
INSERT INTO `news` VALUES (7, '车品年货屯起来', '车品年货屯起来', '2018-02-02 10:42:54');
INSERT INTO `news` VALUES (8, '母婴好物 5折疯抢', '母婴好物 5折疯抢', '2018-02-02 10:43:09');
INSERT INTO `news` VALUES (9, '数码家电，大牌直降', '发现生活的美好，家电精选热卖，大牌分期免息，快来享受大牌低价！', '2018-02-02 11:19:44');
INSERT INTO `news` VALUES (10, '远离雾霾自由呼吸', '明星同款口罩；保暖防雾霾口罩大促！', '2018-02-02 11:20:06');
INSERT INTO `news` VALUES (11, '千元手机，新年换新', '新年手机新品来袭，苹果手机、华为mate9现货开卖，最高12期分期免息。', '2018-02-02 11:20:26');
INSERT INTO `news` VALUES (12, '易买国际全球源计划，逐步给每件商品“身份证”，让国内消费者放心购买。', '天猫国际全球源计划，逐步给每件商品“身份证”，让国内消费者放心购买。', '2018-02-02 11:20:43');
INSERT INTO `news` VALUES (13, '新年买新衣，国际大牌倾情钜惠！', '新年买新衣，国际大牌倾情钜惠！', '2018-02-02 11:20:56');
INSERT INTO `news` VALUES (14, '国际大牌', '新年买新衣，国际大牌倾情钜惠！', '2018-02-02 15:36:50');
INSERT INTO `news` VALUES (15, '千元手机', '千元手机，新年换新', '2018-02-02 15:37:06');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `loginName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名',
  `userAddress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户地址',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `cost` double(10, 0) NOT NULL COMMENT '消费金额',
  `status` int(1) NOT NULL COMMENT '1为待审核，2为审核通过，3为配货，4为卖家已发货，5为已收货',
  `type` int(1) NOT NULL COMMENT '类型',
  `serialNumber` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `price` double(10, 0) NOT NULL COMMENT '商品价格',
  `stock` int(10) NOT NULL COMMENT '库存',
  `categoryLevel1` int(10) NOT NULL COMMENT '所属分类',
  `categoryLevel2` int(10) NULL DEFAULT NULL COMMENT '二级分类',
  `categoryLevel3` int(10) NULL DEFAULT NULL COMMENT '所属三级分类',
  `fileName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上传的文件名',
  `isDelete` int(1) NOT NULL DEFAULT 0 COMMENT '1为删除，0为未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '锐龙 sAMD Threadripper', '锐龙 AMD Threadripper （线程撕裂者）16核32线程处理器，诠释暴力性能', 5499, 100, 1, NULL, NULL, 'AMDThreadripper.jpg', 0);
INSERT INTO `product` VALUES (2, '锐龙 AMD Ryzen 7 1800X', '锐龙 AMD Ryzen 7 1800X ', 2699, 100, 1, NULL, NULL, 'ryzen7-1800X.jpg', 0);

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `parentId` int(10) NULL DEFAULT NULL COMMENT '父分类',
  `type` int(1) NOT NULL DEFAULT 1 COMMENT '1为一级分类，2为二级分类，3为三级分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, 'CPU', NULL, 1);
INSERT INTO `product_category` VALUES (2, 'AMD', 1, 2);
INSERT INTO `product_category` VALUES (3, 'Intel', 1, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `passWord` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `realName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `idCard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  `type` int(1) NOT NULL DEFAULT 0 COMMENT '用户类型，1为管理员，0为用户',
  `sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', NULL, '无', 'admin', '超级管理员', 1, '男');
INSERT INTO `user` VALUES (2, 'why', '123', NULL, '无', 'why', '超级管理员', 1, '男');
INSERT INTO `user` VALUES (3, '2b青年', '111', 'cynthia_017@163.com', '12345678901', '伍曼彤', '123456789012345678', 0, '男');
INSERT INTO `user` VALUES (4, '听风雨', '111', '150939468@qq.com', '12345678901', '汪玉嘉', '653126198709212609', 0, '男');
INSERT INTO `user` VALUES (5, '大家好我叫陈阿土你叫什么名字', '111', 'miikii2008@gmail.com', '17862793101', '萧麟', '522327197908251902', 0, '男');
INSERT INTO `user` VALUES (6, '淡淡的忧伤', '111', 'shilibleach@yahoo.cn', '15550081869', '扶忆梅', '371102198108116789', 0, '女');
INSERT INTO `user` VALUES (7, '闻鸡起舞', '111', '503609793@qq.com', '13255033668', '黄贺', '410702197607215008', 0, '男');
INSERT INTO `user` VALUES (8, '我是人', '111', 'mijobs@126.com', '17869568897', '沙恨寒', '341201197709061301', 0, '男');
INSERT INTO `user` VALUES (9, '2b', '123', '', '13222222222', '杀马特', '2353443323123434', 0, '男');

SET FOREIGN_KEY_CHECKS = 1;
