-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2023 年 09 月 28 日 11:58
-- 伺服器版本： 8.0.34-0ubuntu0.22.04.1
-- PHP 版本： 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `sample01`
--

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `Id` int NOT NULL,
  `Product_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` int NOT NULL,
  `Num` int NOT NULL,
  `Create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Member_id` int NOT NULL,
  `Pay` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否已付款'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `cart`
--

INSERT INTO `cart` (`Id`, `Product_id`, `Name`, `Price`, `Num`, `Create_at`, `Member_id`, `Pay`) VALUES
(145, '33', '包包04', 1000, 16, '2023-09-28 00:16:30', 14, 'Y');

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `ID` int NOT NULL COMMENT '編號(系統自動產生)',
  `Username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳號',
  `Password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密碼',
  `Nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '暱稱',
  `Email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'email',
  `Gender` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '性別(m,f)',
  `Age` int NOT NULL COMMENT '年齡',
  `Uid01` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserState` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `Total` int NOT NULL,
  `Level` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`ID`, `Username`, `Password`, `Nickname`, `Email`, `Gender`, `Age`, `Uid01`, `UserState`, `Total`, `Level`, `Create_at`) VALUES
(2, 'test001', 'test01', ' test001', 'email001', 'f', 0, NULL, 'false', 0, 'A', '2023-09-07 00:13:11'),
(6, 'test03', 'test03', 'test03', 'test03', 'm', 12, NULL, 'false', 0, 'B', '2023-09-07 00:13:11'),
(14, 'test02', '25d55c07ad', '測試02', 'test02', 'm', 28, 'b0657599bb', 'true', 16000, 'B', '2023-09-07 00:13:11'),
(15, 'test04', '25d55c07ad', 'test04', 'test04', 'f', 20, 'd84e7bcc47', 'true', 0, 'C', '2023-09-07 00:13:11'),
(21, 'sushi', '25d55c07ad', 'sushi', '123132@test', 'm', 123, '4bd74a377b', 'true', 0, 'C', '2023-09-07 00:13:11'),
(22, 'smember', '25d55c07ad', 'smember', '123', 'm', 12, '51847d6ab8', 'true', 0, 'S', '2023-09-12 02:17:50'),
(24, 'bmember', '25d55c07ad', 'B', 'B', 'm', 20, '63d2d03165', 'true', 0, 'C', '2023-09-12 05:18:07'),
(29, 'test06', '25d55c07ad', 'test06', 'test06', 'm', 1, NULL, 'true', 0, 'C', '2023-09-14 08:33:00'),
(30, 'admin', '25d55c07ad', '這是管理員帳號啦', 'admin@test.com', 'm', 0, 'df64d692c0', 'true', 999999, 'B', '2023-09-23 04:56:37'),
(31, '12345678', '25d55c07ad', ' 123456', '12345678', 'm', 1, '4606825362', 'true', 0, 'C', '2023-09-25 00:51:13'),
(32, 'aaaaa', '25d55c07ad', 'aaa', 'aaaaa@test.com', 'm', 30, '209a9b5d66', 'true', 181000, 'S', '2023-09-25 07:26:03'),
(33, 'test07', '25d55c07ad', 'test07', 'test07', 'f', 11, 'a2aa8a94ce', 'true', 1000199, 'S', '2023-09-25 08:21:55');

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `Id` int NOT NULL COMMENT '序號',
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品名',
  `Price` int NOT NULL COMMENT '價格',
  `Type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '種類',
  `Img` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Active` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建檔時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`Id`, `Name`, `Price`, `Type`, `Img`, `Active`, `Created_at`) VALUES
(30, '包01', 1000, '包包', 'bag01.png', 'N', '2023-09-08 00:28:02'),
(31, '包02', 1000, '包包', 'bag02.png', 'Y', '2023-09-08 00:28:02'),
(32, '包包03', 1000, '包包', 'bag03.png', 'N', '2023-09-08 00:28:48'),
(33, '包包04', 1000, '包包', 'bag04.png', 'Y', '2023-09-08 00:28:48'),
(38, '香香水01', 1000, '香水', 'perfume01.png', 'Y', '2023-09-08 00:34:23'),
(39, '香02', 1000, '香水', 'perfume02.png', 'Y', '2023-09-08 00:34:58'),
(40, '香水03', 1000, '香水', 'perfume03.png', 'Y', '2023-09-08 00:34:58'),
(41, '香水04', 1000, '香水', 'perfume04.png', 'N', '2023-09-08 00:35:22'),
(42, '首飾01', 1000, '首飾', 'jewelry01.png', 'N', '2023-09-08 00:36:14'),
(43, '首飾02', 1000, '首飾', 'jewelry02.png', 'Y', '2023-09-08 00:36:14'),
(44, '香水05', 1000, '香水', 'perfume05.png', 'N', '2023-09-12 06:39:48'),
(45, '香水06', 1000, '香水', 'perfume06.png', 'N', '2023-09-12 06:40:19'),
(46, '首飾03', 1000, '首飾', 'jewelry03.png', 'Y', '2023-09-12 06:41:27'),
(47, '首飾04', 1000, '首飾', 'jewelry04.png', 'Y', '2023-09-12 06:44:03'),
(48, '首飾05', 1000, '首飾', 'jewelry05.png', 'Y', '2023-09-12 06:44:19'),
(49, '首飾06', 1000, '首飾', 'jewelry06.png', 'Y', '2023-09-12 06:44:43'),
(59, '衣服01', 100, '衣服', 'c4ea616603_bag06.png', 'Y', '2023-09-23 01:01:16'),
(60, '衣服01', 100, '衣服', '1bee71732c_bag04.png', 'Y', '2023-09-23 01:13:50'),
(61, '衣服01', 100, '衣服', '824d1de360_bag04.png', 'Y', '2023-09-23 01:14:53'),
(62, '衣服01', 100, '衣服', '207af906b7_bag04.png', 'Y', '2023-09-23 01:14:58'),
(63, '衣服01', 100, '包包', '2539b63c4d_bag04.png', 'Y', '2023-09-23 01:15:07'),
(64, '衣服01', 100, '衣服', 'dc7db8dfab_bag04.png', 'Y', '2023-09-23 01:16:39'),
(65, '衣服01', 100, '包包', 'f1f52037ed_bag10.png', 'Y', '2023-09-23 01:18:08'),
(66, '衣服01', 100, '衣服', '050b24c9c7_bag01.png', 'Y', '2023-09-23 01:18:51'),
(67, '衣服01', 100, '衣服', '12ddd23c02_bag05.png', 'Y', '2023-09-23 01:20:48'),
(68, '衣服01', 100, '包包', '11ad47de92_bag04.png', 'Y', '2023-09-23 01:22:07'),
(69, '11', 100, '包包', '1968ea8ff1_bag04.png', 'Y', '2023-09-23 01:25:44'),
(70, '衣服001', 100, '衣服', '5b861d63db_bag04.png', 'Y', '2023-09-23 01:31:43'),
(71, '褲子001', 100, '褲子', '72c871c522_bag04.png', 'Y', '2023-09-23 01:32:21'),
(72, '褲子001', 100, '包包', '928d67aa9c_bag05.png', 'Y', '2023-09-23 01:34:03'),
(73, '衣服01', 100, '包包', 'ca3e8c0f06_bag05.png', 'Y', '2023-09-23 01:41:35'),
(74, '香水', 100, '香水', '29d2479061_bag07.png', 'N', '2023-09-23 03:56:25'),
(75, '衣服01', 100, '首飾', '2149d67a01_bag07.png', 'Y', '2023-09-23 04:35:31'),
(76, '衣服01', 100, '衣服', '999cf5d5d3_bag10.png', 'Y', '2023-09-23 04:36:21'),
(77, '衣服01', 100, '包包', 'b35ee67554_bag06.png', 'Y', '2023-09-23 04:42:22'),
(78, '衣服001', 100000, '包包', 'c4958b82fc_bag03.png', 'Y', '2023-09-23 06:14:38'),
(79, 'test123', 999999, '漢堡', '00b942baa9_images.jpg', 'N', '2023-09-25 08:10:44'),
(80, '漢堡', 100, '漢堡', 'b0d5acc54c_hamburger3.jpg', 'Y', '2023-09-27 07:10:24'),
(81, '水手服', 100, '水手服', '23c40b088c_222.jpg', 'Y', '2023-09-27 08:20:53');

-- --------------------------------------------------------

--
-- 資料表結構 `productType`
--

CREATE TABLE `productType` (
  `Id` int NOT NULL,
  `Type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Active` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `productType`
--

INSERT INTO `productType` (`Id`, `Type`, `Active`, `Create_at`) VALUES
(1, '包包', 'Y', '2023-09-18 06:35:53'),
(2, '香水', 'Y', '2023-09-18 06:35:53'),
(3, '首飾', 'Y', '2023-09-18 06:35:53'),
(4, '衣服', 'Y', '2023-09-18 06:35:53'),
(6, '褲子', 'N', '2023-09-18 06:35:53'),
(23, '水手服', 'Y', '2023-09-18 06:35:53'),
(24, '漢堡', 'Y', '2023-09-18 06:35:53'),
(26, '水', 'N', '2023-09-23 06:10:39');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`ID`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Id`);

--
-- 資料表索引 `productType`
--
ALTER TABLE `productType`
  ADD PRIMARY KEY (`Id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart`
--
ALTER TABLE `cart`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT '編號(系統自動產生)', AUTO_INCREMENT=34;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT COMMENT '序號', AUTO_INCREMENT=82;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `productType`
--
ALTER TABLE `productType`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
