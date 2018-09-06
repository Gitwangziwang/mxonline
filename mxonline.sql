/*
 Navicat Premium Data Transfer

 Source Server         : djangostart
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : mxonline

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 23/08/2018 23:51:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (9, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (10, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (14, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (15, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add Bookmark', 7, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (26, 'Can change Bookmark', 7, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (27, 'Can delete Bookmark', 7, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (28, 'Can add User Setting', 8, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (29, 'Can change User Setting', 8, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (30, 'Can delete User Setting', 8, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (31, 'Can add User Widget', 9, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (32, 'Can change User Widget', 9, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (33, 'Can delete User Widget', 9, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (34, 'Can add log entry', 10, 'add_log');
INSERT INTO `auth_permission` VALUES (35, 'Can change log entry', 10, 'change_log');
INSERT INTO `auth_permission` VALUES (36, 'Can delete log entry', 10, 'delete_log');
INSERT INTO `auth_permission` VALUES (37, 'Can view Bookmark', 7, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (38, 'Can view log entry', 10, 'view_log');
INSERT INTO `auth_permission` VALUES (39, 'Can view User Setting', 8, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (40, 'Can view User Widget', 9, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (41, 'Can add 用户信息', 11, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (42, 'Can change 用户信息', 11, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 用户信息', 11, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (44, 'Can add 邮箱验证码', 12, 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (45, 'Can change 邮箱验证码', 12, 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (46, 'Can delete 邮箱验证码', 12, 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (47, 'Can add 轮播图', 13, 'add_banner');
INSERT INTO `auth_permission` VALUES (48, 'Can change 轮播图', 13, 'change_banner');
INSERT INTO `auth_permission` VALUES (49, 'Can delete 轮播图', 13, 'delete_banner');
INSERT INTO `auth_permission` VALUES (50, 'Can view 轮播图', 13, 'view_banner');
INSERT INTO `auth_permission` VALUES (51, 'Can view 邮箱验证码', 12, 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (52, 'Can view 用户信息', 11, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (53, 'Can add 课程', 14, 'add_course');
INSERT INTO `auth_permission` VALUES (54, 'Can change 课程', 14, 'change_course');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 课程', 14, 'delete_course');
INSERT INTO `auth_permission` VALUES (56, 'Can add 章节', 15, 'add_lesson');
INSERT INTO `auth_permission` VALUES (57, 'Can change 章节', 15, 'change_lesson');
INSERT INTO `auth_permission` VALUES (58, 'Can delete 章节', 15, 'delete_lesson');
INSERT INTO `auth_permission` VALUES (59, 'Can add 视频', 16, 'add_video');
INSERT INTO `auth_permission` VALUES (60, 'Can change 视频', 16, 'change_video');
INSERT INTO `auth_permission` VALUES (61, 'Can delete 视频', 16, 'delete_video');
INSERT INTO `auth_permission` VALUES (62, 'Can add 课程资源', 17, 'add_courseresourse');
INSERT INTO `auth_permission` VALUES (63, 'Can change 课程资源', 17, 'change_courseresourse');
INSERT INTO `auth_permission` VALUES (64, 'Can delete 课程资源', 17, 'delete_courseresourse');
INSERT INTO `auth_permission` VALUES (65, 'Can view 课程', 14, 'view_course');
INSERT INTO `auth_permission` VALUES (66, 'Can view 课程资源', 17, 'view_courseresourse');
INSERT INTO `auth_permission` VALUES (67, 'Can view 章节', 15, 'view_lesson');
INSERT INTO `auth_permission` VALUES (68, 'Can view 视频', 16, 'view_video');
INSERT INTO `auth_permission` VALUES (69, 'Can add 用户咨询', 18, 'add_userask');
INSERT INTO `auth_permission` VALUES (70, 'Can change 用户咨询', 18, 'change_userask');
INSERT INTO `auth_permission` VALUES (71, 'Can delete 用户咨询', 18, 'delete_userask');
INSERT INTO `auth_permission` VALUES (72, 'Can add 课程评论', 19, 'add_coursecomment');
INSERT INTO `auth_permission` VALUES (73, 'Can change 课程评论', 19, 'change_coursecomment');
INSERT INTO `auth_permission` VALUES (74, 'Can delete 课程评论', 19, 'delete_coursecomment');
INSERT INTO `auth_permission` VALUES (75, 'Can add 用户收藏', 20, 'add_userfavorite');
INSERT INTO `auth_permission` VALUES (76, 'Can change 用户收藏', 20, 'change_userfavorite');
INSERT INTO `auth_permission` VALUES (77, 'Can delete 用户收藏', 20, 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES (78, 'Can add 用户消息', 21, 'add_usermessage');
INSERT INTO `auth_permission` VALUES (79, 'Can change 用户消息', 21, 'change_usermessage');
INSERT INTO `auth_permission` VALUES (80, 'Can delete 用户消息', 21, 'delete_usermessage');
INSERT INTO `auth_permission` VALUES (81, 'Can add 用户课程', 22, 'add_usercourse');
INSERT INTO `auth_permission` VALUES (82, 'Can change 用户课程', 22, 'change_usercourse');
INSERT INTO `auth_permission` VALUES (83, 'Can delete 用户课程', 22, 'delete_usercourse');
INSERT INTO `auth_permission` VALUES (84, 'Can view 课程评论', 19, 'view_coursecomment');
INSERT INTO `auth_permission` VALUES (85, 'Can view 用户咨询', 18, 'view_userask');
INSERT INTO `auth_permission` VALUES (86, 'Can view 用户课程', 22, 'view_usercourse');
INSERT INTO `auth_permission` VALUES (87, 'Can view 用户收藏', 20, 'view_userfavorite');
INSERT INTO `auth_permission` VALUES (88, 'Can view 用户消息', 21, 'view_usermessage');
INSERT INTO `auth_permission` VALUES (89, 'Can add 城市', 23, 'add_citydict');
INSERT INTO `auth_permission` VALUES (90, 'Can change 城市', 23, 'change_citydict');
INSERT INTO `auth_permission` VALUES (91, 'Can delete 城市', 23, 'delete_citydict');
INSERT INTO `auth_permission` VALUES (92, 'Can add 课程机构', 24, 'add_courseorg');
INSERT INTO `auth_permission` VALUES (93, 'Can change 课程机构', 24, 'change_courseorg');
INSERT INTO `auth_permission` VALUES (94, 'Can delete 课程机构', 24, 'delete_courseorg');
INSERT INTO `auth_permission` VALUES (95, 'Can add 教师', 25, 'add_teacher');
INSERT INTO `auth_permission` VALUES (96, 'Can change 教师', 25, 'change_teacher');
INSERT INTO `auth_permission` VALUES (97, 'Can delete 教师', 25, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (98, 'Can view 城市', 23, 'view_citydict');
INSERT INTO `auth_permission` VALUES (99, 'Can view 课程机构', 24, 'view_courseorg');
INSERT INTO `auth_permission` VALUES (100, 'Can view 教师', 25, 'view_teacher');
INSERT INTO `auth_permission` VALUES (101, 'Can add captcha store', 26, 'add_captchastore');
INSERT INTO `auth_permission` VALUES (102, 'Can change captcha store', 26, 'change_captchastore');
INSERT INTO `auth_permission` VALUES (103, 'Can delete captcha store', 26, 'delete_captchastore');
INSERT INTO `auth_permission` VALUES (104, 'Can view captcha store', 26, 'view_captchastore');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$24000$vtSd9DgNbQuX$0Gk0pNMZBFw9ga8p6Lk0hW6he1GMCm1+I8jPvjFGc+o=', '2018-08-14 19:37:40.434064', 1, 'wangzi', '', '', '1@1.com', 1, 1, '2018-08-14 19:37:33.211245');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `response` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hashkey` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hashkey`(`hashkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES (89, 'TFBI', 'tfbi', '5e70190545a81dfdff42360ad239de292b601abd', '2018-08-18 12:30:18.068505');
INSERT INTO `captcha_captchastore` VALUES (91, 'OBTV', 'obtv', '54273aedd05b1645d7fdb4b19bfd5c57fb5c20cf', '2018-08-18 12:34:53.411710');
INSERT INTO `captcha_captchastore` VALUES (92, 'JHVF', 'jhvf', '6c9c7d47f8d58b4be9738196585fa5358f3e784f', '2018-08-18 12:34:58.313540');
INSERT INTO `captcha_captchastore` VALUES (93, 'DEGO', 'dego', '4ec37e2241df7458cb02db62a22b9ef5a4b088b0', '2018-08-18 13:01:34.123275');
INSERT INTO `captcha_captchastore` VALUES (94, 'QSDI', 'qsdi', '2c9fa1a610bba8543094d1b4de45bfcc44c23e5c', '2018-08-18 13:50:57.274113');
INSERT INTO `captcha_captchastore` VALUES (95, 'HANR', 'hanr', '7b42867f61cfc486dc3c9c3356d202494705b805', '2018-08-18 13:52:09.957385');

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `degree` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `learn_times` int(11) NOT NULL,
  `student` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) NULL DEFAULT NULL,
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tercher_id` int(11) NULL DEFAULT NULL,
  `teacher_tell_you` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `you_need_know` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_course_11456c5a`(`course_org_id`) USING BTREE,
  INDEX `courses_course_1861cd5c`(`tercher_id`) USING BTREE,
  CONSTRAINT `courses_cour_course_org_id_4d2c4aab_fk_organization_courseorg_id` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `courses_course_tercher_id_8f3008b2_fk_organization_teacher_id` FOREIGN KEY (`tercher_id`) REFERENCES `organization_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES (1, 'python入门', 'python入门基础', '主要介绍讲解了python语言的基础知识和基本用法。', 'cj', 0, 0, 0, 'courses/20180819/python.jpg', 0, '2018-08-19 23:08:00.000000', 3, '后端开发', 'python', NULL, '', '');
INSERT INTO `courses_course` VALUES (2, 'java进阶', 'java进阶教程', '主要介绍了java语言的进阶开发，属于中等难度课程。', 'zj', 0, 0, 0, 'courses/20180819/java.jpg', 0, '2018-08-19 23:55:00.000000', 2, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (3, 'mysql教程', 'mysql高级教程', '主要介绍了mysql数据库的高级开发，属于高级难度课程。', 'gj', 0, 8, 0, 'courses/20180819/mysql.jpg', 3, '2018-08-19 23:56:00.000000', 1, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (4, 'HTML基础', 'HTML基础课程', '该课程介绍了HTML的基础知识，属于初级课程。', 'cj', 0, 0, 0, 'courses/20180822/gx.png', 0, '2018-08-22 18:44:00.000000', 4, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (5, 'Django基础', 'Django基础课程', '该课程介绍了Django 的基础知识，值得大家学习。', 'zj', 0, 5, 0, 'courses/20180822/module1_2.jpg', 4, '2018-08-22 18:46:00.000000', 5, '后端开发', '', NULL, '', '');
INSERT INTO `courses_course` VALUES (6, 'CSS基础', 'CSS基础知识', '该课程介绍了CSS的基础知识，是个很不错的课程。', 'gj', 0, 6, 0, 'courses/20180822/banner.jpg', 58, '2018-08-22 18:48:00.000000', 7, '后端开发', 'python', 4, '学完之后收获很大，请认真学习。', 'css基础很重要');

-- ----------------------------
-- Table structure for courses_courseresourse
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresourse`;
CREATE TABLE `courses_courseresourse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `download` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_courseresourse_course_id_15e41486_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_courseresourse_course_id_15e41486_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_courseresourse
-- ----------------------------
INSERT INTO `courses_courseresourse` VALUES (1, '前端资源', 'course/resoure/20180823/course-video.html', '2018-08-23 20:57:00.000000', 6);
INSERT INTO `courses_courseresourse` VALUES (3, '资料２', 'course/resoure/20180823/mysql.jpg', '2018-08-23 21:06:00.000000', 6);
INSERT INTO `courses_courseresourse` VALUES (4, '资料３', 'course/resoure/20180823/网站图片.zip', '2018-08-23 21:20:00.000000', 6);

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_lesson_course_id_16bc4882_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES (1, '第一章　基础知识', '2018-08-23 20:16:00.000000', 6);
INSERT INTO `courses_lesson` VALUES (2, '第二章　进阶开发', '2018-08-23 20:17:00.000000', 6);

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_video_lesson_id_59f2396e_fk_courses_lesson_id`(`lesson_id`) USING BTREE,
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES (1, '2.1 进阶开发详细视频', '2018-08-23 20:17:00.000000', 2, 'http://www.imooc.com/video/1430', 53);
INSERT INTO `courses_video` VALUES (2, '1.1 基础知识详细视频', '2018-08-23 20:19:00.000000', 1, 'http://www.imooc.com/video/1430', 54);
INSERT INTO `courses_video` VALUES (3, '1.2 基础知识详细视频（２）', '2018-08-23 20:24:00.000000', 1, 'http://www.imooc.com/video/1430', 43);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (26, 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (14, 'courses', 'course');
INSERT INTO `django_content_type` VALUES (17, 'courses', 'courseresourse');
INSERT INTO `django_content_type` VALUES (15, 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES (16, 'courses', 'video');
INSERT INTO `django_content_type` VALUES (19, 'operation', 'coursecomment');
INSERT INTO `django_content_type` VALUES (18, 'operation', 'userask');
INSERT INTO `django_content_type` VALUES (22, 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES (20, 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES (21, 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES (23, 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES (24, 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES (25, 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (13, 'users', 'banner');
INSERT INTO `django_content_type` VALUES (12, 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES (11, 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES (7, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (10, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (8, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (9, 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-08-14 19:35:09.487346');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2018-08-14 19:35:09.839603');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2018-08-14 19:35:09.931996');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2018-08-14 19:35:09.950406');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2018-08-14 19:35:10.031014');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2018-08-14 19:35:10.082459');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0003_alter_user_email_max_length', '2018-08-14 19:35:10.119762');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0004_alter_user_username_opts', '2018-08-14 19:35:10.130854');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0005_alter_user_last_login_null', '2018-08-14 19:35:10.162247');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0006_require_contenttypes_0002', '2018-08-14 19:35:10.165758');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2018-08-14 19:35:10.178854');
INSERT INTO `django_migrations` VALUES (12, 'sessions', '0001_initial', '2018-08-14 19:35:10.206510');
INSERT INTO `django_migrations` VALUES (13, 'xadmin', '0001_initial', '2018-08-14 19:35:10.398000');
INSERT INTO `django_migrations` VALUES (14, 'xadmin', '0002_log', '2018-08-14 19:35:10.475875');
INSERT INTO `django_migrations` VALUES (15, 'xadmin', '0003_auto_20160715_0100', '2018-08-14 19:35:10.525451');
INSERT INTO `django_migrations` VALUES (16, 'users', '0001_initial', '2018-08-14 20:39:29.911482');
INSERT INTO `django_migrations` VALUES (17, 'courses', '0001_initial', '2018-08-14 20:39:30.072831');
INSERT INTO `django_migrations` VALUES (18, 'operation', '0001_initial', '2018-08-14 20:39:30.156753');
INSERT INTO `django_migrations` VALUES (19, 'operation', '0002_auto_20180814_2039', '2018-08-14 20:39:30.503698');
INSERT INTO `django_migrations` VALUES (20, 'organization', '0001_initial', '2018-08-14 20:39:30.605025');
INSERT INTO `django_migrations` VALUES (21, 'users', '0002_auto_20180814_2048', '2018-08-14 20:48:12.476212');
INSERT INTO `django_migrations` VALUES (22, 'captcha', '0001_initial', '2018-08-16 22:18:31.502610');
INSERT INTO `django_migrations` VALUES (23, 'courses', '0002_course_course_org', '2018-08-20 19:15:32.719673');
INSERT INTO `django_migrations` VALUES (24, 'organization', '0002_teacher_image', '2018-08-20 21:33:47.735918');
INSERT INTO `django_migrations` VALUES (25, 'courses', '0003_course_category', '2018-08-22 22:31:00.810129');
INSERT INTO `django_migrations` VALUES (26, 'users', '0003_auto_20180822_2326', '2018-08-22 23:26:34.676186');
INSERT INTO `django_migrations` VALUES (27, 'courses', '0004_course_tag', '2018-08-23 18:44:10.459698');
INSERT INTO `django_migrations` VALUES (28, 'courses', '0005_video_url', '2018-08-23 20:21:30.924519');
INSERT INTO `django_migrations` VALUES (29, 'courses', '0006_video_learn_times', '2018-08-23 20:48:00.657735');
INSERT INTO `django_migrations` VALUES (30, 'courses', '0007_course_tercher', '2018-08-23 21:31:38.603856');
INSERT INTO `django_migrations` VALUES (31, 'courses', '0008_auto_20180823_2140', '2018-08-23 21:41:01.595703');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_de54fa62`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('313yhru371b1h8bmgd8qq4hne1lb1gfy', 'YTA4YWVmM2YwOTg5MTZjNmZhMDRiODkyZGE2OTYzNDk4NmQxNjZmNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRlZjZkMmE3ZTNlYzkyN2M1MjM4ZTUyODFmZjAwMGJhZDdlMjg2N2QiLCJMSVNUX1FVRVJZIjpbWyJvcmdhbml6YXRpb24iLCJjb3Vyc2VvcmciXSwiIl19', '2018-09-01 17:17:30.618055');
INSERT INTO `django_session` VALUES ('3y1klfc7rzhf4ah8fd56uzr15k4bqvqh', 'ZGM3NWE1YjhkYjAzNGIxOGY4YjBhZGE3MGYyM2RlYWQzZDZlNDcyYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZWY2ZDJhN2UzZWM5MjdjNTIzOGU1MjgxZmYwMDBiYWQ3ZTI4NjdkIn0=', '2018-08-29 22:02:16.284247');
INSERT INTO `django_session` VALUES ('7nfw27w2dg28ce9dr9d93q6lgxb3yi23', 'MjA2ZDkzNDYyYWZhY2QxOWMwYWQzNjA3NzYzNzRmNjhiNjhmYmY5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZWY2ZDJhN2UzZWM5MjdjNTIzOGU1MjgxZmYwMDBiYWQ3ZTI4NjdkIiwiTElTVF9RVUVSWSI6W1siYXV0aCIsInBlcm1pc3Npb24iXSwiIl19', '2018-08-28 22:28:09.212396');
INSERT INTO `django_session` VALUES ('b0eb822ith5vjrpkuh4e327d2yn3ql6m', 'ZWZlYjA1NWI5MmY4Nzk3ZDI5MjgxNTM3MzFjYzRmYWVmNDVlMjg5YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRlZjZkMmE3ZTNlYzkyN2M1MjM4ZTUyODFmZjAwMGJhZDdlMjg2N2QiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==', '2018-09-06 21:42:15.551344');
INSERT INTO `django_session` VALUES ('s5ivo55j9n4tr26rwh6m78l1haoxu9ir', 'ZWZlYjA1NWI5MmY4Nzk3ZDI5MjgxNTM3MzFjYzRmYWVmNDVlMjg5YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRlZjZkMmE3ZTNlYzkyN2M1MjM4ZTUyODFmZjAwMGJhZDdlMjg2N2QiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==', '2018-09-03 20:48:57.063758');

-- ----------------------------
-- Table structure for operation_coursecomment
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomment`;
CREATE TABLE `operation_coursecomment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_coursecomment_ea134da7`(`course_id`) USING BTREE,
  INDEX `operation_coursecomment_e8701ad4`(`user_id`) USING BTREE,
  CONSTRAINT `operation_coursecomment_course_id_ae7551b0_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_coursecomment_user_id_8f3ff0f8_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------
INSERT INTO `operation_userask` VALUES (2, '王子', '15986763507', 'django', '2018-08-19 20:45:54.406106');
INSERT INTO `operation_userask` VALUES (3, '哈哈', '15575877421', 'python', '2018-08-19 21:16:04.203599');

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_usercourse_ea134da7`(`course_id`) USING BTREE,
  INDEX `operation_usercourse_e8701ad4`(`user_id`) USING BTREE,
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES (1, '2018-08-22 23:29:00.000000', 6, 4);
INSERT INTO `operation_usercourse` VALUES (6, '2018-08-22 23:36:00.000000', 6, 1);

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_userfavorite_e8701ad4`(`user_id`) USING BTREE,
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES (10, 1, 2, '2018-08-21 23:16:41.887255', 1);
INSERT INTO `operation_userfavorite` VALUES (11, 2, 2, '2018-08-21 23:28:04.817826', 1);
INSERT INTO `operation_userfavorite` VALUES (12, 3, 2, '2018-08-21 23:28:33.655449', 1);
INSERT INTO `operation_userfavorite` VALUES (14, 6, 1, '2018-08-23 19:36:45.627946', 1);
INSERT INTO `operation_userfavorite` VALUES (15, 7, 2, '2018-08-23 19:36:46.507949', 1);

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES (1, '北京市', '北京市', '2018-08-18 16:33:00.000000');
INSERT INTO `organization_citydict` VALUES (2, '上海市', '上海市', '2018-08-18 16:35:00.000000');
INSERT INTO `organization_citydict` VALUES (3, '广州市', '广州市', '2018-08-18 16:36:00.000000');
INSERT INTO `organization_citydict` VALUES (4, '深圳市', '深圳市', '2018-08-18 16:41:00.000000');
INSERT INTO `organization_citydict` VALUES (5, '天津市', '天津市', '2018-08-18 16:41:00.000000');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `students` int(11) NOT NULL,
  `courses_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organization_course_city_id_4a842f85_fk_organization_citydict_id`(`city_id`) USING BTREE,
  CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES (1, '慕课网', '慕课网是垂直的互联网IT技能免费学习网站。', 'pxjg', 0, 'courses/20180818/imooc.png', 0, '北京市', 0, 0, '2018-08-18 16:55:00.000000', 1);
INSERT INTO `organization_courseorg` VALUES (2, '北京大学', '北京大学是个全国顶尖学校', 'gx', 0, 'courses/20180818/bjdx.jpg', 0, '北京市', 0, 0, '2018-08-18 17:02:00.000000', 1);
INSERT INTO `organization_courseorg` VALUES (3, '慕课网１', '慕课网是垂直的互联网IT技能免费学习网站。', 'pxjg', 0, 'courses/20180818/imooc_qEaMov1.png', 0, '上海市', 0, 0, '2018-08-18 17:05:00.000000', 2);
INSERT INTO `organization_courseorg` VALUES (4, '上海交通大学', '上海交通大学是全国排名靠前的好学校', 'gx', 0, 'courses/20180818/shjtdx.png', 3, '上海市', 0, 0, '2018-08-18 17:06:00.000000', 2);
INSERT INTO `organization_courseorg` VALUES (5, '慕课网２', '慕课网是垂直的互联网IT技能免费学习网站。', 'pxjg', 0, 'courses/20180818/imooc_V0TJOyb.png', 0, '天津市', 0, 0, '2018-08-18 17:09:00.000000', 5);
INSERT INTO `organization_courseorg` VALUES (6, '欧阳锋', '欧阳锋的个人培训', 'gr', 0, 'courses/20180818/oyf.png', 0, '天津市', 0, 0, '2018-08-18 17:10:00.000000', 5);
INSERT INTO `organization_courseorg` VALUES (7, '中山大学', '中山大学是985高校', 'gx', 0, 'courses/20180818/dsdx.png', 0, '广州市', 0, 0, '2018-08-18 17:12:00.000000', 3);
INSERT INTO `organization_courseorg` VALUES (8, '奥巴马', '奥巴马的个人培训', 'gr', 0, 'courses/20180818/aobama.png', 9, '广州市', 7, 4, '2018-08-18 17:15:00.000000', 3);
INSERT INTO `organization_courseorg` VALUES (9, '慕课网３', '慕课网是垂直的互联网IT技能免费学习网站。', 'pxjg', 4, 'courses/20180818/imooc_V0TJOyb_1rxkzIB.png', 7, '深圳市', 6, 5, '2018-08-18 17:16:00.000000', 4);
INSERT INTO `organization_courseorg` VALUES (10, '张无忌', '张无忌的个人培训', 'gr', 0, 'courses/20180818/zwj.png', 6, '深圳市', 4, 3, '2018-08-18 17:16:00.000000', 4);

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_year` int(11) NOT NULL,
  `work_company` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_position` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `points` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id`(`org_id`) USING BTREE,
  CONSTRAINT `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES (1, '马云', 5, '阿里巴巴', '董事长', '风趣幽默', 0, 0, '2018-08-19 22:58:00.000000', 1, 'teacher/20180820/my.jpg');
INSERT INTO `organization_teacher` VALUES (2, '李开复', 6, '创新工厂', '总经理', '严谨', 0, 0, '2018-08-19 22:59:00.000000', 2, 'teacher/20180820/compright.png');
INSERT INTO `organization_teacher` VALUES (3, '周杰伦', 3, '音乐公司', '歌手', '才华横溢', 0, 0, '2018-08-19 23:00:00.000000', 3, 'teacher/20180820/01.jpg');
INSERT INTO `organization_teacher` VALUES (4, '陈奕迅', 5, '音乐公司', '歌手', '搞笑幽默', 0, 0, '2018-08-19 23:01:00.000000', 4, 'teacher/20180820/02_mid.jpg');
INSERT INTO `organization_teacher` VALUES (5, '王健林', 9, '万达集团', '老板', '一丝不苟', 0, 0, '2018-08-19 23:02:00.000000', 5, 'teacher/20180820/fqy.png');
INSERT INTO `organization_teacher` VALUES (6, '欧阳锋', 4, '射雕英雄传', '西毒', '武功高强', 0, 0, '2018-08-19 23:03:00.000000', 6, 'teacher/20180820/oyf.png');
INSERT INTO `organization_teacher` VALUES (7, '靳东', 2, '影视公司', '演员', '认真严禁', 0, 0, '2018-08-19 23:04:00.000000', 7, 'teacher/20180820/02_small.jpg');
INSERT INTO `organization_teacher` VALUES (8, '奥巴马', 7, '美国', '总统', '因材施教', 0, 0, '2018-08-19 23:05:00.000000', 8, 'teacher/20180820/aobama.png');
INSERT INTO `organization_teacher` VALUES (9, '王凯', 2, '影视公司', '演员', '认真严禁', 0, 0, '2018-08-19 23:05:00.000000', 9, 'teacher/20180820/billcheck.png');
INSERT INTO `organization_teacher` VALUES (10, '张无忌', 4, '倚天屠龙记', '教主', '风流倜傥', 0, 0, '2018-08-19 23:06:00.000000', 10, 'teacher/20180820/zwj.png');

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES (1, 'jbE3NaaVBd2NdMIs', '1768628190@qq.com', 'register', '2018-08-17 20:16:30.978611');
INSERT INTO `users_emailverifyrecord` VALUES (2, 'OvuanGZsnSR9PSj0', '1768628190@qq.com', 'forget', '2018-08-18 11:07:05.879203');
INSERT INTO `users_emailverifyrecord` VALUES (3, 'zl9E1GaAJpVmMmit', '1768628190@qq.com', 'forget', '2018-08-18 11:45:09.163941');
INSERT INTO `users_emailverifyrecord` VALUES (4, 'ni9BzGKtodlvlUKE', '1768628190@qq.com', 'forget', '2018-08-18 12:00:00.358963');
INSERT INTO `users_emailverifyrecord` VALUES (5, 'EPDjk4JvnlKeNlhN', '1768628190@qq.com', 'register', '2018-08-18 12:11:50.321326');
INSERT INTO `users_emailverifyrecord` VALUES (6, 'WSC4639JPZ3nQGdY', '1768628190@qq.com', 'register', '2018-08-18 12:29:40.089989');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date NULL DEFAULT NULL,
  `gender` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES (1, 'pbkdf2_sha256$24000$6l4gjfeB4SBa$3zUgWIqN1z57OxEG4abnzQTfSylCl4LglkZ1tFvE5JY=', '2018-08-20 21:34:00.000000', 1, 'wzw', '', '', '1@1.com', 1, 1, '2018-08-14 20:50:00.000000', '王子', '2018-08-22', 'male', '深圳市', '15575877421', 'image/20180822/gx.png');
INSERT INTO `users_userprofile` VALUES (4, 'pbkdf2_sha256$24000$Q2SwjVlTFYcy$mkUamAHPE94OZuE5ZwrL9AR90MeQqiSdyZSNfYlglms=', '2018-08-18 14:07:00.000000', 0, '1768628190@qq.com', '', '', '1768628190@qq.com', 0, 1, '2018-08-18 12:27:00.000000', '恋恋风尘', '2018-08-22', 'male', '深圳市', '15575877421', 'image/20180822/aobama.png');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_groups_userprofile_id_823cf2fc_uniq`(`userprofile_id`, `group_id`) USING BTREE,
  INDEX `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_user_permissions_userprofile_id_d0215190_uniq`(`userprofile_id`, `permission_id`) USING BTREE,
  INDEX `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------
INSERT INTO `users_userprofile_user_permissions` VALUES (101, 1, 1);
INSERT INTO `users_userprofile_user_permissions` VALUES (102, 1, 2);
INSERT INTO `users_userprofile_user_permissions` VALUES (103, 1, 3);
INSERT INTO `users_userprofile_user_permissions` VALUES (104, 1, 4);
INSERT INTO `users_userprofile_user_permissions` VALUES (105, 1, 5);
INSERT INTO `users_userprofile_user_permissions` VALUES (106, 1, 6);
INSERT INTO `users_userprofile_user_permissions` VALUES (107, 1, 7);
INSERT INTO `users_userprofile_user_permissions` VALUES (108, 1, 8);
INSERT INTO `users_userprofile_user_permissions` VALUES (109, 1, 9);
INSERT INTO `users_userprofile_user_permissions` VALUES (110, 1, 10);
INSERT INTO `users_userprofile_user_permissions` VALUES (111, 1, 14);
INSERT INTO `users_userprofile_user_permissions` VALUES (112, 1, 15);
INSERT INTO `users_userprofile_user_permissions` VALUES (113, 1, 17);
INSERT INTO `users_userprofile_user_permissions` VALUES (114, 1, 18);
INSERT INTO `users_userprofile_user_permissions` VALUES (115, 1, 19);
INSERT INTO `users_userprofile_user_permissions` VALUES (116, 1, 20);
INSERT INTO `users_userprofile_user_permissions` VALUES (117, 1, 21);
INSERT INTO `users_userprofile_user_permissions` VALUES (118, 1, 22);
INSERT INTO `users_userprofile_user_permissions` VALUES (119, 1, 23);
INSERT INTO `users_userprofile_user_permissions` VALUES (120, 1, 24);
INSERT INTO `users_userprofile_user_permissions` VALUES (121, 1, 25);
INSERT INTO `users_userprofile_user_permissions` VALUES (122, 1, 26);
INSERT INTO `users_userprofile_user_permissions` VALUES (123, 1, 27);
INSERT INTO `users_userprofile_user_permissions` VALUES (124, 1, 28);
INSERT INTO `users_userprofile_user_permissions` VALUES (125, 1, 29);
INSERT INTO `users_userprofile_user_permissions` VALUES (126, 1, 30);
INSERT INTO `users_userprofile_user_permissions` VALUES (127, 1, 31);
INSERT INTO `users_userprofile_user_permissions` VALUES (128, 1, 32);
INSERT INTO `users_userprofile_user_permissions` VALUES (129, 1, 33);
INSERT INTO `users_userprofile_user_permissions` VALUES (130, 1, 34);
INSERT INTO `users_userprofile_user_permissions` VALUES (131, 1, 35);
INSERT INTO `users_userprofile_user_permissions` VALUES (132, 1, 36);
INSERT INTO `users_userprofile_user_permissions` VALUES (133, 1, 37);
INSERT INTO `users_userprofile_user_permissions` VALUES (134, 1, 38);
INSERT INTO `users_userprofile_user_permissions` VALUES (135, 1, 39);
INSERT INTO `users_userprofile_user_permissions` VALUES (136, 1, 40);
INSERT INTO `users_userprofile_user_permissions` VALUES (137, 1, 41);
INSERT INTO `users_userprofile_user_permissions` VALUES (138, 1, 42);
INSERT INTO `users_userprofile_user_permissions` VALUES (139, 1, 43);
INSERT INTO `users_userprofile_user_permissions` VALUES (140, 1, 44);
INSERT INTO `users_userprofile_user_permissions` VALUES (141, 1, 45);
INSERT INTO `users_userprofile_user_permissions` VALUES (142, 1, 46);
INSERT INTO `users_userprofile_user_permissions` VALUES (143, 1, 47);
INSERT INTO `users_userprofile_user_permissions` VALUES (144, 1, 48);
INSERT INTO `users_userprofile_user_permissions` VALUES (145, 1, 49);
INSERT INTO `users_userprofile_user_permissions` VALUES (146, 1, 50);
INSERT INTO `users_userprofile_user_permissions` VALUES (147, 1, 51);
INSERT INTO `users_userprofile_user_permissions` VALUES (148, 1, 52);
INSERT INTO `users_userprofile_user_permissions` VALUES (149, 1, 53);
INSERT INTO `users_userprofile_user_permissions` VALUES (150, 1, 54);
INSERT INTO `users_userprofile_user_permissions` VALUES (151, 1, 55);
INSERT INTO `users_userprofile_user_permissions` VALUES (152, 1, 56);
INSERT INTO `users_userprofile_user_permissions` VALUES (153, 1, 57);
INSERT INTO `users_userprofile_user_permissions` VALUES (154, 1, 58);
INSERT INTO `users_userprofile_user_permissions` VALUES (155, 1, 59);
INSERT INTO `users_userprofile_user_permissions` VALUES (156, 1, 60);
INSERT INTO `users_userprofile_user_permissions` VALUES (157, 1, 61);
INSERT INTO `users_userprofile_user_permissions` VALUES (158, 1, 62);
INSERT INTO `users_userprofile_user_permissions` VALUES (159, 1, 63);
INSERT INTO `users_userprofile_user_permissions` VALUES (160, 1, 64);
INSERT INTO `users_userprofile_user_permissions` VALUES (161, 1, 65);
INSERT INTO `users_userprofile_user_permissions` VALUES (162, 1, 66);
INSERT INTO `users_userprofile_user_permissions` VALUES (163, 1, 67);
INSERT INTO `users_userprofile_user_permissions` VALUES (164, 1, 68);
INSERT INTO `users_userprofile_user_permissions` VALUES (165, 1, 69);
INSERT INTO `users_userprofile_user_permissions` VALUES (166, 1, 70);
INSERT INTO `users_userprofile_user_permissions` VALUES (167, 1, 71);
INSERT INTO `users_userprofile_user_permissions` VALUES (168, 1, 72);
INSERT INTO `users_userprofile_user_permissions` VALUES (169, 1, 73);
INSERT INTO `users_userprofile_user_permissions` VALUES (170, 1, 74);
INSERT INTO `users_userprofile_user_permissions` VALUES (171, 1, 75);
INSERT INTO `users_userprofile_user_permissions` VALUES (172, 1, 76);
INSERT INTO `users_userprofile_user_permissions` VALUES (173, 1, 77);
INSERT INTO `users_userprofile_user_permissions` VALUES (174, 1, 78);
INSERT INTO `users_userprofile_user_permissions` VALUES (175, 1, 79);
INSERT INTO `users_userprofile_user_permissions` VALUES (176, 1, 80);
INSERT INTO `users_userprofile_user_permissions` VALUES (177, 1, 81);
INSERT INTO `users_userprofile_user_permissions` VALUES (178, 1, 82);
INSERT INTO `users_userprofile_user_permissions` VALUES (179, 1, 83);
INSERT INTO `users_userprofile_user_permissions` VALUES (180, 1, 84);
INSERT INTO `users_userprofile_user_permissions` VALUES (181, 1, 85);
INSERT INTO `users_userprofile_user_permissions` VALUES (182, 1, 86);
INSERT INTO `users_userprofile_user_permissions` VALUES (183, 1, 87);
INSERT INTO `users_userprofile_user_permissions` VALUES (184, 1, 88);
INSERT INTO `users_userprofile_user_permissions` VALUES (185, 1, 89);
INSERT INTO `users_userprofile_user_permissions` VALUES (186, 1, 90);
INSERT INTO `users_userprofile_user_permissions` VALUES (187, 1, 91);
INSERT INTO `users_userprofile_user_permissions` VALUES (188, 1, 92);
INSERT INTO `users_userprofile_user_permissions` VALUES (189, 1, 93);
INSERT INTO `users_userprofile_user_permissions` VALUES (190, 1, 94);
INSERT INTO `users_userprofile_user_permissions` VALUES (191, 1, 95);
INSERT INTO `users_userprofile_user_permissions` VALUES (192, 1, 96);
INSERT INTO `users_userprofile_user_permissions` VALUES (193, 1, 97);
INSERT INTO `users_userprofile_user_permissions` VALUES (194, 1, 98);
INSERT INTO `users_userprofile_user_permissions` VALUES (195, 1, 99);
INSERT INTO `users_userprofile_user_permissions` VALUES (196, 1, 100);
INSERT INTO `users_userprofile_user_permissions` VALUES (197, 1, 101);
INSERT INTO `users_userprofile_user_permissions` VALUES (198, 1, 102);
INSERT INTO `users_userprofile_user_permissions` VALUES (199, 1, 103);
INSERT INTO `users_userprofile_user_permissions` VALUES (200, 1, 104);
INSERT INTO `users_userprofile_user_permissions` VALUES (1, 4, 1);
INSERT INTO `users_userprofile_user_permissions` VALUES (2, 4, 2);
INSERT INTO `users_userprofile_user_permissions` VALUES (3, 4, 3);
INSERT INTO `users_userprofile_user_permissions` VALUES (4, 4, 4);
INSERT INTO `users_userprofile_user_permissions` VALUES (5, 4, 5);
INSERT INTO `users_userprofile_user_permissions` VALUES (6, 4, 6);
INSERT INTO `users_userprofile_user_permissions` VALUES (7, 4, 7);
INSERT INTO `users_userprofile_user_permissions` VALUES (8, 4, 8);
INSERT INTO `users_userprofile_user_permissions` VALUES (9, 4, 9);
INSERT INTO `users_userprofile_user_permissions` VALUES (10, 4, 10);
INSERT INTO `users_userprofile_user_permissions` VALUES (11, 4, 14);
INSERT INTO `users_userprofile_user_permissions` VALUES (12, 4, 15);
INSERT INTO `users_userprofile_user_permissions` VALUES (13, 4, 17);
INSERT INTO `users_userprofile_user_permissions` VALUES (14, 4, 18);
INSERT INTO `users_userprofile_user_permissions` VALUES (15, 4, 19);
INSERT INTO `users_userprofile_user_permissions` VALUES (16, 4, 20);
INSERT INTO `users_userprofile_user_permissions` VALUES (17, 4, 21);
INSERT INTO `users_userprofile_user_permissions` VALUES (18, 4, 22);
INSERT INTO `users_userprofile_user_permissions` VALUES (19, 4, 23);
INSERT INTO `users_userprofile_user_permissions` VALUES (20, 4, 24);
INSERT INTO `users_userprofile_user_permissions` VALUES (21, 4, 25);
INSERT INTO `users_userprofile_user_permissions` VALUES (22, 4, 26);
INSERT INTO `users_userprofile_user_permissions` VALUES (23, 4, 27);
INSERT INTO `users_userprofile_user_permissions` VALUES (24, 4, 28);
INSERT INTO `users_userprofile_user_permissions` VALUES (25, 4, 29);
INSERT INTO `users_userprofile_user_permissions` VALUES (26, 4, 30);
INSERT INTO `users_userprofile_user_permissions` VALUES (27, 4, 31);
INSERT INTO `users_userprofile_user_permissions` VALUES (28, 4, 32);
INSERT INTO `users_userprofile_user_permissions` VALUES (29, 4, 33);
INSERT INTO `users_userprofile_user_permissions` VALUES (30, 4, 34);
INSERT INTO `users_userprofile_user_permissions` VALUES (31, 4, 35);
INSERT INTO `users_userprofile_user_permissions` VALUES (32, 4, 36);
INSERT INTO `users_userprofile_user_permissions` VALUES (33, 4, 37);
INSERT INTO `users_userprofile_user_permissions` VALUES (34, 4, 38);
INSERT INTO `users_userprofile_user_permissions` VALUES (35, 4, 39);
INSERT INTO `users_userprofile_user_permissions` VALUES (36, 4, 40);
INSERT INTO `users_userprofile_user_permissions` VALUES (37, 4, 41);
INSERT INTO `users_userprofile_user_permissions` VALUES (38, 4, 42);
INSERT INTO `users_userprofile_user_permissions` VALUES (39, 4, 43);
INSERT INTO `users_userprofile_user_permissions` VALUES (40, 4, 44);
INSERT INTO `users_userprofile_user_permissions` VALUES (41, 4, 45);
INSERT INTO `users_userprofile_user_permissions` VALUES (42, 4, 46);
INSERT INTO `users_userprofile_user_permissions` VALUES (43, 4, 47);
INSERT INTO `users_userprofile_user_permissions` VALUES (44, 4, 48);
INSERT INTO `users_userprofile_user_permissions` VALUES (45, 4, 49);
INSERT INTO `users_userprofile_user_permissions` VALUES (46, 4, 50);
INSERT INTO `users_userprofile_user_permissions` VALUES (47, 4, 51);
INSERT INTO `users_userprofile_user_permissions` VALUES (48, 4, 52);
INSERT INTO `users_userprofile_user_permissions` VALUES (49, 4, 53);
INSERT INTO `users_userprofile_user_permissions` VALUES (50, 4, 54);
INSERT INTO `users_userprofile_user_permissions` VALUES (51, 4, 55);
INSERT INTO `users_userprofile_user_permissions` VALUES (52, 4, 56);
INSERT INTO `users_userprofile_user_permissions` VALUES (53, 4, 57);
INSERT INTO `users_userprofile_user_permissions` VALUES (54, 4, 58);
INSERT INTO `users_userprofile_user_permissions` VALUES (55, 4, 59);
INSERT INTO `users_userprofile_user_permissions` VALUES (56, 4, 60);
INSERT INTO `users_userprofile_user_permissions` VALUES (57, 4, 61);
INSERT INTO `users_userprofile_user_permissions` VALUES (58, 4, 62);
INSERT INTO `users_userprofile_user_permissions` VALUES (59, 4, 63);
INSERT INTO `users_userprofile_user_permissions` VALUES (60, 4, 64);
INSERT INTO `users_userprofile_user_permissions` VALUES (61, 4, 65);
INSERT INTO `users_userprofile_user_permissions` VALUES (62, 4, 66);
INSERT INTO `users_userprofile_user_permissions` VALUES (63, 4, 67);
INSERT INTO `users_userprofile_user_permissions` VALUES (64, 4, 68);
INSERT INTO `users_userprofile_user_permissions` VALUES (65, 4, 69);
INSERT INTO `users_userprofile_user_permissions` VALUES (66, 4, 70);
INSERT INTO `users_userprofile_user_permissions` VALUES (67, 4, 71);
INSERT INTO `users_userprofile_user_permissions` VALUES (68, 4, 72);
INSERT INTO `users_userprofile_user_permissions` VALUES (69, 4, 73);
INSERT INTO `users_userprofile_user_permissions` VALUES (70, 4, 74);
INSERT INTO `users_userprofile_user_permissions` VALUES (71, 4, 75);
INSERT INTO `users_userprofile_user_permissions` VALUES (72, 4, 76);
INSERT INTO `users_userprofile_user_permissions` VALUES (73, 4, 77);
INSERT INTO `users_userprofile_user_permissions` VALUES (74, 4, 78);
INSERT INTO `users_userprofile_user_permissions` VALUES (75, 4, 79);
INSERT INTO `users_userprofile_user_permissions` VALUES (76, 4, 80);
INSERT INTO `users_userprofile_user_permissions` VALUES (77, 4, 81);
INSERT INTO `users_userprofile_user_permissions` VALUES (78, 4, 82);
INSERT INTO `users_userprofile_user_permissions` VALUES (79, 4, 83);
INSERT INTO `users_userprofile_user_permissions` VALUES (80, 4, 84);
INSERT INTO `users_userprofile_user_permissions` VALUES (81, 4, 85);
INSERT INTO `users_userprofile_user_permissions` VALUES (82, 4, 86);
INSERT INTO `users_userprofile_user_permissions` VALUES (83, 4, 87);
INSERT INTO `users_userprofile_user_permissions` VALUES (84, 4, 88);
INSERT INTO `users_userprofile_user_permissions` VALUES (85, 4, 89);
INSERT INTO `users_userprofile_user_permissions` VALUES (86, 4, 90);
INSERT INTO `users_userprofile_user_permissions` VALUES (87, 4, 91);
INSERT INTO `users_userprofile_user_permissions` VALUES (88, 4, 92);
INSERT INTO `users_userprofile_user_permissions` VALUES (89, 4, 93);
INSERT INTO `users_userprofile_user_permissions` VALUES (90, 4, 94);
INSERT INTO `users_userprofile_user_permissions` VALUES (91, 4, 95);
INSERT INTO `users_userprofile_user_permissions` VALUES (92, 4, 96);
INSERT INTO `users_userprofile_user_permissions` VALUES (93, 4, 97);
INSERT INTO `users_userprofile_user_permissions` VALUES (94, 4, 98);
INSERT INTO `users_userprofile_user_permissions` VALUES (95, 4, 99);
INSERT INTO `users_userprofile_user_permissions` VALUES (96, 4, 100);
INSERT INTO `users_userprofile_user_permissions` VALUES (97, 4, 101);
INSERT INTO `users_userprofile_user_permissions` VALUES (98, 4, 102);
INSERT INTO `users_userprofile_user_permissions` VALUES (99, 4, 103);
INSERT INTO `users_userprofile_user_permissions` VALUES (100, 4, 104);

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_bookmark_user_id_42d307fc_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_log_user_id_bb16a176_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES (1, '2018-08-18 16:34:02.470746', '127.0.0.1', '1', 'CityDict object', 'create', '已添加。', 23, 1);
INSERT INTO `xadmin_log` VALUES (2, '2018-08-18 16:36:04.508725', '127.0.0.1', '2', '上海市', 'create', '已添加。', 23, 1);
INSERT INTO `xadmin_log` VALUES (3, '2018-08-18 16:41:16.403087', '127.0.0.1', '3', '广州市', 'create', '已添加。', 23, 1);
INSERT INTO `xadmin_log` VALUES (4, '2018-08-18 16:41:29.062793', '127.0.0.1', '4', '深圳市', 'create', '已添加。', 23, 1);
INSERT INTO `xadmin_log` VALUES (5, '2018-08-18 16:41:44.431114', '127.0.0.1', '5', '天津市', 'create', '已添加。', 23, 1);
INSERT INTO `xadmin_log` VALUES (6, '2018-08-18 16:55:43.549056', '127.0.0.1', '1', '慕课网', 'create', '已添加。', 24, 1);
INSERT INTO `xadmin_log` VALUES (7, '2018-08-18 17:03:25.012725', '127.0.0.1', '北京大学', '北京大学', 'create', '已添加。', 24, 1);
INSERT INTO `xadmin_log` VALUES (8, '2018-08-18 17:05:46.906542', '127.0.0.1', '3', '慕课网１', 'create', '已添加。', 24, 1);
INSERT INTO `xadmin_log` VALUES (9, '2018-08-18 17:08:49.260898', '127.0.0.1', '4', '上海交通大学', 'create', '已添加。', 24, 1);
INSERT INTO `xadmin_log` VALUES (10, '2018-08-18 17:09:55.625072', '127.0.0.1', '5', '慕课网２', 'create', '已添加。', 24, 1);
INSERT INTO `xadmin_log` VALUES (11, '2018-08-18 17:11:49.269525', '127.0.0.1', '6', '欧阳锋', 'create', '已添加。', 24, 1);
INSERT INTO `xadmin_log` VALUES (12, '2018-08-18 17:14:58.409503', '127.0.0.1', '7', '中山大学', 'create', '已添加。', 24, 1);
INSERT INTO `xadmin_log` VALUES (13, '2018-08-18 17:16:00.633276', '127.0.0.1', '8', '奥巴马', 'create', '已添加。', 24, 1);
INSERT INTO `xadmin_log` VALUES (14, '2018-08-18 17:16:37.743207', '127.0.0.1', '9', '慕课网３', 'create', '已添加。', 24, 1);
INSERT INTO `xadmin_log` VALUES (15, '2018-08-18 17:17:20.611280', '127.0.0.1', '10', '张无忌', 'create', '已添加。', 24, 1);
INSERT INTO `xadmin_log` VALUES (16, '2018-08-19 22:59:01.695600', '127.0.0.1', '1', '马云', 'create', '已添加。', 25, 1);
INSERT INTO `xadmin_log` VALUES (17, '2018-08-19 23:00:32.156830', '127.0.0.1', '2', '李开复', 'create', '已添加。', 25, 1);
INSERT INTO `xadmin_log` VALUES (18, '2018-08-19 23:01:13.223704', '127.0.0.1', '3', '周杰伦', 'create', '已添加。', 25, 1);
INSERT INTO `xadmin_log` VALUES (19, '2018-08-19 23:02:21.314601', '127.0.0.1', '4', '陈奕迅', 'create', '已添加。', 25, 1);
INSERT INTO `xadmin_log` VALUES (20, '2018-08-19 23:03:02.867553', '127.0.0.1', '5', '王健林', 'create', '已添加。', 25, 1);
INSERT INTO `xadmin_log` VALUES (21, '2018-08-19 23:04:10.366574', '127.0.0.1', '6', '欧阳锋', 'create', '已添加。', 25, 1);
INSERT INTO `xadmin_log` VALUES (22, '2018-08-19 23:05:07.599105', '127.0.0.1', '7', '靳东', 'create', '已添加。', 25, 1);
INSERT INTO `xadmin_log` VALUES (23, '2018-08-19 23:05:55.800459', '127.0.0.1', '8', '奥巴马', 'create', '已添加。', 25, 1);
INSERT INTO `xadmin_log` VALUES (24, '2018-08-19 23:06:30.126314', '127.0.0.1', '9', '王凯', 'create', '已添加。', 25, 1);
INSERT INTO `xadmin_log` VALUES (25, '2018-08-19 23:07:19.696515', '127.0.0.1', '10', '张无忌', 'create', '已添加。', 25, 1);
INSERT INTO `xadmin_log` VALUES (26, '2018-08-19 23:54:46.592406', '127.0.0.1', '1', 'python入门', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (27, '2018-08-19 23:56:43.506465', '127.0.0.1', '2', 'java进阶', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (28, '2018-08-19 23:57:46.360259', '127.0.0.1', '3', 'mysql教程', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (29, '2018-08-20 20:31:21.836366', '127.0.0.1', '3', 'mysql教程', 'change', '已修改 course_org 。', 14, 1);
INSERT INTO `xadmin_log` VALUES (30, '2018-08-20 20:31:28.857709', '127.0.0.1', '2', 'java进阶', 'change', '已修改 course_org 。', 14, 1);
INSERT INTO `xadmin_log` VALUES (31, '2018-08-20 20:31:36.991781', '127.0.0.1', '1', 'python入门', 'change', '已修改 course_org 。', 14, 1);
INSERT INTO `xadmin_log` VALUES (32, '2018-08-20 21:35:15.405315', '127.0.0.1', '10', '张无忌', 'change', '已修改 image 。', 25, 1);
INSERT INTO `xadmin_log` VALUES (33, '2018-08-20 21:36:14.717849', '127.0.0.1', '9', '王凯', 'change', '已修改 image 。', 25, 1);
INSERT INTO `xadmin_log` VALUES (34, '2018-08-20 21:36:39.324237', '127.0.0.1', '8', '奥巴马', 'change', '已修改 image 。', 25, 1);
INSERT INTO `xadmin_log` VALUES (35, '2018-08-20 21:36:52.278531', '127.0.0.1', '7', '靳东', 'change', '已修改 image 。', 25, 1);
INSERT INTO `xadmin_log` VALUES (36, '2018-08-20 21:37:20.003933', '127.0.0.1', '6', '欧阳锋', 'change', '已修改 image 。', 25, 1);
INSERT INTO `xadmin_log` VALUES (37, '2018-08-20 21:37:37.983895', '127.0.0.1', '5', '王健林', 'change', '已修改 image 。', 25, 1);
INSERT INTO `xadmin_log` VALUES (38, '2018-08-20 21:37:53.411920', '127.0.0.1', '4', '陈奕迅', 'change', '已修改 image 。', 25, 1);
INSERT INTO `xadmin_log` VALUES (39, '2018-08-20 21:38:03.018121', '127.0.0.1', '3', '周杰伦', 'change', '已修改 image 。', 25, 1);
INSERT INTO `xadmin_log` VALUES (40, '2018-08-20 21:38:15.927108', '127.0.0.1', '2', '李开复', 'change', '已修改 image 。', 25, 1);
INSERT INTO `xadmin_log` VALUES (41, '2018-08-20 21:38:34.318993', '127.0.0.1', '1', '马云', 'change', '已修改 image 。', 25, 1);
INSERT INTO `xadmin_log` VALUES (42, '2018-08-22 18:46:10.794414', '127.0.0.1', '4', 'HTML基础', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (43, '2018-08-22 18:47:54.977351', '127.0.0.1', '5', 'Django基础', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (44, '2018-08-22 18:49:00.144981', '127.0.0.1', '6', 'CSS基础', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (45, '2018-08-22 20:16:51.610478', '127.0.0.1', '10', '张无忌', 'change', '已修改 students 和 courses_nums 。', 24, 1);
INSERT INTO `xadmin_log` VALUES (46, '2018-08-22 20:17:07.442554', '127.0.0.1', '9', '慕课网３', 'change', '已修改 fav_nums，click_nums，students 和 courses_nums 。', 24, 1);
INSERT INTO `xadmin_log` VALUES (47, '2018-08-22 20:17:17.235871', '127.0.0.1', '8', '奥巴马', 'change', '已修改 students 和 courses_nums 。', 24, 1);
INSERT INTO `xadmin_log` VALUES (48, '2018-08-22 20:22:40.076156', '127.0.0.1', '6', 'CSS基础', 'change', '已修改 student 和 click_nums 。', 14, 1);
INSERT INTO `xadmin_log` VALUES (49, '2018-08-22 20:22:50.192984', '127.0.0.1', '5', 'Django基础', 'change', '已修改 student 和 click_nums 。', 14, 1);
INSERT INTO `xadmin_log` VALUES (50, '2018-08-22 20:23:01.937969', '127.0.0.1', '3', 'mysql教程', 'change', '已修改 student 和 click_nums 。', 14, 1);
INSERT INTO `xadmin_log` VALUES (51, '2018-08-22 20:37:12.181015', '127.0.0.1', '10', '张无忌', 'change', '已修改 click_nums 。', 24, 1);
INSERT INTO `xadmin_log` VALUES (52, '2018-08-22 20:37:18.007417', '127.0.0.1', '9', '慕课网３', 'change', '没有字段被修改。', 24, 1);
INSERT INTO `xadmin_log` VALUES (53, '2018-08-22 20:37:25.876084', '127.0.0.1', '8', '奥巴马', 'change', '已修改 click_nums 。', 24, 1);
INSERT INTO `xadmin_log` VALUES (54, '2018-08-22 20:37:35.012074', '127.0.0.1', '4', '上海交通大学', 'change', '已修改 click_nums 。', 24, 1);
INSERT INTO `xadmin_log` VALUES (55, '2018-08-22 23:28:49.741472', '127.0.0.1', '4', '恋恋风尘', 'change', '已修改 last_login，user_permissions，name，birthday，address，mobile 和 image 。', 11, 1);
INSERT INTO `xadmin_log` VALUES (56, '2018-08-22 23:29:19.171404', '127.0.0.1', '4', '恋恋风尘', 'change', '没有字段被修改。', 11, 1);
INSERT INTO `xadmin_log` VALUES (57, '2018-08-22 23:29:30.230415', '127.0.0.1', '1', 'UserCourse object', 'create', '已添加。', 22, 1);
INSERT INTO `xadmin_log` VALUES (58, '2018-08-22 23:33:19.218978', '127.0.0.1', '1', '王子', 'change', '已修改 last_login，user_permissions，name，birthday，address，mobile 和 image 。', 11, 1);
INSERT INTO `xadmin_log` VALUES (59, '2018-08-22 23:34:17.716941', '127.0.0.1', '1', '王子', 'change', '没有字段被修改。', 11, 1);
INSERT INTO `xadmin_log` VALUES (60, '2018-08-22 23:36:21.814293', '127.0.0.1', '6', 'UserCourse object', 'create', '已添加。', 22, 1);
INSERT INTO `xadmin_log` VALUES (61, '2018-08-23 18:53:17.801020', '127.0.0.1', '6', 'CSS基础', 'change', '已修改 tag 。', 14, 1);
INSERT INTO `xadmin_log` VALUES (62, '2018-08-23 18:53:30.140817', '127.0.0.1', '1', 'python入门', 'change', '已修改 tag 。', 14, 1);
INSERT INTO `xadmin_log` VALUES (63, '2018-08-23 20:17:16.716889', '127.0.0.1', '1', '第一章　基础知识', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (64, '2018-08-23 20:17:44.084329', '127.0.0.1', '2', '第二章　进阶开发', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (65, '2018-08-23 20:18:25.909601', '127.0.0.1', '1', '2.1 进阶开发详细视频', 'create', '已添加。', 16, 1);
INSERT INTO `xadmin_log` VALUES (66, '2018-08-23 20:19:22.572452', '127.0.0.1', '2', '1.1 基础知识详细视频', 'create', '已添加。', 16, 1);
INSERT INTO `xadmin_log` VALUES (67, '2018-08-23 20:23:25.281532', '127.0.0.1', '2', '1.1 基础知识详细视频', 'change', '已修改 url 。', 16, 1);
INSERT INTO `xadmin_log` VALUES (68, '2018-08-23 20:23:33.207579', '127.0.0.1', '2', '1.1 基础知识详细视频', 'change', '没有字段被修改。', 16, 1);
INSERT INTO `xadmin_log` VALUES (69, '2018-08-23 20:23:38.101465', '127.0.0.1', '1', '2.1 进阶开发详细视频', 'change', '已修改 url 。', 16, 1);
INSERT INTO `xadmin_log` VALUES (70, '2018-08-23 20:25:01.290673', '127.0.0.1', '3', '1.2 基础知识（２）', 'create', '已添加。', 16, 1);
INSERT INTO `xadmin_log` VALUES (71, '2018-08-23 20:25:26.286347', '127.0.0.1', '3', '1.2 基础知识详细视频（２）', 'change', '已修改 name 。', 16, 1);
INSERT INTO `xadmin_log` VALUES (72, '2018-08-23 20:50:21.527243', '127.0.0.1', '3', '1.2 基础知识详细视频（２）', 'change', '已修改 learn_times 。', 16, 1);
INSERT INTO `xadmin_log` VALUES (73, '2018-08-23 20:50:28.174374', '127.0.0.1', '2', '1.1 基础知识详细视频', 'change', '已修改 learn_times 。', 16, 1);
INSERT INTO `xadmin_log` VALUES (74, '2018-08-23 20:50:36.668481', '127.0.0.1', '1', '2.1 进阶开发详细视频', 'change', '已修改 learn_times 。', 16, 1);
INSERT INTO `xadmin_log` VALUES (75, '2018-08-23 20:58:05.788518', '127.0.0.1', '1', '前端资源', 'create', '已添加。', 17, 1);
INSERT INTO `xadmin_log` VALUES (76, '2018-08-23 20:58:25.160626', '127.0.0.1', '2', '资料２', 'create', '已添加。', 17, 1);
INSERT INTO `xadmin_log` VALUES (77, '2018-08-23 21:06:10.081100', '127.0.0.1', '2', '资料２', 'delete', '', 17, 1);
INSERT INTO `xadmin_log` VALUES (78, '2018-08-23 21:06:27.542584', '127.0.0.1', '1', '前端资源', 'change', '没有字段被修改。', 17, 1);
INSERT INTO `xadmin_log` VALUES (79, '2018-08-23 21:06:51.866840', '127.0.0.1', '3', '资料２', 'create', '已添加。', 17, 1);
INSERT INTO `xadmin_log` VALUES (80, '2018-08-23 21:21:38.563160', '127.0.0.1', '4', '资料３', 'create', '已添加。', 17, 1);
INSERT INTO `xadmin_log` VALUES (81, '2018-08-23 21:32:09.565051', '127.0.0.1', '6', 'CSS基础', 'change', '已修改 tercher 。', 14, 1);
INSERT INTO `xadmin_log` VALUES (82, '2018-08-23 21:42:14.175183', '127.0.0.1', '6', 'CSS基础', 'change', '已修改 you_need_know 和 teacher_tell_you 。', 14, 1);

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_usersettings_user_id_edeabe4a_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES (1, 'dashboard:home:pos', '', 1);

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `widget_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_userwidget_user_id_c159233a_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
