/*
 Navicat Premium Data Transfer

 Source Server         : mariadb
 Source Server Type    : MySQL
 Source Server Version : 110702 (11.7.2-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : dhitadb

 Target Server Type    : MySQL
 Target Server Version : 110702 (11.7.2-MariaDB)
 File Encoding         : 65001

 Date: 06/03/2025 19:59:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_transactions
-- ----------------------------
DROP TABLE IF EXISTS `account_transactions`;
CREATE TABLE `account_transactions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `type` enum('debit','credit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `amount` decimal(22, 4) NOT NULL,
  `reff_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int NOT NULL,
  `transaction_id` int NULL DEFAULT NULL,
  `transaction_payment_id` int NULL DEFAULT NULL,
  `transfer_transaction_id` int NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_transactions_account_id_index`(`account_id` ASC) USING BTREE,
  INDEX `account_transactions_transaction_id_index`(`transaction_id` ASC) USING BTREE,
  INDEX `account_transactions_transaction_payment_id_index`(`transaction_payment_id` ASC) USING BTREE,
  INDEX `account_transactions_transfer_transaction_id_index`(`transfer_transaction_id` ASC) USING BTREE,
  INDEX `account_transactions_created_by_index`(`created_by` ASC) USING BTREE,
  INDEX `account_transactions_type_index`(`type` ASC) USING BTREE,
  INDEX `account_transactions_sub_type_index`(`sub_type` ASC) USING BTREE,
  INDEX `account_transactions_operation_date_index`(`operation_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_transactions
-- ----------------------------

-- ----------------------------
-- Table structure for account_types
-- ----------------------------
DROP TABLE IF EXISTS `account_types`;
CREATE TABLE `account_types`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int NULL DEFAULT NULL,
  `business_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_types_parent_account_type_id_index`(`parent_account_type_id` ASC) USING BTREE,
  INDEX `account_types_business_id_index`(`business_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_types
-- ----------------------------

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `account_type_id` int NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` int NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `accounts_business_id_index`(`business_id` ASC) USING BTREE,
  INDEX `accounts_account_type_id_index`(`account_type_id` ASC) USING BTREE,
  INDEX `accounts_created_by_index`(`created_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of accounts
-- ----------------------------

-- ----------------------------
-- Table structure for activity_log
-- ----------------------------
DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE `activity_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int NULL DEFAULT NULL,
  `subject_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `event` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `business_id` int NULL DEFAULT NULL,
  `causer_id` int NULL DEFAULT NULL,
  `causer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `batch_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `activity_log_log_name_index`(`log_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of activity_log
-- ----------------------------
INSERT INTO `activity_log` VALUES (1, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2025-02-22 14:17:07', '2025-02-22 14:17:07');
INSERT INTO `activity_log` VALUES (2, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2025-02-22 14:18:16', '2025-02-22 14:18:16');
INSERT INTO `activity_log` VALUES (3, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2025-02-22 14:22:59', '2025-02-22 14:22:59');
INSERT INTO `activity_log` VALUES (4, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2025-02-24 14:25:53', '2025-02-24 14:25:53');
INSERT INTO `activity_log` VALUES (5, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2025-02-26 11:22:29', '2025-02-26 11:22:29');
INSERT INTO `activity_log` VALUES (6, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2025-03-01 21:22:53', '2025-03-01 21:22:53');
INSERT INTO `activity_log` VALUES (7, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2025-03-02 21:01:06', '2025-03-02 21:01:06');
INSERT INTO `activity_log` VALUES (8, 'default', 'added', 2, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\" AZZAM \"}', NULL, '2025-03-02 21:07:20', '2025-03-02 21:07:20');
INSERT INTO `activity_log` VALUES (9, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2025-03-02 21:07:30', '2025-03-02 21:07:30');
INSERT INTO `activity_log` VALUES (10, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:07:35', '2025-03-02 21:07:35');
INSERT INTO `activity_log` VALUES (11, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:13:12', '2025-03-02 21:13:12');
INSERT INTO `activity_log` VALUES (12, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:13:17', '2025-03-02 21:13:17');
INSERT INTO `activity_log` VALUES (13, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:13:23', '2025-03-02 21:13:23');
INSERT INTO `activity_log` VALUES (14, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:14:33', '2025-03-02 21:14:33');
INSERT INTO `activity_log` VALUES (15, 'default', 'added', 3, 'App\\User', NULL, 1, 2, 'App\\User', '{\"name\":\" ANNA \"}', NULL, '2025-03-02 21:16:30', '2025-03-02 21:16:30');
INSERT INTO `activity_log` VALUES (16, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:16:39', '2025-03-02 21:16:39');
INSERT INTO `activity_log` VALUES (17, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2025-03-02 21:16:46', '2025-03-02 21:16:46');
INSERT INTO `activity_log` VALUES (18, 'default', 'logout', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2025-03-02 21:18:03', '2025-03-02 21:18:03');
INSERT INTO `activity_log` VALUES (19, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:18:07', '2025-03-02 21:18:07');
INSERT INTO `activity_log` VALUES (20, 'default', 'added', 95, 'App\\Transaction', NULL, 1, 2, 'App\\User', '{\"attributes\":{\"status\":\"final\"}}', NULL, '2025-03-02 21:29:16', '2025-03-02 21:29:16');
INSERT INTO `activity_log` VALUES (21, 'default', 'edited', 3, 'App\\User', NULL, 1, 2, 'App\\User', '{\"name\":\" ANNA \"}', NULL, '2025-03-02 21:36:31', '2025-03-02 21:36:31');
INSERT INTO `activity_log` VALUES (22, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:36:39', '2025-03-02 21:36:39');
INSERT INTO `activity_log` VALUES (23, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2025-03-02 21:36:44', '2025-03-02 21:36:44');
INSERT INTO `activity_log` VALUES (24, 'default', 'logout', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2025-03-02 21:37:21', '2025-03-02 21:37:21');
INSERT INTO `activity_log` VALUES (25, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:37:25', '2025-03-02 21:37:25');
INSERT INTO `activity_log` VALUES (26, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:40:32', '2025-03-02 21:40:32');
INSERT INTO `activity_log` VALUES (27, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2025-03-02 21:40:36', '2025-03-02 21:40:36');
INSERT INTO `activity_log` VALUES (28, 'default', 'added', 98, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3850000}}', NULL, '2025-03-02 21:41:17', '2025-03-02 21:41:17');
INSERT INTO `activity_log` VALUES (29, 'default', 'logout', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2025-03-02 21:42:35', '2025-03-02 21:42:35');
INSERT INTO `activity_log` VALUES (30, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:42:50', '2025-03-02 21:42:50');
INSERT INTO `activity_log` VALUES (31, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:50:33', '2025-03-02 21:50:33');
INSERT INTO `activity_log` VALUES (32, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2025-03-02 21:50:37', '2025-03-02 21:50:37');
INSERT INTO `activity_log` VALUES (33, 'default', 'logout', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2025-03-02 21:55:15', '2025-03-02 21:55:15');
INSERT INTO `activity_log` VALUES (34, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:55:22', '2025-03-02 21:55:22');
INSERT INTO `activity_log` VALUES (35, 'default', 'added', 99, 'App\\Transaction', NULL, 1, 2, 'App\\User', '{\"attributes\":{\"status\":\"final\"}}', NULL, '2025-03-02 21:57:01', '2025-03-02 21:57:01');
INSERT INTO `activity_log` VALUES (36, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:57:07', '2025-03-02 21:57:07');
INSERT INTO `activity_log` VALUES (37, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2025-03-02 21:57:13', '2025-03-02 21:57:13');
INSERT INTO `activity_log` VALUES (38, 'default', 'logout', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2025-03-02 21:59:30', '2025-03-02 21:59:30');
INSERT INTO `activity_log` VALUES (39, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 21:59:35', '2025-03-02 21:59:35');
INSERT INTO `activity_log` VALUES (40, 'default', 'added', 2, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:20:32', '2025-03-02 22:20:32');
INSERT INTO `activity_log` VALUES (41, 'default', 'imported', 3, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (42, 'default', 'imported', 4, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (43, 'default', 'imported', 5, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (44, 'default', 'imported', 6, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (45, 'default', 'imported', 7, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (46, 'default', 'imported', 8, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (47, 'default', 'imported', 9, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (48, 'default', 'imported', 10, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (49, 'default', 'imported', 11, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (50, 'default', 'imported', 12, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (51, 'default', 'imported', 13, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (52, 'default', 'imported', 14, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (53, 'default', 'imported', 15, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (54, 'default', 'imported', 16, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (55, 'default', 'imported', 17, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (56, 'default', 'imported', 18, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (57, 'default', 'imported', 19, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (58, 'default', 'imported', 20, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (59, 'default', 'imported', 21, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (60, 'default', 'imported', 22, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (61, 'default', 'imported', 23, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (62, 'default', 'imported', 24, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (63, 'default', 'imported', 25, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (64, 'default', 'imported', 26, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (65, 'default', 'imported', 27, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (66, 'default', 'imported', 28, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (67, 'default', 'imported', 29, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (68, 'default', 'imported', 30, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (69, 'default', 'imported', 31, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (70, 'default', 'imported', 32, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (71, 'default', 'imported', 33, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (72, 'default', 'imported', 34, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (73, 'default', 'imported', 35, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (74, 'default', 'imported', 36, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (75, 'default', 'imported', 37, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (76, 'default', 'imported', 38, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (77, 'default', 'imported', 39, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (78, 'default', 'imported', 40, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (79, 'default', 'imported', 41, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (80, 'default', 'imported', 42, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (81, 'default', 'imported', 43, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (82, 'default', 'imported', 44, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (83, 'default', 'imported', 45, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (84, 'default', 'imported', 46, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (85, 'default', 'imported', 47, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (86, 'default', 'imported', 48, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (87, 'default', 'imported', 49, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (88, 'default', 'imported', 50, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (89, 'default', 'imported', 51, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (90, 'default', 'imported', 52, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (91, 'default', 'imported', 53, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (92, 'default', 'imported', 54, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (93, 'default', 'imported', 55, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (94, 'default', 'imported', 56, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (95, 'default', 'imported', 57, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (96, 'default', 'imported', 58, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (97, 'default', 'imported', 59, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (98, 'default', 'imported', 60, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (99, 'default', 'imported', 61, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (100, 'default', 'imported', 62, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (101, 'default', 'imported', 63, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (102, 'default', 'imported', 64, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (103, 'default', 'imported', 65, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (104, 'default', 'imported', 66, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (105, 'default', 'imported', 67, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (106, 'default', 'imported', 68, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (107, 'default', 'imported', 69, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (108, 'default', 'imported', 70, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (109, 'default', 'imported', 71, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (110, 'default', 'imported', 72, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (111, 'default', 'imported', 73, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (112, 'default', 'imported', 74, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (113, 'default', 'imported', 75, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (114, 'default', 'imported', 76, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (115, 'default', 'imported', 77, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (116, 'default', 'imported', 78, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (117, 'default', 'imported', 79, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (118, 'default', 'imported', 80, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (119, 'default', 'imported', 81, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (120, 'default', 'imported', 82, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (121, 'default', 'imported', 83, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (122, 'default', 'imported', 84, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (123, 'default', 'imported', 85, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (124, 'default', 'imported', 86, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `activity_log` VALUES (125, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:39:21', '2025-03-02 22:39:21');
INSERT INTO `activity_log` VALUES (126, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:40:59', '2025-03-02 22:40:59');
INSERT INTO `activity_log` VALUES (127, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-02 22:41:06', '2025-03-02 22:41:06');
INSERT INTO `activity_log` VALUES (128, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2025-03-02 22:41:10', '2025-03-02 22:41:10');
INSERT INTO `activity_log` VALUES (129, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-03 19:18:23', '2025-03-03 19:18:23');
INSERT INTO `activity_log` VALUES (130, 'default', 'added', 87, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-03 19:56:11', '2025-03-03 19:56:11');
INSERT INTO `activity_log` VALUES (131, 'default', 'added', 88, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-03 19:56:38', '2025-03-03 19:56:38');
INSERT INTO `activity_log` VALUES (132, 'default', 'added', 89, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-03 19:57:03', '2025-03-03 19:57:03');
INSERT INTO `activity_log` VALUES (133, 'default', 'added', 90, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-03 19:57:33', '2025-03-03 19:57:33');
INSERT INTO `activity_log` VALUES (134, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-03 19:58:23', '2025-03-03 19:58:23');
INSERT INTO `activity_log` VALUES (135, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2025-03-03 19:58:29', '2025-03-03 19:58:29');
INSERT INTO `activity_log` VALUES (136, 'default', 'added', 101, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":770000}}', NULL, '2025-03-03 19:59:01', '2025-03-03 19:59:01');
INSERT INTO `activity_log` VALUES (137, 'default', 'logout', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2025-03-03 20:01:28', '2025-03-03 20:01:28');
INSERT INTO `activity_log` VALUES (138, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-03 20:01:32', '2025-03-03 20:01:32');
INSERT INTO `activity_log` VALUES (139, 'default', 'payment_edited', 101, 'App\\Transaction', NULL, 1, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"770000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"770000.0000\"}}', NULL, '2025-03-03 20:04:16', '2025-03-03 20:04:16');
INSERT INTO `activity_log` VALUES (140, 'default', 'added', 4, 'App\\User', NULL, 1, 2, 'App\\User', '{\"name\":\" PUPUT \"}', NULL, '2025-03-03 20:10:05', '2025-03-03 20:10:05');
INSERT INTO `activity_log` VALUES (141, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-03 20:10:15', '2025-03-03 20:10:15');
INSERT INTO `activity_log` VALUES (142, 'default', 'login', 4, 'App\\User', NULL, 1, 4, 'App\\User', '[]', NULL, '2025-03-03 20:10:18', '2025-03-03 20:10:18');
INSERT INTO `activity_log` VALUES (143, 'default', 'added', 102, 'App\\Transaction', NULL, 1, 4, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":770000}}', NULL, '2025-03-03 20:10:43', '2025-03-03 20:10:43');
INSERT INTO `activity_log` VALUES (144, 'default', 'logout', 4, 'App\\User', NULL, 1, 4, 'App\\User', '[]', NULL, '2025-03-03 20:12:10', '2025-03-03 20:12:10');
INSERT INTO `activity_log` VALUES (145, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2025-03-03 20:12:14', '2025-03-03 20:12:14');
INSERT INTO `activity_log` VALUES (146, 'default', 'added', 103, 'App\\Transaction', NULL, 1, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"final_total\":770000}}', NULL, '2025-03-03 20:13:02', '2025-03-03 20:13:02');
INSERT INTO `activity_log` VALUES (147, 'default', 'edited', 103, 'App\\Transaction', NULL, 1, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":770000},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":\"770000.0000\"}}', NULL, '2025-03-03 20:13:30', '2025-03-03 20:13:30');
INSERT INTO `activity_log` VALUES (148, 'default', 'payment_edited', 103, 'App\\Transaction', NULL, 1, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"paid\",\"final_total\":\"770000.0000\"},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":\"770000.0000\"}}', NULL, '2025-03-03 20:15:36', '2025-03-03 20:15:36');

-- ----------------------------
-- Table structure for barcodes
-- ----------------------------
DROP TABLE IF EXISTS `barcodes`;
CREATE TABLE `barcodes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `width` double(22, 4) NULL DEFAULT NULL,
  `height` double(22, 4) NULL DEFAULT NULL,
  `paper_width` double(22, 4) NULL DEFAULT NULL,
  `paper_height` double(22, 4) NULL DEFAULT NULL,
  `top_margin` double(22, 4) NULL DEFAULT NULL,
  `left_margin` double(22, 4) NULL DEFAULT NULL,
  `row_distance` double(22, 4) NULL DEFAULT NULL,
  `col_distance` double(22, 4) NULL DEFAULT NULL,
  `stickers_in_one_row` int NULL DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int NULL DEFAULT NULL,
  `business_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `barcodes_business_id_foreign`(`business_id` ASC) USING BTREE,
  CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of barcodes
-- ----------------------------
INSERT INTO `barcodes` VALUES (1, '20 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20', 4.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.1250, 0.0000, 0.1875, 2, 0, 0, 20, NULL, '2017-12-18 06:13:44', '2017-12-18 06:13:44');
INSERT INTO `barcodes` VALUES (2, '30 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.1880, 0.0000, 0.1250, 3, 0, 0, 30, NULL, '2017-12-18 06:04:39', '2017-12-18 06:10:40');
INSERT INTO `barcodes` VALUES (3, '32 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-18 05:55:40', '2017-12-18 05:55:40');
INSERT INTO `barcodes` VALUES (4, '40 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-18 05:58:40', '2017-12-18 05:58:40');
INSERT INTO `barcodes` VALUES (5, '50 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-18 05:51:10', '2017-12-18 05:51:10');
INSERT INTO `barcodes` VALUES (6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm, Gap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-18 05:51:10', '2017-12-18 05:51:10');

-- ----------------------------
-- Table structure for bookings
-- ----------------------------
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `contact_id` int UNSIGNED NOT NULL,
  `waiter_id` int UNSIGNED NULL DEFAULT NULL,
  `table_id` int UNSIGNED NULL DEFAULT NULL,
  `correspondent_id` int NULL DEFAULT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `booking_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bookings_contact_id_foreign`(`contact_id` ASC) USING BTREE,
  INDEX `bookings_business_id_foreign`(`business_id` ASC) USING BTREE,
  INDEX `bookings_created_by_foreign`(`created_by` ASC) USING BTREE,
  INDEX `bookings_table_id_index`(`table_id` ASC) USING BTREE,
  INDEX `bookings_waiter_id_index`(`waiter_id` ASC) USING BTREE,
  INDEX `bookings_location_id_index`(`location_id` ASC) USING BTREE,
  INDEX `bookings_booking_status_index`(`booking_status` ASC) USING BTREE,
  INDEX `bookings_correspondent_id_index`(`correspondent_id` ASC) USING BTREE,
  CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bookings
-- ----------------------------

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `brands_business_id_foreign`(`business_id` ASC) USING BTREE,
  INDEX `brands_created_by_foreign`(`created_by` ASC) USING BTREE,
  CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of brands
-- ----------------------------

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int UNSIGNED NOT NULL,
  `start_date` date NULL DEFAULT NULL,
  `tax_number_1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tax_label_1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tax_number_2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tax_label_2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `code_label_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `code_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `code_label_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `code_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `default_sales_tax` int UNSIGNED NULL DEFAULT NULL,
  `default_profit_percent` double(5, 2) NOT NULL DEFAULT 0.00,
  `owner_id` int UNSIGNED NOT NULL,
  `time_zone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint NOT NULL DEFAULT 1,
  `accounting_method` enum('fifo','lifo','avco') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5, 2) NULL DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sku_prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_type` enum('add_expiry','add_manufacturing') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT 1,
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int UNSIGNED NULL DEFAULT NULL,
  `p_exchange_rate` decimal(20, 3) NOT NULL DEFAULT 1.000,
  `transaction_edit_days` int UNSIGNED NOT NULL DEFAULT 30,
  `stock_expiry_alert_days` int UNSIGNED NOT NULL DEFAULT 30,
  `keyboard_shortcuts` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `pos_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `weighing_scale_setting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT 1,
  `enable_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT 1,
  `enable_purchase_status` tinyint(1) NULL DEFAULT 1,
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT 0,
  `default_unit` int NULL DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT 0,
  `enable_racks` tinyint(1) NOT NULL DEFAULT 0,
  `enable_row` tinyint(1) NOT NULL DEFAULT 0,
  `enable_position` tinyint(1) NOT NULL DEFAULT 0,
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT 1,
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT 1,
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT 1,
  `currency_symbol_placement` enum('before','after') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `date_format` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `currency_precision` tinyint NOT NULL DEFAULT 2,
  `quantity_precision` tinyint NOT NULL DEFAULT 2,
  `ref_no_prefixes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `theme_color` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22, 4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22, 4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int NULL DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22, 4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22, 4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int NULL DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int NULL DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int NULL DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sms_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `custom_labels` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `common_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `business_owner_id_foreign`(`owner_id` ASC) USING BTREE,
  INDEX `business_currency_id_foreign`(`currency_id` ASC) USING BTREE,
  INDEX `business_default_sales_tax_foreign`(`default_sales_tax` ASC) USING BTREE,
  CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES (1, 'Dhita Fresh Fruits', 54, '2025-02-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, 1, 'Asia/Jakarta', 1, 'fifo', NULL, 'includes', '1740208593_IMG-20250222-WA0014.jpg', NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"recent_product_quantity\":\"f2\",\"add_new_product\":\"f4\"}}', NULL, '', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'm/d/Y', '24', 2, 2, '{\"purchase\":\"PO\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"business_location\":\"BL\"}', NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', NULL, NULL, NULL, NULL, 1, '2025-02-22 12:46:35', '2025-02-22 12:46:35');

-- ----------------------------
-- Table structure for business_locations
-- ----------------------------
DROP TABLE IF EXISTS `business_locations`;
CREATE TABLE `business_locations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int UNSIGNED NOT NULL,
  `sale_invoice_scheme_id` int NULL DEFAULT NULL,
  `invoice_layout_id` int UNSIGNED NOT NULL,
  `sale_invoice_layout_id` int NULL DEFAULT NULL,
  `selling_price_group_id` int NULL DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) NULL DEFAULT 1,
  `receipt_printer_type` enum('browser','printer') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int NULL DEFAULT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `alternate_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `featured_products` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `default_payment_accounts` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `custom_field1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `business_locations_business_id_index`(`business_id` ASC) USING BTREE,
  INDEX `business_locations_invoice_scheme_id_foreign`(`invoice_scheme_id` ASC) USING BTREE,
  INDEX `business_locations_invoice_layout_id_foreign`(`invoice_layout_id` ASC) USING BTREE,
  INDEX `business_locations_sale_invoice_layout_id_index`(`sale_invoice_layout_id` ASC) USING BTREE,
  INDEX `business_locations_selling_price_group_id_index`(`selling_price_group_id` ASC) USING BTREE,
  INDEX `business_locations_receipt_printer_type_index`(`receipt_printer_type` ASC) USING BTREE,
  INDEX `business_locations_printer_id_index`(`printer_id` ASC) USING BTREE,
  CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of business_locations
-- ----------------------------
INSERT INTO `business_locations` VALUES (1, 1, 'BL0001', 'Dhita Fresh Fruits', 'Dhita Fresh Fruits App', 'Indonesia', 'JAWA TIMUR', 'LUMAJANG', '67311', 1, NULL, 1, 1, NULL, 1, 'browser', NULL, '082221663853', '', '', '', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2025-02-22 12:46:35', '2025-02-22 12:46:35');
INSERT INTO `business_locations` VALUES (2, 1, 'BL0002', 'gudang', 'alun2 lumajang', 'Indonesia', 'indonesia', 'Lumajang', '60239', 1, 1, 1, 1, NULL, 1, 'browser', NULL, '08123456789', NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"},\"card\":{\"is_enabled\":\"1\"},\"cheque\":{\"is_enabled\":\"1\"},\"bank_transfer\":{\"is_enabled\":\"1\"},\"other\":{\"is_enabled\":\"1\"},\"custom_pay_1\":{\"is_enabled\":\"1\"},\"custom_pay_2\":{\"is_enabled\":\"1\"},\"custom_pay_3\":{\"is_enabled\":\"1\"},\"custom_pay_4\":{\"is_enabled\":\"1\"},\"custom_pay_5\":{\"is_enabled\":\"1\"},\"custom_pay_6\":{\"is_enabled\":\"1\"},\"custom_pay_7\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2025-03-02 21:21:30', '2025-03-02 21:21:30');

-- ----------------------------
-- Table structure for cash_denominations
-- ----------------------------
DROP TABLE IF EXISTS `cash_denominations`;
CREATE TABLE `cash_denominations`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int NOT NULL,
  `amount` decimal(22, 4) NOT NULL,
  `total_count` int NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cash_denominations_model_type_model_id_index`(`model_type` ASC, `model_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cash_denominations
-- ----------------------------

-- ----------------------------
-- Table structure for cash_register_transactions
-- ----------------------------
DROP TABLE IF EXISTS `cash_register_transactions`;
CREATE TABLE `cash_register_transactions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cash_register_id` int UNSIGNED NOT NULL,
  `amount` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `pay_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` enum('debit','credit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `transaction_id` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cash_register_transactions_cash_register_id_foreign`(`cash_register_id` ASC) USING BTREE,
  INDEX `cash_register_transactions_transaction_id_index`(`transaction_id` ASC) USING BTREE,
  INDEX `cash_register_transactions_type_index`(`type` ASC) USING BTREE,
  INDEX `cash_register_transactions_transaction_type_index`(`transaction_type` ASC) USING BTREE,
  CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cash_register_transactions
-- ----------------------------
INSERT INTO `cash_register_transactions` VALUES (1, 1, 100000.0000, 'cash', 'credit', 'initial', NULL, '2025-02-26 14:57:42', '2025-02-26 14:57:42');
INSERT INTO `cash_register_transactions` VALUES (2, 4, 3850000.0000, 'cash', 'credit', 'sell', 98, '2025-03-02 21:41:17', '2025-03-02 21:41:17');
INSERT INTO `cash_register_transactions` VALUES (3, 5, 100000.0000, 'cash', 'credit', 'initial', NULL, '2025-03-02 21:50:43', '2025-03-02 21:50:43');
INSERT INTO `cash_register_transactions` VALUES (4, 6, 100000.0000, 'cash', 'credit', 'initial', NULL, '2025-03-02 21:57:18', '2025-03-02 21:57:18');
INSERT INTO `cash_register_transactions` VALUES (5, 8, 770000.0000, 'cash', 'credit', 'sell', 102, '2025-03-03 20:10:43', '2025-03-03 20:10:43');

-- ----------------------------
-- Table structure for cash_registers
-- ----------------------------
DROP TABLE IF EXISTS `cash_registers`;
CREATE TABLE `cash_registers`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int NULL DEFAULT NULL,
  `user_id` int UNSIGNED NULL DEFAULT NULL,
  `status` enum('close','open') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime NULL DEFAULT NULL,
  `closing_amount` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `total_card_slips` int NOT NULL DEFAULT 0,
  `total_cheques` int NOT NULL DEFAULT 0,
  `denominations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `closing_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cash_registers_business_id_foreign`(`business_id` ASC) USING BTREE,
  INDEX `cash_registers_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `cash_registers_location_id_index`(`location_id` ASC) USING BTREE,
  CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cash_registers
-- ----------------------------
INSERT INTO `cash_registers` VALUES (1, 1, 1, 1, 'close', '2025-02-26 14:59:20', 100000.0000, 0, 0, NULL, NULL, '2025-02-26 14:57:00', '2025-02-26 14:59:20');
INSERT INTO `cash_registers` VALUES (2, 1, 1, 1, 'close', '2025-02-26 15:36:15', 0.0000, 0, 0, NULL, NULL, '2025-02-26 15:30:00', '2025-02-26 15:36:15');
INSERT INTO `cash_registers` VALUES (3, 1, 2, 3, 'close', '2025-03-02 21:37:16', 0.0000, 0, 0, NULL, NULL, '2025-03-02 21:36:00', '2025-03-02 21:37:16');
INSERT INTO `cash_registers` VALUES (4, 1, 2, 3, 'close', '2025-03-02 21:41:41', 3850000.0000, 0, 0, NULL, NULL, '2025-03-02 21:40:00', '2025-03-02 21:41:41');
INSERT INTO `cash_registers` VALUES (5, 1, 2, 3, 'close', '2025-03-02 21:55:07', 100000.0000, 0, 0, NULL, NULL, '2025-03-02 21:50:00', '2025-03-02 21:55:07');
INSERT INTO `cash_registers` VALUES (6, 1, 2, 3, 'close', '2025-03-02 21:59:26', 100000.0000, 0, 0, NULL, NULL, '2025-03-02 21:57:00', '2025-03-02 21:59:26');
INSERT INTO `cash_registers` VALUES (7, 1, 2, 3, 'close', '2025-03-03 19:59:46', 0.0000, 0, 0, NULL, NULL, '2025-03-03 19:58:00', '2025-03-03 19:59:46');
INSERT INTO `cash_registers` VALUES (8, 1, 1, 4, 'close', '2025-03-03 20:11:38', 770000.0000, 0, 0, NULL, NULL, '2025-03-03 20:10:00', '2025-03-03 20:11:38');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `short_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent_id` int NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `category_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categories_business_id_foreign`(`business_id` ASC) USING BTREE,
  INDEX `categories_created_by_foreign`(`created_by` ASC) USING BTREE,
  INDEX `categories_parent_id_index`(`parent_id` ASC) USING BTREE,
  CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'APEL FUJI', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (2, 'BAWANG', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (3, 'JERUK NAVEL', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (4, 'ANGGUR', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (5, 'LEMON', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (6, 'PEER CENTURY', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (7, 'PEAR', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (8, 'JERUK', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (9, 'APEL', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (10, 'KURMA', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (11, 'ASEM', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (12, 'PEER PACKAM', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (13, 'JAMUR', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (14, 'PITA', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (15, 'SAYURAN', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (16, 'KELENGKENG', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (17, 'DELIMA', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (18, 'PEER GOLDEN', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (19, 'PIR', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (20, 'PLASTIK', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (21, 'KIWI', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (22, 'KRANJANG', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (23, 'KUE', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (24, 'KLENGKENG', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (25, 'ES', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (26, 'KELAPA', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (27, 'JAGUNG', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (28, 'KESEMEK', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (29, 'CABE', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (30, 'BLUBERRY', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (31, 'KISMIS', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (32, 'SAYUR', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (33, 'BLUBERY', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (34, 'ANNGUR', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (35, 'CHERY', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (36, 'keranjang', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (37, 'STRAWBERRY', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `categories` VALUES (38, 'STROBERRY', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');

-- ----------------------------
-- Table structure for categorizables
-- ----------------------------
DROP TABLE IF EXISTS `categorizables`;
CREATE TABLE `categorizables`  (
  `category_id` int NOT NULL,
  `categorizable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorizable_id` bigint UNSIGNED NOT NULL,
  INDEX `categorizables_categorizable_type_categorizable_id_index`(`categorizable_type` ASC, `categorizable_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categorizables
-- ----------------------------

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supplier_business_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `middle_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `contact_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `contact_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address_line_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `address_line_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `zip_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dob` date NULL DEFAULT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `alternate_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pay_term_number` int NULL DEFAULT NULL,
  `pay_term_type` enum('days','months') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `credit_limit` decimal(22, 4) NULL DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `balance` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `total_rp` int NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_used` int NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shipping_custom_field_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_field_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `export_custom_field_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `export_custom_field_3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `export_custom_field_4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `export_custom_field_5` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `export_custom_field_6` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_group_id` int NULL DEFAULT NULL,
  `custom_field1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field5` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field6` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field7` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field8` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field9` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field10` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `contacts_business_id_foreign`(`business_id` ASC) USING BTREE,
  INDEX `contacts_created_by_foreign`(`created_by` ASC) USING BTREE,
  INDEX `contacts_type_index`(`type` ASC) USING BTREE,
  INDEX `contacts_contact_status_index`(`contact_status` ASC) USING BTREE,
  CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES (1, 1, 'customer', NULL, NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 1, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-22 12:46:35', '2025-02-22 12:46:35');
INSERT INTO `contacts` VALUES (2, 1, 'supplier', 'business', 'A T P', '', NULL, NULL, NULL, NULL, NULL, 'CO0002', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '08123456789', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:20:32', '2025-03-02 22:20:32');
INSERT INTO `contacts` VALUES (3, 1, 'supplier', NULL, 'A T P', ' A T P  ', NULL, 'A T P', NULL, NULL, NULL, 'CO0003', 'active', NULL, NULL, NULL, NULL, 'SYRABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (4, 1, 'supplier', NULL, 'CIK-HWA', ' CIK-HWA  ', NULL, 'CIK-HWA', NULL, NULL, NULL, 'CO0004', 'active', NULL, NULL, NULL, NULL, 'BATU', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (5, 1, 'supplier', NULL, 'CSA(CAKKA SEGAR ABADI)', ' CSA(CAKKA SEGAR ABADI)  ', NULL, 'CSA(CAKKA SEGAR ABADI)', NULL, NULL, NULL, 'CO0005', 'active', NULL, NULL, NULL, NULL, 'SIDOARJO', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (6, 1, 'supplier', NULL, 'LMU-SRBY', ' LMU-SRBY  ', NULL, 'LMU-SRBY', NULL, NULL, NULL, 'CO0006', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (7, 1, 'supplier', NULL, 'MAJ( MAKMUR ABADI JAYA)', ' MAJ( MAKMUR ABADI JAYA)  ', NULL, 'MAJ( MAKMUR ABADI JAYA)', NULL, NULL, NULL, 'CO0007', 'active', NULL, NULL, NULL, NULL, 'GRESIK', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (8, 1, 'supplier', NULL, 'MAL', ' MAL  ', NULL, 'MAL', NULL, NULL, NULL, 'CO0008', 'active', NULL, NULL, NULL, NULL, 'TAMBAK LANGON SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (9, 1, 'supplier', NULL, 'MULTI CAHAYA BUANA', ' MULTI CAHAYA BUANA  ', NULL, 'MULTI CAHAYA BUANA', NULL, NULL, NULL, 'CO0009', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (10, 1, 'supplier', NULL, 'RORAN TERPANDANG', ' RORAN TERPANDANG  ', NULL, 'RORAN TERPANDANG', NULL, NULL, NULL, 'CO0010', 'active', NULL, NULL, NULL, NULL, 'SURI MULIA (SURABAYA)', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (11, 1, 'supplier', NULL, 'S J M', ' S J M  ', NULL, 'S J M', NULL, NULL, NULL, 'CO0011', 'active', NULL, NULL, NULL, NULL, 'SEPANJANG SIDOARJO', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (12, 1, 'supplier', NULL, 'SAM(SINAR ABADI MAKMUR)', ' SAM(SINAR ABADI MAKMUR)  ', NULL, 'SAM(SINAR ABADI MAKMUR)', NULL, NULL, NULL, 'CO0012', 'active', NULL, NULL, NULL, NULL, 'SENTONG,SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (13, 1, 'supplier', NULL, 'SBM (SEGAR BUAH MAKMUR)', ' SBM (SEGAR BUAH MAKMUR)  ', NULL, 'SBM (SEGAR BUAH MAKMUR)', NULL, NULL, NULL, 'CO0013', 'active', NULL, NULL, NULL, NULL, '-', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (14, 1, 'supplier', NULL, 'SENGEK', ' SENGEK  ', NULL, 'SENGEK', NULL, NULL, NULL, 'CO0014', 'active', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (15, 1, 'supplier', NULL, 'SHB', ' SHB  ', NULL, 'SHB', NULL, NULL, NULL, 'CO0015', 'active', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (16, 1, 'supplier', NULL, 'SK SURABAYA', ' SK SURABAYA  ', NULL, 'SK SURABAYA', NULL, NULL, NULL, 'CO0016', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (17, 1, 'supplier', NULL, 'SSA', ' SSA  ', NULL, 'SSA', NULL, NULL, NULL, 'CO0017', 'active', NULL, NULL, NULL, NULL, 'GRESIK', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (18, 1, 'supplier', NULL, 'SUMBER ALAM BUAH (SAB)', ' SUMBER ALAM BUAH (SAB)  ', NULL, 'SUMBER ALAM BUAH (SAB)', NULL, NULL, NULL, 'CO0018', 'active', NULL, NULL, NULL, NULL, 'TAMBAK LANGON', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (19, 1, 'supplier', NULL, 'TIGA SAUDARA', ' TIGA SAUDARA  ', NULL, 'TIGA SAUDARA', NULL, NULL, NULL, 'CO0019', 'active', NULL, NULL, NULL, NULL, '-', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (20, 1, 'supplier', NULL, 'UD.MAKMUR', ' UD.MAKMUR  ', NULL, 'UD.MAKMUR', NULL, NULL, NULL, 'CO0020', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (21, 1, 'supplier', NULL, 'WK', ' WK  ', NULL, 'WK', NULL, NULL, NULL, 'CO0021', 'active', NULL, NULL, NULL, NULL, 'DUMAR INDUSTRI, SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (22, 1, 'supplier', NULL, 'INDOFRESH', ' INDOFRESH  ', NULL, 'INDOFRESH', NULL, NULL, NULL, 'CO0022', 'active', NULL, NULL, NULL, NULL, 'SIDOARJO', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (23, 1, 'supplier', NULL, 'ADIBA PARCEL', ' ADIBA PARCEL  ', NULL, 'ADIBA PARCEL', NULL, NULL, NULL, 'CO0023', 'active', NULL, NULL, NULL, NULL, 'JEPARA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (24, 1, 'supplier', NULL, 'ANEKA', ' ANEKA  ', NULL, 'ANEKA', NULL, NULL, NULL, 'CO0024', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (25, 1, 'supplier', NULL, 'PT.KARYA SUKSES', ' PT.KARYA SUKSES  ', NULL, 'PT.KARYA SUKSES', NULL, NULL, NULL, 'CO0025', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (26, 1, 'supplier', NULL, 'SEGAR KUMALA INDONESIA', ' SEGAR KUMALA INDONESIA  ', NULL, 'SEGAR KUMALA INDONESIA', NULL, NULL, NULL, 'CO0026', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (27, 1, 'supplier', NULL, 'SEGAR KUMALA PERSADA', ' SEGAR KUMALA PERSADA  ', NULL, 'SEGAR KUMALA PERSADA', NULL, NULL, NULL, 'CO0027', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (28, 1, 'supplier', NULL, 'SAHABAT MEKAR INDONESIA', ' SAHABAT MEKAR INDONESIA  ', NULL, 'SAHABAT MEKAR INDONESIA', NULL, NULL, NULL, 'CO0028', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (29, 1, 'supplier', NULL, 'TIGA SAKTI UTAMA', ' TIGA SAKTI UTAMA  ', NULL, 'TIGA SAKTI UTAMA', NULL, NULL, NULL, 'CO0029', 'active', NULL, NULL, NULL, NULL, 'SIDOARJO', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (30, 1, 'supplier', NULL, 'SEMESTA SEGAR ABADI', ' SEMESTA SEGAR ABADI  ', NULL, 'SEMESTA SEGAR ABADI', NULL, NULL, NULL, 'CO0030', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (31, 1, 'supplier', NULL, 'CIPTA ANEKA BUAH', ' CIPTA ANEKA BUAH  ', NULL, 'CIPTA ANEKA BUAH', NULL, NULL, NULL, 'CO0031', 'active', NULL, NULL, NULL, NULL, 'SBY', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (32, 1, 'supplier', NULL, 'SEGAR JAYA MANDIRI', ' SEGAR JAYA MANDIRI  ', NULL, 'SEGAR JAYA MANDIRI', NULL, NULL, NULL, 'CO0032', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (33, 1, 'supplier', NULL, 'TUNAS MAJU MANDIRI', ' TUNAS MAJU MANDIRI  ', NULL, 'TUNAS MAJU MANDIRI', NULL, NULL, NULL, 'CO0033', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (34, 1, 'supplier', NULL, 'TUNAS MAJU CEMERLANG', ' TUNAS MAJU CEMERLANG  ', NULL, 'TUNAS MAJU CEMERLANG', NULL, NULL, NULL, 'CO0034', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (35, 1, 'supplier', NULL, 'TENTRA', ' TENTRA  ', NULL, 'TENTRA', NULL, NULL, NULL, 'CO0035', 'active', NULL, NULL, NULL, NULL, 'SBY', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (36, 1, 'supplier', NULL, 'PT DMX TRADING INDONESIA', ' PT DMX TRADING INDONESIA  ', NULL, 'PT DMX TRADING INDONESIA', NULL, NULL, NULL, 'CO0036', 'active', NULL, NULL, NULL, NULL, 'SURABYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (37, 1, 'supplier', NULL, 'BINTANG BUAH LESTARI', ' BINTANG BUAH LESTARI  ', NULL, 'BINTANG BUAH LESTARI', NULL, NULL, NULL, 'CO0037', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (38, 1, 'supplier', NULL, 'CV BELIMBING', ' CV BELIMBING  ', NULL, 'CV BELIMBING', NULL, NULL, NULL, 'CO0038', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (39, 1, 'supplier', NULL, 'CAB', ' CAB  ', NULL, 'CAB', NULL, NULL, NULL, 'CO0039', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (40, 1, 'supplier', NULL, 'PT,MUSTIKA KARYA ANUGRAH', ' PT,MUSTIKA KARYA ANUGRAH  ', NULL, 'PT,MUSTIKA KARYA ANUGRAH', NULL, NULL, NULL, 'CO0040', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (41, 1, 'supplier', NULL, 'SEGAR JAYA SEJAHTERA', ' SEGAR JAYA SEJAHTERA  ', NULL, 'SEGAR JAYA SEJAHTERA', NULL, NULL, NULL, 'CO0041', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (42, 1, 'supplier', NULL, 'CAKKA SEGAR ABADI', ' CAKKA SEGAR ABADI  ', NULL, 'CAKKA SEGAR ABADI', NULL, NULL, NULL, 'CO0042', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (43, 1, 'supplier', NULL, 'LAUTAN BINTANG SEMESTA', ' LAUTAN BINTANG SEMESTA  ', NULL, 'LAUTAN BINTANG SEMESTA', NULL, NULL, NULL, 'CO0043', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (44, 1, 'supplier', NULL, 'PT SEGAR ABADI UTAMA', ' PT SEGAR ABADI UTAMA  ', NULL, 'PT SEGAR ABADI UTAMA', NULL, NULL, NULL, 'CO0044', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (45, 1, 'supplier', NULL, 'PARAMITA UNGGUL ABADI', ' PARAMITA UNGGUL ABADI  ', NULL, 'PARAMITA UNGGUL ABADI', NULL, NULL, NULL, 'CO0045', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (46, 1, 'supplier', NULL, 'ASTANA BERKAT PRATAMA', ' ASTANA BERKAT PRATAMA  ', NULL, 'ASTANA BERKAT PRATAMA', NULL, NULL, NULL, 'CO0046', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (47, 1, 'supplier', NULL, 'KOLINDO JAYA PRATAMA', ' KOLINDO JAYA PRATAMA  ', NULL, 'KOLINDO JAYA PRATAMA', NULL, NULL, NULL, 'CO0047', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (48, 1, 'supplier', NULL, 'ZULFI', ' ZULFI  ', NULL, 'ZULFI', NULL, NULL, NULL, 'CO0048', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (49, 1, 'supplier', NULL, 'PT.MULIA RAYA AGRIJAYA', ' PT.MULIA RAYA AGRIJAYA  ', NULL, 'PT.MULIA RAYA AGRIJAYA', NULL, NULL, NULL, 'CO0049', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (50, 1, 'supplier', NULL, 'PT.SENTOSA KARYA PUTRO', ' PT.SENTOSA KARYA PUTRO  ', NULL, 'PT.SENTOSA KARYA PUTRO', NULL, NULL, NULL, 'CO0050', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (51, 1, 'supplier', NULL, 'PT SEGAR UTAMA INDONESIA', ' PT SEGAR UTAMA INDONESIA  ', NULL, 'PT SEGAR UTAMA INDONESIA', NULL, NULL, NULL, 'CO0051', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (52, 1, 'supplier', NULL, 'PT UMBI SEGAR DELAPAN', ' PT UMBI SEGAR DELAPAN  ', NULL, 'PT UMBI SEGAR DELAPAN', NULL, NULL, NULL, 'CO0052', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (53, 1, 'supplier', NULL, 'PT ANANTARA SUKSES ANUGERAH', ' PT ANANTARA SUKSES ANUGERAH  ', NULL, 'PT ANANTARA SUKSES ANUGERAH', NULL, NULL, NULL, 'CO0053', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (54, 1, 'supplier', NULL, 'CV. INTI SEGAR MANDIRI', ' CV. INTI SEGAR MANDIRI  ', NULL, 'CV. INTI SEGAR MANDIRI', NULL, NULL, NULL, 'CO0054', 'active', NULL, NULL, NULL, NULL, 'SIDOARJO', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (55, 1, 'supplier', NULL, 'PT.INDO BAHAGIA SEJAHTERA', ' PT.INDO BAHAGIA SEJAHTERA  ', NULL, 'PT.INDO BAHAGIA SEJAHTERA', NULL, NULL, NULL, 'CO0055', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (56, 1, 'supplier', NULL, 'PT.ANEKA BUAH ABADI', ' PT.ANEKA BUAH ABADI  ', NULL, 'PT.ANEKA BUAH ABADI', NULL, NULL, NULL, 'CO0056', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (57, 1, 'supplier', NULL, 'PT.CIPTA BUAH GEMILANG', ' PT.CIPTA BUAH GEMILANG  ', NULL, 'PT.CIPTA BUAH GEMILANG', NULL, NULL, NULL, 'CO0057', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (58, 1, 'supplier', NULL, 'PT. SAHABAT BUAH INDONESIA', ' PT. SAHABAT BUAH INDONESIA  ', NULL, 'PT. SAHABAT BUAH INDONESIA', NULL, NULL, NULL, 'CO0058', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (59, 1, 'supplier', NULL, 'SUMBER ENERGI SEGAR', ' SUMBER ENERGI SEGAR  ', NULL, 'SUMBER ENERGI SEGAR', NULL, NULL, NULL, 'CO0059', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (60, 1, 'supplier', NULL, 'CV TANJUNG SARI BUAH', ' CV TANJUNG SARI BUAH  ', NULL, 'CV TANJUNG SARI BUAH', NULL, NULL, NULL, 'CO0060', 'active', NULL, NULL, NULL, NULL, 'SBY', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (61, 1, 'supplier', NULL, 'CV CHERRY FRUIT', ' CV CHERRY FRUIT  ', NULL, 'CV CHERRY FRUIT', NULL, NULL, NULL, 'CO0061', 'active', NULL, NULL, NULL, NULL, 'SBY', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (62, 1, 'supplier', NULL, 'SIMBOL BUAH INDONESIA(SBI)', ' SIMBOL BUAH INDONESIA(SBI)  ', NULL, 'SIMBOL BUAH INDONESIA(SBI)', NULL, NULL, NULL, 'CO0062', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (63, 1, 'supplier', NULL, 'SAU( SEGAR ABADI UTAMA)', ' SAU( SEGAR ABADI UTAMA)  ', NULL, 'SAU( SEGAR ABADI UTAMA)', NULL, NULL, NULL, 'CO0063', 'active', NULL, NULL, NULL, NULL, 'SBY', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (64, 1, 'supplier', NULL, 'SINAR SEGAR SEJAHTERA', ' SINAR SEGAR SEJAHTERA  ', NULL, 'SINAR SEGAR SEJAHTERA', NULL, NULL, NULL, 'CO0064', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (65, 1, 'supplier', NULL, 'BUAH ABADI CEMERLANG', ' BUAH ABADI CEMERLANG  ', NULL, 'BUAH ABADI CEMERLANG', NULL, NULL, NULL, 'CO0065', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (66, 1, 'supplier', NULL, 'CV,TANJUNG SARI BUAH', ' CV,TANJUNG SARI BUAH  ', NULL, 'CV,TANJUNG SARI BUAH', NULL, NULL, NULL, 'CO0066', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (67, 1, 'supplier', NULL, 'MUSTIKA KARYA ANUGRAH', ' MUSTIKA KARYA ANUGRAH  ', NULL, 'MUSTIKA KARYA ANUGRAH', NULL, NULL, NULL, 'CO0067', 'active', NULL, NULL, NULL, NULL, 'SBY', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (68, 1, 'supplier', NULL, 'PT ASA', ' PT ASA  ', NULL, 'PT ASA', NULL, NULL, NULL, 'CO0068', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (69, 1, 'supplier', NULL, 'PT.BUAH INDAH PRATAMA', ' PT.BUAH INDAH PRATAMA  ', NULL, 'PT.BUAH INDAH PRATAMA', NULL, NULL, NULL, 'CO0069', 'active', NULL, NULL, NULL, NULL, 'surabaya', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (70, 1, 'supplier', NULL, 'CV.SANDI BUAH', ' CV.SANDI BUAH  ', NULL, 'CV.SANDI BUAH', NULL, NULL, NULL, 'CO0070', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (71, 1, 'supplier', NULL, 'PT.PRAMBANAN KENCANA', ' PT.PRAMBANAN KENCANA  ', NULL, 'PT.PRAMBANAN KENCANA', NULL, NULL, NULL, 'CO0071', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (72, 1, 'supplier', NULL, 'SBA', ' SBA  ', NULL, 'SBA', NULL, NULL, NULL, 'CO0072', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (73, 1, 'supplier', NULL, 'ANEKA BUAH', ' ANEKA BUAH  ', NULL, 'ANEKA BUAH', NULL, NULL, NULL, 'CO0073', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (74, 1, 'supplier', NULL, 'CV CAR', ' CV CAR  ', NULL, 'CV CAR', NULL, NULL, NULL, 'CO0074', 'active', NULL, NULL, NULL, NULL, 'SURABYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (75, 1, 'supplier', NULL, 'CAHAYA SEGAR ABADI', ' CAHAYA SEGAR ABADI  ', NULL, 'CAHAYA SEGAR ABADI', NULL, NULL, NULL, 'CO0075', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (76, 1, 'supplier', NULL, 'CV.INTI SEGAR  MANDIRI', ' CV.INTI SEGAR  MANDIRI  ', NULL, 'CV.INTI SEGAR  MANDIRI', NULL, NULL, NULL, 'CO0076', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (77, 1, 'supplier', NULL, 'PT.MITRA BUAH ABADI', ' PT.MITRA BUAH ABADI  ', NULL, 'PT.MITRA BUAH ABADI', NULL, NULL, NULL, 'CO0077', 'active', NULL, NULL, NULL, NULL, 'SBY', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (78, 1, 'supplier', NULL, 'CAHAYA ABADI REJEKI', ' CAHAYA ABADI REJEKI  ', NULL, 'CAHAYA ABADI REJEKI', NULL, NULL, NULL, 'CO0078', 'active', NULL, NULL, NULL, NULL, 'SURABAYA+', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (79, 1, 'supplier', NULL, 'PT BUAH SEGAR SUKSESINDO', ' PT BUAH SEGAR SUKSESINDO  ', NULL, 'PT BUAH SEGAR SUKSESINDO', NULL, NULL, NULL, 'CO0079', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (80, 1, 'supplier', NULL, 'PT SUNPRIDE', ' PT SUNPRIDE  ', NULL, 'PT SUNPRIDE', NULL, NULL, NULL, 'CO0080', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (81, 1, 'supplier', NULL, 'PT. TANI ANEKA MAJU', ' PT. TANI ANEKA MAJU  ', NULL, 'PT. TANI ANEKA MAJU', NULL, NULL, NULL, 'CO0081', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (82, 1, 'supplier', NULL, 'CV.VANTO AGRO NUSANTARA', ' CV.VANTO AGRO NUSANTARA  ', NULL, 'CV.VANTO AGRO NUSANTARA', NULL, NULL, NULL, 'CO0082', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (83, 1, 'supplier', NULL, 'TANI ANEKA MAJU', ' TANI ANEKA MAJU  ', NULL, 'TANI ANEKA MAJU', NULL, NULL, NULL, 'CO0083', 'active', NULL, NULL, NULL, NULL, 'SURABYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (84, 1, 'supplier', NULL, 'PT MAKMUR SEGAR BUAH', ' PT MAKMUR SEGAR BUAH  ', NULL, 'PT MAKMUR SEGAR BUAH', NULL, NULL, NULL, 'CO0084', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (85, 1, 'supplier', NULL, 'PT SAUDARA SEJATI SENTOSA', ' PT SAUDARA SEJATI SENTOSA  ', NULL, 'PT SAUDARA SEJATI SENTOSA', NULL, NULL, NULL, 'CO0085', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (86, 1, 'supplier', NULL, 'MITRA ABADI LANCAR', ' MITRA ABADI LANCAR  ', NULL, 'MITRA ABADI LANCAR', NULL, NULL, NULL, 'CO0086', 'active', NULL, NULL, NULL, NULL, 'SURABAYA', NULL, NULL, NULL, '812345678', NULL, NULL, 1, 'months', NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 22:31:22', '2025-03-02 22:31:22');
INSERT INTO `contacts` VALUES (87, 1, 'customer', 'individual', NULL, 'HASYIM ASYARI', NULL, 'HASYIM ASYARI', NULL, NULL, NULL, 'CO0087', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '08123456789', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 19:56:11', '2025-03-03 19:56:11');
INSERT INTO `contacts` VALUES (88, 1, 'customer', 'individual', NULL, 'TULUS', NULL, 'TULUS', NULL, NULL, NULL, 'CO0088', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '08123456789', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 19:56:38', '2025-03-03 19:56:38');
INSERT INTO `contacts` VALUES (89, 1, 'customer', 'individual', NULL, 'AJI LAKSONO', NULL, 'AJI LAKSONO', NULL, NULL, NULL, 'CO0089', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '08123456789', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 19:57:03', '2025-03-03 19:57:03');
INSERT INTO `contacts` VALUES (90, 1, 'customer', 'individual', NULL, 'NUR', NULL, 'NUR', NULL, NULL, NULL, 'CO0090', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '08123456789', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 19:57:33', '2025-03-03 19:57:33');

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of currencies
-- ----------------------------
INSERT INTO `currencies` VALUES (1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL);
INSERT INTO `currencies` VALUES (31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL);
INSERT INTO `currencies` VALUES (39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL);
INSERT INTO `currencies` VALUES (42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL);
INSERT INTO `currencies` VALUES (45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL);
INSERT INTO `currencies` VALUES (49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL);
INSERT INTO `currencies` VALUES (57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL);
INSERT INTO `currencies` VALUES (60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL);
INSERT INTO `currencies` VALUES (74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL);
INSERT INTO `currencies` VALUES (77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL);
INSERT INTO `currencies` VALUES (85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL);
INSERT INTO `currencies` VALUES (106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL);
INSERT INTO `currencies` VALUES (111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL);
INSERT INTO `currencies` VALUES (128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL);
INSERT INTO `currencies` VALUES (141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', ',', '.', NULL, NULL);

-- ----------------------------
-- Table structure for customer_groups
-- ----------------------------
DROP TABLE IF EXISTS `customer_groups`;
CREATE TABLE `customer_groups`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5, 2) NOT NULL,
  `price_calculation_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'percentage',
  `selling_price_group_id` int NULL DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_groups_business_id_foreign`(`business_id` ASC) USING BTREE,
  INDEX `customer_groups_created_by_index`(`created_by` ASC) USING BTREE,
  INDEX `customer_groups_price_calculation_type_index`(`price_calculation_type` ASC) USING BTREE,
  INDEX `customer_groups_selling_price_group_id_index`(`selling_price_group_id` ASC) USING BTREE,
  CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer_groups
-- ----------------------------

-- ----------------------------
-- Table structure for dashboard_configurations
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_configurations`;
CREATE TABLE `dashboard_configurations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dashboard_configurations_business_id_foreign`(`business_id` ASC) USING BTREE,
  CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dashboard_configurations
-- ----------------------------

-- ----------------------------
-- Table structure for discount_variations
-- ----------------------------
DROP TABLE IF EXISTS `discount_variations`;
CREATE TABLE `discount_variations`  (
  `discount_id` int NOT NULL,
  `variation_id` int NOT NULL,
  INDEX `discount_variations_discount_id_index`(`discount_id` ASC) USING BTREE,
  INDEX `discount_variations_variation_id_index`(`variation_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of discount_variations
-- ----------------------------

-- ----------------------------
-- Table structure for discounts
-- ----------------------------
DROP TABLE IF EXISTS `discounts`;
CREATE TABLE `discounts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int NOT NULL,
  `brand_id` int NULL DEFAULT NULL,
  `category_id` int NULL DEFAULT NULL,
  `location_id` int NULL DEFAULT NULL,
  `priority` int NULL DEFAULT NULL,
  `discount_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `discount_amount` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `starts_at` datetime NULL DEFAULT NULL,
  `ends_at` datetime NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `spg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Applicable in specified selling price group only. Use of applicable_in_spg column is discontinued',
  `applicable_in_cg` tinyint(1) NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `discounts_business_id_index`(`business_id` ASC) USING BTREE,
  INDEX `discounts_brand_id_index`(`brand_id` ASC) USING BTREE,
  INDEX `discounts_category_id_index`(`category_id` ASC) USING BTREE,
  INDEX `discounts_location_id_index`(`location_id` ASC) USING BTREE,
  INDEX `discounts_priority_index`(`priority` ASC) USING BTREE,
  INDEX `discounts_spg_index`(`spg` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of discounts
-- ----------------------------

-- ----------------------------
-- Table structure for document_and_notes
-- ----------------------------
DROP TABLE IF EXISTS `document_and_notes`;
CREATE TABLE `document_and_notes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int NOT NULL,
  `notable_id` int NOT NULL,
  `notable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `document_and_notes_business_id_index`(`business_id` ASC) USING BTREE,
  INDEX `document_and_notes_notable_id_index`(`notable_id` ASC) USING BTREE,
  INDEX `document_and_notes_created_by_index`(`created_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of document_and_notes
-- ----------------------------

-- ----------------------------
-- Table structure for expense_categories
-- ----------------------------
DROP TABLE IF EXISTS `expense_categories`;
CREATE TABLE `expense_categories`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent_id` int NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `expense_categories_business_id_foreign`(`business_id` ASC) USING BTREE,
  CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of expense_categories
-- ----------------------------

-- ----------------------------
-- Table structure for group_sub_taxes
-- ----------------------------
DROP TABLE IF EXISTS `group_sub_taxes`;
CREATE TABLE `group_sub_taxes`  (
  `group_tax_id` int UNSIGNED NOT NULL,
  `tax_id` int UNSIGNED NOT NULL,
  INDEX `group_sub_taxes_group_tax_id_foreign`(`group_tax_id` ASC) USING BTREE,
  INDEX `group_sub_taxes_tax_id_foreign`(`tax_id` ASC) USING BTREE,
  CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_sub_taxes
-- ----------------------------

-- ----------------------------
-- Table structure for invoice_layouts
-- ----------------------------
DROP TABLE IF EXISTS `invoice_layouts`;
CREATE TABLE `invoice_layouts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `invoice_no_prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quotation_no_prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `invoice_heading` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sub_heading_line1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sub_heading_line2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sub_heading_line3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sub_heading_line4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sub_heading_line5` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `invoice_heading_paid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quotation_heading` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sub_total_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `discount_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tax_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `total_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `round_off_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `total_due_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `paid_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT 0,
  `client_id_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `client_tax_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_time_format` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT 1,
  `show_brand` tinyint(1) NOT NULL DEFAULT 0,
  `show_sku` tinyint(1) NOT NULL DEFAULT 1,
  `show_cat_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `show_lot` tinyint(1) NOT NULL DEFAULT 0,
  `show_image` tinyint(1) NOT NULL DEFAULT 0,
  `show_sale_description` tinyint(1) NOT NULL DEFAULT 0,
  `sales_person_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT 0,
  `table_product_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `table_qty_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `table_unit_price_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `table_subtotal_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cat_code_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_business_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_location_name` tinyint(1) NOT NULL DEFAULT 1,
  `show_landmark` tinyint(1) NOT NULL DEFAULT 1,
  `show_city` tinyint(1) NOT NULL DEFAULT 1,
  `show_state` tinyint(1) NOT NULL DEFAULT 1,
  `show_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_country` tinyint(1) NOT NULL DEFAULT 1,
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT 1,
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT 0,
  `show_email` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax_1` tinyint(1) NOT NULL DEFAULT 1,
  `show_tax_2` tinyint(1) NOT NULL DEFAULT 0,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `show_payments` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `commission_agent_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `show_commission_agent` tinyint(1) NOT NULL DEFAULT 0,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT 0,
  `highlight_color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `footer_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `module_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `common_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` int UNSIGNED NOT NULL,
  `show_letter_head` tinyint(1) NOT NULL DEFAULT 0,
  `letter_head` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `show_qr_code` tinyint(1) NOT NULL DEFAULT 0,
  `qr_code_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `design` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'classic',
  `cn_heading` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cn_amount_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `table_tax_headings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT 0,
  `prev_bal_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `change_return_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `contact_custom_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `location_custom_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invoice_layouts_business_id_foreign`(`business_id` ASC) USING BTREE,
  CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of invoice_layouts
-- ----------------------------
INSERT INTO `invoice_layouts` VALUES (1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 1, 0, NULL, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2025-02-22 12:46:35', '2025-02-22 12:46:35');

-- ----------------------------
-- Table structure for invoice_schemes
-- ----------------------------
DROP TABLE IF EXISTS `invoice_schemes`;
CREATE TABLE `invoice_schemes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sequential',
  `prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `start_number` int NULL DEFAULT NULL,
  `invoice_count` int NOT NULL DEFAULT 0,
  `total_digits` int NULL DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invoice_schemes_business_id_foreign`(`business_id` ASC) USING BTREE,
  INDEX `invoice_schemes_scheme_type_index`(`scheme_type` ASC) USING BTREE,
  INDEX `invoice_schemes_number_type_index`(`number_type` ASC) USING BTREE,
  CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of invoice_schemes
-- ----------------------------
INSERT INTO `invoice_schemes` VALUES (1, 1, 'Default', 'blank', 'sequential', '', 1, 3, 4, 1, '2025-02-22 12:46:35', '2025-03-03 20:10:43');

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `uploaded_by` int NULL DEFAULT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_media_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `media_model_type_model_id_index`(`model_type` ASC, `model_id` ASC) USING BTREE,
  INDEX `media_business_id_index`(`business_id` ASC) USING BTREE,
  INDEX `media_uploaded_by_index`(`uploaded_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 298 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_06_01_000001_create_oauth_auth_codes_table', 1);
INSERT INTO `migrations` VALUES (4, '2016_06_01_000002_create_oauth_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1);
INSERT INTO `migrations` VALUES (6, '2016_06_01_000004_create_oauth_clients_table', 1);
INSERT INTO `migrations` VALUES (7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);
INSERT INTO `migrations` VALUES (8, '2017_07_05_071953_create_currencies_table', 1);
INSERT INTO `migrations` VALUES (9, '2017_07_05_073658_create_business_table', 1);
INSERT INTO `migrations` VALUES (10, '2017_07_22_075923_add_business_id_users_table', 1);
INSERT INTO `migrations` VALUES (11, '2017_07_23_113209_create_brands_table', 1);
INSERT INTO `migrations` VALUES (12, '2017_07_26_083429_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (13, '2017_07_26_110000_create_tax_rates_table', 1);
INSERT INTO `migrations` VALUES (14, '2017_07_26_122313_create_units_table', 1);
INSERT INTO `migrations` VALUES (15, '2017_07_27_075706_create_contacts_table', 1);
INSERT INTO `migrations` VALUES (16, '2017_08_04_071038_create_categories_table', 1);
INSERT INTO `migrations` VALUES (17, '2017_08_08_115903_create_products_table', 1);
INSERT INTO `migrations` VALUES (18, '2017_08_09_061616_create_variation_templates_table', 1);
INSERT INTO `migrations` VALUES (19, '2017_08_09_061638_create_variation_value_templates_table', 1);
INSERT INTO `migrations` VALUES (20, '2017_08_10_061146_create_product_variations_table', 1);
INSERT INTO `migrations` VALUES (21, '2017_08_10_061216_create_variations_table', 1);
INSERT INTO `migrations` VALUES (22, '2017_08_19_054827_create_transactions_table', 1);
INSERT INTO `migrations` VALUES (23, '2017_08_31_073533_create_purchase_lines_table', 1);
INSERT INTO `migrations` VALUES (24, '2017_10_15_064638_create_transaction_payments_table', 1);
INSERT INTO `migrations` VALUES (25, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1);
INSERT INTO `migrations` VALUES (26, '2017_11_20_051930_create_table_group_sub_taxes', 1);
INSERT INTO `migrations` VALUES (27, '2017_11_20_063603_create_transaction_sell_lines', 1);
INSERT INTO `migrations` VALUES (28, '2017_11_21_064540_create_barcodes_table', 1);
INSERT INTO `migrations` VALUES (29, '2017_11_23_181237_create_invoice_schemes_table', 1);
INSERT INTO `migrations` VALUES (30, '2017_12_25_122822_create_business_locations_table', 1);
INSERT INTO `migrations` VALUES (31, '2017_12_25_160253_add_location_id_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (32, '2017_12_25_163227_create_variation_location_details_table', 1);
INSERT INTO `migrations` VALUES (33, '2018_01_04_115627_create_sessions_table', 1);
INSERT INTO `migrations` VALUES (34, '2018_01_05_112817_create_invoice_layouts_table', 1);
INSERT INTO `migrations` VALUES (35, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1);
INSERT INTO `migrations` VALUES (36, '2018_01_08_104124_create_expense_categories_table', 1);
INSERT INTO `migrations` VALUES (37, '2018_01_08_123327_modify_transactions_table_for_expenses', 1);
INSERT INTO `migrations` VALUES (38, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1);
INSERT INTO `migrations` VALUES (39, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1);
INSERT INTO `migrations` VALUES (40, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1);
INSERT INTO `migrations` VALUES (41, '2018_01_27_184322_create_printers_table', 1);
INSERT INTO `migrations` VALUES (42, '2018_01_30_181442_create_cash_registers_table', 1);
INSERT INTO `migrations` VALUES (43, '2018_01_31_125836_create_cash_register_transactions_table', 1);
INSERT INTO `migrations` VALUES (44, '2018_02_07_173326_modify_business_table', 1);
INSERT INTO `migrations` VALUES (45, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1);
INSERT INTO `migrations` VALUES (46, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1);
INSERT INTO `migrations` VALUES (47, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1);
INSERT INTO `migrations` VALUES (48, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (49, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1);
INSERT INTO `migrations` VALUES (50, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1);
INSERT INTO `migrations` VALUES (51, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1);
INSERT INTO `migrations` VALUES (52, '2018_02_13_183323_alter_decimal_fields_size', 1);
INSERT INTO `migrations` VALUES (53, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1);
INSERT INTO `migrations` VALUES (54, '2018_02_15_161032_add_document_column_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (55, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1);
INSERT INTO `migrations` VALUES (56, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1);
INSERT INTO `migrations` VALUES (57, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1);
INSERT INTO `migrations` VALUES (58, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (59, '2018_02_21_105329_create_system_table', 1);
INSERT INTO `migrations` VALUES (60, '2018_02_23_100549_version_1_2', 1);
INSERT INTO `migrations` VALUES (61, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1);
INSERT INTO `migrations` VALUES (62, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1);
INSERT INTO `migrations` VALUES (63, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1);
INSERT INTO `migrations` VALUES (64, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (65, '2018_02_27_121422_add_item_addition_method_to_business_table', 1);
INSERT INTO `migrations` VALUES (66, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1);
INSERT INTO `migrations` VALUES (67, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1);
INSERT INTO `migrations` VALUES (68, '2018_03_06_210206_modify_product_barcode_types', 1);
INSERT INTO `migrations` VALUES (69, '2018_03_13_181541_add_expiry_type_to_business_table', 1);
INSERT INTO `migrations` VALUES (70, '2018_03_16_113446_product_expiry_setting_for_business', 1);
INSERT INTO `migrations` VALUES (71, '2018_03_19_113601_add_business_settings_options', 1);
INSERT INTO `migrations` VALUES (72, '2018_03_26_125334_add_pos_settings_to_business_table', 1);
INSERT INTO `migrations` VALUES (73, '2018_03_26_165350_create_customer_groups_table', 1);
INSERT INTO `migrations` VALUES (74, '2018_03_27_122720_customer_group_related_changes_in_tables', 1);
INSERT INTO `migrations` VALUES (75, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1);
INSERT INTO `migrations` VALUES (76, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1);
INSERT INTO `migrations` VALUES (77, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1);
INSERT INTO `migrations` VALUES (78, '2018_03_31_140921_update_transactions_table_exchange_rate', 1);
INSERT INTO `migrations` VALUES (79, '2018_04_03_103037_add_contact_id_to_contacts_table', 1);
INSERT INTO `migrations` VALUES (80, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1);
INSERT INTO `migrations` VALUES (81, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1);
INSERT INTO `migrations` VALUES (82, '2018_04_17_123122_add_lot_number_to_business', 1);
INSERT INTO `migrations` VALUES (83, '2018_04_17_160845_add_product_racks_table', 1);
INSERT INTO `migrations` VALUES (84, '2018_04_20_182015_create_res_tables_table', 1);
INSERT INTO `migrations` VALUES (85, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1);
INSERT INTO `migrations` VALUES (86, '2018_04_24_114149_add_enabled_modules_business_table', 1);
INSERT INTO `migrations` VALUES (87, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1);
INSERT INTO `migrations` VALUES (88, '2018_04_27_132653_quotation_related_change', 1);
INSERT INTO `migrations` VALUES (89, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1);
INSERT INTO `migrations` VALUES (90, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1);
INSERT INTO `migrations` VALUES (91, '2018_05_14_114027_add_rows_positions_for_products', 1);
INSERT INTO `migrations` VALUES (92, '2018_05_14_125223_add_weight_to_products_table', 1);
INSERT INTO `migrations` VALUES (93, '2018_05_14_164754_add_opening_stock_permission', 1);
INSERT INTO `migrations` VALUES (94, '2018_05_15_134729_add_design_to_invoice_layouts', 1);
INSERT INTO `migrations` VALUES (95, '2018_05_16_183307_add_tax_fields_invoice_layout', 1);
INSERT INTO `migrations` VALUES (96, '2018_05_18_191956_add_sell_return_to_transaction_table', 1);
INSERT INTO `migrations` VALUES (97, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1);
INSERT INTO `migrations` VALUES (98, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1);
INSERT INTO `migrations` VALUES (99, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1);
INSERT INTO `migrations` VALUES (100, '2018_05_22_123527_create_reference_counts_table', 1);
INSERT INTO `migrations` VALUES (101, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1);
INSERT INTO `migrations` VALUES (102, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1);
INSERT INTO `migrations` VALUES (103, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1);
INSERT INTO `migrations` VALUES (104, '2018_05_25_180603_create_modifiers_related_table', 1);
INSERT INTO `migrations` VALUES (105, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1);
INSERT INTO `migrations` VALUES (106, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (107, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1);
INSERT INTO `migrations` VALUES (108, '2018_06_05_111905_modify_products_table_for_modifiers', 1);
INSERT INTO `migrations` VALUES (109, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1);
INSERT INTO `migrations` VALUES (110, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1);
INSERT INTO `migrations` VALUES (111, '2018_06_07_182258_add_image_field_to_products_table', 1);
INSERT INTO `migrations` VALUES (112, '2018_06_13_133705_create_bookings_table', 1);
INSERT INTO `migrations` VALUES (113, '2018_06_15_173636_add_email_column_to_contacts_table', 1);
INSERT INTO `migrations` VALUES (114, '2018_06_27_182835_add_superadmin_related_fields_business', 1);
INSERT INTO `migrations` VALUES (115, '2018_07_10_101913_add_custom_fields_to_products_table', 1);
INSERT INTO `migrations` VALUES (116, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1);
INSERT INTO `migrations` VALUES (117, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1);
INSERT INTO `migrations` VALUES (118, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1);
INSERT INTO `migrations` VALUES (119, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1);
INSERT INTO `migrations` VALUES (120, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1);
INSERT INTO `migrations` VALUES (121, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1);
INSERT INTO `migrations` VALUES (122, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1);
INSERT INTO `migrations` VALUES (123, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1);
INSERT INTO `migrations` VALUES (124, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1);
INSERT INTO `migrations` VALUES (125, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1);
INSERT INTO `migrations` VALUES (126, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (127, '2018_09_04_155900_create_accounts_table', 1);
INSERT INTO `migrations` VALUES (128, '2018_09_06_114438_create_selling_price_groups_table', 1);
INSERT INTO `migrations` VALUES (129, '2018_09_06_154057_create_variation_group_prices_table', 1);
INSERT INTO `migrations` VALUES (130, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1);
INSERT INTO `migrations` VALUES (131, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (132, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1);
INSERT INTO `migrations` VALUES (133, '2018_09_10_152703_create_account_transactions_table', 1);
INSERT INTO `migrations` VALUES (134, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1);
INSERT INTO `migrations` VALUES (135, '2018_09_19_123914_create_notification_templates_table', 1);
INSERT INTO `migrations` VALUES (136, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1);
INSERT INTO `migrations` VALUES (137, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1);
INSERT INTO `migrations` VALUES (138, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1);
INSERT INTO `migrations` VALUES (139, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1);
INSERT INTO `migrations` VALUES (140, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1);
INSERT INTO `migrations` VALUES (141, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1);
INSERT INTO `migrations` VALUES (142, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1);
INSERT INTO `migrations` VALUES (143, '2018_10_03_185947_add_default_notification_templates_to_database', 1);
INSERT INTO `migrations` VALUES (144, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1);
INSERT INTO `migrations` VALUES (145, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1);
INSERT INTO `migrations` VALUES (146, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1);
INSERT INTO `migrations` VALUES (147, '2018_10_22_134428_modify_variable_product_data', 1);
INSERT INTO `migrations` VALUES (148, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1);
INSERT INTO `migrations` VALUES (149, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1);
INSERT INTO `migrations` VALUES (150, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1);
INSERT INTO `migrations` VALUES (151, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1);
INSERT INTO `migrations` VALUES (152, '2018_10_31_175627_add_user_contact_access', 1);
INSERT INTO `migrations` VALUES (153, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1);
INSERT INTO `migrations` VALUES (154, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1);
INSERT INTO `migrations` VALUES (155, '2018_11_08_105621_add_role_permissions', 1);
INSERT INTO `migrations` VALUES (156, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (157, '2018_11_28_104410_modify_units_table_for_multi_unit', 1);
INSERT INTO `migrations` VALUES (158, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1);
INSERT INTO `migrations` VALUES (159, '2018_11_29_115918_add_primary_key_in_system_table', 1);
INSERT INTO `migrations` VALUES (160, '2018_12_03_185546_add_product_description_column_to_products_table', 1);
INSERT INTO `migrations` VALUES (161, '2018_12_06_114937_modify_system_table_and_users_table', 1);
INSERT INTO `migrations` VALUES (162, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1);
INSERT INTO `migrations` VALUES (163, '2018_12_14_103307_modify_system_table', 1);
INSERT INTO `migrations` VALUES (164, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1);
INSERT INTO `migrations` VALUES (165, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1);
INSERT INTO `migrations` VALUES (166, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1);
INSERT INTO `migrations` VALUES (167, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (168, '2018_12_24_154933_create_notifications_table', 1);
INSERT INTO `migrations` VALUES (169, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1);
INSERT INTO `migrations` VALUES (170, '2019_01_10_124645_add_account_permission', 1);
INSERT INTO `migrations` VALUES (171, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (172, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (173, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1);
INSERT INTO `migrations` VALUES (174, '2019_02_19_103118_create_discounts_table', 1);
INSERT INTO `migrations` VALUES (175, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1);
INSERT INTO `migrations` VALUES (176, '2019_02_21_134324_add_permission_for_discount', 1);
INSERT INTO `migrations` VALUES (177, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1);
INSERT INTO `migrations` VALUES (178, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (179, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1);
INSERT INTO `migrations` VALUES (180, '2019_03_12_120336_create_activity_log_table', 1);
INSERT INTO `migrations` VALUES (181, '2019_03_15_132925_create_media_table', 1);
INSERT INTO `migrations` VALUES (182, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1);
INSERT INTO `migrations` VALUES (183, '2019_05_10_132311_add_missing_column_indexing', 1);
INSERT INTO `migrations` VALUES (184, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1);
INSERT INTO `migrations` VALUES (185, '2019_05_25_104922_add_view_purchase_price_permission', 1);
INSERT INTO `migrations` VALUES (186, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1);
INSERT INTO `migrations` VALUES (187, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1);
INSERT INTO `migrations` VALUES (188, '2019_06_19_112058_add_database_changes_for_reward_points', 1);
INSERT INTO `migrations` VALUES (189, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1);
INSERT INTO `migrations` VALUES (190, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (191, '2019_07_15_165136_add_fields_for_combo_product', 1);
INSERT INTO `migrations` VALUES (192, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1);
INSERT INTO `migrations` VALUES (193, '2019_07_22_152649_add_not_for_selling_in_product_table', 1);
INSERT INTO `migrations` VALUES (194, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1);
INSERT INTO `migrations` VALUES (195, '2019_08_08_162302_add_sub_units_related_fields', 1);
INSERT INTO `migrations` VALUES (196, '2019_08_26_133419_update_price_fields_decimal_point', 1);
INSERT INTO `migrations` VALUES (197, '2019_09_02_160054_remove_location_permissions_from_roles', 1);
INSERT INTO `migrations` VALUES (198, '2019_09_03_185259_add_permission_for_pos_screen', 1);
INSERT INTO `migrations` VALUES (199, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1);
INSERT INTO `migrations` VALUES (200, '2019_09_04_184008_create_types_of_services_table', 1);
INSERT INTO `migrations` VALUES (201, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (202, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1);
INSERT INTO `migrations` VALUES (203, '2019_09_12_105616_create_product_locations_table', 1);
INSERT INTO `migrations` VALUES (204, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1);
INSERT INTO `migrations` VALUES (205, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (206, '2019_09_19_170927_close_all_active_registers', 1);
INSERT INTO `migrations` VALUES (207, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1);
INSERT INTO `migrations` VALUES (208, '2019_10_18_155633_create_account_types_table', 1);
INSERT INTO `migrations` VALUES (209, '2019_10_22_163335_add_common_settings_column_to_business_table', 1);
INSERT INTO `migrations` VALUES (210, '2019_10_29_132521_add_update_purchase_status_permission', 1);
INSERT INTO `migrations` VALUES (211, '2019_11_09_110522_add_indexing_to_lot_number', 1);
INSERT INTO `migrations` VALUES (212, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1);
INSERT INTO `migrations` VALUES (213, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1);
INSERT INTO `migrations` VALUES (214, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1);
INSERT INTO `migrations` VALUES (215, '2019_12_02_105025_create_warranties_table', 1);
INSERT INTO `migrations` VALUES (216, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1);
INSERT INTO `migrations` VALUES (217, '2019_12_05_183955_add_more_fields_to_users_table', 1);
INSERT INTO `migrations` VALUES (218, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1);
INSERT INTO `migrations` VALUES (219, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1);
INSERT INTO `migrations` VALUES (220, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1);
INSERT INTO `migrations` VALUES (221, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1);
INSERT INTO `migrations` VALUES (222, '2019_12_25_173413_create_dashboard_configurations_table', 1);
INSERT INTO `migrations` VALUES (223, '2020_01_08_133506_create_document_and_notes_table', 1);
INSERT INTO `migrations` VALUES (224, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1);
INSERT INTO `migrations` VALUES (225, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (226, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1);
INSERT INTO `migrations` VALUES (227, '2020_02_18_172447_add_import_fields_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (228, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1);
INSERT INTO `migrations` VALUES (229, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1);
INSERT INTO `migrations` VALUES (230, '2020_03_26_124736_add_allow_login_column_in_users_table', 1);
INSERT INTO `migrations` VALUES (231, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1);
INSERT INTO `migrations` VALUES (232, '2020_04_15_151802_add_user_type_to_users_table', 1);
INSERT INTO `migrations` VALUES (233, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (234, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1);
INSERT INTO `migrations` VALUES (235, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1);
INSERT INTO `migrations` VALUES (236, '2020_06_12_162245_modify_contacts_table', 1);
INSERT INTO `migrations` VALUES (237, '2020_06_22_103104_change_recur_interval_default_to_one', 1);
INSERT INTO `migrations` VALUES (238, '2020_07_09_174621_add_balance_field_to_contacts_table', 1);
INSERT INTO `migrations` VALUES (239, '2020_07_23_104933_change_status_column_to_varchar_in_transaction_table', 1);
INSERT INTO `migrations` VALUES (240, '2020_09_07_171059_change_completed_stock_transfer_status_to_final', 1);
INSERT INTO `migrations` VALUES (241, '2020_09_21_123224_modify_booking_status_column_in_bookings_table', 1);
INSERT INTO `migrations` VALUES (242, '2020_09_22_121639_create_discount_variations_table', 1);
INSERT INTO `migrations` VALUES (243, '2020_10_05_121550_modify_business_location_table_for_invoice_layout', 1);
INSERT INTO `migrations` VALUES (244, '2020_10_16_175726_set_status_as_received_for_opening_stock', 1);
INSERT INTO `migrations` VALUES (245, '2020_10_23_170823_add_for_group_tax_column_to_tax_rates_table', 1);
INSERT INTO `migrations` VALUES (246, '2020_11_04_130940_add_more_custom_fields_to_contacts_table', 1);
INSERT INTO `migrations` VALUES (247, '2020_11_10_152841_add_cash_register_permissions', 1);
INSERT INTO `migrations` VALUES (248, '2020_11_17_164041_modify_type_column_to_varchar_in_contacts_table', 1);
INSERT INTO `migrations` VALUES (249, '2020_12_18_181447_add_shipping_custom_fields_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (250, '2020_12_22_164303_add_sub_status_column_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (251, '2020_12_24_153050_add_custom_fields_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (252, '2020_12_28_105403_add_whatsapp_text_column_to_notification_templates_table', 1);
INSERT INTO `migrations` VALUES (253, '2020_12_29_165925_add_model_document_type_to_media_table', 1);
INSERT INTO `migrations` VALUES (254, '2021_02_08_175632_add_contact_number_fields_to_users_table', 1);
INSERT INTO `migrations` VALUES (255, '2021_02_11_172217_add_indexing_for_multiple_columns', 1);
INSERT INTO `migrations` VALUES (256, '2021_02_23_122043_add_more_columns_to_customer_groups_table', 1);
INSERT INTO `migrations` VALUES (257, '2021_02_24_175551_add_print_invoice_permission_to_all_roles', 1);
INSERT INTO `migrations` VALUES (258, '2021_03_03_162021_add_purchase_order_columns_to_purchase_lines_and_transactions_table', 1);
INSERT INTO `migrations` VALUES (259, '2021_03_11_120229_add_sales_order_columns', 1);
INSERT INTO `migrations` VALUES (260, '2021_03_16_120705_add_business_id_to_activity_log_table', 1);
INSERT INTO `migrations` VALUES (261, '2021_03_16_153427_add_code_columns_to_business_table', 1);
INSERT INTO `migrations` VALUES (262, '2021_03_18_173308_add_account_details_column_to_accounts_table', 1);
INSERT INTO `migrations` VALUES (263, '2021_03_18_183119_add_prefer_payment_account_columns_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (264, '2021_03_22_120810_add_more_types_of_service_custom_fields', 1);
INSERT INTO `migrations` VALUES (265, '2021_03_24_183132_add_shipping_export_custom_field_details_to_contacts_table', 1);
INSERT INTO `migrations` VALUES (266, '2021_03_25_170715_add_export_custom_fields_info_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (267, '2021_04_15_063449_add_denominations_column_to_cash_registers_table', 1);
INSERT INTO `migrations` VALUES (268, '2021_05_22_083426_add_indexing_to_account_transactions_table', 1);
INSERT INTO `migrations` VALUES (269, '2021_07_08_065808_add_additional_expense_columns_to_transaction_table', 1);
INSERT INTO `migrations` VALUES (270, '2021_07_13_082918_add_qr_code_columns_to_invoice_layouts_table', 1);
INSERT INTO `migrations` VALUES (271, '2021_07_21_061615_add_fields_to_show_commission_agent_in_invoice_layout', 1);
INSERT INTO `migrations` VALUES (272, '2021_08_13_105549_add_crm_contact_id_to_users_table', 1);
INSERT INTO `migrations` VALUES (273, '2021_08_25_114932_add_payment_link_fields_to_transaction_payments_table', 1);
INSERT INTO `migrations` VALUES (274, '2021_09_01_063110_add_spg_column_to_discounts_table', 1);
INSERT INTO `migrations` VALUES (275, '2021_09_03_061528_modify_cash_register_transactions_table', 1);
INSERT INTO `migrations` VALUES (276, '2021_10_05_061658_add_source_column_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (277, '2021_12_16_121851_add_parent_id_column_to_expense_categories_table', 1);
INSERT INTO `migrations` VALUES (278, '2022_04_14_075120_add_payment_type_column_to_transaction_payments_table', 1);
INSERT INTO `migrations` VALUES (279, '2022_04_21_083327_create_cash_denominations_table', 1);
INSERT INTO `migrations` VALUES (280, '2022_05_10_055307_add_delivery_date_column_to_transactions_table', 1);
INSERT INTO `migrations` VALUES (281, '2022_06_13_123135_add_currency_precision_and_quantity_precision_fields_to_business_table', 1);
INSERT INTO `migrations` VALUES (282, '2022_06_28_133342_add_secondary_unit_columns_to_products_sell_line_purchase_lines_tables', 1);
INSERT INTO `migrations` VALUES (283, '2022_07_13_114307_create_purchase_requisition_related_columns', 1);
INSERT INTO `migrations` VALUES (284, '2022_08_25_132707_add_service_staff_timer_fields_to_products_and_users_table', 1);
INSERT INTO `migrations` VALUES (285, '2023_01_28_114255_add_letter_head_column_to_invoice_layouts_table', 1);
INSERT INTO `migrations` VALUES (286, '2023_02_11_161510_add_event_column_to_activity_log_table', 1);
INSERT INTO `migrations` VALUES (287, '2023_02_11_161511_add_batch_uuid_column_to_activity_log_table', 1);
INSERT INTO `migrations` VALUES (288, '2023_03_02_170312_add_provider_to_oauth_clients_table', 1);
INSERT INTO `migrations` VALUES (289, '2023_03_21_122731_add_sale_invoice_scheme_id_business_table', 1);
INSERT INTO `migrations` VALUES (290, '2023_03_21_170446_add_number_type_to_invoice_scheme', 1);
INSERT INTO `migrations` VALUES (291, '2023_04_17_155216_add_custom_fields_to_products', 1);
INSERT INTO `migrations` VALUES (292, '2023_04_28_130247_add_price_type_to_group_price_table', 1);
INSERT INTO `migrations` VALUES (293, '2023_06_21_033923_add_delivery_person_in_transactions', 1);
INSERT INTO `migrations` VALUES (294, '2023_09_13_153555_add_service_staff_pin_columns_in_users', 1);
INSERT INTO `migrations` VALUES (295, '2023_09_15_154404_add_is_kitchen_order_in_transactions', 1);
INSERT INTO `migrations` VALUES (296, '2023_12_06_152840_add_contact_type_in_contacts', 1);
INSERT INTO `migrations` VALUES (297, '2024_10_03_151459_modify_transaction_sell_lines_purchase_lines_table', 1);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_type_model_id_index`(`model_type` ASC, `model_id` ASC) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------
INSERT INTO `model_has_permissions` VALUES (80, 'App\\User', 2);
INSERT INTO `model_has_permissions` VALUES (83, 'App\\User', 3);
INSERT INTO `model_has_permissions` VALUES (80, 'App\\User', 4);

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_type_model_id_index`(`model_type` ASC, `model_id` ASC) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\User', 1);
INSERT INTO `model_has_roles` VALUES (1, 'App\\User', 2);
INSERT INTO `model_has_roles` VALUES (2, 'App\\User', 3);
INSERT INTO `model_has_roles` VALUES (2, 'App\\User', 4);

-- ----------------------------
-- Table structure for notification_templates
-- ----------------------------
DROP TABLE IF EXISTS `notification_templates`;
CREATE TABLE `notification_templates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int NOT NULL,
  `template_for` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `sms_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `whatsapp_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bcc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_wa_notif` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notification_templates
-- ----------------------------
INSERT INTO `notification_templates` VALUES (1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2025-02-22 12:46:35', '2025-02-22 12:46:35');
INSERT INTO `notification_templates` VALUES (2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2025-02-22 12:46:35', '2025-02-22 12:46:35');
INSERT INTO `notification_templates` VALUES (3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2025-02-22 12:46:35', '2025-02-22 12:46:35');
INSERT INTO `notification_templates` VALUES (4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2025-02-22 12:46:35', '2025-02-22 12:46:35');
INSERT INTO `notification_templates` VALUES (5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2025-02-22 12:46:35', '2025-02-22 12:46:35');
INSERT INTO `notification_templates` VALUES (6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2025-02-22 12:46:35', '2025-02-22 12:46:35');
INSERT INTO `notification_templates` VALUES (7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2025-02-22 12:46:35', '2025-02-22 12:46:35');
INSERT INTO `notification_templates` VALUES (8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2025-02-22 12:46:35', '2025-02-22 12:46:35');
INSERT INTO `notification_templates` VALUES (9, 1, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2025-02-22 12:46:35', '2025-02-22 12:46:35');
INSERT INTO `notification_templates` VALUES (10, 1, 'purchase_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>', 'We have a new purchase order with reference number {order_ref_number}. {business_name}', NULL, 'New Purchase Order, from {business_name}', NULL, NULL, 0, 0, 0, '2025-02-22 12:46:35', '2025-02-22 12:46:35');

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `notifications_notifiable_type_notifiable_id_index`(`notifiable_type` ASC, `notifiable_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notifications
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_access_tokens_user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth_auth_codes
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_clients_user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_personal_access_clients_client_id_index`(`client_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_refresh_tokens_access_token_id_index`(`access_token_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'profit_loss_report.view', 'web', '2025-02-22 12:12:19', NULL);
INSERT INTO `permissions` VALUES (2, 'direct_sell.access', 'web', '2025-02-22 12:12:19', NULL);
INSERT INTO `permissions` VALUES (3, 'product.opening_stock', 'web', '2025-02-22 12:12:20', '2025-02-22 12:12:20');
INSERT INTO `permissions` VALUES (4, 'crud_all_bookings', 'web', '2025-02-22 12:12:21', '2025-02-22 12:12:21');
INSERT INTO `permissions` VALUES (5, 'crud_own_bookings', 'web', '2025-02-22 12:12:21', '2025-02-22 12:12:21');
INSERT INTO `permissions` VALUES (6, 'access_default_selling_price', 'web', '2025-02-22 12:12:21', '2025-02-22 12:12:21');
INSERT INTO `permissions` VALUES (7, 'purchase.payments', 'web', '2025-02-22 12:12:21', '2025-02-22 12:12:21');
INSERT INTO `permissions` VALUES (8, 'sell.payments', 'web', '2025-02-22 12:12:21', '2025-02-22 12:12:21');
INSERT INTO `permissions` VALUES (9, 'edit_product_price_from_sale_screen', 'web', '2025-02-22 12:12:21', '2025-02-22 12:12:21');
INSERT INTO `permissions` VALUES (10, 'edit_product_discount_from_sale_screen', 'web', '2025-02-22 12:12:21', '2025-02-22 12:12:21');
INSERT INTO `permissions` VALUES (11, 'roles.view', 'web', '2025-02-22 12:12:21', '2025-02-22 12:12:21');
INSERT INTO `permissions` VALUES (12, 'roles.create', 'web', '2025-02-22 12:12:21', '2025-02-22 12:12:21');
INSERT INTO `permissions` VALUES (13, 'roles.update', 'web', '2025-02-22 12:12:21', '2025-02-22 12:12:21');
INSERT INTO `permissions` VALUES (14, 'roles.delete', 'web', '2025-02-22 12:12:21', '2025-02-22 12:12:21');
INSERT INTO `permissions` VALUES (15, 'account.access', 'web', '2025-02-22 12:12:22', '2025-02-22 12:12:22');
INSERT INTO `permissions` VALUES (16, 'discount.access', 'web', '2025-02-22 12:12:22', '2025-02-22 12:12:22');
INSERT INTO `permissions` VALUES (17, 'view_purchase_price', 'web', '2025-02-22 12:12:22', '2025-02-22 12:12:22');
INSERT INTO `permissions` VALUES (18, 'view_own_sell_only', 'web', '2025-02-22 12:12:22', '2025-02-22 12:12:22');
INSERT INTO `permissions` VALUES (19, 'edit_product_discount_from_pos_screen', 'web', '2025-02-22 12:12:22', '2025-02-22 12:12:22');
INSERT INTO `permissions` VALUES (20, 'edit_product_price_from_pos_screen', 'web', '2025-02-22 12:12:22', '2025-02-22 12:12:22');
INSERT INTO `permissions` VALUES (21, 'access_shipping', 'web', '2025-02-22 12:12:22', '2025-02-22 12:12:22');
INSERT INTO `permissions` VALUES (22, 'purchase.update_status', 'web', '2025-02-22 12:12:22', '2025-02-22 12:12:22');
INSERT INTO `permissions` VALUES (23, 'list_drafts', 'web', '2025-02-22 12:12:23', '2025-02-22 12:12:23');
INSERT INTO `permissions` VALUES (24, 'list_quotations', 'web', '2025-02-22 12:12:23', '2025-02-22 12:12:23');
INSERT INTO `permissions` VALUES (25, 'view_cash_register', 'web', '2025-02-22 12:12:23', '2025-02-22 12:12:23');
INSERT INTO `permissions` VALUES (26, 'close_cash_register', 'web', '2025-02-22 12:12:23', '2025-02-22 12:12:23');
INSERT INTO `permissions` VALUES (27, 'print_invoice', 'web', '2025-02-22 12:12:24', '2025-02-22 12:12:24');
INSERT INTO `permissions` VALUES (28, 'user.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (29, 'user.create', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (30, 'user.update', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (31, 'user.delete', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (32, 'supplier.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (33, 'supplier.create', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (34, 'supplier.update', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (35, 'supplier.delete', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (36, 'customer.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (37, 'customer.create', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (38, 'customer.update', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (39, 'customer.delete', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (40, 'product.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (41, 'product.create', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (42, 'product.update', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (43, 'product.delete', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (44, 'purchase.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (45, 'purchase.create', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (46, 'purchase.update', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (47, 'purchase.delete', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (48, 'sell.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (49, 'sell.create', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (50, 'sell.update', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (51, 'sell.delete', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (52, 'purchase_n_sell_report.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (53, 'contacts_report.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (54, 'stock_report.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (55, 'tax_report.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (56, 'trending_product_report.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (57, 'register_report.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (58, 'sales_representative.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (59, 'expense_report.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (60, 'business_settings.access', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (61, 'barcode_settings.access', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (62, 'invoice_settings.access', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (63, 'brand.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (64, 'brand.create', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (65, 'brand.update', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (66, 'brand.delete', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (67, 'tax_rate.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (68, 'tax_rate.create', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (69, 'tax_rate.update', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (70, 'tax_rate.delete', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (71, 'unit.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (72, 'unit.create', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (73, 'unit.update', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (74, 'unit.delete', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (75, 'category.view', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (76, 'category.create', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (77, 'category.update', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (78, 'category.delete', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (79, 'expense.access', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (80, 'access_all_locations', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (81, 'dashboard.data', 'web', '2025-02-22 12:12:25', NULL);
INSERT INTO `permissions` VALUES (82, 'location.1', 'web', '2025-02-22 12:46:35', '2025-02-22 12:46:35');
INSERT INTO `permissions` VALUES (83, 'location.2', 'web', '2025-03-02 21:21:30', '2025-03-02 21:21:30');

-- ----------------------------
-- Table structure for printers
-- ----------------------------
DROP TABLE IF EXISTS `printers`;
CREATE TABLE `printers`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ip_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `port` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `printers_business_id_foreign`(`business_id` ASC) USING BTREE,
  CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of printers
-- ----------------------------

-- ----------------------------
-- Table structure for product_locations
-- ----------------------------
DROP TABLE IF EXISTS `product_locations`;
CREATE TABLE `product_locations`  (
  `product_id` int NOT NULL,
  `location_id` int NOT NULL,
  INDEX `product_locations_product_id_index`(`product_id` ASC) USING BTREE,
  INDEX `product_locations_location_id_index`(`location_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_locations
-- ----------------------------
INSERT INTO `product_locations` VALUES (1, 1);
INSERT INTO `product_locations` VALUES (2, 1);
INSERT INTO `product_locations` VALUES (3, 1);
INSERT INTO `product_locations` VALUES (4, 1);
INSERT INTO `product_locations` VALUES (5, 1);
INSERT INTO `product_locations` VALUES (10, 1);
INSERT INTO `product_locations` VALUES (11, 1);
INSERT INTO `product_locations` VALUES (13, 1);
INSERT INTO `product_locations` VALUES (14, 1);
INSERT INTO `product_locations` VALUES (15, 1);
INSERT INTO `product_locations` VALUES (17, 1);
INSERT INTO `product_locations` VALUES (19, 1);
INSERT INTO `product_locations` VALUES (20, 1);
INSERT INTO `product_locations` VALUES (21, 1);
INSERT INTO `product_locations` VALUES (23, 1);
INSERT INTO `product_locations` VALUES (28, 1);
INSERT INTO `product_locations` VALUES (31, 1);
INSERT INTO `product_locations` VALUES (33, 1);
INSERT INTO `product_locations` VALUES (34, 1);
INSERT INTO `product_locations` VALUES (35, 1);
INSERT INTO `product_locations` VALUES (36, 1);
INSERT INTO `product_locations` VALUES (37, 1);
INSERT INTO `product_locations` VALUES (38, 1);
INSERT INTO `product_locations` VALUES (41, 1);
INSERT INTO `product_locations` VALUES (43, 1);
INSERT INTO `product_locations` VALUES (44, 1);
INSERT INTO `product_locations` VALUES (45, 1);
INSERT INTO `product_locations` VALUES (47, 1);
INSERT INTO `product_locations` VALUES (51, 1);
INSERT INTO `product_locations` VALUES (55, 1);
INSERT INTO `product_locations` VALUES (57, 1);
INSERT INTO `product_locations` VALUES (60, 1);
INSERT INTO `product_locations` VALUES (61, 1);
INSERT INTO `product_locations` VALUES (62, 1);
INSERT INTO `product_locations` VALUES (63, 1);
INSERT INTO `product_locations` VALUES (65, 1);
INSERT INTO `product_locations` VALUES (67, 1);
INSERT INTO `product_locations` VALUES (68, 1);
INSERT INTO `product_locations` VALUES (69, 1);
INSERT INTO `product_locations` VALUES (71, 1);
INSERT INTO `product_locations` VALUES (72, 1);
INSERT INTO `product_locations` VALUES (73, 1);
INSERT INTO `product_locations` VALUES (75, 1);
INSERT INTO `product_locations` VALUES (77, 1);
INSERT INTO `product_locations` VALUES (78, 1);
INSERT INTO `product_locations` VALUES (80, 1);
INSERT INTO `product_locations` VALUES (81, 1);
INSERT INTO `product_locations` VALUES (85, 1);
INSERT INTO `product_locations` VALUES (90, 1);
INSERT INTO `product_locations` VALUES (92, 1);
INSERT INTO `product_locations` VALUES (93, 1);
INSERT INTO `product_locations` VALUES (95, 1);
INSERT INTO `product_locations` VALUES (99, 1);
INSERT INTO `product_locations` VALUES (111, 1);
INSERT INTO `product_locations` VALUES (112, 1);
INSERT INTO `product_locations` VALUES (113, 1);
INSERT INTO `product_locations` VALUES (114, 1);
INSERT INTO `product_locations` VALUES (117, 1);
INSERT INTO `product_locations` VALUES (118, 1);
INSERT INTO `product_locations` VALUES (123, 1);
INSERT INTO `product_locations` VALUES (124, 1);
INSERT INTO `product_locations` VALUES (127, 1);
INSERT INTO `product_locations` VALUES (128, 1);
INSERT INTO `product_locations` VALUES (130, 1);
INSERT INTO `product_locations` VALUES (131, 1);
INSERT INTO `product_locations` VALUES (132, 1);
INSERT INTO `product_locations` VALUES (135, 1);
INSERT INTO `product_locations` VALUES (136, 1);
INSERT INTO `product_locations` VALUES (138, 1);
INSERT INTO `product_locations` VALUES (139, 1);
INSERT INTO `product_locations` VALUES (141, 1);
INSERT INTO `product_locations` VALUES (142, 1);
INSERT INTO `product_locations` VALUES (143, 1);
INSERT INTO `product_locations` VALUES (144, 1);
INSERT INTO `product_locations` VALUES (145, 1);
INSERT INTO `product_locations` VALUES (153, 1);
INSERT INTO `product_locations` VALUES (155, 1);
INSERT INTO `product_locations` VALUES (156, 1);
INSERT INTO `product_locations` VALUES (158, 1);
INSERT INTO `product_locations` VALUES (162, 1);
INSERT INTO `product_locations` VALUES (163, 1);
INSERT INTO `product_locations` VALUES (164, 1);
INSERT INTO `product_locations` VALUES (166, 1);
INSERT INTO `product_locations` VALUES (167, 1);
INSERT INTO `product_locations` VALUES (171, 1);
INSERT INTO `product_locations` VALUES (172, 1);
INSERT INTO `product_locations` VALUES (174, 1);
INSERT INTO `product_locations` VALUES (175, 1);
INSERT INTO `product_locations` VALUES (177, 1);
INSERT INTO `product_locations` VALUES (179, 1);
INSERT INTO `product_locations` VALUES (180, 1);
INSERT INTO `product_locations` VALUES (181, 1);
INSERT INTO `product_locations` VALUES (182, 1);
INSERT INTO `product_locations` VALUES (42, 1);
INSERT INTO `product_locations` VALUES (42, 2);
INSERT INTO `product_locations` VALUES (143, 2);

-- ----------------------------
-- Table structure for product_racks
-- ----------------------------
DROP TABLE IF EXISTS `product_racks`;
CREATE TABLE `product_racks`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `rack` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `row` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `position` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_racks_business_id_index`(`business_id` ASC) USING BTREE,
  INDEX `product_racks_location_id_index`(`location_id` ASC) USING BTREE,
  INDEX `product_racks_product_id_index`(`product_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_racks
-- ----------------------------

-- ----------------------------
-- Table structure for product_variations
-- ----------------------------
DROP TABLE IF EXISTS `product_variations`;
CREATE TABLE `product_variations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `variation_template_id` int NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_variations_name_index`(`name` ASC) USING BTREE,
  INDEX `product_variations_product_id_index`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_variations
-- ----------------------------
INSERT INTO `product_variations` VALUES (1, NULL, 'DUMMY', 1, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (2, NULL, 'DUMMY', 2, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (3, NULL, 'DUMMY', 3, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (4, NULL, 'DUMMY', 4, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (5, NULL, 'DUMMY', 5, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (6, NULL, 'DUMMY', 6, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (7, NULL, 'DUMMY', 7, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (8, NULL, 'DUMMY', 8, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (9, NULL, 'DUMMY', 9, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (10, NULL, 'DUMMY', 10, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (11, NULL, 'DUMMY', 11, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (12, NULL, 'DUMMY', 12, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (13, NULL, 'DUMMY', 13, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (14, NULL, 'DUMMY', 14, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (15, NULL, 'DUMMY', 15, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (16, NULL, 'DUMMY', 16, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (17, NULL, 'DUMMY', 17, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (18, NULL, 'DUMMY', 18, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (19, NULL, 'DUMMY', 19, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (20, NULL, 'DUMMY', 20, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (21, NULL, 'DUMMY', 21, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (22, NULL, 'DUMMY', 22, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (23, NULL, 'DUMMY', 23, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (24, NULL, 'DUMMY', 24, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (25, NULL, 'DUMMY', 25, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (26, NULL, 'DUMMY', 26, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (27, NULL, 'DUMMY', 27, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (28, NULL, 'DUMMY', 28, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (29, NULL, 'DUMMY', 29, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (30, NULL, 'DUMMY', 30, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (31, NULL, 'DUMMY', 31, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (32, NULL, 'DUMMY', 32, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (33, NULL, 'DUMMY', 33, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (34, NULL, 'DUMMY', 34, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (35, NULL, 'DUMMY', 35, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (36, NULL, 'DUMMY', 36, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (37, NULL, 'DUMMY', 37, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (38, NULL, 'DUMMY', 38, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (39, NULL, 'DUMMY', 39, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (40, NULL, 'DUMMY', 40, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (41, NULL, 'DUMMY', 41, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (42, NULL, 'DUMMY', 42, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (43, NULL, 'DUMMY', 43, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (44, NULL, 'DUMMY', 44, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (45, NULL, 'DUMMY', 45, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (46, NULL, 'DUMMY', 46, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (47, NULL, 'DUMMY', 47, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (48, NULL, 'DUMMY', 48, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (49, NULL, 'DUMMY', 49, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (50, NULL, 'DUMMY', 50, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (51, NULL, 'DUMMY', 51, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (52, NULL, 'DUMMY', 52, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (53, NULL, 'DUMMY', 53, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (54, NULL, 'DUMMY', 54, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (55, NULL, 'DUMMY', 55, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (56, NULL, 'DUMMY', 56, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (57, NULL, 'DUMMY', 57, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (58, NULL, 'DUMMY', 58, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (59, NULL, 'DUMMY', 59, 1, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `product_variations` VALUES (60, NULL, 'DUMMY', 60, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (61, NULL, 'DUMMY', 61, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (62, NULL, 'DUMMY', 62, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (63, NULL, 'DUMMY', 63, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (64, NULL, 'DUMMY', 64, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (65, NULL, 'DUMMY', 65, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (66, NULL, 'DUMMY', 66, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (67, NULL, 'DUMMY', 67, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (68, NULL, 'DUMMY', 68, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (69, NULL, 'DUMMY', 69, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (70, NULL, 'DUMMY', 70, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (71, NULL, 'DUMMY', 71, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (72, NULL, 'DUMMY', 72, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (73, NULL, 'DUMMY', 73, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (74, NULL, 'DUMMY', 74, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (75, NULL, 'DUMMY', 75, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (76, NULL, 'DUMMY', 76, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (77, NULL, 'DUMMY', 77, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (78, NULL, 'DUMMY', 78, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (79, NULL, 'DUMMY', 79, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (80, NULL, 'DUMMY', 80, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (81, NULL, 'DUMMY', 81, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (82, NULL, 'DUMMY', 82, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (83, NULL, 'DUMMY', 83, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (84, NULL, 'DUMMY', 84, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (85, NULL, 'DUMMY', 85, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (86, NULL, 'DUMMY', 86, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (87, NULL, 'DUMMY', 87, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (88, NULL, 'DUMMY', 88, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (89, NULL, 'DUMMY', 89, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (90, NULL, 'DUMMY', 90, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (91, NULL, 'DUMMY', 91, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (92, NULL, 'DUMMY', 92, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (93, NULL, 'DUMMY', 93, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (94, NULL, 'DUMMY', 94, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (95, NULL, 'DUMMY', 95, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (96, NULL, 'DUMMY', 96, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (97, NULL, 'DUMMY', 97, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (98, NULL, 'DUMMY', 98, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (99, NULL, 'DUMMY', 99, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (100, NULL, 'DUMMY', 100, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (101, NULL, 'DUMMY', 101, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (102, NULL, 'DUMMY', 102, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (103, NULL, 'DUMMY', 103, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (104, NULL, 'DUMMY', 104, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (105, NULL, 'DUMMY', 105, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (106, NULL, 'DUMMY', 106, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (107, NULL, 'DUMMY', 107, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (108, NULL, 'DUMMY', 108, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (109, NULL, 'DUMMY', 109, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (110, NULL, 'DUMMY', 110, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (111, NULL, 'DUMMY', 111, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (112, NULL, 'DUMMY', 112, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (113, NULL, 'DUMMY', 113, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (114, NULL, 'DUMMY', 114, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (115, NULL, 'DUMMY', 115, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (116, NULL, 'DUMMY', 116, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (117, NULL, 'DUMMY', 117, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (118, NULL, 'DUMMY', 118, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (119, NULL, 'DUMMY', 119, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (120, NULL, 'DUMMY', 120, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (121, NULL, 'DUMMY', 121, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (122, NULL, 'DUMMY', 122, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (123, NULL, 'DUMMY', 123, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (124, NULL, 'DUMMY', 124, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (125, NULL, 'DUMMY', 125, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (126, NULL, 'DUMMY', 126, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (127, NULL, 'DUMMY', 127, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (128, NULL, 'DUMMY', 128, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (129, NULL, 'DUMMY', 129, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (130, NULL, 'DUMMY', 130, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (131, NULL, 'DUMMY', 131, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (132, NULL, 'DUMMY', 132, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (133, NULL, 'DUMMY', 133, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (134, NULL, 'DUMMY', 134, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (135, NULL, 'DUMMY', 135, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (136, NULL, 'DUMMY', 136, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (137, NULL, 'DUMMY', 137, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (138, NULL, 'DUMMY', 138, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (139, NULL, 'DUMMY', 139, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (140, NULL, 'DUMMY', 140, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (141, NULL, 'DUMMY', 141, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (142, NULL, 'DUMMY', 142, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (143, NULL, 'DUMMY', 143, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (144, NULL, 'DUMMY', 144, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (145, NULL, 'DUMMY', 145, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (146, NULL, 'DUMMY', 146, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (147, NULL, 'DUMMY', 147, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (148, NULL, 'DUMMY', 148, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (149, NULL, 'DUMMY', 149, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (150, NULL, 'DUMMY', 150, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (151, NULL, 'DUMMY', 151, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (152, NULL, 'DUMMY', 152, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (153, NULL, 'DUMMY', 153, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (154, NULL, 'DUMMY', 154, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (155, NULL, 'DUMMY', 155, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (156, NULL, 'DUMMY', 156, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (157, NULL, 'DUMMY', 157, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (158, NULL, 'DUMMY', 158, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (159, NULL, 'DUMMY', 159, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (160, NULL, 'DUMMY', 160, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (161, NULL, 'DUMMY', 161, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (162, NULL, 'DUMMY', 162, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (163, NULL, 'DUMMY', 163, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (164, NULL, 'DUMMY', 164, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (165, NULL, 'DUMMY', 165, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (166, NULL, 'DUMMY', 166, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (167, NULL, 'DUMMY', 167, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (168, NULL, 'DUMMY', 168, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (169, NULL, 'DUMMY', 169, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (170, NULL, 'DUMMY', 170, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (171, NULL, 'DUMMY', 171, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (172, NULL, 'DUMMY', 172, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (173, NULL, 'DUMMY', 173, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (174, NULL, 'DUMMY', 174, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (175, NULL, 'DUMMY', 175, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (176, NULL, 'DUMMY', 176, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (177, NULL, 'DUMMY', 177, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (178, NULL, 'DUMMY', 178, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (179, NULL, 'DUMMY', 179, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (180, NULL, 'DUMMY', 180, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (181, NULL, 'DUMMY', 181, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `product_variations` VALUES (182, NULL, 'DUMMY', 182, 1, '2025-02-26 12:50:34', '2025-02-26 12:50:34');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `unit_id` int UNSIGNED NULL DEFAULT NULL,
  `secondary_unit_id` int NULL DEFAULT NULL,
  `sub_unit_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `brand_id` int UNSIGNED NULL DEFAULT NULL,
  `category_id` int UNSIGNED NULL DEFAULT NULL,
  `sub_category_id` int UNSIGNED NULL DEFAULT NULL,
  `tax` int UNSIGNED NULL DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT 0,
  `alert_quantity` decimal(22, 4) NULL DEFAULT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'C128',
  `expiry_period` decimal(4, 2) NULL DEFAULT NULL,
  `expiry_period_type` enum('days','months') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field5` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field6` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field7` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field8` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field9` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field10` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field11` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field12` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field13` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field14` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field15` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field16` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field17` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field18` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field19` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_custom_field20` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` int UNSIGNED NOT NULL,
  `preparation_time_in_minutes` int NULL DEFAULT NULL,
  `warranty_id` int NULL DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT 0,
  `not_for_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `products_brand_id_foreign`(`brand_id` ASC) USING BTREE,
  INDEX `products_category_id_foreign`(`category_id` ASC) USING BTREE,
  INDEX `products_sub_category_id_foreign`(`sub_category_id` ASC) USING BTREE,
  INDEX `products_tax_foreign`(`tax` ASC) USING BTREE,
  INDEX `products_name_index`(`name` ASC) USING BTREE,
  INDEX `products_business_id_index`(`business_id` ASC) USING BTREE,
  INDEX `products_unit_id_index`(`unit_id` ASC) USING BTREE,
  INDEX `products_created_by_index`(`created_by` ASC) USING BTREE,
  INDEX `products_warranty_id_index`(`warranty_id` ASC) USING BTREE,
  INDEX `products_type_index`(`type` ASC) USING BTREE,
  INDEX `products_tax_type_index`(`tax_type` ASC) USING BTREE,
  INDEX `products_barcode_type_index`(`barcode_type` ASC) USING BTREE,
  INDEX `products_secondary_unit_id_index`(`secondary_unit_id` ASC) USING BTREE,
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'FJ 100 YUM YUM BLACK', 1, 'single', 2, NULL, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, 0.0000, 'FJ 100 POLOS', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (2, 'BAWANG BOMBAY XY', 1, 'single', 3, NULL, NULL, NULL, 2, NULL, NULL, 'inclusive', 1, 0.0000, 'BOMBAY', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (3, 'NAVEL EGYPT YARD 72', 1, 'single', 4, NULL, NULL, NULL, 3, NULL, NULL, 'inclusive', 1, 0.0000, 'NAVEL8', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (4, 'ANGGUR JARI SWEET AUST OKUKU', 1, 'single', 4, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'SHINE', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (5, 'LEMON  CALIFRESH 88', 1, 'single', 5, NULL, NULL, NULL, 5, NULL, NULL, 'inclusive', 1, 0.0000, 'LEMON8', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (6, 'CENTURY 60 FRESH 60', 1, 'single', 5, NULL, NULL, NULL, 6, NULL, NULL, 'inclusive', 1, 0.0000, 'CENTURY12', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (7, 'PACKAM ELEGIDO 90', 1, 'single', 5, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, 'PACKAM5', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (8, 'MUSCHAT DMX 10X500GR', 1, 'single', 2, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'BOAT', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (9, 'SANTANG MADU YUJI 8X750G', 1, 'single', 2, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'SANTANG13', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (10, 'BLUSH POHON 54', 1, 'single', 2, NULL, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, 0.0000, 'PHN2', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (11, 'LEMON FRESH 88,100  DUS PUTIH', 1, 'single', 2, NULL, NULL, NULL, 5, NULL, NULL, 'inclusive', 1, 0.0000, 'LMN9', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (12, 'BABY JAVA', 1, 'single', 6, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'APM8', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (13, 'FUJI 88 BLUSH WIDERWAYS', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, '88IJO', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (14, 'KURMA ANGGUR BARARI 12X600GR', 1, 'single', 2, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, '338', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (15, 'ASEM BANGKOK 2OX500GR PROMO', 1, 'single', 5, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, 'ASEM', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (16, 'PACKAM PROMO 90', 1, 'single', 2, NULL, NULL, NULL, 12, NULL, NULL, 'inclusive', 1, 0.0000, 'CAP60', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (17, 'KURMA PALM FRUIT 24X250GRM', 1, 'single', 2, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, 'PALM3', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (18, 'KURMA PALM FRUIT TANGKAI 24x250g BARU', 1, 'single', 2, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, 'PLAM SWEET8', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (19, 'BUNA SHIMEJI 40Pack X 150Gr', 1, 'single', 5, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, 'BUN', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (20, 'FUJI WANGSHAN 54 PREMIUM', 1, 'single', 2, NULL, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, 0.0000, 'WPRE', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (21, 'SHIMEJI WHITE 40X150GR', 1, 'single', 2, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, 'SHMJ', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (22, 'APEL FUJI SUNSHINE BLUE 54', 1, 'single', 2, NULL, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, 0.0000, '54PR', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (23, 'FUJI TOP IJO 88', 1, 'single', 2, NULL, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, 0.0000, 'FJJJ', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (24, 'PITA POLOS WARNA WARNI', 1, 'single', 7, NULL, NULL, NULL, 14, NULL, NULL, 'inclusive', 1, 0.0000, 'ANGR1', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (25, 'SAYUR KOL UNGU 10KG*', 1, 'single', 2, NULL, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, 0.0000, 'KOL1', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (26, 'SHINE MUSCAT HONESTMAN 10X500G', 1, 'single', 4, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'SHN1', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (27, 'MUSCHAT UNIFRESH 10X500GR', 1, 'single', 5, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'MS', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (28, 'FUJI BLUSH SUNMOON 54 13KG', 1, 'single', 2, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'FJ5', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (29, 'SHANTANG DAUN DONG FANG KTA', 1, 'single', 8, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'JRB', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (30, 'SWEET PEAR 45', 1, 'single', 2, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, 'SWEET', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (31, 'JERUK KIMKIT YUJI 12X500GR', 1, 'single', 2, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'KIMKIT', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (32, 'FUJI GIFT PACK 9', 1, 'single', 2, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'FUJ', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (33, 'WOKAM CITRUS 80', 1, 'single', 2, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'WO1', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (34, 'WOKAM MR.FRUIT SK 80', 1, 'single', 2, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'WOK', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (35, 'LENGKENG H MERAH', 1, 'single', 8, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, 'LKZ', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (36, 'DELIMA SAIRAJ SIZE 12', 1, 'single', 2, NULL, NULL, NULL, 17, NULL, NULL, 'inclusive', 1, 0.0000, 'DELIMA', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (37, 'ENOKI HUALU BLUE', 1, 'single', 2, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, 'ENOKI', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (38, 'PEAR GOLDEN SK 22 B', 1, 'single', 2, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, 'GOL1', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (39, 'PEAR XIANGLIE SU', 1, 'single', 5, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, 'XIANG', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (40, 'RED MUSCAT LADY 5KG promo', 1, 'single', 4, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'RED M', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (41, 'APEL MERAH LEFORE 125 20KG', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'AP SA', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (42, 'ANGGUR AUTUM IJO CRISP CADIME 3J', 1, 'single', 9, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'MR', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-03-02 21:38:52');
INSERT INTO `products` VALUES (43, 'YALI 80 HAONONG', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'YJ', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (44, 'ENOKI ADL', 1, 'single', 5, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, 'AS', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (45, 'YALI 80 JICHANGXING', 1, 'single', 2, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, 'YLL1', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (46, 'WRAP  30 CM TEBAL', 1, 'single', 1, NULL, NULL, NULL, 20, NULL, NULL, 'inclusive', 1, 0.0000, 'EV', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (47, 'YALI 96 YULONG', 1, 'single', 2, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, 'Y2', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (48, 'APEL ROYAL GALA POLAND 100', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'APK', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (49, 'PONKAM L JOSH', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'PN', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (50, 'PONKAM M JOSH HDL', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'PNK', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (51, 'KIWI GREEN QIFENG', 1, 'single', 4, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, 'DR', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (52, 'WOGAN  FRESH 85', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'WK', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (53, 'FUJI 113 MERAK', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'FL', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (54, 'APEL MERAH USA JOYFUL 138', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'AP T', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (55, 'FUJI BLUSH TAN SUN FRESH 66', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'FD', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (56, 'SATANG WIDER WAYS 8X750GR', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'PP', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (57, 'WOGAN DINO XL 80', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'WM', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (58, 'JERUK HONET TANGERIN DINO 10X600GR', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'PC', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (59, 'LENGKENG EMAS MP', 1, 'single', 8, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, 'LONG', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `products` VALUES (60, 'SANTANG TANGERIN YUJI', 1, 'single', 4, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'SN', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (61, 'FUJI BLUSH ALWIN 54 13KG', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'AW', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (62, 'CENTURI 60 CHANGHUA', 1, 'single', 5, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, 'CT', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (63, 'ANGGUR PERU VERFRUIT XL', 1, 'single', 9, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'MC', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (64, 'JERUK NAVEL LQ PROMO', 1, 'single', 4, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'NV', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (65, 'FUJI BLUSH 54 ROSY WIDER', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'FY', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (66, 'PONKAM HDL  FY L 9KG', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'DF', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (67, 'APEL HUANIU LONTRUE', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'FJW', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (68, 'FUJI BLUSH 54 SUNPRIDE', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'FP', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (69, 'WOGAN WONDER 8BAGX800GR', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'WC', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (70, 'CENTURY 60 JIJINUO', 1, 'single', 5, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, 'DH', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (71, 'FUJI BLUSH 88 LAIWU MANHING', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'HU', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (72, 'APEL POHON 54 NAVY', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'HN', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (73, 'AUTUM MIDNIGHT BEAUTY 888', 1, 'single', 5, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'AK', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (74, 'KRANJANG OVAL BIJIAN', 1, 'single', 10, NULL, NULL, NULL, 22, NULL, NULL, 'inclusive', 1, 0.0000, 'AU', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (75, 'ANGGUR MERAH KTA KTA HITAM', 1, 'single', 8, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'XL', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (76, 'KUCANG SULTAN', 1, 'single', 11, NULL, NULL, NULL, 23, NULL, NULL, 'inclusive', 1, 0.0000, 'PR', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (77, 'WOGAN DINO L', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'WD', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (78, 'FUJI 88 TOP HITAM', 1, 'single', 5, NULL, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, 0.0000, 'ALL W1', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (79, 'KLENGKENG MERAH XL', 1, 'single', 4, NULL, NULL, NULL, 24, NULL, NULL, 'inclusive', 1, 0.0000, 'K E', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (80, 'APEL MERAH ORCHARDS 125', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'RDF', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (81, 'PEAR SINGO SK', 1, 'single', 5, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, 'SG', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (82, 'GOLDEN XIANG NONG GIFT PACK 10', 1, 'single', 5, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, 'YI', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (83, 'ES TELER SR', 1, 'single', 5, NULL, NULL, NULL, 25, NULL, NULL, 'inclusive', 1, 0.0000, 'SM', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (84, 'KIWI HAYWARD LUCKY 27', 1, 'single', 4, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, 'KW', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (85, 'SATANG TANGGERIN YUMI', 1, 'single', 8, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'TG', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (86, 'KELAPA THAILANDVACUUM TP 12s', 1, 'single', 5, NULL, NULL, NULL, 26, NULL, NULL, 'inclusive', 1, 0.0000, 'AM', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (87, 'APEL IJO GRANNY SMITH AFRIKA', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'GS', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (88, 'KIWI GOLD', 1, 'single', 5, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, 'KWG', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (89, 'KIWI RED 5,8KG PACK', 1, 'single', 5, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, 'KR', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (90, 'KLENGKENG H EMAS', 1, 'single', 4, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, 'BR', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (91, 'BOMBAY CAMBRIT', 1, 'single', 3, NULL, NULL, NULL, 2, NULL, NULL, 'inclusive', 1, 0.0000, 'RION', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (92, 'PEAR GOLDEN FLOURISH 22', 1, 'single', 2, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, 'SKM', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (93, 'LENGKENG  BIRU MP', 1, 'single', 8, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, 'LG', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (94, 'PEAR SINGO KOREA 27', 1, 'single', 2, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, 'SA', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (95, 'FUJI 100 AK DUS MERAH', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'TE', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (96, 'FUJI 88 MERAK', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'TM', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (97, 'MUSCAT LOS POCONG AA', 1, 'single', 5, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'MU', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (98, 'GOLDEN WANGSAN 14', 1, 'single', 5, NULL, NULL, NULL, 18, NULL, NULL, 'inclusive', 1, 0.0000, 'GD', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (99, 'PONKAM XL DINOFRESH', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'PKM', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (100, 'NAVEL WONDER 72', 1, 'single', 8, NULL, NULL, NULL, 3, NULL, NULL, 'inclusive', 1, 0.0000, 'NO', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (101, 'WAWACAI 20X300GR', 1, 'single', 5, NULL, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, 0.0000, 'WW', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (102, 'CELERY 10KG', 1, 'single', 5, NULL, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, 0.0000, 'CL', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (103, 'BROKOLI 7KG', 1, 'single', 5, NULL, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, 0.0000, 'BC', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (104, 'BABY SHANGHAI 4KG', 1, 'single', 5, NULL, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, 0.0000, 'BS', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (105, 'BABY PAKCOY 4KG', 1, 'single', 5, NULL, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, 0.0000, 'BP', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (106, 'GAILAN 5KG', 1, 'single', 5, NULL, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, 0.0000, 'GA', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (107, 'JAGUNG PUTIH 5KG', 1, 'single', 5, NULL, NULL, NULL, 27, NULL, NULL, 'inclusive', 1, 0.0000, 'JK', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (108, 'FUJI 80 FUJIMAN', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'F1', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (109, 'PEAR SINGO WANGSAN 14', 1, 'single', 5, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'SF', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (110, 'PERSIMON DINOFRESH 40S', 1, 'single', 5, NULL, NULL, NULL, 28, NULL, NULL, 'inclusive', 1, 0.0000, 'PS', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (111, 'JAMUR SALJU 40X150GR', 1, 'single', 5, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, 'JS', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (112, 'KING OYSTER 30X200GR', 1, 'single', 5, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, 'KO', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (113, 'POHON PEAR AUTUM HONEY LOTUS', 1, 'single', 5, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, 'AH', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (114, 'XIANGLI XIBAO 170GR', 1, 'single', 5, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, 'XM', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (115, 'OVAL BIJIAN', 1, 'single', 10, NULL, NULL, NULL, 22, NULL, NULL, 'inclusive', 1, 0.0000, 'S3', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (116, 'WOGAN DAUN WONDER', 1, 'single', 4, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'MW', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (117, 'PAPAGAN TSU XXL', 1, 'single', 4, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'PG', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (118, 'ENOKI  IJO GAJAH', 1, 'single', 5, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, 'EG', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (119, 'APEL VENUS WANGSAN 36', 1, 'single', 2, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'WN', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (120, 'CABE HIJAU 8KG', 1, 'single', 2, NULL, NULL, NULL, 29, NULL, NULL, 'inclusive', 1, 0.0000, 'WS', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (121, 'BLUBERRY DRISCOL 125X12PCK', 1, 'single', 2, NULL, NULL, NULL, 30, NULL, NULL, 'inclusive', 1, 0.0000, 'BLUBER', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (122, 'PEAR CROWN DINOFRESH 48', 1, 'single', 2, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, 'PER', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (123, 'SATANG PURE SWEET YUJI 8X750GR', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'STC', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (124, 'FUJI 100 TOP HITAM', 1, 'single', 5, NULL, NULL, NULL, 9, NULL, NULL, 'inclusive', 1, 0.0000, 'GZ', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (125, 'SANTANG TANGERIN KTA 8X750G', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'SS', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (126, 'KURMA GOLDEN VALLEY', 1, 'single', 2, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, 'KG', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (127, 'LEMON CALI FRESH 100', 1, 'single', 2, NULL, NULL, NULL, 5, NULL, NULL, 'inclusive', 1, 0.0000, 'LC', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (128, 'JERUK PAPAGAN 2XL', 1, 'single', 4, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'PA', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (129, 'KURMA AJWA BARARI 12X500GR', 1, 'single', 5, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, 'AJ', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (130, 'SATANG UNIFRESH', 1, 'single', 8, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'AA', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (131, 'KISMIS RAISINS MEDLEY', 1, 'single', 2, NULL, NULL, NULL, 31, NULL, NULL, 'inclusive', 1, 0.0000, 'KS', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (132, 'JERUK KINO CHASE 60', 1, 'single', 2, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'KM', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (133, 'ICEBERG LETTUCE 7KG', 1, 'single', 2, NULL, NULL, NULL, 32, NULL, NULL, 'inclusive', 1, 0.0000, 'KIS', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (134, 'KISMIS RAISINS GREEN', 1, 'single', 2, NULL, NULL, NULL, 31, NULL, NULL, 'inclusive', 1, 0.0000, 'KRS', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (135, 'PALM FRUIT 12X500GR', 1, 'single', 5, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, 'PF', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (136, 'BLUBERRY JUMBO JOYVIO 12X125GR', 1, 'single', 2, NULL, NULL, NULL, 33, NULL, NULL, 'inclusive', 1, 0.0000, 'BBL', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (137, 'JAMUR SHITTAKE 25X200GR', 1, 'single', 12, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, 'SHT', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (138, 'WOGAN BAG POP 9X800GR', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'WO', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (139, 'KOL UNGU 10KG DM', 1, 'single', 5, NULL, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, 0.0000, 'KK', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (140, 'SATANG DAUN MANDARIN YX', 1, 'single', 8, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'SW', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (141, 'ANGGUR IJO IVORY 9KG', 1, 'single', 5, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'AI', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (142, 'LENGKENG H IJO', 1, 'single', 8, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, 'L1', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (143, 'ANGGUR CINA KTA BLUE', 1, 'single', 8, NULL, NULL, NULL, 34, NULL, NULL, 'inclusive', 1, 0.0000, 'AP', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (144, 'PONKAM DINO OCTAGON XL', 1, 'single', 1, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'PO', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (145, 'BROKOLI IMPOR 7KG', 1, 'single', 5, NULL, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, 0.0000, 'BK', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (146, 'SWEET OAT 4KG', 1, 'single', 5, NULL, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, 0.0000, 'SO', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (147, 'JAGUNG BLACK CORN 5KG', 1, 'single', 5, NULL, NULL, NULL, 27, NULL, NULL, 'inclusive', 1, 0.0000, 'JH', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (148, 'JAGUNG YELLOW5KG', 1, 'single', 5, NULL, NULL, NULL, 27, NULL, NULL, 'inclusive', 1, 0.0000, 'JY', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (149, 'PONKAM M CALIFRESH 9KG', 1, 'single', 2, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'PM', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (150, 'PONKAM SEGI 8 15', 1, 'single', 2, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'PK', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (151, 'K.SET 3 SILANG PUTIH', 1, 'single', 13, NULL, NULL, NULL, 22, NULL, NULL, 'inclusive', 1, 0.0000, 'PON', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (152, 'SOUTH CHERY TASMANIAN', 1, 'single', 2, NULL, NULL, NULL, 35, NULL, NULL, 'inclusive', 1, 0.0000, 'CH', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (153, 'KIWI GOLD QIFENG', 1, 'single', 4, NULL, NULL, NULL, 21, NULL, NULL, 'inclusive', 1, 0.0000, 'KI', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (154, 'XIANGLIE FAGRANT RUYI GOLD', 1, 'single', 2, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, 'XN', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (155, 'LENGKENG MP MEERAH', 1, 'single', 8, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, 'LB', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (156, 'KINO NATIONAL 60', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'KC', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (157, 'NAVEL DINOFRESH 56', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'ND', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (158, 'WOKAM FERTILE 1KGX8BAG', 1, 'single', 5, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'WF', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (159, 'JAMUR SHITAKE FLOWER 25X200GR', 1, 'single', 5, NULL, NULL, NULL, 13, NULL, NULL, 'inclusive', 1, 0.0000, 'SH', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (160, 'GARLIC SPROUT 10KG', 1, 'single', 5, NULL, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, 0.0000, 'G', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (161, 'KAPRI SNAP PEAS 30X130GR', 1, 'single', 5, NULL, NULL, NULL, 15, NULL, NULL, 'inclusive', 1, 0.0000, 'KP', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (162, 'YALI 80 SUNING', 1, 'single', 2, NULL, NULL, NULL, 7, NULL, NULL, 'inclusive', 1, 0.0000, 'YA', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (163, 'KURMA GOLDEN VALLEY 10KG', 1, 'single', 2, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, 'GV', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (164, 'YALI 96 COOL', 1, 'single', 5, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, 'Y3', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (165, 'keranjang nanas warna', 1, 'single', 1, NULL, NULL, NULL, 36, NULL, NULL, 'inclusive', 1, 0.0000, 'NNNB', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (166, 'TUNISIA MADU 5KG BARARI', 1, 'single', 5, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, 'TN', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (167, 'CENTURI 60 JIHONLY', 1, 'single', 5, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, 'RY', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (168, 'CENTURI 60 BIRU', 1, 'single', 5, NULL, NULL, NULL, 19, NULL, NULL, 'inclusive', 1, 0.0000, 'TR', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (169, 'KINO NATIONAL 66', 1, 'single', 2, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'KN', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (170, 'AUTUM CRISP JJ ECOSAC', 1, 'single', 8, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'AUE', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (171, 'KURMA MESIR BARARI 12X1KG', 1, 'single', 5, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, 'KB', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (172, 'KURMA UAE ZAHIDI 20X500GR', 1, 'single', 5, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, 'KZ', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (173, 'KLENGKENG H KUNING', 1, 'single', 4, NULL, NULL, NULL, 24, NULL, NULL, 'inclusive', 1, 0.0000, 'KL', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (174, 'LENGKENG IJO JS', 1, 'single', 8, NULL, NULL, NULL, 16, NULL, NULL, 'inclusive', 1, 0.0000, 'LJ', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (175, 'KURMA KHALAS 28X250GR', 1, 'single', 5, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, 'KH', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (176, 'KURMA KHALAS 20X500GR', 1, 'single', 5, NULL, NULL, NULL, 10, NULL, NULL, 'inclusive', 1, 0.0000, 'KA', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (177, 'DELIMA INDIAN', 1, 'single', 2, NULL, NULL, NULL, 17, NULL, NULL, 'inclusive', 1, 0.0000, 'DL', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (178, 'STRAWBERRY 330GRX4', 1, 'single', 2, NULL, NULL, NULL, 37, NULL, NULL, 'inclusive', 1, 0.0000, 'ST', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (179, 'KINGBERRY KOREA', 1, 'single', 14, NULL, NULL, NULL, 38, NULL, NULL, 'inclusive', 1, 0.0000, 'KBR', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (180, 'ANGGUR IJO IVORY AUSY', 1, 'single', 5, NULL, NULL, NULL, 4, NULL, NULL, 'inclusive', 1, 0.0000, 'AV', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (181, 'PAPAGAN 3XL TSU', 1, 'single', 8, NULL, NULL, NULL, 8, NULL, NULL, 'inclusive', 1, 0.0000, 'P3', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `products` VALUES (182, 'SWEET TAMRIND 40PACKX250GR', 1, 'single', 5, NULL, NULL, NULL, 11, NULL, NULL, 'inclusive', 1, 0.0000, 'AB', 'C128', NULL, NULL, 0, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, NULL, 0, 0, '2025-02-26 12:50:34', '2025-02-26 12:50:34');

-- ----------------------------
-- Table structure for purchase_lines
-- ----------------------------
DROP TABLE IF EXISTS `purchase_lines`;
CREATE TABLE `purchase_lines`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `secondary_unit_quantity` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `pp_without_discount` decimal(22, 4) NOT NULL DEFAULT 0.0000 COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5, 2) NOT NULL DEFAULT 0.00 COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22, 4) NOT NULL,
  `purchase_price_inc_tax` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(22, 4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int UNSIGNED NULL DEFAULT NULL,
  `purchase_requisition_line_id` int NULL DEFAULT NULL,
  `purchase_order_line_id` int NULL DEFAULT NULL,
  `quantity_sold` decimal(22, 4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22, 4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `po_quantity_purchased` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `mfg_quantity_used` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `mfg_date` date NULL DEFAULT NULL,
  `exp_date` date NULL DEFAULT NULL,
  `lot_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sub_unit_id` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `purchase_lines_transaction_id_foreign`(`transaction_id` ASC) USING BTREE,
  INDEX `purchase_lines_product_id_foreign`(`product_id` ASC) USING BTREE,
  INDEX `purchase_lines_variation_id_foreign`(`variation_id` ASC) USING BTREE,
  INDEX `purchase_lines_tax_id_foreign`(`tax_id` ASC) USING BTREE,
  INDEX `purchase_lines_sub_unit_id_index`(`sub_unit_id` ASC) USING BTREE,
  INDEX `purchase_lines_lot_number_index`(`lot_number` ASC) USING BTREE,
  CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of purchase_lines
-- ----------------------------
INSERT INTO `purchase_lines` VALUES (1, 1, 1, 1, 171.0000, 0.0000, 370000.0000, 0.00, 370000.0000, 370000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (2, 2, 2, 2, 32.0000, 0.0000, 250000.0000, 0.00, 250000.0000, 250000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (3, 3, 3, 3, 27.0000, 0.0000, 280000.0000, 0.00, 280000.0000, 280000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (4, 4, 4, 4, 49.0000, 0.0000, 650000.0000, 0.00, 650000.0000, 650000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (5, 5, 5, 5, 13.0000, 0.0000, 320000.0000, 0.00, 320000.0000, 320000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (6, 6, 10, 10, 3.0000, 0.0000, 700000.0000, 0.00, 700000.0000, 700000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (7, 7, 11, 11, 97.0000, 0.0000, 250000.0000, 0.00, 250000.0000, 250000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (8, 8, 13, 13, 48.0000, 0.0000, 660000.0000, 0.00, 660000.0000, 660000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (9, 9, 14, 14, 42.0000, 0.0000, 415000.0000, 0.00, 415000.0000, 415000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (10, 10, 15, 15, 1.0000, 0.0000, 550000.0000, 0.00, 550000.0000, 550000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (11, 11, 17, 17, 38.0000, 0.0000, 325000.0000, 0.00, 325000.0000, 325000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (12, 12, 19, 19, 1.0000, 0.0000, 280000.0000, 0.00, 280000.0000, 280000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (13, 13, 20, 20, 20.0000, 0.0000, 690000.0000, 0.00, 690000.0000, 690000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (14, 14, 21, 21, 7.0000, 0.0000, 280000.0000, 0.00, 280000.0000, 280000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (15, 15, 23, 23, 97.0000, 0.0000, 410000.0000, 0.00, 410000.0000, 410000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (16, 16, 28, 28, 45.0000, 0.0000, 540000.0000, 0.00, 540000.0000, 540000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (17, 17, 31, 31, 3.0000, 0.0000, 220000.0000, 0.00, 220000.0000, 220000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (18, 18, 33, 33, 7.0000, 0.0000, 210000.0000, 0.00, 210000.0000, 210000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (19, 19, 34, 34, 223.0000, 0.0000, 230000.0000, 0.00, 230000.0000, 230000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (20, 20, 35, 35, 50.0000, 0.0000, 320000.0000, 0.00, 320000.0000, 320000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (21, 21, 36, 36, 13.0000, 0.0000, 200000.0000, 0.00, 200000.0000, 200000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (22, 22, 37, 37, 2.0000, 0.0000, 85000.0000, 0.00, 85000.0000, 85000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (23, 23, 38, 38, 7.0000, 0.0000, 230000.0000, 0.00, 230000.0000, 230000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (24, 24, 41, 41, 29.0000, 0.0000, 630000.0000, 0.00, 630000.0000, 630000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (25, 25, 42, 42, 20.0000, 0.0000, 725000.0000, 0.00, 725000.0000, 725000.0000, 0.0000, NULL, NULL, NULL, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-03-03 20:13:02');
INSERT INTO `purchase_lines` VALUES (26, 26, 43, 43, 44.0000, 0.0000, 180000.0000, 0.00, 180000.0000, 180000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (27, 27, 44, 44, 82.0000, 0.0000, 90000.0000, 0.00, 90000.0000, 90000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (28, 28, 45, 45, 131.0000, 0.0000, 170000.0000, 0.00, 170000.0000, 170000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (29, 29, 47, 47, 11.0000, 0.0000, 190000.0000, 0.00, 190000.0000, 190000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (30, 30, 51, 51, 54.0000, 0.0000, 260000.0000, 0.00, 260000.0000, 260000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (31, 31, 55, 55, 7.0000, 0.0000, 530000.0000, 0.00, 530000.0000, 530000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (32, 32, 57, 57, 16.0000, 0.0000, 335000.0000, 0.00, 335000.0000, 335000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `purchase_lines` VALUES (33, 33, 60, 60, 253.0000, 0.0000, 195000.0000, 0.00, 195000.0000, 195000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (34, 34, 61, 61, 11.0000, 0.0000, 560000.0000, 0.00, 560000.0000, 560000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (35, 35, 62, 62, 6.0000, 0.0000, 200000.0000, 0.00, 200000.0000, 200000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (36, 36, 63, 63, 12.0000, 0.0000, 450000.0000, 0.00, 450000.0000, 450000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (37, 37, 65, 65, 36.0000, 0.0000, 625000.0000, 0.00, 625000.0000, 625000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (38, 38, 67, 67, 67.0000, 0.0000, 272500.0000, 0.00, 272500.0000, 272500.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (39, 39, 68, 68, 4.0000, 0.0000, 570000.0000, 0.00, 570000.0000, 570000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (40, 40, 69, 69, 21.0000, 0.0000, 200000.0000, 0.00, 200000.0000, 200000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (41, 41, 71, 71, 42.0000, 0.0000, 520000.0000, 0.00, 520000.0000, 520000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (42, 42, 72, 72, 36.0000, 0.0000, 680000.0000, 0.00, 680000.0000, 680000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (43, 43, 73, 73, 42.0000, 0.0000, 600000.0000, 0.00, 600000.0000, 600000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (44, 44, 75, 75, 192.0000, 0.0000, 195000.0000, 0.00, 195000.0000, 195000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (45, 45, 77, 77, 101.0000, 0.0000, 310000.0000, 0.00, 310000.0000, 310000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (46, 46, 78, 78, 2.0000, 0.0000, 420000.0000, 0.00, 420000.0000, 420000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (47, 47, 80, 80, 21.0000, 0.0000, 620000.0000, 0.00, 620000.0000, 620000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (48, 48, 81, 81, 13.0000, 0.0000, 220000.0000, 0.00, 220000.0000, 220000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (49, 49, 85, 85, 14.0000, 0.0000, 195000.0000, 0.00, 195000.0000, 195000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (50, 50, 90, 90, 6.0000, 0.0000, 340000.0000, 0.00, 340000.0000, 340000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (51, 51, 92, 92, 20.0000, 0.0000, 230000.0000, 0.00, 230000.0000, 230000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (52, 52, 93, 93, 118.0000, 0.0000, 300000.0000, 0.00, 300000.0000, 300000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (53, 53, 95, 95, 123.0000, 0.0000, 350000.0000, 0.00, 350000.0000, 350000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (54, 54, 99, 99, 2.0000, 0.0000, 210000.0000, 0.00, 210000.0000, 210000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (55, 55, 111, 111, 2.0000, 0.0000, 260000.0000, 0.00, 260000.0000, 260000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (56, 56, 112, 112, 3.0000, 0.0000, 270000.0000, 0.00, 270000.0000, 270000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (57, 57, 113, 113, 18.0000, 0.0000, 300000.0000, 0.00, 300000.0000, 300000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (58, 58, 114, 114, 16.0000, 0.0000, 185000.0000, 0.00, 185000.0000, 185000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (59, 59, 117, 117, 6.0000, 0.0000, 400000.0000, 0.00, 400000.0000, 400000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (60, 60, 118, 118, 77.0000, 0.0000, 90000.0000, 0.00, 90000.0000, 90000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (61, 61, 123, 123, 237.0000, 0.0000, 290000.0000, 0.00, 290000.0000, 290000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (62, 62, 124, 124, 21.0000, 0.0000, 420000.0000, 0.00, 420000.0000, 420000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (63, 63, 127, 127, 21.0000, 0.0000, 310000.0000, 0.00, 310000.0000, 310000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (64, 64, 128, 128, 25.0000, 0.0000, 370000.0000, 0.00, 370000.0000, 370000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (65, 65, 130, 130, 197.0000, 0.0000, 195000.0000, 0.00, 195000.0000, 195000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (66, 66, 131, 131, 1.0000, 0.0000, 1005000.0000, 0.00, 1005000.0000, 1005000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (67, 67, 132, 132, 100.0000, 0.0000, 130000.0000, 0.00, 130000.0000, 130000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (68, 68, 135, 135, 74.0000, 0.0000, 550000.0000, 0.00, 550000.0000, 550000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (69, 69, 136, 136, 9.0000, 0.0000, 450000.0000, 0.00, 450000.0000, 450000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (70, 70, 138, 138, 45.0000, 0.0000, 210000.0000, 0.00, 210000.0000, 210000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (71, 71, 139, 139, 2.0000, 0.0000, 170000.0000, 0.00, 170000.0000, 170000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (72, 72, 141, 141, 1.0000, 0.0000, 480000.0000, 0.00, 480000.0000, 480000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (73, 73, 142, 142, 2.0000, 0.0000, 280000.0000, 0.00, 280000.0000, 280000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (74, 74, 143, 143, 3.0000, 0.0000, 185000.0000, 0.00, 185000.0000, 185000.0000, 0.0000, NULL, NULL, NULL, 1.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-03-02 21:57:01');
INSERT INTO `purchase_lines` VALUES (75, 75, 144, 144, 34.0000, 0.0000, 175000.0000, 0.00, 175000.0000, 175000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (76, 76, 145, 145, 3.0000, 0.0000, 250000.0000, 0.00, 250000.0000, 250000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (77, 77, 153, 153, 1.0000, 0.0000, 420000.0000, 0.00, 420000.0000, 420000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (78, 78, 155, 155, 98.0000, 0.0000, 310000.0000, 0.00, 310000.0000, 310000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (79, 79, 156, 156, 47.0000, 0.0000, 130000.0000, 0.00, 130000.0000, 130000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (80, 80, 158, 158, 12.0000, 0.0000, 220000.0000, 0.00, 220000.0000, 220000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (81, 81, 162, 162, 198.0000, 0.0000, 185000.0000, 0.00, 185000.0000, 185000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (82, 82, 163, 163, 552.0000, 0.0000, 195000.0000, 0.00, 195000.0000, 195000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (83, 83, 164, 164, 146.0000, 0.0000, 200000.0000, 0.00, 200000.0000, 200000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (84, 84, 166, 166, 58.0000, 0.0000, 215000.0000, 0.00, 215000.0000, 215000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (85, 85, 167, 167, 124.0000, 0.0000, 200000.0000, 0.00, 200000.0000, 200000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (86, 86, 171, 171, 2.0000, 0.0000, 280000.0000, 0.00, 280000.0000, 280000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (87, 87, 172, 172, 8.0000, 0.0000, 350000.0000, 0.00, 350000.0000, 350000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (88, 88, 174, 174, 52.0000, 0.0000, 270000.0000, 0.00, 270000.0000, 270000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (89, 89, 175, 175, 6.0000, 0.0000, 325000.0000, 0.00, 325000.0000, 325000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (90, 90, 177, 177, 28.0000, 0.0000, 200000.0000, 0.00, 200000.0000, 200000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (91, 91, 179, 179, 12.0000, 0.0000, 100000.0000, 0.00, 100000.0000, 100000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (92, 92, 180, 180, 15.0000, 0.0000, 460000.0000, 0.00, 460000.0000, 460000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (93, 93, 181, 181, 130.0000, 0.0000, 370000.0000, 0.00, 370000.0000, 370000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (94, 94, 182, 182, 5.0000, 0.0000, 750000.0000, 0.00, 750000.0000, 750000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `purchase_lines` VALUES (95, 96, 42, 42, 10.0000, 0.0000, 0.0000, 0.00, 725000.0000, 725000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-03-02 21:29:16', '2025-03-02 21:29:16');
INSERT INTO `purchase_lines` VALUES (96, 97, 42, 42, 8.0000, 0.0000, 725000.0000, 0.00, 725000.0000, 725000.0000, 0.0000, NULL, NULL, NULL, 6.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-03-02 21:39:33', '2025-03-03 19:59:01');
INSERT INTO `purchase_lines` VALUES (97, 100, 143, 143, 1.0000, 0.0000, 0.0000, 0.00, 185000.0000, 185000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2025-03-02 21:57:01', '2025-03-02 21:57:01');

-- ----------------------------
-- Table structure for reference_counts
-- ----------------------------
DROP TABLE IF EXISTS `reference_counts`;
CREATE TABLE `reference_counts`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ref_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int NOT NULL,
  `business_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reference_counts_business_id_index`(`business_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reference_counts
-- ----------------------------
INSERT INTO `reference_counts` VALUES (1, 'contacts', 90, 1, '2025-02-22 12:46:35', '2025-03-03 19:57:33');
INSERT INTO `reference_counts` VALUES (2, 'business_location', 2, 1, '2025-02-22 12:46:35', '2025-03-02 21:21:30');
INSERT INTO `reference_counts` VALUES (3, 'stock_transfer', 2, 1, '2025-03-02 21:29:16', '2025-03-02 21:57:01');
INSERT INTO `reference_counts` VALUES (4, 'sell_payment', 4, 1, '2025-03-02 21:41:17', '2025-03-03 20:15:36');
INSERT INTO `reference_counts` VALUES (5, 'sell_return', 1, 1, '2025-03-03 20:13:02', '2025-03-03 20:13:02');

-- ----------------------------
-- Table structure for res_product_modifier_sets
-- ----------------------------
DROP TABLE IF EXISTS `res_product_modifier_sets`;
CREATE TABLE `res_product_modifier_sets`  (
  `modifier_set_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product',
  INDEX `res_product_modifier_sets_modifier_set_id_foreign`(`modifier_set_id` ASC) USING BTREE,
  CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of res_product_modifier_sets
-- ----------------------------

-- ----------------------------
-- Table structure for res_tables
-- ----------------------------
DROP TABLE IF EXISTS `res_tables`;
CREATE TABLE `res_tables`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `res_tables_business_id_foreign`(`business_id` ASC) USING BTREE,
  CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of res_tables
-- ----------------------------

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id` ASC) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (25, 2);
INSERT INTO `role_has_permissions` VALUES (26, 2);
INSERT INTO `role_has_permissions` VALUES (48, 2);
INSERT INTO `role_has_permissions` VALUES (49, 2);
INSERT INTO `role_has_permissions` VALUES (50, 2);
INSERT INTO `role_has_permissions` VALUES (51, 2);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_service_staff` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `roles_business_id_foreign`(`business_id` ASC) USING BTREE,
  CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Admin#1', 'web', 1, 1, 0, '2025-02-22 12:46:35', '2025-02-22 12:46:35');
INSERT INTO `roles` VALUES (2, 'Cashier#1', 'web', 1, 0, 0, '2025-02-22 12:46:35', '2025-02-22 12:46:35');

-- ----------------------------
-- Table structure for sell_line_warranties
-- ----------------------------
DROP TABLE IF EXISTS `sell_line_warranties`;
CREATE TABLE `sell_line_warranties`  (
  `sell_line_id` int NOT NULL,
  `warranty_id` int NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sell_line_warranties
-- ----------------------------

-- ----------------------------
-- Table structure for selling_price_groups
-- ----------------------------
DROP TABLE IF EXISTS `selling_price_groups`;
CREATE TABLE `selling_price_groups`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `business_id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `selling_price_groups_business_id_foreign`(`business_id` ASC) USING BTREE,
  CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of selling_price_groups
-- ----------------------------

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  UNIQUE INDEX `sessions_id_unique`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sessions
-- ----------------------------

-- ----------------------------
-- Table structure for stock_adjustment_lines
-- ----------------------------
DROP TABLE IF EXISTS `stock_adjustment_lines`;
CREATE TABLE `stock_adjustment_lines`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22, 4) NOT NULL,
  `secondary_unit_quantity` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22, 4) NULL DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int NULL DEFAULT NULL,
  `lot_no_line_id` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `stock_adjustment_lines_product_id_foreign`(`product_id` ASC) USING BTREE,
  INDEX `stock_adjustment_lines_variation_id_foreign`(`variation_id` ASC) USING BTREE,
  INDEX `stock_adjustment_lines_transaction_id_index`(`transaction_id` ASC) USING BTREE,
  INDEX `stock_adjustment_lines_lot_no_line_id_index`(`lot_no_line_id` ASC) USING BTREE,
  CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_adjustment_lines
-- ----------------------------

-- ----------------------------
-- Table structure for stock_adjustments_temp
-- ----------------------------
DROP TABLE IF EXISTS `stock_adjustments_temp`;
CREATE TABLE `stock_adjustments_temp`  (
  `id` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stock_adjustments_temp
-- ----------------------------

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system
-- ----------------------------
INSERT INTO `system` VALUES (1, 'db_version', '6.5');
INSERT INTO `system` VALUES (2, 'default_business_active_status', '1');

-- ----------------------------
-- Table structure for tax_rates
-- ----------------------------
DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE `tax_rates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22, 4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `for_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tax_rates_business_id_foreign`(`business_id` ASC) USING BTREE,
  INDEX `tax_rates_created_by_foreign`(`created_by` ASC) USING BTREE,
  CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tax_rates
-- ----------------------------

-- ----------------------------
-- Table structure for transaction_payments
-- ----------------------------
DROP TABLE IF EXISTS `transaction_payments`;
CREATE TABLE `transaction_payments`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int UNSIGNED NULL DEFAULT NULL,
  `business_id` int NULL DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Used during sales to return the change',
  `amount` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `transaction_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `card_transaction_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `card_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `card_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `card_holder_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `card_month` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `card_year` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `card_security` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cheque_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_account_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `paid_on` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `paid_through_link` tinyint(1) NOT NULL DEFAULT 0,
  `gateway` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT 0,
  `payment_for` int NULL DEFAULT NULL COMMENT 'stores the contact id',
  `parent_id` int NULL DEFAULT NULL,
  `note` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_ref_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `account_id` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transaction_payments_transaction_id_foreign`(`transaction_id` ASC) USING BTREE,
  INDEX `transaction_payments_created_by_index`(`created_by` ASC) USING BTREE,
  INDEX `transaction_payments_parent_id_index`(`parent_id` ASC) USING BTREE,
  INDEX `transaction_payments_payment_type_index`(`payment_type` ASC) USING BTREE,
  CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaction_payments
-- ----------------------------
INSERT INTO `transaction_payments` VALUES (1, 98, 1, 0, 3850000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 21:41:17', 3, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2025/0001', NULL, '2025-03-02 21:41:17', '2025-03-02 21:41:17');
INSERT INTO `transaction_payments` VALUES (2, 101, 1, 0, 770000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 20:04:00', 2, 0, NULL, 0, 90, NULL, NULL, NULL, 'SP2025/0002', NULL, '2025-03-03 20:04:16', '2025-03-03 20:04:16');
INSERT INTO `transaction_payments` VALUES (3, 102, 1, 0, 770000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 20:10:43', 4, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2025/0003', NULL, '2025-03-03 20:10:43', '2025-03-03 20:10:43');
INSERT INTO `transaction_payments` VALUES (4, 103, 1, 0, 770000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 20:15:00', 2, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2025/0004', NULL, '2025-03-03 20:15:36', '2025-03-03 20:15:36');

-- ----------------------------
-- Table structure for transaction_sell_lines
-- ----------------------------
DROP TABLE IF EXISTS `transaction_sell_lines`;
CREATE TABLE `transaction_sell_lines`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `secondary_unit_quantity` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `quantity_returned` decimal(20, 4) NOT NULL DEFAULT 0.0000,
  `unit_price_before_discount` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22, 4) NULL DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `line_discount_amount` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `unit_price_inc_tax` decimal(22, 4) NULL DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22, 4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int UNSIGNED NULL DEFAULT NULL,
  `discount_id` int NULL DEFAULT NULL,
  `lot_no_line_id` int NULL DEFAULT NULL,
  `sell_line_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `so_line_id` int NULL DEFAULT NULL,
  `so_quantity_invoiced` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `res_service_staff_id` int NULL DEFAULT NULL,
  `res_line_order_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent_sell_line_id` int NULL DEFAULT NULL,
  `children_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transaction_sell_lines_transaction_id_foreign`(`transaction_id` ASC) USING BTREE,
  INDEX `transaction_sell_lines_product_id_foreign`(`product_id` ASC) USING BTREE,
  INDEX `transaction_sell_lines_variation_id_foreign`(`variation_id` ASC) USING BTREE,
  INDEX `transaction_sell_lines_tax_id_foreign`(`tax_id` ASC) USING BTREE,
  INDEX `transaction_sell_lines_children_type_index`(`children_type` ASC) USING BTREE,
  INDEX `transaction_sell_lines_parent_sell_line_id_index`(`parent_sell_line_id` ASC) USING BTREE,
  INDEX `transaction_sell_lines_line_discount_type_index`(`line_discount_type` ASC) USING BTREE,
  INDEX `transaction_sell_lines_discount_id_index`(`discount_id` ASC) USING BTREE,
  INDEX `transaction_sell_lines_lot_no_line_id_index`(`lot_no_line_id` ASC) USING BTREE,
  INDEX `transaction_sell_lines_sub_unit_id_index`(`sub_unit_id` ASC) USING BTREE,
  CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaction_sell_lines
-- ----------------------------
INSERT INTO `transaction_sell_lines` VALUES (1, 95, 42, 42, 10.0000, 0.0000, 0.0000, 725000.0000, 725000.0000, NULL, 0.0000, 725000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2025-03-02 21:29:16', '2025-03-02 21:29:16');
INSERT INTO `transaction_sell_lines` VALUES (2, 98, 42, 42, 5.0000, 0.0000, 0.0000, 770000.0000, 770000.0000, 'fixed', 0.0000, 770000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2025-03-02 21:41:17', '2025-03-02 21:41:17');
INSERT INTO `transaction_sell_lines` VALUES (3, 99, 143, 143, 1.0000, 0.0000, 0.0000, 185000.0000, 185000.0000, NULL, 0.0000, 185000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2025-03-02 21:57:01', '2025-03-02 21:57:01');
INSERT INTO `transaction_sell_lines` VALUES (4, 101, 42, 42, 1.0000, 0.0000, 0.0000, 770000.0000, 770000.0000, 'fixed', 0.0000, 770000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2025-03-03 19:59:01', '2025-03-03 19:59:01');
INSERT INTO `transaction_sell_lines` VALUES (5, 102, 42, 42, 1.0000, 0.0000, 1.0000, 770000.0000, 770000.0000, 'fixed', 0.0000, 770000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2025-03-03 20:10:43', '2025-03-03 20:13:30');

-- ----------------------------
-- Table structure for transaction_sell_lines_purchase_lines
-- ----------------------------
DROP TABLE IF EXISTS `transaction_sell_lines_purchase_lines`;
CREATE TABLE `transaction_sell_lines_purchase_lines`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sell_line_id` int UNSIGNED NULL DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int UNSIGNED NULL DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22, 4) NOT NULL,
  `qty_returned` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sell_line_id`(`sell_line_id` ASC) USING BTREE,
  INDEX `stock_adjustment_line_id`(`stock_adjustment_line_id` ASC) USING BTREE,
  INDEX `purchase_line_id`(`purchase_line_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaction_sell_lines_purchase_lines
-- ----------------------------
INSERT INTO `transaction_sell_lines_purchase_lines` VALUES (1, 1, NULL, 25, 10.0000, 0.0000, '2025-03-02 21:29:16', '2025-03-02 21:29:16');
INSERT INTO `transaction_sell_lines_purchase_lines` VALUES (2, 2, NULL, 96, 5.0000, 0.0000, '2025-03-02 21:41:17', '2025-03-02 21:41:17');
INSERT INTO `transaction_sell_lines_purchase_lines` VALUES (3, 3, NULL, 74, 1.0000, 0.0000, '2025-03-02 21:57:01', '2025-03-02 21:57:01');
INSERT INTO `transaction_sell_lines_purchase_lines` VALUES (4, 4, NULL, 96, 1.0000, 0.0000, '2025-03-03 19:59:01', '2025-03-03 19:59:01');
INSERT INTO `transaction_sell_lines_purchase_lines` VALUES (5, 5, NULL, 25, 1.0000, 1.0000, '2025-03-03 20:10:43', '2025-03-03 20:13:02');

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NULL DEFAULT NULL,
  `is_kitchen_order` tinyint(1) NOT NULL DEFAULT 0,
  `res_table_id` int UNSIGNED NULL DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int UNSIGNED NULL DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sub_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` enum('paid','due','partial') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `contact_id` int UNSIGNED NULL DEFAULT NULL,
  `customer_group_id` int NULL DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ref_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `source` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subscription_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subscription_repeat_on` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22, 4) NOT NULL DEFAULT 0.0000 COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int UNSIGNED NULL DEFAULT NULL,
  `tax_amount` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `discount_type` enum('fixed','percentage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `discount_amount` decimal(22, 4) NULL DEFAULT 0.0000,
  `rp_redeemed` int NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22, 4) NOT NULL DEFAULT 0.0000 COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `delivery_date` datetime NULL DEFAULT NULL,
  `shipping_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delivered_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delivery_person` bigint NULL DEFAULT NULL,
  `shipping_charges` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `shipping_custom_field_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_custom_field_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_custom_field_3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_custom_field_4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_custom_field_5` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `additional_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `staff_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_fields_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `round_off_amount` decimal(22, 4) NOT NULL DEFAULT 0.0000 COMMENT 'Difference of rounded total and actual total',
  `additional_expense_key_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `additional_expense_value_1` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `additional_expense_value_2` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `additional_expense_value_3` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `additional_expense_value_4` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `final_total` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `expense_category_id` int UNSIGNED NULL DEFAULT NULL,
  `expense_sub_category_id` int NULL DEFAULT NULL,
  `expense_for` int UNSIGNED NULL DEFAULT NULL,
  `commission_agent` int NULL DEFAULT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspend` tinyint(1) NOT NULL DEFAULT 0,
  `exchange_rate` decimal(20, 3) NOT NULL DEFAULT 1.000,
  `total_amount_recovered` decimal(22, 4) NULL DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int NULL DEFAULT NULL,
  `return_parent_id` int NULL DEFAULT NULL,
  `opening_stock_product_id` int NULL DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `purchase_requisition_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `prefer_payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `prefer_payment_account` int NULL DEFAULT NULL,
  `sales_order_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `purchase_order_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `custom_field_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field_3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field_4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `import_batch` int NULL DEFAULT NULL,
  `import_time` datetime NULL DEFAULT NULL,
  `types_of_service_id` int NULL DEFAULT NULL,
  `packing_charge` decimal(22, 4) NULL DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `service_custom_field_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `service_custom_field_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `service_custom_field_3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `service_custom_field_4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `service_custom_field_5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `service_custom_field_6` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT 0,
  `rp_earned` int NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `order_addresses` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recur_interval` double(22, 4) NULL DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `recur_repetitions` int NULL DEFAULT NULL,
  `recur_stopped_on` datetime NULL DEFAULT NULL,
  `recur_parent_id` int NULL DEFAULT NULL,
  `invoice_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pay_term_number` int NULL DEFAULT NULL,
  `pay_term_type` enum('days','months') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `selling_price_group_id` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transactions_tax_id_foreign`(`tax_id` ASC) USING BTREE,
  INDEX `transactions_business_id_index`(`business_id` ASC) USING BTREE,
  INDEX `transactions_type_index`(`type` ASC) USING BTREE,
  INDEX `transactions_contact_id_index`(`contact_id` ASC) USING BTREE,
  INDEX `transactions_transaction_date_index`(`transaction_date` ASC) USING BTREE,
  INDEX `transactions_created_by_index`(`created_by` ASC) USING BTREE,
  INDEX `transactions_location_id_index`(`location_id` ASC) USING BTREE,
  INDEX `transactions_expense_for_foreign`(`expense_for` ASC) USING BTREE,
  INDEX `transactions_expense_category_id_index`(`expense_category_id` ASC) USING BTREE,
  INDEX `transactions_sub_type_index`(`sub_type` ASC) USING BTREE,
  INDEX `transactions_return_parent_id_index`(`return_parent_id` ASC) USING BTREE,
  INDEX `type`(`type` ASC) USING BTREE,
  INDEX `transactions_status_index`(`status` ASC) USING BTREE,
  INDEX `transactions_sub_status_index`(`sub_status` ASC) USING BTREE,
  INDEX `transactions_res_table_id_index`(`res_table_id` ASC) USING BTREE,
  INDEX `transactions_res_waiter_id_index`(`res_waiter_id` ASC) USING BTREE,
  INDEX `transactions_res_order_status_index`(`res_order_status` ASC) USING BTREE,
  INDEX `transactions_payment_status_index`(`payment_status` ASC) USING BTREE,
  INDEX `transactions_discount_type_index`(`discount_type` ASC) USING BTREE,
  INDEX `transactions_commission_agent_index`(`commission_agent` ASC) USING BTREE,
  INDEX `transactions_transfer_parent_id_index`(`transfer_parent_id` ASC) USING BTREE,
  INDEX `transactions_types_of_service_id_index`(`types_of_service_id` ASC) USING BTREE,
  INDEX `transactions_packing_charge_type_index`(`packing_charge_type` ASC) USING BTREE,
  INDEX `transactions_recur_parent_id_index`(`recur_parent_id` ASC) USING BTREE,
  INDEX `transactions_selling_price_group_id_index`(`selling_price_group_id` ASC) USING BTREE,
  INDEX `transactions_delivery_date_index`(`delivery_date` ASC) USING BTREE,
  INDEX `transactions_delivery_person_index`(`delivery_person` ASC) USING BTREE,
  CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transactions
-- ----------------------------
INSERT INTO `transactions` VALUES (1, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 63270000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 63270000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (2, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 8000000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 8000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (3, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 7560000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 7560000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (4, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 31850000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 31850000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (5, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 4160000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 4160000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (6, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 2100000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2100000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (7, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 24250000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 24250000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (8, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 31680000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 31680000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (9, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 17430000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 17430000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (10, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 550000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 550000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 15, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (11, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 12350000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 12350000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (12, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 280000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 280000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (13, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 13800000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 13800000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (14, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 1960000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1960000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (15, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 39770000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 39770000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 23, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (16, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 24300000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 24300000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (17, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 660000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 660000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 31, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (18, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 1470000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1470000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (19, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 51290000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 51290000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 34, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (20, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 16000000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 16000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (21, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 2600000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2600000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 36, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (22, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 170000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 170000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 37, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (23, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 1610000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1610000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 38, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (24, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 18270000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 18270000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 41, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (25, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:00', 14500000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 14500000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 42, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-03-02 21:39:33');
INSERT INTO `transactions` VALUES (26, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 7920000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 7920000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 43, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (27, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 7380000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 7380000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 44, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (28, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 22270000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 22270000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 45, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (29, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 2090000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2090000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 47, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (30, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 14040000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 14040000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 51, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (31, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 3710000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3710000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 55, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (32, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:33', 5360000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5360000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `transactions` VALUES (33, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 49335000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 49335000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 60, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (34, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 6160000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 6160000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 61, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (35, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 1200000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1200000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 62, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (36, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 5400000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5400000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 63, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (37, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 22500000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 22500000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 65, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (38, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 18257500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 18257500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 67, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (39, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 2280000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2280000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 68, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (40, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 4200000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 4200000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 69, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (41, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 21840000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 21840000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 71, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (42, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 24480000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 24480000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 72, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (43, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 25200000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25200000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 73, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (44, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 37440000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 37440000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 75, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (45, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 31310000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 31310000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 77, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (46, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 840000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 840000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 78, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (47, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 13020000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 13020000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 80, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (48, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 2860000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2860000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 81, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (49, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 2730000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2730000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 85, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (50, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 2040000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2040000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 90, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (51, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 4600000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 4600000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 92, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (52, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 35400000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 35400000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 93, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (53, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 43050000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 43050000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 95, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (54, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 420000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 420000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 99, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (55, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 520000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 520000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 111, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (56, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 810000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 810000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 112, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (57, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 5400000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5400000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 113, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (58, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 2960000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2960000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 114, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (59, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 2400000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2400000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 117, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (60, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 6930000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 6930000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 118, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (61, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 68730000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 68730000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 123, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (62, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 8820000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 8820000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 124, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (63, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 6510000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 6510000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 127, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (64, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 9250000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 9250000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 128, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (65, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 38415000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 38415000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 130, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (66, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 1005000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1005000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 131, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (67, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 13000000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 13000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 132, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (68, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 40700000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 40700000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 135, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (69, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 4050000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 4050000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 136, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (70, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 9450000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 9450000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 138, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (71, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 340000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 340000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 139, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (72, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 480000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 480000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 141, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (73, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 560000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 560000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 142, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (74, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 555000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 555000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 143, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (75, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 5950000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5950000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 144, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (76, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 750000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 750000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 145, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (77, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 420000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 420000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 153, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (78, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 30380000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 30380000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 155, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (79, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 6110000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 6110000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 156, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (80, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 2640000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2640000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 158, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (81, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 36630000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 36630000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 162, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (82, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 107640000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 107640000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 163, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (83, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 29200000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 29200000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 164, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (84, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 12470000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 12470000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 166, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (85, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 24800000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 24800000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 167, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (86, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 560000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 560000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 171, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (87, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 2800000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2800000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 172, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (88, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 14040000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 14040000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 174, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (89, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 1950000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1950000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 175, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (90, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 5600000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5600000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 177, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (91, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 1200000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1200000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 179, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (92, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 6900000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 6900000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 180, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (93, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 48100000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 48100000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 181, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (94, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:34', 3750000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3750000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 182, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `transactions` VALUES (95, 1, 1, 0, NULL, NULL, NULL, 'sell_transfer', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'ST2025/0001', NULL, NULL, NULL, '2025-03-02 21:28:00', 7250000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 7250000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 21:29:16', '2025-03-02 21:29:16');
INSERT INTO `transactions` VALUES (96, 1, 2, 0, NULL, NULL, NULL, 'purchase_transfer', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'ST2025/0001', NULL, NULL, NULL, '2025-03-02 21:28:00', 7250000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 7250000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, 95, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 21:29:16', '2025-03-02 21:29:16');
INSERT INTO `transactions` VALUES (97, 1, 2, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 12:50:00', 725000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 5800000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 42, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 21:39:33', '2025-03-02 21:39:33');
INSERT INTO `transactions` VALUES (98, 1, 2, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0001', '', NULL, NULL, NULL, '2025-03-02 21:41:17', 3850000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3850000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 21:41:17', '2025-03-02 21:41:17');
INSERT INTO `transactions` VALUES (99, 1, 1, 0, NULL, NULL, NULL, 'sell_transfer', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'ST2025/0002', NULL, NULL, NULL, '2025-03-02 21:56:00', 185000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 185000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 21:57:01', '2025-03-02 21:57:01');
INSERT INTO `transactions` VALUES (100, 1, 2, 0, NULL, NULL, NULL, 'purchase_transfer', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'ST2025/0002', NULL, NULL, NULL, '2025-03-02 21:56:00', 185000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 185000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, 99, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 21:57:01', '2025-03-02 21:57:01');
INSERT INTO `transactions` VALUES (101, 1, 2, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 90, NULL, '0002', '', NULL, NULL, NULL, '2025-03-03 19:59:01', 770000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 770000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 19:59:01', '2025-03-03 20:04:16');
INSERT INTO `transactions` VALUES (102, 1, 1, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '0003', '', NULL, NULL, NULL, '2025-03-03 20:10:43', 770000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 770000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 20:10:43', '2025-03-03 20:10:43');
INSERT INTO `transactions` VALUES (103, 1, 1, 0, NULL, NULL, NULL, 'sell_return', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, 'CN2025/0001', NULL, NULL, NULL, NULL, '2025-03-03 20:12:00', 770000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 770000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, 102, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-03 20:13:02', '2025-03-03 20:15:36');

-- ----------------------------
-- Table structure for types_of_services
-- ----------------------------
DROP TABLE IF EXISTS `types_of_services`;
CREATE TABLE `types_of_services`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `business_id` int NOT NULL,
  `location_price_group` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `packing_charge` decimal(22, 4) NULL DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `types_of_services_business_id_index`(`business_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of types_of_services
-- ----------------------------

-- ----------------------------
-- Table structure for units
-- ----------------------------
DROP TABLE IF EXISTS `units`;
CREATE TABLE `units`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int UNSIGNED NOT NULL,
  `actual_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int NULL DEFAULT NULL,
  `base_unit_multiplier` decimal(20, 4) NULL DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `units_business_id_foreign`(`business_id` ASC) USING BTREE,
  INDEX `units_created_by_foreign`(`created_by` ASC) USING BTREE,
  INDEX `units_base_unit_id_index`(`base_unit_id` ASC) USING BTREE,
  CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of units
-- ----------------------------
INSERT INTO `units` VALUES (1, 1, 'PCS', 'PCS', 0, NULL, NULL, 1, NULL, '2025-02-22 12:46:35', '2025-02-26 12:30:14');
INSERT INTO `units` VALUES (2, 1, 'DUS', 'DUS', 0, NULL, NULL, 1, NULL, '2025-02-26 12:27:29', '2025-02-26 12:27:29');
INSERT INTO `units` VALUES (3, 1, 'SAK', 'SAK', 0, NULL, NULL, 1, NULL, '2025-02-26 12:27:51', '2025-02-26 12:27:51');
INSERT INTO `units` VALUES (4, 1, 'KRT', 'KRT', 0, NULL, NULL, 1, NULL, '2025-02-26 12:28:14', '2025-02-26 12:28:14');
INSERT INTO `units` VALUES (5, 1, 'DOS', 'DOS', 0, NULL, NULL, 1, NULL, '2025-02-26 12:28:32', '2025-02-26 12:28:32');
INSERT INTO `units` VALUES (6, 1, 'KG', 'KG', 0, NULL, NULL, 1, NULL, '2025-02-26 12:28:50', '2025-02-26 12:28:50');
INSERT INTO `units` VALUES (7, 1, 'PAK', 'PAK', 0, NULL, NULL, 1, NULL, '2025-02-26 12:29:07', '2025-02-26 12:29:07');
INSERT INTO `units` VALUES (8, 1, 'KRAT', 'KRAT', 0, NULL, NULL, 1, NULL, '2025-02-26 12:29:31', '2025-02-26 12:29:31');
INSERT INTO `units` VALUES (9, 1, 'PETI', 'PETI', 0, NULL, NULL, 1, NULL, '2025-02-26 12:29:54', '2025-02-26 12:29:54');
INSERT INTO `units` VALUES (10, 1, 'BIJI', 'BIJI', 0, NULL, NULL, 1, NULL, '2025-02-26 12:30:36', '2025-02-26 12:30:36');
INSERT INTO `units` VALUES (11, 1, 'PSC', 'PSC', 0, NULL, NULL, 1, NULL, '2025-02-26 12:30:57', '2025-02-26 12:30:57');
INSERT INTO `units` VALUES (12, 1, 'BOX', 'BOX', 0, NULL, NULL, 1, NULL, '2025-02-26 12:31:12', '2025-02-26 12:31:12');
INSERT INTO `units` VALUES (13, 1, 'SET', 'SET', 0, NULL, NULL, 1, NULL, '2025-02-26 12:31:27', '2025-02-26 12:31:27');
INSERT INTO `units` VALUES (14, 1, 'PACK', 'PACK', 0, NULL, NULL, 1, NULL, '2025-02-26 12:32:00', '2025-02-26 12:32:00');

-- ----------------------------
-- Table structure for user_contact_access
-- ----------------------------
DROP TABLE IF EXISTS `user_contact_access`;
CREATE TABLE `user_contact_access`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `contact_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_contact_access_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `user_contact_access_contact_id_index`(`contact_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_contact_access
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `surname` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `language` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `business_id` int UNSIGNED NULL DEFAULT NULL,
  `available_at` datetime NULL DEFAULT NULL COMMENT 'Service staff avilable at. Calculated from product preparation_time_in_minutes',
  `paused_at` datetime NULL DEFAULT NULL COMMENT 'Service staff available time paused at, Will be nulled on resume.',
  `max_sales_discount_percent` decimal(5, 2) NULL DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('active','inactive','terminated') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_enable_service_staff_pin` tinyint(1) NOT NULL DEFAULT 0,
  `service_staff_pin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `crm_contact_id` int UNSIGNED NULL DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT 0,
  `cmmsn_percent` decimal(4, 2) NOT NULL DEFAULT 0.00,
  `selected_contacts` tinyint(1) NOT NULL DEFAULT 0,
  `dob` date NULL DEFAULT NULL,
  `gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `blood_group` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `contact_number` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `alt_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `family_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fb_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `twitter_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `social_media_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `social_media_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permanent_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `current_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `guardian_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field_3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `custom_field_4` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `id_proof_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_proof_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username` ASC) USING BTREE,
  INDEX `users_business_id_foreign`(`business_id` ASC) USING BTREE,
  INDEX `users_user_type_index`(`user_type` ASC) USING BTREE,
  INDEX `users_crm_contact_id_foreign`(`crm_contact_id` ASC) USING BTREE,
  CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `users_crm_contact_id_foreign` FOREIGN KEY (`crm_contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'user', 'Mr', 'Joni', NULL, 'admin', 'dhitawarehouse@gmail.com', '$2y$10$PXF1daJdNg0TIuYstSbnD.OVf5hJ8AjTuTHfMmqqD1yKUOaAG.yzi', 'id', NULL, NULL, '8mXcZIsuudoEPIRYQnLavUCYCoCjwpdxUgza1elvf7qFQgAOIpTtnOasxUqw', 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2025-02-22 12:46:33', '2025-02-26 11:22:56');
INSERT INTO `users` VALUES (2, 'user', NULL, 'AZZAM', NULL, 'AZZAM', 'admin@admin.com', '$2y$10$oP0NVgtlXCE/Yp4.37ZHvenJk8H7OteFEQ5J1G6VKszR5bRvYmip2', 'id', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2025-03-02 21:07:20', '2025-03-02 21:18:20');
INSERT INTO `users` VALUES (3, 'user', NULL, 'ANNA', NULL, 'ANNA1', 'anna@admin.com', '$2y$10$ANPH57Ilk/SD2HC6q6rtguASF3k7j0nFFS7DhJYiVKOYG.PtK.oOa', 'id', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2025-03-02 21:16:30', '2025-03-02 21:36:31');
INSERT INTO `users` VALUES (4, 'user', NULL, 'PUPUT', NULL, 'PUPUT', 'puput@admin.com', '$2y$10$iU9parwS2Rz2lnGaLqwMQ.eLKk7a0rSkGz9e0U.S7Zs6usPLrLRSm', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2025-03-03 20:10:05', '2025-03-03 20:10:05');

-- ----------------------------
-- Table structure for variation_group_prices
-- ----------------------------
DROP TABLE IF EXISTS `variation_group_prices`;
CREATE TABLE `variation_group_prices`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `variation_id` int UNSIGNED NOT NULL,
  `price_group_id` int UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22, 4) NOT NULL,
  `price_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `variation_group_prices_variation_id_foreign`(`variation_id` ASC) USING BTREE,
  INDEX `variation_group_prices_price_group_id_foreign`(`price_group_id` ASC) USING BTREE,
  CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of variation_group_prices
-- ----------------------------

-- ----------------------------
-- Table structure for variation_location_details
-- ----------------------------
DROP TABLE IF EXISTS `variation_location_details`;
CREATE TABLE `variation_location_details`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `product_variation_id` int UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `qty_available` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `variation_location_details_location_id_foreign`(`location_id` ASC) USING BTREE,
  INDEX `variation_location_details_product_id_index`(`product_id` ASC) USING BTREE,
  INDEX `variation_location_details_product_variation_id_index`(`product_variation_id` ASC) USING BTREE,
  INDEX `variation_location_details_variation_id_index`(`variation_id` ASC) USING BTREE,
  CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of variation_location_details
-- ----------------------------
INSERT INTO `variation_location_details` VALUES (1, 1, 1, 1, 1, 171.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (2, 2, 2, 2, 1, 32.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (3, 3, 3, 3, 1, 27.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (4, 4, 4, 4, 1, 49.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (5, 5, 5, 5, 1, 13.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (6, 10, 10, 10, 1, 3.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (7, 11, 11, 11, 1, 97.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (8, 13, 13, 13, 1, 48.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (9, 14, 14, 14, 1, 42.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (10, 15, 15, 15, 1, 1.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (11, 17, 17, 17, 1, 38.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (12, 19, 19, 19, 1, 1.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (13, 20, 20, 20, 1, 20.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (14, 21, 21, 21, 1, 7.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (15, 23, 23, 23, 1, 97.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (16, 28, 28, 28, 1, 45.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (17, 31, 31, 31, 1, 3.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (18, 33, 33, 33, 1, 7.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (19, 34, 34, 34, 1, 223.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (20, 35, 35, 35, 1, 50.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (21, 36, 36, 36, 1, 13.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (22, 37, 37, 37, 1, 2.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (23, 38, 38, 38, 1, 7.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (24, 41, 41, 41, 1, 29.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (25, 42, 42, 42, 1, 10.0000, '2025-02-26 12:50:33', '2025-03-03 20:13:02');
INSERT INTO `variation_location_details` VALUES (26, 43, 43, 43, 1, 44.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (27, 44, 44, 44, 1, 82.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (28, 45, 45, 45, 1, 131.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (29, 47, 47, 47, 1, 11.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (30, 51, 51, 51, 1, 54.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (31, 55, 55, 55, 1, 7.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (32, 57, 57, 57, 1, 16.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33');
INSERT INTO `variation_location_details` VALUES (33, 60, 60, 60, 1, 253.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (34, 61, 61, 61, 1, 11.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (35, 62, 62, 62, 1, 6.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (36, 63, 63, 63, 1, 12.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (37, 65, 65, 65, 1, 36.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (38, 67, 67, 67, 1, 67.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (39, 68, 68, 68, 1, 4.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (40, 69, 69, 69, 1, 21.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (41, 71, 71, 71, 1, 42.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (42, 72, 72, 72, 1, 36.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (43, 73, 73, 73, 1, 42.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (44, 75, 75, 75, 1, 192.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (45, 77, 77, 77, 1, 101.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (46, 78, 78, 78, 1, 2.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (47, 80, 80, 80, 1, 21.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (48, 81, 81, 81, 1, 13.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (49, 85, 85, 85, 1, 14.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (50, 90, 90, 90, 1, 6.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (51, 92, 92, 92, 1, 20.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (52, 93, 93, 93, 1, 118.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (53, 95, 95, 95, 1, 123.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (54, 99, 99, 99, 1, 2.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (55, 111, 111, 111, 1, 2.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (56, 112, 112, 112, 1, 3.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (57, 113, 113, 113, 1, 18.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (58, 114, 114, 114, 1, 16.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (59, 117, 117, 117, 1, 6.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (60, 118, 118, 118, 1, 77.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (61, 123, 123, 123, 1, 237.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (62, 124, 124, 124, 1, 21.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (63, 127, 127, 127, 1, 21.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (64, 128, 128, 128, 1, 25.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (65, 130, 130, 130, 1, 197.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (66, 131, 131, 131, 1, 1.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (67, 132, 132, 132, 1, 100.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (68, 135, 135, 135, 1, 74.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (69, 136, 136, 136, 1, 9.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (70, 138, 138, 138, 1, 45.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (71, 139, 139, 139, 1, 2.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (72, 141, 141, 141, 1, 1.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (73, 142, 142, 142, 1, 2.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (74, 143, 143, 143, 1, 2.0000, '2025-02-26 12:50:34', '2025-03-02 21:57:01');
INSERT INTO `variation_location_details` VALUES (75, 144, 144, 144, 1, 34.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (76, 145, 145, 145, 1, 3.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (77, 153, 153, 153, 1, 1.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (78, 155, 155, 155, 1, 98.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (79, 156, 156, 156, 1, 47.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (80, 158, 158, 158, 1, 12.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (81, 162, 162, 162, 1, 198.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (82, 163, 163, 163, 1, 552.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (83, 164, 164, 164, 1, 146.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (84, 166, 166, 166, 1, 58.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (85, 167, 167, 167, 1, 124.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (86, 171, 171, 171, 1, 2.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (87, 172, 172, 172, 1, 8.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (88, 174, 174, 174, 1, 52.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (89, 175, 175, 175, 1, 6.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (90, 177, 177, 177, 1, 28.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (91, 179, 179, 179, 1, 12.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (92, 180, 180, 180, 1, 15.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (93, 181, 181, 181, 1, 130.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (94, 182, 182, 182, 1, 5.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34');
INSERT INTO `variation_location_details` VALUES (95, 42, 42, 42, 2, 12.0000, '2025-03-02 21:29:16', '2025-03-03 19:59:01');
INSERT INTO `variation_location_details` VALUES (96, 143, 143, 143, 2, 1.0000, '2025-03-02 21:57:01', '2025-03-02 21:57:01');

-- ----------------------------
-- Table structure for variation_templates
-- ----------------------------
DROP TABLE IF EXISTS `variation_templates`;
CREATE TABLE `variation_templates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `variation_templates_business_id_foreign`(`business_id` ASC) USING BTREE,
  CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of variation_templates
-- ----------------------------

-- ----------------------------
-- Table structure for variation_value_templates
-- ----------------------------
DROP TABLE IF EXISTS `variation_value_templates`;
CREATE TABLE `variation_value_templates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `variation_value_templates_name_index`(`name` ASC) USING BTREE,
  INDEX `variation_value_templates_variation_template_id_index`(`variation_template_id` ASC) USING BTREE,
  CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of variation_value_templates
-- ----------------------------

-- ----------------------------
-- Table structure for variations
-- ----------------------------
DROP TABLE IF EXISTS `variations`;
CREATE TABLE `variations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `sub_sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_variation_id` int UNSIGNED NOT NULL,
  `variation_value_id` int NULL DEFAULT NULL,
  `default_purchase_price` decimal(22, 4) NULL DEFAULT NULL,
  `dpp_inc_tax` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `profit_percent` decimal(22, 4) NOT NULL DEFAULT 0.0000,
  `default_sell_price` decimal(22, 4) NULL DEFAULT NULL,
  `sell_price_inc_tax` decimal(22, 4) NULL DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'Contains the combo variation details',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `variations_product_id_foreign`(`product_id` ASC) USING BTREE,
  INDEX `variations_product_variation_id_foreign`(`product_variation_id` ASC) USING BTREE,
  INDEX `variations_name_index`(`name` ASC) USING BTREE,
  INDEX `variations_sub_sku_index`(`sub_sku` ASC) USING BTREE,
  INDEX `variations_variation_value_id_index`(`variation_value_id` ASC) USING BTREE,
  CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of variations
-- ----------------------------
INSERT INTO `variations` VALUES (1, 'DUMMY', 1, 'FJ 100 POLOS', 1, NULL, 370000.0000, 370000.0000, 25.0000, 420000.0000, 420000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (2, 'DUMMY', 2, 'BOMBAY', 2, NULL, 250000.0000, 250000.0000, 25.0000, 330000.0000, 330000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (3, 'DUMMY', 3, 'NAVEL8', 3, NULL, 280000.0000, 280000.0000, 25.0000, 320000.0000, 320000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (4, 'DUMMY', 4, 'SHINE', 4, NULL, 650000.0000, 650000.0000, 25.0000, 680000.0000, 680000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (5, 'DUMMY', 5, 'LEMON8', 5, NULL, 320000.0000, 320000.0000, 25.0000, 360000.0000, 360000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (6, 'DUMMY', 6, 'CENTURY12', 6, NULL, 200000.0000, 200000.0000, 25.0000, 230000.0000, 230000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (7, 'DUMMY', 7, 'PACKAM5', 7, NULL, 640000.0000, 640000.0000, 25.0000, 685000.0000, 685000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (8, 'DUMMY', 8, 'BOAT', 8, NULL, 280000.0000, 280000.0000, 25.0000, 325000.0000, 325000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (9, 'DUMMY', 9, 'SANTANG13', 9, NULL, 290000.0000, 290000.0000, 25.0000, 325000.0000, 325000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (10, 'DUMMY', 10, 'PHN2', 10, NULL, 700000.0000, 700000.0000, 25.0000, 750000.0000, 750000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (11, 'DUMMY', 11, 'LMN9', 11, NULL, 250000.0000, 250000.0000, 25.0000, 350000.0000, 350000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (12, 'DUMMY', 12, 'APM8', 12, NULL, 11250.0000, 11250.0000, 25.0000, 11500.0000, 11500.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (13, 'DUMMY', 13, '88IJO', 13, NULL, 660000.0000, 660000.0000, 25.0000, 730000.0000, 730000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (14, 'DUMMY', 14, '338', 14, NULL, 415000.0000, 415000.0000, 25.0000, 450000.0000, 450000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (15, 'DUMMY', 15, 'ASEM', 15, NULL, 550000.0000, 550000.0000, 25.0000, 550000.0000, 550000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (16, 'DUMMY', 16, 'CAP60', 16, NULL, 85000.0000, 85000.0000, 25.0000, 85000.0000, 85000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (17, 'DUMMY', 17, 'PALM3', 17, NULL, 325000.0000, 325000.0000, 25.0000, 400000.0000, 400000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (18, 'DUMMY', 18, 'PLAM SWEET8', 18, NULL, 400000.0000, 400000.0000, 25.0000, 400000.0000, 400000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (19, 'DUMMY', 19, 'BUN', 19, NULL, 280000.0000, 280000.0000, 25.0000, 320000.0000, 320000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (20, 'DUMMY', 20, 'WPRE', 20, NULL, 690000.0000, 690000.0000, 25.0000, 750000.0000, 750000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (21, 'DUMMY', 21, 'SHMJ', 21, NULL, 280000.0000, 280000.0000, 25.0000, 320000.0000, 320000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (22, 'DUMMY', 22, '54PR', 22, NULL, 590000.0000, 590000.0000, 25.0000, 590000.0000, 590000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (23, 'DUMMY', 23, 'FJJJ', 23, NULL, 410000.0000, 410000.0000, 25.0000, 460000.0000, 460000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (24, 'DUMMY', 24, 'ANGR1', 24, NULL, 4000.0000, 4000.0000, 25.0000, 5000.0000, 5000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (25, 'DUMMY', 25, 'KOL1', 25, NULL, 240000.0000, 240000.0000, 25.0000, 285000.0000, 285000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (26, 'DUMMY', 26, 'SHN1', 26, NULL, 295000.0000, 295000.0000, 25.0000, 325000.0000, 325000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (27, 'DUMMY', 27, 'MS', 27, NULL, 300000.0000, 300000.0000, 25.0000, 335000.0000, 335000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (28, 'DUMMY', 28, 'FJ5', 28, NULL, 540000.0000, 540000.0000, 25.0000, 600000.0000, 600000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (29, 'DUMMY', 29, 'JRB', 29, NULL, 175000.0000, 175000.0000, 25.0000, 190000.0000, 190000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (30, 'DUMMY', 30, 'SWEET', 30, NULL, 140000.0000, 140000.0000, 25.0000, 140000.0000, 140000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (31, 'DUMMY', 31, 'KIMKIT', 31, NULL, 220000.0000, 220000.0000, 25.0000, 260000.0000, 260000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (32, 'DUMMY', 32, 'FUJ', 32, NULL, 175000.0000, 175000.0000, 25.0000, 200000.0000, 200000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (33, 'DUMMY', 33, 'WO1', 33, NULL, 210000.0000, 210000.0000, 25.0000, 250000.0000, 250000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (34, 'DUMMY', 34, 'WOK', 34, NULL, 230000.0000, 230000.0000, 25.0000, 240000.0000, 240000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (35, 'DUMMY', 35, 'LKZ', 35, NULL, 320000.0000, 320000.0000, 25.0000, 360000.0000, 360000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (36, 'DUMMY', 36, 'DELIMA', 36, NULL, 200000.0000, 200000.0000, 25.0000, 245000.0000, 245000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (37, 'DUMMY', 37, 'ENOKI', 37, NULL, 85000.0000, 85000.0000, 25.0000, 110000.0000, 110000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (38, 'DUMMY', 38, 'GOL1', 38, NULL, 230000.0000, 230000.0000, 25.0000, 265000.0000, 265000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (39, 'DUMMY', 39, 'XIANG', 39, NULL, 190000.0000, 190000.0000, 25.0000, 225000.0000, 225000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (40, 'DUMMY', 40, 'RED M', 40, NULL, 200000.0000, 200000.0000, 25.0000, 200000.0000, 200000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (41, 'DUMMY', 41, 'AP SA', 41, NULL, 630000.0000, 630000.0000, 25.0000, 670000.0000, 670000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (42, 'DUMMY', 42, 'MR', 42, NULL, 725000.0000, 725000.0000, 25.0000, 770000.0000, 770000.0000, '2025-02-26 12:50:33', '2025-03-02 21:38:52', NULL, '[]');
INSERT INTO `variations` VALUES (43, 'DUMMY', 43, 'YJ', 43, NULL, 180000.0000, 180000.0000, 25.0000, 215000.0000, 215000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (44, 'DUMMY', 44, 'AS', 44, NULL, 90000.0000, 90000.0000, 25.0000, 115000.0000, 115000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (45, 'DUMMY', 45, 'YLL1', 45, NULL, 170000.0000, 170000.0000, 25.0000, 210000.0000, 210000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (46, 'DUMMY', 46, 'EV', 46, NULL, 145000.0000, 145000.0000, 25.0000, 150000.0000, 150000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (47, 'DUMMY', 47, 'Y2', 47, NULL, 190000.0000, 190000.0000, 25.0000, 220000.0000, 220000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (48, 'DUMMY', 48, 'APK', 48, NULL, 700000.0000, 700000.0000, 25.0000, 740000.0000, 740000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (49, 'DUMMY', 49, 'PN', 49, NULL, 200000.0000, 200000.0000, 25.0000, 240000.0000, 240000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (50, 'DUMMY', 50, 'PNK', 50, NULL, 215000.0000, 215000.0000, 25.0000, 230000.0000, 230000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (51, 'DUMMY', 51, 'DR', 51, NULL, 260000.0000, 260000.0000, 25.0000, 315000.0000, 315000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (52, 'DUMMY', 52, 'WK', 52, NULL, 210000.0000, 210000.0000, 25.0000, 280000.0000, 280000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (53, 'DUMMY', 53, 'FL', 53, NULL, 380000.0000, 380000.0000, 25.0000, 420000.0000, 420000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (54, 'DUMMY', 54, 'AP T', 54, NULL, 620000.0000, 620000.0000, 25.0000, 670000.0000, 670000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (55, 'DUMMY', 55, 'FD', 55, NULL, 530000.0000, 530000.0000, 25.0000, 580000.0000, 580000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (56, 'DUMMY', 56, 'PP', 56, NULL, 250000.0000, 250000.0000, 25.0000, 305000.0000, 305000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (57, 'DUMMY', 57, 'WM', 57, NULL, 335000.0000, 335000.0000, 25.0000, 380000.0000, 380000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (58, 'DUMMY', 58, 'PC', 58, NULL, 220000.0000, 220000.0000, 25.0000, 295000.0000, 295000.0000, '2025-02-26 12:50:33', '2025-02-26 12:50:33', NULL, '[]');
INSERT INTO `variations` VALUES (59, 'DUMMY', 59, 'LONG', 59, NULL, 330000.0000, 330000.0000, 25.0000, 380000.0000, 380000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (60, 'DUMMY', 60, 'SN', 60, NULL, 195000.0000, 195000.0000, 25.0000, 240000.0000, 240000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (61, 'DUMMY', 61, 'AW', 61, NULL, 560000.0000, 560000.0000, 25.0000, 590000.0000, 590000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (62, 'DUMMY', 62, 'CT', 62, NULL, 200000.0000, 200000.0000, 25.0000, 230000.0000, 230000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (63, 'DUMMY', 63, 'MC', 63, NULL, 450000.0000, 450000.0000, 25.0000, 470000.0000, 470000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (64, 'DUMMY', 64, 'NV', 64, NULL, 75000.0000, 75000.0000, 25.0000, 75000.0000, 75000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (65, 'DUMMY', 65, 'FY', 65, NULL, 625000.0000, 625000.0000, 25.0000, 680000.0000, 680000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (66, 'DUMMY', 66, 'DF', 66, NULL, 200000.0000, 200000.0000, 25.0000, 240000.0000, 240000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (67, 'DUMMY', 67, 'FJW', 67, NULL, 272500.0000, 272500.0000, 25.0000, 300000.0000, 300000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (68, 'DUMMY', 68, 'FP', 68, NULL, 570000.0000, 570000.0000, 25.0000, 580000.0000, 580000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (69, 'DUMMY', 69, 'WC', 69, NULL, 200000.0000, 200000.0000, 25.0000, 250000.0000, 250000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (70, 'DUMMY', 70, 'DH', 70, NULL, 200000.0000, 200000.0000, 25.0000, 230000.0000, 230000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (71, 'DUMMY', 71, 'HU', 71, NULL, 520000.0000, 520000.0000, 25.0000, 560000.0000, 560000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (72, 'DUMMY', 72, 'HN', 72, NULL, 680000.0000, 680000.0000, 25.0000, 750000.0000, 750000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (73, 'DUMMY', 73, 'AK', 73, NULL, 600000.0000, 600000.0000, 25.0000, 645000.0000, 645000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (74, 'DUMMY', 74, 'AU', 74, NULL, 9500.0000, 9500.0000, 25.0000, 10000.0000, 10000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (75, 'DUMMY', 75, 'XL', 75, NULL, 195000.0000, 195000.0000, 25.0000, 255000.0000, 255000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (76, 'DUMMY', 76, 'PR', 76, NULL, 19000.0000, 19000.0000, 25.0000, 21000.0000, 21000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (77, 'DUMMY', 77, 'WD', 77, NULL, 310000.0000, 310000.0000, 25.0000, 360000.0000, 360000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (78, 'DUMMY', 78, 'ALL W1', 78, NULL, 420000.0000, 420000.0000, 25.0000, 485000.0000, 485000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (79, 'DUMMY', 79, 'K E', 79, NULL, 310000.0000, 310000.0000, 25.0000, 360000.0000, 360000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (80, 'DUMMY', 80, 'RDF', 80, NULL, 620000.0000, 620000.0000, 25.0000, 670000.0000, 670000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (81, 'DUMMY', 81, 'SG', 81, NULL, 220000.0000, 220000.0000, 25.0000, 255000.0000, 255000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (82, 'DUMMY', 82, 'YI', 82, NULL, 110000.0000, 110000.0000, 25.0000, 160000.0000, 160000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (83, 'DUMMY', 83, 'SM', 83, NULL, 10250.0000, 10250.0000, 25.0000, 10500.0000, 10500.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (84, 'DUMMY', 84, 'KW', 84, NULL, 275000.0000, 275000.0000, 25.0000, 300000.0000, 300000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (85, 'DUMMY', 85, 'TG', 85, NULL, 195000.0000, 195000.0000, 25.0000, 230000.0000, 230000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (86, 'DUMMY', 86, 'AM', 86, NULL, 380000.0000, 380000.0000, 25.0000, 425000.0000, 425000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (87, 'DUMMY', 87, 'GS', 87, NULL, 670000.0000, 670000.0000, 25.0000, 730000.0000, 730000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (88, 'DUMMY', 88, 'KWG', 88, NULL, 220000.0000, 220000.0000, 25.0000, 320000.0000, 320000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (89, 'DUMMY', 89, 'KR', 89, NULL, 200000.0000, 200000.0000, 25.0000, 320000.0000, 320000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (90, 'DUMMY', 90, 'BR', 90, NULL, 340000.0000, 340000.0000, 25.0000, 380000.0000, 380000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (91, 'DUMMY', 91, 'RION', 91, NULL, 280000.0000, 280000.0000, 25.0000, 330000.0000, 330000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (92, 'DUMMY', 92, 'SKM', 92, NULL, 230000.0000, 230000.0000, 25.0000, 265000.0000, 265000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (93, 'DUMMY', 93, 'LG', 93, NULL, 300000.0000, 300000.0000, 25.0000, 340000.0000, 340000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (94, 'DUMMY', 94, 'SA', 94, NULL, 915000.0000, 915000.0000, 25.0000, 965000.0000, 965000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (95, 'DUMMY', 95, 'TE', 95, NULL, 350000.0000, 350000.0000, 25.0000, 400000.0000, 400000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (96, 'DUMMY', 96, 'TM', 96, NULL, 440000.0000, 440000.0000, 25.0000, 475000.0000, 475000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (97, 'DUMMY', 97, 'MU', 97, NULL, 250000.0000, 250000.0000, 25.0000, 250000.0000, 250000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (98, 'DUMMY', 98, 'GD', 98, NULL, 300000.0000, 300000.0000, 25.0000, 330000.0000, 330000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (99, 'DUMMY', 99, 'PKM', 99, NULL, 210000.0000, 210000.0000, 25.0000, 255000.0000, 255000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (100, 'DUMMY', 100, 'NO', 100, NULL, 330000.0000, 330000.0000, 25.0000, 360000.0000, 360000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (101, 'DUMMY', 101, 'WW', 101, NULL, 260000.0000, 260000.0000, 25.0000, 300000.0000, 300000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (102, 'DUMMY', 102, 'CL', 102, NULL, 190000.0000, 190000.0000, 25.0000, 250000.0000, 250000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (103, 'DUMMY', 103, 'BC', 103, NULL, 200000.0000, 200000.0000, 25.0000, 250000.0000, 250000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (104, 'DUMMY', 104, 'BS', 104, NULL, 190000.0000, 190000.0000, 25.0000, 240000.0000, 240000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (105, 'DUMMY', 105, 'BP', 105, NULL, 190000.0000, 190000.0000, 25.0000, 240000.0000, 240000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (106, 'DUMMY', 106, 'GA', 106, NULL, 240000.0000, 240000.0000, 25.0000, 280000.0000, 280000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (107, 'DUMMY', 107, 'JK', 107, NULL, 250000.0000, 250000.0000, 25.0000, 300000.0000, 300000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (108, 'DUMMY', 108, 'F1', 108, NULL, 590000.0000, 590000.0000, 25.0000, 650000.0000, 650000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (109, 'DUMMY', 109, 'SF', 109, NULL, 280000.0000, 280000.0000, 25.0000, 315000.0000, 315000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (110, 'DUMMY', 110, 'PS', 110, NULL, 210000.0000, 210000.0000, 25.0000, 255000.0000, 255000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (111, 'DUMMY', 111, 'JS', 111, NULL, 260000.0000, 260000.0000, 25.0000, 320000.0000, 320000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (112, 'DUMMY', 112, 'KO', 112, NULL, 270000.0000, 270000.0000, 25.0000, 320000.0000, 320000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (113, 'DUMMY', 113, 'AH', 113, NULL, 300000.0000, 300000.0000, 25.0000, 340000.0000, 340000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (114, 'DUMMY', 114, 'XM', 114, NULL, 185000.0000, 185000.0000, 25.0000, 220000.0000, 220000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (115, 'DUMMY', 115, 'S3', 115, NULL, 9500.0000, 9500.0000, 25.0000, 10000.0000, 10000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (116, 'DUMMY', 116, 'MW', 116, NULL, 100000.0000, 100000.0000, 25.0000, 150000.0000, 150000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (117, 'DUMMY', 117, 'PG', 117, NULL, 400000.0000, 400000.0000, 25.0000, 450000.0000, 450000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (118, 'DUMMY', 118, 'EG', 118, NULL, 90000.0000, 90000.0000, 25.0000, 120000.0000, 120000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (119, 'DUMMY', 119, 'WN', 119, NULL, 695000.0000, 695000.0000, 25.0000, 735000.0000, 735000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (120, 'DUMMY', 120, 'WS', 120, NULL, 290000.0000, 290000.0000, 25.0000, 350000.0000, 350000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (121, 'DUMMY', 121, 'BLUBER', 121, NULL, 420000.0000, 420000.0000, 25.0000, 460000.0000, 460000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (122, 'DUMMY', 122, 'PER', 122, NULL, 300000.0000, 300000.0000, 25.0000, 335000.0000, 335000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (123, 'DUMMY', 123, 'STC', 123, NULL, 290000.0000, 290000.0000, 25.0000, 325000.0000, 325000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (124, 'DUMMY', 124, 'GZ', 124, NULL, 420000.0000, 420000.0000, 25.0000, 450000.0000, 450000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (125, 'DUMMY', 125, 'SS', 125, NULL, 250000.0000, 250000.0000, 25.0000, 305000.0000, 305000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (126, 'DUMMY', 126, 'KG', 126, NULL, 190000.0000, 190000.0000, 25.0000, 215000.0000, 215000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (127, 'DUMMY', 127, 'LC', 127, NULL, 310000.0000, 310000.0000, 25.0000, 360000.0000, 360000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (128, 'DUMMY', 128, 'PA', 128, NULL, 370000.0000, 370000.0000, 25.0000, 450000.0000, 450000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (129, 'DUMMY', 129, 'AJ', 129, NULL, 870000.0000, 870000.0000, 25.0000, 995000.0000, 995000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (130, 'DUMMY', 130, 'AA', 130, NULL, 195000.0000, 195000.0000, 25.0000, 230000.0000, 230000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (131, 'DUMMY', 131, 'KS', 131, NULL, 1005000.0000, 1005000.0000, 25.0000, 1215000.0000, 1215000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (132, 'DUMMY', 132, 'KM', 132, NULL, 130000.0000, 130000.0000, 25.0000, 165000.0000, 165000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (133, 'DUMMY', 133, 'KIS', 133, NULL, 190000.0000, 190000.0000, 25.0000, 240000.0000, 240000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (134, 'DUMMY', 134, 'KRS', 134, NULL, 870000.0000, 870000.0000, 25.0000, 1060000.0000, 1060000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (135, 'DUMMY', 135, 'PF', 135, NULL, 550000.0000, 550000.0000, 25.0000, 590000.0000, 590000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (136, 'DUMMY', 136, 'BBL', 136, NULL, 450000.0000, 450000.0000, 25.0000, 500000.0000, 500000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (137, 'DUMMY', 137, 'SHT', 137, NULL, 355000.0000, 355000.0000, 25.0000, 395000.0000, 395000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (138, 'DUMMY', 138, 'WO', 138, NULL, 210000.0000, 210000.0000, 25.0000, 250000.0000, 250000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (139, 'DUMMY', 139, 'KK', 139, NULL, 170000.0000, 170000.0000, 25.0000, 235000.0000, 235000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (140, 'DUMMY', 140, 'SW', 140, NULL, 180000.0000, 180000.0000, 25.0000, 230000.0000, 230000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (141, 'DUMMY', 141, 'AI', 141, NULL, 480000.0000, 480000.0000, 25.0000, 550000.0000, 550000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (142, 'DUMMY', 142, 'L1', 142, NULL, 280000.0000, 280000.0000, 25.0000, 310000.0000, 310000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (143, 'DUMMY', 143, 'AP', 143, NULL, 185000.0000, 185000.0000, 25.0000, 185000.0000, 185000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (144, 'DUMMY', 144, 'PO', 144, NULL, 175000.0000, 175000.0000, 25.0000, 205000.0000, 205000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (145, 'DUMMY', 145, 'BK', 145, NULL, 250000.0000, 250000.0000, 25.0000, 300000.0000, 300000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (146, 'DUMMY', 146, 'SO', 146, NULL, 160000.0000, 160000.0000, 25.0000, 220000.0000, 220000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (147, 'DUMMY', 147, 'JH', 147, NULL, 250000.0000, 250000.0000, 25.0000, 300000.0000, 300000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (148, 'DUMMY', 148, 'JY', 148, NULL, 250000.0000, 250000.0000, 25.0000, 290000.0000, 290000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (149, 'DUMMY', 149, 'PM', 149, NULL, 180000.0000, 180000.0000, 25.0000, 220000.0000, 220000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (150, 'DUMMY', 150, 'PK', 150, NULL, 175000.0000, 175000.0000, 25.0000, 220000.0000, 220000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (151, 'DUMMY', 151, 'PON', 151, NULL, 22000.0000, 22000.0000, 25.0000, 24000.0000, 24000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (152, 'DUMMY', 152, 'CH', 152, NULL, 890000.0000, 890000.0000, 25.0000, 970000.0000, 970000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (153, 'DUMMY', 153, 'KI', 153, NULL, 420000.0000, 420000.0000, 25.0000, 480000.0000, 480000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (154, 'DUMMY', 154, 'XN', 154, NULL, 160000.0000, 160000.0000, 25.0000, 220000.0000, 220000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (155, 'DUMMY', 155, 'LB', 155, NULL, 310000.0000, 310000.0000, 25.0000, 360000.0000, 360000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (156, 'DUMMY', 156, 'KC', 156, NULL, 130000.0000, 130000.0000, 25.0000, 165000.0000, 165000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (157, 'DUMMY', 157, 'ND', 157, NULL, 320000.0000, 320000.0000, 25.0000, 360000.0000, 360000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (158, 'DUMMY', 158, 'WF', 158, NULL, 220000.0000, 220000.0000, 25.0000, 275000.0000, 275000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (159, 'DUMMY', 159, 'SH', 159, NULL, 340000.0000, 340000.0000, 25.0000, 395000.0000, 395000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (160, 'DUMMY', 160, 'G', 160, NULL, 450000.0000, 450000.0000, 25.0000, 550000.0000, 550000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (161, 'DUMMY', 161, 'KP', 161, NULL, 260000.0000, 260000.0000, 25.0000, 300000.0000, 300000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (162, 'DUMMY', 162, 'YA', 162, NULL, 185000.0000, 185000.0000, 25.0000, 215000.0000, 215000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (163, 'DUMMY', 163, 'GV', 163, NULL, 195000.0000, 195000.0000, 25.0000, 215000.0000, 215000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (164, 'DUMMY', 164, 'Y3', 164, NULL, 200000.0000, 200000.0000, 25.0000, 225000.0000, 225000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (165, 'DUMMY', 165, 'NNNB', 165, NULL, 18000.0000, 18000.0000, 25.0000, 20000.0000, 20000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (166, 'DUMMY', 166, 'TN', 166, NULL, 215000.0000, 215000.0000, 25.0000, 260000.0000, 260000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (167, 'DUMMY', 167, 'RY', 167, NULL, 200000.0000, 200000.0000, 25.0000, 230000.0000, 230000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (168, 'DUMMY', 168, 'TR', 168, NULL, 200000.0000, 200000.0000, 25.0000, 230000.0000, 230000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (169, 'DUMMY', 169, 'KN', 169, NULL, 130000.0000, 130000.0000, 25.0000, 160000.0000, 160000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (170, 'DUMMY', 170, 'AUE', 170, NULL, 400000.0000, 400000.0000, 25.0000, 400000.0000, 400000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (171, 'DUMMY', 171, 'KB', 171, NULL, 280000.0000, 280000.0000, 25.0000, 330000.0000, 330000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (172, 'DUMMY', 172, 'KZ', 172, NULL, 350000.0000, 350000.0000, 25.0000, 400000.0000, 400000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (173, 'DUMMY', 173, 'KL', 173, NULL, 270000.0000, 270000.0000, 25.0000, 305000.0000, 305000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (174, 'DUMMY', 174, 'LJ', 174, NULL, 270000.0000, 270000.0000, 25.0000, 310000.0000, 310000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (175, 'DUMMY', 175, 'KH', 175, NULL, 325000.0000, 325000.0000, 25.0000, 385000.0000, 385000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (176, 'DUMMY', 176, 'KA', 176, NULL, 425000.0000, 425000.0000, 25.0000, 480000.0000, 480000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (177, 'DUMMY', 177, 'DL', 177, NULL, 200000.0000, 200000.0000, 25.0000, 245000.0000, 245000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (178, 'DUMMY', 178, 'ST', 178, NULL, 640000.0000, 640000.0000, 25.0000, 700000.0000, 700000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (179, 'DUMMY', 179, 'KBR', 179, NULL, 100000.0000, 100000.0000, 25.0000, 110000.0000, 110000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (180, 'DUMMY', 180, 'AV', 180, NULL, 460000.0000, 460000.0000, 25.0000, 495000.0000, 495000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (181, 'DUMMY', 181, 'P3', 181, NULL, 370000.0000, 370000.0000, 25.0000, 440000.0000, 440000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');
INSERT INTO `variations` VALUES (182, 'DUMMY', 182, 'AB', 182, NULL, 750000.0000, 750000.0000, 25.0000, 795000.0000, 795000.0000, '2025-02-26 12:50:34', '2025-02-26 12:50:34', NULL, '[]');

-- ----------------------------
-- Table structure for warranties
-- ----------------------------
DROP TABLE IF EXISTS `warranties`;
CREATE TABLE `warranties`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `duration` int NOT NULL,
  `duration_type` enum('days','months','years') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `warranties_business_id_index`(`business_id` ASC) USING BTREE,
  INDEX `warranties_duration_type_index`(`duration_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of warranties
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
