/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 127.0.0.1:3306
 Source Schema         : fruitdb

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 14/12/2020 13:55:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `posCode` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `consignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `dfault` int(11) NULL DEFAULT NULL COMMENT '1:默认地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 1, '浙江省杭州市萧山区', '311266', '杨士永', '12365478963', 1);
INSERT INTO `address` VALUES (2, 2, '浙江省宁波市海曙区高桥镇学院路899号宁波大红鹰学院', '311266', '何超群', '98652365263', 1);
INSERT INTO `address` VALUES (3, 2, '浙江省宁波市鄞州区宁波财经学院\r\n                                ', '311266', '王恒', '13652815632', 0);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '购物车编号',
  `productId` int(255) NULL DEFAULT NULL COMMENT '商品id',
  `userId` int(255) NULL DEFAULT NULL COMMENT '用户id',
  `num` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `total` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品总价',
  `isDelete` int(255) NULL DEFAULT NULL COMMENT '状态  0：在  1：消除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (2, 9, 1, 2, 22.50, '45.0', 0);
INSERT INTO `cart` VALUES (54, 1, 2, 2, 49.41, '98.82', 0);
INSERT INTO `cart` VALUES (38, 1, 10, 1, 49.41, '49.41', 0);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `productId` int(11) NULL DEFAULT NULL COMMENT '商品编号',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言',
  `addTime` datetime(0) NULL DEFAULT NULL COMMENT '留言时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 3, 9, '真的很不错', '2018-03-20 19:23:03');
INSERT INTO `comment` VALUES (2, 3, 2, '真好吃', '2018-03-20 19:32:31');
INSERT INTO `comment` VALUES (3, 1, 3, '这个果子不错', '2020-11-28 14:22:48');
INSERT INTO `comment` VALUES (4, 2, 22, 'asdas', '2020-12-07 14:37:50');
INSERT INTO `comment` VALUES (5, 7, 23, '不错不错', '2020-12-08 11:20:04');

-- ----------------------------
-- Table structure for cplb
-- ----------------------------
DROP TABLE IF EXISTS `cplb`;
CREATE TABLE `cplb`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '类别编号',
  `lbname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父编号',
  `isdelete` int(1) NULL DEFAULT NULL COMMENT '是否删除 0未删除  1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cplb
-- ----------------------------
INSERT INTO `cplb` VALUES (4, '肖山御石榴', 3, 0);
INSERT INTO `cplb` VALUES (3, '石榴', NULL, 0);
INSERT INTO `cplb` VALUES (2, '湾里酥梨', 1, 0);
INSERT INTO `cplb` VALUES (1, '梨子', NULL, 0);
INSERT INTO `cplb` VALUES (5, '桃子', NULL, 0);
INSERT INTO `cplb` VALUES (6, '史德镇御桃', 5, 0);
INSERT INTO `cplb` VALUES (7, '苹果', NULL, 0);
INSERT INTO `cplb` VALUES (8, '日本红富士', 7, 0);
INSERT INTO `cplb` VALUES (9, '秦冠', 7, 0);
INSERT INTO `cplb` VALUES (10, '嘎拉', 7, 0);
INSERT INTO `cplb` VALUES (11, '橘子', NULL, 0);
INSERT INTO `cplb` VALUES (12, '砂糖桔', 11, 0);
INSERT INTO `cplb` VALUES (13, '栌柑', 11, 0);
INSERT INTO `cplb` VALUES (14, '葡萄', NULL, 0);
INSERT INTO `cplb` VALUES (15, '巨峰', 14, 0);
INSERT INTO `cplb` VALUES (16, '白牛奶', 14, 0);
INSERT INTO `cplb` VALUES (17, '香蕉', NULL, 0);
INSERT INTO `cplb` VALUES (19, '六月雪', 1, 0);
INSERT INTO `cplb` VALUES (22, '外国香蕉', 17, 0);
INSERT INTO `cplb` VALUES (20, '砀山梨', 1, 0);
INSERT INTO `cplb` VALUES (21, '柠檬', NULL, 0);
INSERT INTO `cplb` VALUES (23, '西瓜', NULL, 0);
INSERT INTO `cplb` VALUES (24, '西瓜2', 23, 0);
INSERT INTO `cplb` VALUES (25, '雪花梨', 1, 0);
INSERT INTO `cplb` VALUES (26, '尤力克', 21, 0);
INSERT INTO `cplb` VALUES (27, '库尔勒香梨', 1, 0);

-- ----------------------------
-- Table structure for manage
-- ----------------------------
DROP TABLE IF EXISTS `manage`;
CREATE TABLE `manage`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `aaccount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `apass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `aname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `atel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `lasttime` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manage
-- ----------------------------
INSERT INTO `manage` VALUES (1, 'admin', '111111', '管理员', '123456789', '2020-12-14 10:12:32');
INSERT INTO `manage` VALUES (2, 'ysy', '222222', '杨士永', '987654321', '2020-11-03 08:35:55');
INSERT INTO `manage` VALUES (7, 'wh', 'wh', '王恒', '12365478966', NULL);
INSERT INTO `manage` VALUES (6, 'hcq', 'hcq', '何超群', '12365478966', NULL);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言人名称',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, 'wxj', '12533656485', '这是啥呀？');
INSERT INTO `message` VALUES (2, 'lj', '45569625662', 'asdasd');
INSERT INTO `message` VALUES (3, 'lj', '45569625662', '只是被动建设为本');
INSERT INTO `message` VALUES (4, 'lj', '45569625662', 'jgucmne');
INSERT INTO `message` VALUES (5, 'lj', '45569625662', '阿等可参考');
INSERT INTO `message` VALUES (31, 'ysy', '17815941368', '真好');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公告内容',
  `addTime` datetime(0) NULL DEFAULT NULL COMMENT '公告发布时间',
  `status` int(255) NULL DEFAULT NULL COMMENT '公告转态  可用/禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (6, '嫦娥五号探测器正按计划开展月面采样工作', '<p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">记者从国家航天局获悉，北京时间12月2日4时53分，探月工程嫦娥五号着陆器和上升器组合体完成了月球钻取采样及封装。探测器于12月1日23时许成功着陆月面后，开展了太阳翼展开、机构解锁等相关准备工作。</span></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/62f8fda0345d11eb555cde2d6c8a3975b3fb43166d224f4abd2789ea29be3d559922d15a.png\" title=\"\" alt=\"b3fb43166d224f4abd2789ea29be3d559922d15a.png\"/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">目前，着陆器和上升器组合体正按计划进行表取采样。嫦娥五号探测器自动采样任务采用表钻结合，多点采样的方式，设计了钻具钻取和机械臂表取两种“挖土”模式。</span></p><p><br/></p>', '2020-12-02 13:11:19', NULL);
INSERT INTO `news` VALUES (2, '测试公告2', '<p><img src=\"/ueditor/a83fde2049e011e8f298b03797777b7bd613e0adcb8ef424fed66f6deea08d99.jpg\" title=\"\" alt=\"d613e0adcb8ef424fed66f6deea08d99.jpg\"/></p>', '2018-04-27 14:03:09', NULL);
INSERT INTO `news` VALUES (3, '测试公告3', '<p style=\"margin: 10px auto; padding: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Verdana, Arial, sans-serif; font-size: 14px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 23.8px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">原来是我们自使用类似于Ant来获取类的时候是不能象UserLibaray来使用的,因为我们建立的是一个web app,而web app使用的是自定义的ClassLoader,而非JVM中的存在的三种ClassLoader(如上面所说),因此它无法识别出我们写在xml文件中的第三方类库的class文件,而只有我们写在src目录下的java文件才能使用,因此,我们必须要把第三方的类库放入到lib目录下,web app 才会识别我们定义在xml中的类了 &nbsp;.</p><p style=\"margin: 10px auto; padding: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Verdana, Arial, sans-serif; font-size: 14px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 23.8px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; 通这个错误,也让我对classloader的认识也进了一步.虽然以前看过周志明的深入JVM一书中关于类加载器分派体系的介绍,但是不太理解,这样一来,自己也多了一些体会.</p><p><br/></p>', '2018-04-27 14:03:32', NULL);
INSERT INTO `news` VALUES (4, '习近平总书记湖北之行第三天', '<p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">修改：新华网北京4月26日电 在24至25日沿长江考察调研后，26日下午，习近平总书记在武汉主持召开了深入推动长江经济带发展座谈会，为长江经济带发展进一步指引方向，作出部署。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　26日上午，习近平前往武汉市的科技企业和居民社区调研，聚焦自主创新、棚户区改造和社区党组织建设。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　这是习近平总书记第二次召开长江经济发展专题座谈会，特意安排在了位于长江中游的湖北。上一次座谈会是2016年1月，在位于长江上游的重庆召开的。“共抓大保护、不搞大开发”的重大战略思想，就是在那次座谈会上提出的。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　在今天的座谈会上，习近平总书记明确提出了推动长江经济带发展需要正确把握的5个关系：</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　◆整体推进和重点突破的关系；</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　◆生态环境保护和经济发展的关系；</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　◆总体谋划和久久为功的关系；</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　◆破除旧动能和培育新动能的关系；</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　◆自身发展和协同发展的关系。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　习近平强调，加强改革创新、战略统筹、规划引导，以长江经济带发展推动经济高质量发展。</p><p style=\"margin-top: 0px; margin-bottom: 15px; padding: 0px; color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\">　　自主创新，是习近平在武汉调研的一个重点课题。</p><p><br/></p>', '2018-04-27 14:25:46', NULL);
INSERT INTO `news` VALUES (5, '宁波银行荣获“普惠金融先锋”奖', '<p>value=&quot;</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;microsoft yahei&quot;; border: none; line-height: 2em; color: rgb(57, 57, 57); white-space: normal;\">修改123：近日，由人民日报社《国际金融报》主办的“2020国际先锋金融机构高峰论坛暨颁奖典礼”在上海举行，宁波银行荣获“普惠金融先锋”奖。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;microsoft yahei&quot;; border: none; line-height: 2em; color: rgb(57, 57, 57); white-space: normal;\">　　宁波银行始终坚持“服务地方经济、服务小微企业、服务城乡居民”市场定位，以普惠金融理念指引经营活动，不断增强服务实体经济的能力，持续为广大客户和社会创造价值。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;microsoft yahei&quot;; border: none; line-height: 2em; color: rgb(57, 57, 57); white-space: normal;\">　　从“门当户对”到相伴成长的客户经营理念，宁波银行始终将小微企业当作是重要的客户基础。在政策引导下，宁波银行发挥银行专业的优势和金融科技的力量，持续为小微企业客户创造价值，普惠金融服务的量在增长，质在提高。宁波银行单列小微企业信贷额度，优先满足小微企业贷款投放，2019年全行普惠小微企业单列信贷额度计划80亿元，2020年增加到215亿元。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;microsoft yahei&quot;; border: none; line-height: 2em; color: rgb(57, 57, 57); white-space: normal;\">　　在服务小微企业过程中，宁波银行创新推出“快审快贷”“捷算卡”等特色产品，不断升级“贷易融”等传统产品，辅之以线上服务等模式，有效满足小微企业不同的金融需求。2020年，在普惠小微企业首贷户拓展中，宁波银行“贷易融”受到小微企业欢迎。“贷易融”是面向小微企业或小微企业主提供抵押项下的公开授信额度，房产抵押率最高可达100%，授信期最长可达20年，循环额度授信，额度内随借随还。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;microsoft yahei&quot;; border: none; line-height: 2em; color: rgb(57, 57, 57); white-space: normal;\">　　新冠肺炎疫情发生后，宁波银行为疫情防控和复工复产提供全方位金融服务，贯彻落实各级政府和金融管理部门稳企业、保就业政策，配置优质资源，持续提高服务实体的能力。宁波银行针对小微企业开展“抗疫情，送关怀”主题活动，主动投放免息贷款，单户最高100万元，最长免息3个月。截至2020年6月末，宁波银行共发放免息贷款110亿元，惠及3.9万家小微企业。在人民银行支小再贷款的基础上，宁波银行专门配套40亿元专项低息支小贷款额度。此外，宁波银行落实多项减免服务费和利率优惠措施，为企业开通绿色服务通道，多方位做好金融支持和金融普惠工作。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;microsoft yahei&quot;; border: none; line-height: 2em; color: rgb(57, 57, 57); white-space: normal;\">　　宁波银行牢牢把握金融服务的根本宗旨，将普惠金融作为自身可持续发展的内生动力，始终坚持在服务实体经济的过程中积累差异化的比较优势，推动整体经营稳健向好，核心竞争力进一步增强。截至2020年9月末，宁波银行资产总额1.54万亿元，各项存款9267.37亿元，各项贷款总额6552.76亿元，均实现15%以上的增长；同时，整体资产质量稳健良好，不良贷款率稳定在0.79%，继续保持在较低水平。</p><p><br/></p><p>&quot;</p>', '2020-11-06 16:41:43', NULL);

-- ----------------------------
-- Table structure for porder
-- ----------------------------
DROP TABLE IF EXISTS `porder`;
CREATE TABLE `porder`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `productId` int(11) NULL DEFAULT NULL COMMENT '商品编号',
  `userId` int(255) NULL DEFAULT NULL COMMENT '会员编号',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `addTime` datetime(0) NULL DEFAULT NULL COMMENT '订单生成时间',
  `orderPrice` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单价格',
  `isdelete` int(255) NULL DEFAULT NULL COMMENT '0未删除',
  `status` int(255) NULL DEFAULT NULL COMMENT '0.新建待发货1.已取消 2已发货3.待收货4已收货',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of porder
-- ----------------------------
INSERT INTO `porder` VALUES (1, NULL, 1, '2018032017080001', '2018-03-20 17:08:56', '54.90', 0, 3);
INSERT INTO `porder` VALUES (2, NULL, 1, '2018032017380001', '2018-03-20 17:38:52', '66.50', 0, 3);
INSERT INTO `porder` VALUES (3, NULL, 1, '2018032017390001', '2018-03-20 17:39:28', '49.90', 0, 3);
INSERT INTO `porder` VALUES (4, NULL, 1, '2018032019220001', '2018-03-20 19:22:25', '85.00', 0, 3);
INSERT INTO `porder` VALUES (5, NULL, 1, '2018032019310001', '2018-03-20 19:31:23', '36.00', 0, 1);
INSERT INTO `porder` VALUES (6, NULL, 1, '2018032019310002', '2018-03-20 19:31:50', '198.00', 0, 0);
INSERT INTO `porder` VALUES (7, NULL, 1, '2020112717510001', '2020-11-27 17:51:48', '199.65', 0, 4);
INSERT INTO `porder` VALUES (8, NULL, 1, '2020120708440001', '2020-12-07 08:44:58', '300.0', 0, 0);
INSERT INTO `porder` VALUES (9, NULL, 2, '2020120714360001', '2020-12-07 14:36:56', '1724.8', 0, 4);
INSERT INTO `porder` VALUES (10, NULL, 7, '2020120811140001', '2020-12-08 11:14:22', '94.42', 0, 4);
INSERT INTO `porder` VALUES (11, NULL, 2, '2020121015050001', '2020-12-10 15:05:01', '236.05', 0, 1);
INSERT INTO `porder` VALUES (12, NULL, 2, '2020121215180001', '2020-12-12 15:18:13', '583.0', 0, 0);
INSERT INTO `porder` VALUES (18, NULL, 2, '2020121215480001', '2020-12-12 15:48:16', '183.52', 0, 0);
INSERT INTO `porder` VALUES (19, NULL, 2, '2020121217170001', '2020-12-12 17:17:55', '76.50', 0, 0);

-- ----------------------------
-- Table structure for porderdetail
-- ----------------------------
DROP TABLE IF EXISTS `porderdetail`;
CREATE TABLE `porderdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `productId` int(255) NULL DEFAULT NULL COMMENT '商品id',
  `porderId` int(11) NULL DEFAULT NULL COMMENT '订单id',
  `status` int(11) NULL DEFAULT NULL COMMENT '0.未退货 1已退货',
  `num` int(11) NULL DEFAULT NULL COMMENT '数量',
  `total` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小计',
  `addressId` int(11) NULL DEFAULT NULL COMMENT '地址id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of porderdetail
-- ----------------------------
INSERT INTO `porderdetail` VALUES (1, 1, 1, 0, 1, '1', 1);
INSERT INTO `porderdetail` VALUES (2, 6, 2, 0, 5, '25', 1);
INSERT INTO `porderdetail` VALUES (3, 1, 2, 0, 3, '9', 1);
INSERT INTO `porderdetail` VALUES (4, 2, 2, 0, 1, '1', 1);
INSERT INTO `porderdetail` VALUES (5, 9, 3, 0, 2, '4', 1);
INSERT INTO `porderdetail` VALUES (6, 8, 3, 0, 4, '16', 1);
INSERT INTO `porderdetail` VALUES (7, 6, 3, 0, 3, '9', 1);
INSERT INTO `porderdetail` VALUES (8, 10, 3, 0, 3, '9', 1);
INSERT INTO `porderdetail` VALUES (9, 6, 3, 0, 2, '4', 1);
INSERT INTO `porderdetail` VALUES (10, 9, 4, 0, 6, '36', 1);
INSERT INTO `porderdetail` VALUES (11, 4, 4, 0, 3, '9', 1);
INSERT INTO `porderdetail` VALUES (12, 2, 5, 0, 4, '16', 1);
INSERT INTO `porderdetail` VALUES (13, 2, 5, 0, 2, '4', 1);
INSERT INTO `porderdetail` VALUES (14, 2, 6, 0, 1, '1', 1);
INSERT INTO `porderdetail` VALUES (15, 3, 7, 0, 5, '199.65', 1);
INSERT INTO `porderdetail` VALUES (16, 10, 8, 0, 5, '300.0', 1);
INSERT INTO `porderdetail` VALUES (17, 22, 9, 0, 2, '1724.8', 2);
INSERT INTO `porderdetail` VALUES (18, 23, 10, 0, 2, '94.42', 1);
INSERT INTO `porderdetail` VALUES (19, 23, 11, 1, 5, '236.05', 3);
INSERT INTO `porderdetail` VALUES (20, 21, 12, 0, 7, '434.77', 3);
INSERT INTO `porderdetail` VALUES (21, 1, 12, 0, 3, '148.23', 3);
INSERT INTO `porderdetail` VALUES (33, 23, 18, 0, 2, '94.42', 2);
INSERT INTO `porderdetail` VALUES (32, 6, 18, 0, 1, '89.1', 2);
INSERT INTO `porderdetail` VALUES (34, 4, 19, 0, 1, '76.5', 3);

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '问题编号',
  `productId` int(255) NULL DEFAULT NULL COMMENT '产品编号',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题内容',
  `solve` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题解答',
  `solveTime` datetime(0) NULL DEFAULT NULL COMMENT '解答时间',
  `url1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实物图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES (1, 3, 1, '烂得有点快呀', '这是正常情况', '2020-11-07 19:21:41', '');
INSERT INTO `problem` VALUES (2, 3, 2, '物流有点慢呀', NULL, NULL, NULL);
INSERT INTO `problem` VALUES (5, 6, 2, '一箱里面有多少', NULL, NULL, '/test1_war_exploded\\resource\\ueditor\\upload\\9f302960386811eb17c43d25625f497b67010409_p0.png');
INSERT INTO `problem` VALUES (4, 3, 1, '发货怎么这么慢，能不能快点', '这是快递原因，我们也没有办法，很抱歉，亲。', '2020-12-05 14:57:44', '/test1_war_exploded\\resource\\ueditor\\upload\\1a0de330360b11eba3856db042375ccb2.jpg');
INSERT INTO `problem` VALUES (8, 22, 2, '保质期有多久', NULL, NULL, '/test1_war_exploded\\resource\\ueditor\\upload\\b7f38210386a11eb2667cc2ea30f11a6wallhaven-52809.png');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `pguishu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品产地',
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市场价格',
  `zk` int(11) NULL DEFAULT NULL COMMENT '折扣',
  `scNum` int(11) NULL DEFAULT NULL COMMENT '收藏数',
  `gmNum` int(11) NULL DEFAULT NULL COMMENT '购买数',
  `psum` int(255) NULL DEFAULT NULL COMMENT '产品数量',
  `cplbOne` int(11) NULL DEFAULT NULL COMMENT '产品所属类别',
  `cplbTwo` int(11) NULL DEFAULT NULL COMMENT '产品所属二级类别',
  `url1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图',
  `url2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附图',
  `url3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附图',
  `url4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附图',
  `url5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附图',
  `ms` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品描述',
  `pstate` int(1) NULL DEFAULT NULL COMMENT '产品状态  0上架/1下架',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '山西运城新鲜水果苹果红富士', NULL, '54.9', 9, 2, 7, 97, 7, 8, '\\test1_war_exploded\\resource\\ueditor\\upload\\9f0296902c2111e865b6dc2da7582a7aTB19p5HeKuSBuNjSsziXXbq8pXa_!!0-item_pic.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\9f030bc02c2111e865b6dc2da7582a7aTB19p5HeKuSBuNjSsziXXbq8pXa_!!0-item_pic.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\9f030bc02c2111e865b6dc2da7582a7aTB19p5HeKuSBuNjSsziXXbq8pXa_!!0-item_pic.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\9f0667202c2111e865b6dc2da7582a7aTB2faFrcFGWBuNjy0FbXXb4sXXa_!!3320501499.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\9f06dc502c2111e865b6dc2da7582a7aTB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/upload/3ca705602c1e11e865b6dc2da7582a7a1.jpg\" title=\"\" alt=\"1.jpg\"/></p>', 0);
INSERT INTO `product` VALUES (2, '黄河古道安徽砀山红富士 丑苹果 不打蜡，无农药', NULL, '66.5', 9, 1, 8, 100, 7, 8, '\\test1_war_exploded\\resource\\ueditor\\upload\\ba329bc02c1e11e865b6dc2da7582a7a811f5031-87ab-4a55-bfd2-3e29a5eb0ad7.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\ba3310f02c1e11e865b6dc2da7582a7a6431e0f4-1f60-465b-906e-25ea52bd076b.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\ba3386202c1e11e865b6dc2da7582a7ae13bedb5-c6c1-47f2-8588-5735397f0dea (1).jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\ba33d4402c1e11e865b6dc2da7582a7ae13bedb5-c6c1-47f2-8588-5735397f0dea.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\ba3449702c1e11e865b6dc2da7582a7ae37c45cf-fcea-4cb1-8b4e-c7ead141c76d.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/a730e2c02c1e11e865b6dc2da7582a7a1.jpg\" title=\"\" alt=\"1.jpg\"/></p><p><img src=\"/test1_war_exploded/resource/ueditor/a93984002c1e11e865b6dc2da7582a7a2.png\" title=\"\" alt=\"2.png\"/></p><p><br/></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/ab62cca02c1e11e865b6dc2da7582a7a3.jpg\" title=\"\" alt=\"3.jpg\"/></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/ad2368602c1e11e865b6dc2da7582a7a4.png\" title=\"\" alt=\"4.png\"/></p>', 0);
INSERT INTO `product` VALUES (3, '2017山东新鲜秦冠苹果', NULL, '49.9', 8, 1, 5, 95, 7, 10, '\\test1_war_exploded\\resource\\ueditor\\upload\\2cb2e5102c1f11e865b6dc2da7582a7a5f5bfef1-1183-4c8a-80f5-23a8251422eb.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\2cb333302c1f11e865b6dc2da7582a7a49e3c13e-5e8c-4c4a-8382-0721d61ae630.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\2cb3a8602c1f11e865b6dc2da7582a7adbbbca07-7c2d-4ecb-a1e3-097620517400.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\2cb41d902c1f11e865b6dc2da7582a7ae798f106-7f85-43f8-82d0-7a1918bd5876.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\2cb46bb02c1f11e865b6dc2da7582a7adbbbca07-7c2d-4ecb-a1e3-097620517400.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/29418c102c1f11e865b6dc2da7582a7a1.jpg\" title=\"\" alt=\"1.jpg\"/></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/2bb683b02c1f11e865b6dc2da7582a7a2.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 0);
INSERT INTO `product` VALUES (4, '陕西新鲜石榴现摘时令水果贵妃大石榴农家特产薄皮酸石榴', NULL, '85', 9, 1, 4, 99, 3, 4, '\\test1_war_exploded\\resource\\ueditor\\upload\\d9a752b02c1f11e865b6dc2da7582a7aTB1pC88XOCYBuNkSnaVXXcMsVXa_!!0-item_pic.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\d9a7eef02c1f11e865b6dc2da7582a7aTB2dP17arGYBuNjy0FoXXciBFXa_!!2455418594.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\d9a864202c1f11e865b6dc2da7582a7aTB2TmdedPgy_uJjSZLeXXaPlFXa_!!2455418594.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\d9a8b2402c1f11e865b6dc2da7582a7aTB2dP17arGYBuNjy0FoXXciBFXa_!!2455418594.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\d9aad5202c1f11e865b6dc2da7582a7aTB2TmdedPgy_uJjSZLeXXaPlFXa_!!2455418594.jpg_430x430q90.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/upload/d89212202c1f11e865b6dc2da7582a7aTB2TmdedPgy_uJjSZLeXXaPlFXa_!!2455418594.jpg_430x430q90.jpg\" title=\"\"/></p>', 0);
INSERT INTO `product` VALUES (5, '【现货】蒙自甜石榴云南特产薄皮 新鲜水果9个装 单果4.5两左右', NULL, '36', 7, 0, 0, 200, 3, 4, '\\test1_war_exploded\\resource\\ueditor\\upload\\23dc83f02c2011e865b6dc2da7582a7aTB2A3FzXRLzQeBjSZFoXXc5gFXa_!!2455185564.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\23dcf9202c2011e865b6dc2da7582a7aTB2iwNJX8PzQeBjSZPiXXb0TpXa_!!2455185564.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\23dd95602c2011e865b6dc2da7582a7aTB2MpRlaqnyQeBjSsplXXaLWVXa_!!2455185564.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\23de0a902c2011e865b6dc2da7582a7aTB11gurg63z9KJjy0FmXXXiwXXa_!!0-item_pic.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\23de7fc02c2011e865b6dc2da7582a7aTB2MpRlaqnyQeBjSsplXXaLWVXa_!!2455185564.jpg_430x430q90.jpg', '<p>品牌名称：<span class=\"J_EbrandLogo\" style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51);\">绿养道</span></p><p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153); font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px; font-variant-numeric: normal; font-variant-east-asian: normal; white-space: normal; widows: 1; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>厂名：绿养道农产品产销合作社</p></li><li><p>厂址：云南蒙自攀枝村花石榴园</p></li><li><p>厂家联系方式：13521676858</p></li><li><p>保质期：60 天</p></li><li><p>净含量:&nbsp;1900g</p></li><li><p>包装方式:&nbsp;包装</p></li><li><p>品牌:&nbsp;绿养道</p></li><li><p>售卖方式:&nbsp;单品</p></li><li><p>生鲜储存温度:&nbsp;8-15℃</p></li><li><p>热卖时间:&nbsp;1月&nbsp;2月&nbsp;8月&nbsp;9月&nbsp;10月&nbsp;11月&nbsp;12月</p></li><li><p>产地:&nbsp;中国大陆</p></li><li><p>省份:&nbsp;云南省</p></li><li><p>城市:&nbsp;红河哈尼族彝族自治州</p></li><li><p>特产品类:&nbsp;蒙自石榴</p></li><li><p>净含量:&nbsp;2.5kg(含）-5kg(不含)</p></li><li><p>价格:&nbsp;51-100元</p></li></ul><p><br/></p>', 0);
INSERT INTO `product` VALUES (6, '现货突尼斯软籽石榴2个超大果软子甜酸石榴新鲜水果非蒙自石榴', NULL, '99', 9, 0, 16, 44, 3, 4, '\\test1_war_exploded\\resource\\ueditor\\upload\\92cc7a902c2011e865b6dc2da7582a7aTB1a7xUdUR1BeNjy0FmXXb0wVXa_!!0-item_pic.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\92ccefc02c2011e865b6dc2da7582a7aTB2GV6ld7fb_uJjSsD4XXaqiFXa_!!3206065077.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\92cd8c002c2011e865b6dc2da7582a7aTB2J81_nf2H8KJjy0FcXXaDlFXa_!!3206065077.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\92ce01302c2011e865b6dc2da7582a7aTB2oM1InmYH8KJjSspdXXcRgVXa_!!3206065077.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\92ce76602c2011e865b6dc2da7582a7aTB29bjrngLD8KJjSszeXXaGRpXa_!!3206065077.jpg_430x430q90.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/upload/8bbe4bc02c2011e865b6dc2da7582a7a1.jpg\" title=\"\" alt=\"1.jpg\"/><img src=\"/test1_war_exploded/resource/ueditor/upload/8d8947c02c2011e865b6dc2da7582a7a2.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/8fd310b02c2011e865b6dc2da7582a7a77.jpg\" title=\"\" alt=\"77.jpg\"/></p>', 0);
INSERT INTO `product` VALUES (7, '荥阳突尼斯陈氏河阴软籽石榴软子新鲜水果非会理蒙自临潼甜新鲜', NULL, '80', 9, 1, 0, 25, 3, 4, '\\test1_war_exploded\\resource\\ueditor\\upload\\dcb3b2e02c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\dcb6e7302c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\dcb75c602c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\dcb7d1902c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\dcb86dd02c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/upload/dbbc33802c2011e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg\" title=\"\" alt=\"TB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg\"/></p>', 0);
INSERT INTO `product` VALUES (8, '正宗陕西红心石榴水果新鲜', NULL, '85', 9, 0, 4, 500, 3, 4, '\\test1_war_exploded\\resource\\ueditor\\upload\\012eb0202c2111e865b6dc2da7582a7aTB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\012f25502c2111e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\012fc1902c2111e865b6dc2da7582a7aTB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\013036c02c2111e865b6dc2da7582a7aTB2VP8VmjuhSKJjSspaXXXFgFXa_!!3363047546.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\0130abf02c2111e865b6dc2da7582a7aTB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/upload/004f73b02c2111e865b6dc2da7582a7aTB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg\" title=\"\" alt=\"TB23TvclwoQMeJjy1XaXXcSsFXa_!!3296167834.jpg_430x430q90.jpg\"/></p>', 0);
INSERT INTO `product` VALUES (9, '新鲜油桃5斤 新鲜孕妇水果非水蜜桃黄桃毛桃子樱桃当季时令鲜果', NULL, '25', 9, 1, 8, 400, 5, 6, '\\test1_war_exploded\\resource\\ueditor\\upload\\4152abc02c2111e865b6dc2da7582a7aTB1sRNzXSMmBKNjSZTEXXasKpXa_!!0-item_pic.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\41536f102c2111e865b6dc2da7582a7aTB2d_RhaKuSBuNjy1XcXXcYjFXa_!!2102024380.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\41540b502c2111e865b6dc2da7582a7aTB1sRNzXSMmBKNjSZTEXXasKpXa_!!0-item_pic.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\415459702c2111e865b6dc2da7582a7aTB2d_RhaKuSBuNjy1XcXXcYjFXa_!!2102024380.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\4154cea02c2111e865b6dc2da7582a7aTB1sRNzXSMmBKNjSZTEXXasKpXa_!!0-item_pic.jpg_430x430q90.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/upload/407173802c2111e865b6dc2da7582a7aTB2d_RhaKuSBuNjy1XcXXcYjFXa_!!2102024380.jpg_430x430q90.jpg\" title=\"\" alt=\"TB2d_RhaKuSBuNjy1XcXXcYjFXa_!!2102024380.jpg_430x430q90.jpg\"/></p>', 0);
INSERT INTO `product` VALUES (10, '现摘3斤 桃子水蜜桃 新鲜水果包邮脆桃硬桃现货新摘桃子非油桃黄', NULL, '120', 5, 3, 8, 55, 5, 6, '\\test1_war_exploded\\resource\\ueditor\\upload\\88b583202c2111e865b6dc2da7582a7aTB2faFrcFGWBuNjy0FbXXb4sXXa_!!3320501499.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\88b5f8502c2111e865b6dc2da7582a7aTB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\88b66d802c2111e865b6dc2da7582a7aTB19p5HeKuSBuNjSsziXXbq8pXa_!!0-item_pic.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\88b6e2b02c2111e865b6dc2da7582a7aTB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg', '\\test1_war_exploded\\resource\\ueditor\\upload\\88b77ef02c2111e865b6dc2da7582a7aTB19p5HeKuSBuNjSsziXXbq8pXa_!!0-item_pic.jpg_430x430q90.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/upload/87d387902c2111e865b6dc2da7582a7aTB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg\" title=\"\" alt=\"TB2GaJWaYArBKNjSZFLXXc_dVXa_!!3320501499.jpg_430x430q90.jpg\"/></p>', 0);
INSERT INTO `product` VALUES (14, '外国香蕉', '外国', '2', 1, 0, 0, 100, 17, 22, '/test1_war_exploded\\resource\\ueditor\\upload\\92f009d01fd211ebdd559e835f5fb8b8wallhaven-388887.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\92f8bc601fd211ebdd559e835f5fb8b8wallhaven-391377.png', '/test1_war_exploded\\resource\\ueditor\\upload\\92f97fb01fd211ebdd559e835f5fb8b8wallhaven-393174.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\92f9f4e01fd211ebdd559e835f5fb8b8wallhaven-396313.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\92fa6a101fd211ebdd559e835f5fb8b8wallhaven-399838.jpg', '<p>外国香蕉描述</p>', 1);
INSERT INTO `product` VALUES (18, '外国香蕉as', '外国', '1', 1, 0, 0, 100, 17, 22, '/test1_war_exploded\\resource\\ueditor\\upload\\b99d77701fd211ebdd559e835f5fb8b8wallhaven-406342.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\b9a148001fd211ebdd559e835f5fb8b8wallhaven-407475.png', '/test1_war_exploded\\resource\\ueditor\\upload\\b9a232601fd211ebdd559e835f5fb8b8wallhaven-407479.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\b9a31cc01fd211ebdd559e835f5fb8b8wallhaven-409133.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\b9a7b0a01fd211ebdd559e835f5fb8b8wallhaven-411707.jpg', '<p>asd</p>', 1);
INSERT INTO `product` VALUES (21, '雪花梨赵县新鲜梨包邮雪梨水果新鲜当季梨子新鲜10雪梨整箱5斤9斤', '赵县', '69', 9, 2, 7, 493, 1, 25, '/test1_war_exploded\\resource\\ueditor\\upload\\140194d0384c11eb5467febf1a5077c4xuehua1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\140601a0384c11eb5467febf1a5077c4xuehua2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\140676d0384c11eb5467febf1a5077c4xuehua3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\1406ec00384c11eb5467febf1a5077c4xuehua4.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\14076130384c11eb5467febf1a5077c4xuehua5.jpg', '<p><span style=\"color: rgb(255, 0, 54); font-family: &quot;microsoft yahei&quot;; font-size: 14px; background-color: rgb(255, 255, 255);\">赵县雪花梨 煮水的梨子 冰糖雪梨 川贝雪梨</span></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/0abbc580384c11eb5467febf1a5077c4xuehua6.jpg\" title=\"\" alt=\"xuehua6.jpg\"/></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/116da380384c11eb5467febf1a5077c4xuehua7.jpg\" title=\"\" alt=\"xuehua7.jpg\"/></p>', 0);
INSERT INTO `product` VALUES (22, '正宗临海涌泉蜜桔新鲜水果蜜橘无核10斤装', '浙江台州黄岩', '98', 9, 1, 2, 198, 11, 12, '/test1_war_exploded\\resource\\ueditor\\upload\\8811eca0384f11eb5467febf1a5077c4shatang1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\8815e440384f11eb5467febf1a5077c4shatang2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\88163260384f11eb5467febf1a5077c4shatang3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\8816cea0384f11eb5467febf1a5077c4shatang4.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\88171cc0384f11eb5467febf1a5077c4shatang5.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/upload/48b363e0384f11eb5467febf1a5077c4shatang6.jpg\" title=\"\" alt=\"shatang6.jpg\"/></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/4ceacc00384f11eb5467febf1a5077c4shatang7.jpg\" title=\"\" alt=\"shatang7.jpg\"/></p>', 0);
INSERT INTO `product` VALUES (23, '正宗新疆库尔勒香梨全母梨特级新鲜梨子', '新疆库尔勒', '118', 4, 3, 19, 481, 1, 27, '/test1_war_exploded\\resource\\ueditor\\upload\\85d94a60390211ebf202d573a136d62ekuer1.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\85d9e6a0390211ebf202d573a136d62ekuer2.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\85da5bd0390211ebf202d573a136d62ekuer3.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\85de2c60390211ebf202d573a136d62ekuer4.jpg', '/test1_war_exploded\\resource\\ueditor\\upload\\85dec8a0390211ebf202d573a136d62ekuer5.jpg', '<p><img src=\"/test1_war_exploded/resource/ueditor/upload/7be7d1c0390211ebf202d573a136d62ekuer6.png\" title=\"\" alt=\"kuer6.png\"/></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/80b6bef0390211ebf202d573a136d62ekuer7.jpg\" title=\"\" alt=\"kuer7.jpg\"/></p><p><img src=\"/test1_war_exploded/resource/ueditor/upload/848c30f0390211ebf202d573a136d62ekuer8.jpg\" title=\"\" alt=\"kuer8.jpg\"/></p>', 0);

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `productId` int(11) NULL DEFAULT NULL COMMENT '商品编号',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `isDelete` int(11) NULL DEFAULT NULL COMMENT '状态  0：在  1：消除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES (1, 1, 3, 0);
INSERT INTO `sc` VALUES (2, 2, 3, 0);
INSERT INTO `sc` VALUES (6, 10, 1, 0);
INSERT INTO `sc` VALUES (7, 4, 1, 0);
INSERT INTO `sc` VALUES (8, 22, 2, 0);
INSERT INTO `sc` VALUES (9, 23, 7, 0);
INSERT INTO `sc` VALUES (10, 21, 2, 0);
INSERT INTO `sc` VALUES (13, 23, 2, 0);
INSERT INTO `sc` VALUES (14, 9, 2, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '会员编号',
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名称',
  `upass` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `ustate` int(255) NOT NULL COMMENT '会员状态  0为允许、1为禁止',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员邮箱',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `uid` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `utel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员电话',
  `usex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员性别',
  `addressId` int(11) NULL DEFAULT NULL COMMENT '收货地址id',
  `zctime` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `lasttime` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'ysy', 'ysy', 0, '12@qq.com', '杨士永', '339005199808145871', '17815941368', '男', 1, '2020-11-04 00:00:00', '2020-12-09 15:04:22');
INSERT INTO `user` VALUES (2, 'hcq', 'hcq', 0, '21@qq.com', '何超群', '987654321123654789', '85236974123', '男', 2, '2020-11-03 00:00:00', '2020-12-13 20:57:59');
INSERT INTO `user` VALUES (7, 'ljw', '1786221170lou.', 0, '1950504650@qq.com', '楼坚伟', '339005199809248711', '13645810883', '男', NULL, '2020-12-08 00:00:00', '2020-12-08 10:57:27');
INSERT INTO `user` VALUES (3, 'wxj', 'wxj', 0, '123456789@qq.com', '王鑫江', '123569874563214581', '12533656485', '男', NULL, '2020-11-06 10:11:57', NULL);
INSERT INTO `user` VALUES (4, 'lj', 'lj', 0, '524862542@qq.com', '李杰', '585695412365844595', '45569625662', '男', NULL, '2020-11-03 10:12:34', NULL);
INSERT INTO `user` VALUES (5, 'wh', '1786221170lou.', 0, '111@qq.com', NULL, NULL, '13645810883', NULL, NULL, '2020-11-13 00:00:00', '2020-11-16 11:54:04');
INSERT INTO `user` VALUES (9, '123', '', 0, '', NULL, NULL, '', NULL, NULL, '2020-12-09 15:32:06', NULL);
INSERT INTO `user` VALUES (10, '123', '1786221170lou.', 0, '12@qq.com', NULL, NULL, '13645810883', NULL, NULL, '2020-12-09 00:00:00', '2020-12-09 16:04:37');

SET FOREIGN_KEY_CHECKS = 1;
