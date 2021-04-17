-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2021 at 05:09 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_cc`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Tên danh mục',
  `type` tinyint(3) DEFAULT 0 COMMENT 'Loại danh mục: 0 - Product, 1 - News',
  `avatar` varchar(100) DEFAULT NULL COMMENT 'Tên file ảnh danh mục',
  `description` text DEFAULT NULL COMMENT 'Mô tả chi tiết cho danh mục',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo danh mục',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `type`, `avatar`, `description`, `status`, `created_at`, `updated_at`) VALUES
(8, 'Samsung', 0, '1616920984-Screenshot_1.png', '<p>Tivi Samsung</p>\r\n', 0, '2021-03-28 08:43:04', NULL),
(9, 'sony', 0, '1618416592-sony4.jpg', '<p>danh mục sony</p>\r\n', 0, '2021-04-14 16:09:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(50) NOT NULL,
  `customername` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 NOT NULL,
  `first_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `last_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `jobs` varchar(200) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='id cua khach hang';

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customername`, `password`, `first_name`, `last_name`, `phone`, `address`, `email`, `avatar`, `jobs`, `last_login`, `facebook`, `status`, `created_at`, `update_at`) VALUES
(1, 'truongdu0212@gmail.com', '9e141c60b24bd8ccd16d8a0eaddb04f5', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Id của danh mục mà tin tức thuộc về, là khóa ngoại liên kết với bảng categories',
  `title` varchar(100) NOT NULL COMMENT 'Tiêu đề tin tức',
  `summary` varchar(100) DEFAULT NULL COMMENT 'Mô tả ngắn cho tin tức',
  `avatar` varchar(100) DEFAULT NULL COMMENT 'Tên file ảnh tin tức',
  `content` text DEFAULT NULL COMMENT 'Mô tả chi tiết cho sản phẩm',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `seo_title` varchar(100) DEFAULT NULL COMMENT 'Từ khóa seo cho title',
  `seo_description` varchar(100) DEFAULT NULL COMMENT 'Từ khóa seo cho phần mô tả',
  `seo_keywords` varchar(100) DEFAULT NULL COMMENT 'Các từ khóa seo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'Id của user trong trường hợp đã login và đặt hàng, là khóa ngoại liên kết với bảng users',
  `fullname` varchar(100) DEFAULT NULL COMMENT 'Tên khách hàng',
  `address` varchar(100) DEFAULT NULL COMMENT 'Địa chỉ khách hàng',
  `mobile` int(11) DEFAULT NULL COMMENT 'SĐT khách hàng',
  `email` varchar(100) DEFAULT NULL COMMENT 'Email khách hàng',
  `note` text DEFAULT NULL COMMENT 'Ghi chú từ khách hàng',
  `price_total` int(11) DEFAULT NULL COMMENT 'Tổng giá trị đơn hàng',
  `payment_status` tinyint(2) DEFAULT NULL COMMENT 'Trạng thái đơn hàng: 0 - Chưa thành toán, 1 - Đã thành toán',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo đơn',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fullname`, `address`, `mobile`, `email`, `note`, `price_total`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'du', 'thanh hóa', 985673110, NULL, 'baby', 0, 0, '2020-09-19 12:31:57', NULL),
(2, NULL, 'du', 'thanh hóa', 985673110, NULL, 'baby', 0, 0, '2020-09-19 12:32:30', NULL),
(3, NULL, 'du', 'thanh hóa', 985673110, NULL, 'baby', 0, 0, '2020-09-19 12:54:16', NULL),
(4, NULL, 'du', 'thanh hóa', 985673110, NULL, 'baby', 0, 0, '2020-09-19 12:54:31', NULL),
(5, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 12:55:54', NULL),
(6, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:12:02', NULL),
(7, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:16:51', NULL),
(8, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:17:57', NULL),
(9, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:18:24', NULL),
(10, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:21:00', NULL),
(11, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:25:27', NULL),
(12, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:26:30', NULL),
(13, NULL, 'du', 'thanh hóa', 985673110, NULL, 'pijpjip', 12, 0, '2020-09-19 13:38:12', NULL),
(14, NULL, 'du', 'thanh hóa', 985673110, NULL, 'fewfw', 12, 0, '2020-09-19 13:42:35', NULL),
(15, NULL, 'du', 'thanh hóa', 985673110, NULL, 'qfef', 12, 0, '2020-09-19 13:43:37', NULL),
(16, NULL, 'du', 'thanh hóa', 985673110, NULL, 'dưef', 12, 0, '2020-09-19 13:47:00', NULL),
(17, NULL, 'du', 'thanh hóa', 985673110, NULL, 'cds', 12, 0, '2020-09-19 13:55:46', NULL),
(18, NULL, 'du', 'thanh hóa', 985673110, NULL, 'rferhtyjtyjyj', 38290000, 0, '2021-04-03 03:50:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) DEFAULT NULL COMMENT 'Id của order tương ứng, là khóa ngoại liên kết với bảng orders',
  `product_id` int(11) DEFAULT NULL COMMENT 'Id của product tương ứng, là khóa ngoại liên kết với bảng products',
  `quantity` int(11) DEFAULT NULL COMMENT 'Số sản phẩm đã đặt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `quantity`) VALUES
(4, 22, 2),
(5, 22, 3),
(5, 23, 1),
(6, 22, 3),
(6, 23, 1),
(7, 22, 3),
(7, 23, 1),
(8, 22, 3),
(8, 23, 1),
(9, 22, 3),
(9, 23, 1),
(10, 22, 3),
(10, 23, 1),
(11, 22, 3),
(11, 23, 1),
(12, 22, 3),
(12, 23, 1),
(13, 22, 3),
(13, 23, 1),
(14, 22, 3),
(14, 23, 1),
(15, 22, 3),
(15, 23, 1),
(16, 22, 3),
(16, 23, 1),
(17, 22, 3),
(17, 23, 1),
(18, 28, 2),
(18, 27, 2),
(18, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'Id của danh mục mà sản phẩm thuộc về, là khóa ngoại liên kết với bảng categories',
  `title` varchar(100) DEFAULT NULL COMMENT 'Tên sản phẩm',
  `avatar` varchar(100) DEFAULT NULL COMMENT 'Tên file ảnh sản phẩm',
  `price` int(11) DEFAULT NULL COMMENT 'Giá sản phẩm',
  `amount` int(11) DEFAULT NULL COMMENT 'Số lượng sản phẩm trong kho',
  `summary` varchar(100) DEFAULT NULL COMMENT 'Mô tả ngắn cho sản phẩm',
  `content` text DEFAULT NULL COMMENT 'Mô tả chi tiết cho sản phẩm',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `seo_title` varchar(100) DEFAULT NULL COMMENT 'Từ khóa seo cho title',
  `seo_description` varchar(100) DEFAULT NULL COMMENT 'Từ khóa seo cho phần mô tả',
  `seo_keywords` varchar(100) DEFAULT NULL COMMENT 'Các từ khóa seo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `title`, `avatar`, `price`, `amount`, `summary`, `content`, `status`, `seo_title`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`) VALUES
(27, 8, 'Tivi LED Samsung HD 32 inch UA32N4000A', '1616921106-product-Screenshot_1.png', 5450000, 25, 'Tivi LED Samsung HD 32 inch UA32N4000A có thiết kế tinh tế và hiện đại với màn hình 32 inch nhỏ gọn,', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>&Acirc;m Thanh</td>\r\n			<td>MP3, M4A, MPA, AAC, FLAC, OGG, WMA, WAV, MID, MIDI</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tổng c&ocirc;ng suất loa</td>\r\n			<td>10W</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Số lượng loa</td>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>C&ocirc;ng nghệ &acirc;m thanh</td>\r\n			<td>Dolby Digital Plus</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>Samsung</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Component video</td>\r\n			<td>1 cổng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Composite video</td>\r\n			<td>1 cổng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Điều khiển tivi bằng điện thoại</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tivi kỹ thuật số (DVB-T2)</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Phim</td>\r\n			<td>AVI, MKV, ASF, WMV, MP4, 3GP, VRO, MPG, MPEG, TS, TP, TRP, MOV, FLV, VOB, SVI, DIVX</td>\r\n		</tr>\r\n		<tr>\r\n			<td>C&ocirc;ng nghệ xử l&yacute; h&igrave;nh ảnh</td>\r\n			<td>Clean View, N&acirc;ng cấp m&agrave;u mở rộng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Model</td>\r\n			<td>UA32N4000AKXXV</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cổng HDMI</td>\r\n			<td>2 cổng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cổng internet (LAN)</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ</td>\r\n			<td>Việt Nam</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Năm ra mắt</td>\r\n			<td>2019</td>\r\n		</tr>\r\n		<tr>\r\n			<td>H&igrave;nh ảnh</td>\r\n			<td>JPG, JPEG, BMP, MPO</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Remote th&ocirc;ng minh</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Độ ph&acirc;n giải</td>\r\n			<td>HD (1366 x 768)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>\r\n			<td>32 inch</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước kh&ocirc;ng ch&acirc;n/treo tường</td>\r\n			<td>(D&agrave;i x Cao x D&agrave;y) 737.4 x 438.0 x 74.1 mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước c&oacute; ch&acirc;n/đặt b&agrave;n</td>\r\n			<td>(D&agrave;i x Cao x D&agrave;y) 737.4 x 465.4 x 150.5 mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Phụ đề Phim</td>\r\n			<td>TTXT, SMI, SRT, SUB, TXT, SSA, ASS, PSB</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại Tivi</td>\r\n			<td>Tivi LED</td>\r\n		</tr>\r\n		<tr>\r\n			<td>USB</td>\r\n			<td>1 cổng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xem 3D</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Khối lượng kh&ocirc;ng ch&acirc;n</td>\r\n			<td>3.8kg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Khối lượng c&oacute; ch&acirc;n</td>\r\n			<td>3.9kg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>5393436508536</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '', '', 'Tivi Samsung', '2021-03-28 08:45:06', NULL),
(28, 8, 'Smart Tivi Samsung HD 32 inch UA32T4300', '1616921226-product-Screenshot_3.png', 5550000, 15, 'Thiết kế hiện đại, thanh lịch với độ mỏng tối ưu\r\nSmart Tivi Samsung HD 32 inch UA32T4300 sở hữu thi', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Tổng c&ocirc;ng suất loa</td>\r\n			<td>10 W</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Số lượng loa</td>\r\n			<td>2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>C&ocirc;ng nghệ &acirc;m thanh</td>\r\n			<td>Dolby Digital Plus</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>Samsung</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ thương hiệu</td>\r\n			<td>H&agrave;n Quốc</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Composite video</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tivi kỹ thuật số (DVB-T2)</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tần số qu&eacute;t</td>\r\n			<td>50Hz</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Hệ điều h&agrave;nh, giao diện</td>\r\n			<td>Tizen OS</td>\r\n		</tr>\r\n		<tr>\r\n			<td>C&ocirc;ng nghệ xử l&yacute; h&igrave;nh ảnh</td>\r\n			<td>Mega Contrast, Micro Dimming Pro, Hyper Real Engine, Digital Clean View, PurColor, N&acirc;ng cấp độ tương phản - Contrast Enhancer</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Kết nối b&agrave;n ph&iacute;m, chuột</td>\r\n			<td>C&oacute; thể kết nối (sử dụng tốt nhất trong tr&igrave;nh duyệt web)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Kết nối kh&ocirc;ng d&acirc;y</td>\r\n			<td>Chiếu m&agrave;n h&igrave;nh Screen Mirroring</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cổng HDMI</td>\r\n			<td>x2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cổng internet (LAN)</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Wifi</td>\r\n			<td>C&oacute;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ</td>\r\n			<td>Việt Nam</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Remote th&ocirc;ng minh</td>\r\n			<td>Kh&ocirc;ng d&ugrave;ng được</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Độ ph&acirc;n giải</td>\r\n			<td>HD (1366 x 768)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>\r\n			<td>32 inch</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước kh&ocirc;ng ch&acirc;n/treo tường</td>\r\n			<td>737.4 x 438.0 x 74.1 mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>K&iacute;ch thước c&oacute; ch&acirc;n/đặt b&agrave;n</td>\r\n			<td>737.4 x 465.4 x 150.5 mm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>C&aacute;c ứng dụng sẵn c&oacute;</td>\r\n			<td>Youtube, Tr&igrave;nh duyệt web</td>\r\n		</tr>\r\n		<tr>\r\n			<td>C&aacute;c ứng dụng phổ biến c&oacute; thể tải th&ecirc;m</td>\r\n			<td>Spotify, Clip TV, Fim+, Netflix, FPT Play</td>\r\n		</tr>\r\n		<tr>\r\n			<td>USB</td>\r\n			<td>x1</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xem 3D</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Khối lượng kh&ocirc;ng ch&acirc;n</td>\r\n			<td>4 kg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Khối lượng c&oacute; ch&acirc;n</td>\r\n			<td>4.1 kg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>3373721523316</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '', '', '', '2021-03-28 08:47:06', NULL),
(29, 8, 'Smart Tivi Samsung UHD 43 inch 43TU6900', '1616921446-product-Screenshot_2.png', 7850000, 10, 'Model: 43TU6900\r\nXuất xứ: Việt Nam\r\nTổng quan\r\nLoại tiviSmart Tivi, Tivi Ultra HD\r\nKích thước màn hì', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Thương hiệu</td>\r\n			<td>Samsung</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ thương hiệu</td>\r\n			<td>H&agrave;n Quốc</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất xứ</td>\r\n			<td>Việt Nam</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Năm ra mắt</td>\r\n			<td>2020</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xem 3D</td>\r\n			<td>Kh&ocirc;ng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Khối lượng kh&ocirc;ng ch&acirc;n</td>\r\n			<td>8</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Khối lượng c&oacute; ch&acirc;n</td>\r\n			<td>8</td>\r\n		</tr>\r\n		<tr>\r\n			<td>SKU</td>\r\n			<td>4960948100636</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1, '', '', '', '2021-03-28 08:50:46', NULL),
(30, 8, 'Tivi Samsung Smart Cong 4K UHD 65 inch UA65NU7500', '1616921591-product-Screenshot_4.png', 16290000, 4, 'Tivi Samsung Smart Cong 4K UHD 65 inch 65NU7500 có điểm nổi bật với thiết kế màn hình siêu mỏng cong', '<p>+ Loại Tivi: Smart Tivi Cong</p>\r\n\r\n<p>+ Độ ph&acirc;n giải: Ultra HD 4K</p>\r\n\r\n<p>+ Cổng HDMI: 3 cổng</p>\r\n\r\n<p>+ Năm ra mắt: 2018</p>\r\n\r\n<p>+ Nơi sản xuất: Việt Nam</p>\r\n\r\n<p>+ Hệ điều h&agrave;nh, giao diện: Tizen OS</p>\r\n\r\n<p>+ Bluetooth: C&oacute; (b&agrave;n ph&iacute;m, loa)</p>\r\n\r\n<p><strong>H&atilde;ng sản xuất</strong>: Samsung</p>\r\n\r\n<p><strong>M&agrave;n h&igrave;nh</strong>: 65 inch</p>\r\n\r\n<p><strong>Độ ph&acirc;n giải</strong>: Ultra HD 4K</p>\r\n\r\n<p><strong>Loại Tivi</strong>: Tivi Smart Ultra HD 4K, TIVI CAO CẤP</p>\r\n\r\n<p><strong>Xuất xứ</strong>: Việt Nam</p>\r\n', 1, '', '', '', '2021-03-28 08:53:11', NULL),
(31, 9, 'Android Tivi OLED Sony 4K 65 inch KD-65A9G', '1618416765-product-sony1.png', 60990000, 15, 'Đặc điểm nổi bật của Android Tivi OLED Sony 4K 65 inch KD-65A9G\r\nKD-65A9G là một trong những mẫu tiv', '<h2>Th&ocirc;ng số kỹ thuật</h2>\r\n\r\n<ul>\r\n	<li>Loại Tivi<a href=\"https://meta.vn/tv-sony-c3431?specs=112.64053\" target=\"_blank\">OLED</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=112.48621\" target=\"_blank\">Android TV</a></li>\r\n	<li>Bộ nhớ trong<a href=\"https://meta.vn/tv-sony-c3431?specs=441.48793\" target=\"_blank\">ROM 16GB</a></li>\r\n	<li>USB<a href=\"https://meta.vn/tv-sony-c3431?specs=1105.48624\" target=\"_blank\">3 cổng</a></li>\r\n	<li>C&ocirc;ng suất loa<a href=\"https://meta.vn/tv-sony-c3431?specs=1536.49788\" target=\"_blank\">2 loa 20W, 2 loa 10W&nbsp;<em>(60W)</em></a></li>\r\n	<li>Bluetooth<a href=\"https://meta.vn/tv-sony-c3431?specs=2327.46530\" target=\"_blank\">C&oacute;</a></li>\r\n	<li>Cổng HDMI<a href=\"https://meta.vn/tv-sony-c3431?specs=2432.48623\" target=\"_blank\">4 cổng</a></li>\r\n	<li>Cổng AV<a href=\"https://meta.vn/tv-sony-c3431?specs=2433.48612\" target=\"_blank\">Cổng Composite</a></li>\r\n	<li>Remote th&ocirc;ng minh<a href=\"https://meta.vn/tv-sony-c3431?specs=2434.48626\" target=\"_blank\">C&oacute;</a></li>\r\n	<li>Điều khiển tivi bằng điện thoại<a href=\"https://meta.vn/tv-sony-c3431?specs=2435.66622\" target=\"_blank\">Ứng dụng Android TV</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=2435.66736\" target=\"_blank\">Ứng dụng Video v&agrave; TV SideView</a></li>\r\n	<li>Model/Mẫu<a href=\"https://meta.vn/tv-sony-c3431?specs=2597.55396\" target=\"_blank\">2019</a></li>\r\n	<li>Độ ph&acirc;n giải<a href=\"https://meta.vn/tv-sony-c3431?specs=85.46162\" target=\"_blank\">4K</a></li>\r\n	<li>Kết nối<a href=\"https://meta.vn/tv-sony-c3431?specs=115.49545\" target=\"_blank\">LAN, Wifi</a></li>\r\n	<li>K&iacute;ch thước m&agrave;n h&igrave;nh<a href=\"https://meta.vn/tv-sony-c3431?specs=113.1531\" target=\"_blank\">65 inch</a></li>\r\n	<li>C&ocirc;ng suất<a href=\"https://meta.vn/tv-sony-c3431?specs=15.64055\" target=\"_blank\">469W</a></li>\r\n	<li>Nguồn điện &aacute;p<a href=\"https://meta.vn/tv-sony-c3431?specs=73.66077\" target=\"_blank\">AC 110 - 240V, 50 / 60Hz</a></li>\r\n	<li>T&iacute;ch hợp đầu thu KTS<a href=\"https://meta.vn/tv-sony-c3431?specs=120.1558\" target=\"_blank\">DVB-T2</a></li>\r\n	<li>C&ocirc;ng nghệ h&igrave;nh ảnh<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66571\" target=\"_blank\">4K X-Reality&trade; PRO</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.2062\" target=\"_blank\">C&ocirc;ng nghệ TRILUMINOS Display</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.10235\" target=\"_blank\">Dolby Vision</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66616\" target=\"_blank\">Dual database processing</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.48628\" target=\"_blank\">Dynamic Contrast Enhancer</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.54067\" target=\"_blank\">HDR10</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.54091\" target=\"_blank\">HLG</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.48639\" target=\"_blank\">Live Colour</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66733\" target=\"_blank\">Motionflow&trade; XR</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66640\" target=\"_blank\">Object-based HDR remaster</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66617\" target=\"_blank\">Object-based Super Resolution</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66619\" target=\"_blank\">Pixel Contrast Booster</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66618\" target=\"_blank\">Precision Colour Mapping</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66729\" target=\"_blank\">Super bit mapping&trade; HDR</a></li>\r\n	<li>Tiện &iacute;ch<a href=\"https://meta.vn/tv-sony-c3431?specs=2672.65954\" target=\"_blank\">Chiếu m&agrave;n h&igrave;nh điện thoại l&ecirc;n tivi</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=2672.65952\" target=\"_blank\">T&igrave;m kiếm bằng giọng n&oacute;i</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=2672.65955\" target=\"_blank\">Trợ l&iacute; ảo Google Assistant</a></li>\r\n	<li>C&ocirc;ng nghệ &acirc;m thanh<a href=\"https://meta.vn/tv-sony-c3431?specs=122.66741\" target=\"_blank\">Acoustic Surface Audio+</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=122.1899\" target=\"_blank\">Clear Phase</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=122.54652\" target=\"_blank\">Dolby Audio</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=122.66019\" target=\"_blank\">DTS</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=122.1921\" target=\"_blank\">S-Force Front Surround</a></li>\r\n	<li>Hệ điều h&agrave;nh<a href=\"https://meta.vn/tv-sony-c3431?specs=136.48625\" target=\"_blank\">Android 8.0</a></li>\r\n	<li>Số lượng loa<a href=\"https://meta.vn/tv-sony-c3431?specs=154.5290\" target=\"_blank\">4 loa</a></li>\r\n	<li>Cổng xuất &acirc;m thanh<a href=\"https://meta.vn/tv-sony-c3431?specs=2793.65320\" target=\"_blank\">Cổng Optical</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=2793.65259\" target=\"_blank\">HDMI ARC</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=2793.65257\" target=\"_blank\">Jack loa 3.5mm</a></li>\r\n	<li>Bộ xử l&yacute;<a href=\"https://meta.vn/tv-sony-c3431?specs=195.65816\" target=\"_blank\">X1&trade; Ultimate</a></li>\r\n</ul>\r\n', 1, '', '', '', '2021-04-14 16:12:45', NULL),
(32, 9, 'Tivi Android OLED Sony 4K 65 inch KD-65A8H (new 2021)', '1618416914-product-sony2.jpg', 56490000, 15, 'Đánh giá chi tiết tivi Android OLED Sony 4K 65 inch KD-65A8H\r\nThiết kế hiện đại, đẹp mắt\r\nTivi Andro', '<h2>Th&ocirc;ng số kỹ thuật</h2>\r\n\r\n<ul>\r\n	<li>Loại Tivi<a href=\"https://meta.vn/tv-sony-c3431?specs=112.48621\" target=\"_blank\">Android TV</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=112.64053\" target=\"_blank\">OLED</a></li>\r\n	<li>Jack cắm<a href=\"https://meta.vn/tv-sony-c3431?specs=452.4528\" target=\"_blank\">3,5mm</a></li>\r\n	<li>USB<a href=\"https://meta.vn/tv-sony-c3431?specs=1105.48624\" target=\"_blank\">3 cổng</a></li>\r\n	<li>C&ocirc;ng suất loa<a href=\"https://meta.vn/tv-sony-c3431?specs=1536.27339\" target=\"_blank\">30W</a></li>\r\n	<li>Bluetooth<a href=\"https://meta.vn/tv-sony-c3431?specs=2327.46530\" target=\"_blank\">C&oacute;</a></li>\r\n	<li>Cổng HDMI<a href=\"https://meta.vn/tv-sony-c3431?specs=2432.48623\" target=\"_blank\">4 cổng</a></li>\r\n	<li>Cổng AV<a href=\"https://meta.vn/tv-sony-c3431?specs=2433.48612\" target=\"_blank\">Cổng Composite</a></li>\r\n	<li>Remote th&ocirc;ng minh<a href=\"https://meta.vn/tv-sony-c3431?specs=2434.48626\" target=\"_blank\">C&oacute;</a></li>\r\n	<li>Điều khiển tivi bằng điện thoại<a href=\"https://meta.vn/tv-sony-c3431?specs=2435.66622\" target=\"_blank\">Ứng dụng Android TV</a></li>\r\n	<li>Model/Mẫu<a href=\"https://meta.vn/tv-sony-c3431?specs=2597.55398\" target=\"_blank\">2020</a></li>\r\n	<li>Độ ph&acirc;n giải<a href=\"https://meta.vn/tv-sony-c3431?specs=85.46162\" target=\"_blank\">4K</a></li>\r\n	<li>Kết nối<a href=\"https://meta.vn/tv-sony-c3431?specs=115.49545\" target=\"_blank\">LAN, Wifi</a></li>\r\n	<li>K&iacute;ch thước m&agrave;n h&igrave;nh<a href=\"https://meta.vn/tv-sony-c3431?specs=113.1531\" target=\"_blank\">65 inch</a></li>\r\n	<li>C&ocirc;ng suất<a href=\"https://meta.vn/tv-sony-c3431?specs=15.60237\" target=\"_blank\">457W</a></li>\r\n	<li>Nguồn điện &aacute;p<a href=\"https://meta.vn/tv-sony-c3431?specs=73.66077\" target=\"_blank\">AC 110 - 240V, 50 / 60Hz</a></li>\r\n	<li>T&iacute;ch hợp đầu thu KTS<a href=\"https://meta.vn/tv-sony-c3431?specs=120.1558\" target=\"_blank\">DVB-T2</a></li>\r\n	<li>C&ocirc;ng nghệ h&igrave;nh ảnh<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66571\" target=\"_blank\">4K X-Reality&trade; PRO</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.2062\" target=\"_blank\">C&ocirc;ng nghệ TRILUMINOS Display</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.10235\" target=\"_blank\">Dolby Vision</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66616\" target=\"_blank\">Dual database processing</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.48628\" target=\"_blank\">Dynamic Contrast Enhancer</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.54067\" target=\"_blank\">HDR10</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.54091\" target=\"_blank\">HLG</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.48639\" target=\"_blank\">Live Colour</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66640\" target=\"_blank\">Object-based HDR remaster</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66617\" target=\"_blank\">Object-based Super Resolution</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66619\" target=\"_blank\">Pixel Contrast Booster</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66618\" target=\"_blank\">Precision Colour Mapping</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66729\" target=\"_blank\">Super bit mapping&trade; HDR</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66620\" target=\"_blank\">X-Motion Clarity</a></li>\r\n	<li>Tiện &iacute;ch<a href=\"https://meta.vn/tv-sony-c3431?specs=2672.65954\" target=\"_blank\">Chiếu m&agrave;n h&igrave;nh điện thoại l&ecirc;n tivi</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=2672.65952\" target=\"_blank\">T&igrave;m kiếm bằng giọng n&oacute;i</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=2672.65955\" target=\"_blank\">Trợ l&iacute; ảo Google Assistant</a></li>\r\n	<li>C&ocirc;ng nghệ &acirc;m thanh<a href=\"https://meta.vn/tv-sony-c3431?specs=122.66735\" target=\"_blank\">Acoustic Surface Audio</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=122.1899\" target=\"_blank\">Clear Phase</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=122.63556\" target=\"_blank\">Dolby&trade; Audio, Dolby&trade; Atmos</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=122.66019\" target=\"_blank\">DTS</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=122.1921\" target=\"_blank\">S-Force Front Surround</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=122.66771\" target=\"_blank\">Voice Zoom</a></li>\r\n	<li>Hệ điều h&agrave;nh<a href=\"https://meta.vn/tv-sony-c3431?specs=136.55904\" target=\"_blank\">Android 9.0</a></li>\r\n	<li>Số lượng loa<a href=\"https://meta.vn/tv-sony-c3431?specs=154.5290\" target=\"_blank\">4 loa</a></li>\r\n	<li>Cổng xuất &acirc;m thanh<a href=\"https://meta.vn/tv-sony-c3431?specs=2793.65320\" target=\"_blank\">Cổng Optical</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=2793.65259\" target=\"_blank\">HDMI ARC</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=2793.65257\" target=\"_blank\">Jack loa 3.5mm</a></li>\r\n	<li>Bộ xử l&yacute;<a href=\"https://meta.vn/tv-sony-c3431?specs=195.65816\" target=\"_blank\">X1&trade; Ultimate</a></li>\r\n</ul>\r\n\r\n<h2>Th&ocirc;ng tin chung</h2>\r\n\r\n<ul>\r\n	<li>K&iacute;ch thước<a href=\"https://meta.vn/tv-sony-c3431?specs=29.66778\" target=\"_blank\">C&oacute; ch&acirc;n đế&nbsp;<em>(144,8cm x 85,7cm x 32,6cm)</em></a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=29.66776\" target=\"_blank\">Kh&ocirc;ng ch&acirc;n đế&nbsp;<em>(144,8cm x 83,6cm x 5,2cm)</em></a></li>\r\n	<li>Trọng lượng sản phẩm<a href=\"https://meta.vn/tv-sony-c3431?specs=35.6926\" target=\"_blank\">C&oacute; ch&acirc;n đế&nbsp;<em>(23,6kg)</em></a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=35.47040\" target=\"_blank\">Kh&ocirc;ng ch&acirc;n đế&nbsp;<em>(21,8kg)</em></a></li>\r\n	<li>Thương hiệu<a href=\"https://meta.vn/tv-sony-c3431?specs=69.1199\" target=\"_blank\">Nhật Bản</a></li>\r\n	<li>Sản xuất tại<a href=\"https://meta.vn/tv-sony-c3431?specs=68.1115\" target=\"_blank\">Malaysia</a></li>\r\n	<li>Bảo h&agrave;nh<a href=\"https://meta.vn/tv-sony-c3431?specs=67.1017\" target=\"_blank\">24 th&aacute;ng</a></li>\r\n</ul>\r\n', 1, '', '', '', '2021-04-14 16:15:14', NULL),
(33, 9, 'Smart Tivi OLED LG 4K 77 inch 77C9PTA', '1618417030-product-sony4.jpg', 143900000, 25, 'Smart Tivi OLED LG 4K 77 inch 77C9PTA cho màu sắc sặc sỡ chính xác đến tuyệt đối.\r\nMàn hình OLED, độ', '<h2>Th&ocirc;ng số kỹ thuật</h2>\r\n\r\n<ul>\r\n	<li>Loại Tivi<a href=\"https://meta.vn/tv-lg-c3432?specs=112.64053\" target=\"_blank\">OLED</a></li>\r\n	<li>USB<a href=\"https://meta.vn/tv-lg-c3432?specs=1105.48624\" target=\"_blank\">3 cổng</a></li>\r\n	<li>C&ocirc;ng suất loa<a href=\"https://meta.vn/tv-lg-c3432?specs=1536.49422\" target=\"_blank\">40W</a></li>\r\n	<li>Bluetooth<a href=\"https://meta.vn/tv-lg-c3432?specs=2327.46530\" target=\"_blank\">C&oacute;</a></li>\r\n	<li>Cổng HDMI<a href=\"https://meta.vn/tv-lg-c3432?specs=2432.48623\" target=\"_blank\">4 cổng</a></li>\r\n	<li>Cổng AV<a href=\"https://meta.vn/tv-lg-c3432?specs=2433.49384\" target=\"_blank\">Cổng composite v&agrave; cổng Component</a></li>\r\n	<li>Remote th&ocirc;ng minh<a href=\"https://meta.vn/tv-lg-c3432?specs=2434.63499\" target=\"_blank\">C&oacute; Magic Remote</a></li>\r\n	<li>Điều khiển tivi bằng điện thoại<a href=\"https://meta.vn/tv-lg-c3432?specs=2435.48603\" target=\"_blank\">LG TV Plus</a></li>\r\n	<li>Độ ph&acirc;n giải<a href=\"https://meta.vn/tv-lg-c3432?specs=85.46162\" target=\"_blank\">4K</a></li>\r\n	<li>Kết nối<a href=\"https://meta.vn/tv-lg-c3432?specs=115.49545\" target=\"_blank\">LAN, Wifi</a></li>\r\n	<li>K&iacute;ch thước m&agrave;n h&igrave;nh<a href=\"https://meta.vn/tv-lg-c3432?specs=113.49845\" target=\"_blank\">77 inch</a></li>\r\n	<li>C&ocirc;ng suất<a href=\"https://meta.vn/tv-lg-c3432?specs=15.49846\" target=\"_blank\">655W</a></li>\r\n	<li>T&iacute;ch hợp đầu thu KTS<a href=\"https://meta.vn/tv-lg-c3432?specs=120.48843\" target=\"_blank\">DVB-C, DVB-T2, DVB-T2C</a></li>\r\n	<li>C&ocirc;ng nghệ h&igrave;nh ảnh<a href=\"https://meta.vn/tv-lg-c3432?specs=114.66377\" target=\"_blank\">4K Cinema HDR</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=114.54669\" target=\"_blank\">4K Upscaler</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=114.66186\" target=\"_blank\">AI Brightness</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=114.10235\" target=\"_blank\">Dolby Vision</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=114.54668\" target=\"_blank\">HDR10 Pro</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=114.54091\" target=\"_blank\">HLG</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=114.66182\" target=\"_blank\">Ultra Luminance PRO</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=114.66379\" target=\"_blank\">Xử l&yacute; h&igrave;nh ảnh AI chuy&ecirc;n s&acirc;u</a></li>\r\n	<li>Tiện &iacute;ch<a href=\"https://meta.vn/tv-lg-c3432?specs=2672.66132\" target=\"_blank\">AI ThinQ</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=2672.65954\" target=\"_blank\">Chiếu m&agrave;n h&igrave;nh điện thoại l&ecirc;n tivi</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=2672.65952\" target=\"_blank\">T&igrave;m kiếm bằng giọng n&oacute;i</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=2672.65955\" target=\"_blank\">Trợ l&iacute; ảo Google Assistant</a></li>\r\n	<li>C&ocirc;ng nghệ &acirc;m thanh<a href=\"https://meta.vn/tv-lg-c3432?specs=122.54103\" target=\"_blank\">AI Sound</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=122.54104\" target=\"_blank\">Chế độ &acirc;m thanh v&ograve;m Dolby Surround</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=122.54107\" target=\"_blank\">Clear Voice III</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=122.54105\" target=\"_blank\">Dolby Atmos</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=122.54106\" target=\"_blank\">Ultra Surround</a></li>\r\n	<li>Hệ điều h&agrave;nh<a href=\"https://meta.vn/tv-lg-c3432?specs=136.48578\" target=\"_blank\">WebOS 4.5</a></li>\r\n	<li>Số lượng loa<a href=\"https://meta.vn/tv-lg-c3432?specs=154.1745\" target=\"_blank\">2 loa</a></li>\r\n	<li>Cổng xuất &acirc;m thanh<a href=\"https://meta.vn/tv-lg-c3432?specs=2793.65320\" target=\"_blank\">Cổng Optical</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=2793.65259\" target=\"_blank\">HDMI ARC</a>,&nbsp;<a href=\"https://meta.vn/tv-lg-c3432?specs=2793.65257\" target=\"_blank\">Jack loa 3.5mm</a></li>\r\n</ul>\r\n', 1, '', '', '', '2021-04-14 16:17:10', NULL),
(34, 9, 'Tivi Sony Smart 4K KD-55X7000G (Mẫu 2021) - 55 inch', '1618417131-product-sony5.jpg', 12490000, 15, 'Điểm nổi bật của Tivi Sony Smart 4K KD-55X7000G\r\nSmart Tivi Sony 4K KD-55X7000G có nhiều ưu điểm nổi', '<h2>Th&ocirc;ng số kỹ thuật</h2>\r\n\r\n<ul>\r\n	<li>Loại Tivi<a href=\"https://meta.vn/tv-sony-c3431?specs=112.1508\" target=\"_blank\">LED</a></li>\r\n	<li>USB<a href=\"https://meta.vn/tv-sony-c3431?specs=1105.48624\" target=\"_blank\">3 cổng</a></li>\r\n	<li>C&ocirc;ng suất loa<a href=\"https://meta.vn/tv-sony-c3431?specs=1536.27340\" target=\"_blank\">2 Loa&nbsp;<em>(20W)</em></a></li>\r\n	<li>Cổng HDMI<a href=\"https://meta.vn/tv-sony-c3431?specs=2432.48599\" target=\"_blank\">3 cổng</a></li>\r\n	<li>Cổng AV<a href=\"https://meta.vn/tv-sony-c3431?specs=2433.48612\" target=\"_blank\">Cổng Composite</a></li>\r\n	<li>Điều khiển tivi bằng điện thoại<a href=\"https://meta.vn/tv-sony-c3431?specs=2435.48640\" target=\"_blank\">C&oacute;</a></li>\r\n	<li>Model/Mẫu<a href=\"https://meta.vn/tv-sony-c3431?specs=2597.55396\" target=\"_blank\">2019</a></li>\r\n	<li>Độ ph&acirc;n giải<a href=\"https://meta.vn/tv-sony-c3431?specs=85.46162\" target=\"_blank\">4K</a></li>\r\n	<li>Kết nối<a href=\"https://meta.vn/tv-sony-c3431?specs=115.1746\" target=\"_blank\">USB, Cổng Internet LAN, Wifi, HDMI</a></li>\r\n	<li>K&iacute;ch thước m&agrave;n h&igrave;nh<a href=\"https://meta.vn/tv-sony-c3431?specs=113.1528\" target=\"_blank\">55 inch</a></li>\r\n	<li>C&ocirc;ng suất<a href=\"https://meta.vn/tv-sony-c3431?specs=15.60217\" target=\"_blank\">173W</a></li>\r\n	<li>Nguồn điện &aacute;p<a href=\"https://meta.vn/tv-sony-c3431?specs=73.66077\" target=\"_blank\">AC 110 - 240V, 50 / 60Hz</a></li>\r\n	<li>T&iacute;ch hợp đầu thu KTS<a href=\"https://meta.vn/tv-sony-c3431?specs=120.1790\" target=\"_blank\">DVB-T/T2</a></li>\r\n	<li>Tần số qu&eacute;t<a href=\"https://meta.vn/tv-sony-c3431?specs=119.1616\" target=\"_blank\">50Hz</a></li>\r\n	<li>C&ocirc;ng nghệ h&igrave;nh ảnh<a href=\"https://meta.vn/tv-sony-c3431?specs=114.48638\" target=\"_blank\">4K X-Reality PRO</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.2062\" target=\"_blank\">C&ocirc;ng nghệ TRILUMINOS Display</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.48628\" target=\"_blank\">Dynamic Contrast Enhancer</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.54067\" target=\"_blank\">HDR10</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.54091\" target=\"_blank\">HLG</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.48639\" target=\"_blank\">Live Colour</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=114.66573\" target=\"_blank\">Motionflow&trade; XR 200</a></li>\r\n	<li>Tiện &iacute;ch<a href=\"https://meta.vn/tv-sony-c3431?specs=2672.65954\" target=\"_blank\">Chiếu m&agrave;n h&igrave;nh điện thoại l&ecirc;n tivi</a></li>\r\n	<li>C&ocirc;ng nghệ &acirc;m thanh<a href=\"https://meta.vn/tv-sony-c3431?specs=122.1921\" target=\"_blank\">S-Force Front Surround</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=122.1899\" target=\"_blank\">Clear Phase</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=122.1585\" target=\"_blank\">ClearAudio+</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=122.48723\" target=\"_blank\">Digital Sound Enhancement Engine (DSEE)</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=122.54652\" target=\"_blank\">Dolby Audio</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=122.66019\" target=\"_blank\">DTS</a></li>\r\n	<li>Hệ điều h&agrave;nh<a href=\"https://meta.vn/tv-sony-c3431?specs=136.5274\" target=\"_blank\">Linux</a></li>\r\n	<li>Số lượng loa<a href=\"https://meta.vn/tv-sony-c3431?specs=154.1745\" target=\"_blank\">2 loa</a></li>\r\n	<li>Cổng xuất &acirc;m thanh<a href=\"https://meta.vn/tv-sony-c3431?specs=2793.65320\" target=\"_blank\">Cổng Optical</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=2793.65259\" target=\"_blank\">HDMI ARC</a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=2793.65257\" target=\"_blank\">Jack loa 3.5mm</a></li>\r\n</ul>\r\n\r\n<h2>Th&ocirc;ng tin chung</h2>\r\n\r\n<ul>\r\n	<li>K&iacute;ch thước<a href=\"https://meta.vn/tv-sony-c3431?specs=29.48637\" target=\"_blank\">C&oacute; ch&acirc;n&nbsp;<em>(124.1cm x 78.5cm x 33.6cm)</em></a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=29.48636\" target=\"_blank\">Kh&ocirc;ng ch&acirc;n&nbsp;<em>(124.1cm x 72.1cm x 7.9cm)</em></a></li>\r\n	<li>Trọng lượng sản phẩm<a href=\"https://meta.vn/tv-sony-c3431?specs=35.1257\" target=\"_blank\">C&oacute; ch&acirc;n&nbsp;<em>(16,5kg)</em></a>,&nbsp;<a href=\"https://meta.vn/tv-sony-c3431?specs=35.48635\" target=\"_blank\">Kh&ocirc;ng ch&acirc;n&nbsp;<em>(15.4kg)</em></a></li>\r\n	<li>Thương hiệu<a href=\"https://meta.vn/tv-sony-c3431?specs=69.1199\" target=\"_blank\">Nhật Bản</a></li>\r\n	<li>Sản xuất tại<a href=\"https://meta.vn/tv-sony-c3431?specs=68.1115\" target=\"_blank\">Malaysia</a></li>\r\n	<li>Bảo h&agrave;nh<a href=\"https://meta.vn/tv-sony-c3431?specs=67.1017\" target=\"_blank\">24 th&aacute;ng</a></li>\r\n</ul>\r\n', 1, '', '', '', '2021-04-14 16:18:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(100) DEFAULT NULL COMMENT 'Mật khẩu đăng nhập',
  `first_name` varchar(100) DEFAULT NULL COMMENT 'Fist name',
  `last_name` varchar(100) DEFAULT NULL COMMENT 'Last name',
  `phone` int(11) DEFAULT NULL COMMENT 'SĐT user',
  `address` varchar(100) DEFAULT NULL COMMENT 'Địa chỉ user',
  `email` varchar(100) DEFAULT NULL COMMENT 'Email của user',
  `avatar` varchar(100) DEFAULT NULL COMMENT 'File ảnh đại diện',
  `jobs` varchar(100) DEFAULT NULL COMMENT 'Nghề nghiệp',
  `last_login` datetime DEFAULT NULL COMMENT 'Lần đăng nhập gần đây nhất',
  `facebook` varchar(100) DEFAULT NULL COMMENT 'Link facebook',
  `status` tinyint(3) DEFAULT 0 COMMENT 'Trạng thái danh mục: 0 - Inactive, 1 - Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` datetime DEFAULT NULL COMMENT 'Ngày cập nhật cuối'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `phone`, `address`, `email`, `avatar`, `jobs`, `last_login`, `facebook`, `status`, `created_at`, `updated_at`) VALUES
(1, 'truongdu0212@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-08-29 09:20:57', NULL),
(3, 'truongdu1107@gmail.com', '915d1427fdf8a4e9cdc2df8a8cb727a3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-03-05 07:58:29', NULL),
(4, 'truongdu0212@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trương', 'Dụ', 985673110, 'thanh hóa', 'truongdu0212@gmail.com', '1618451291-user-sony2.jpg', '', NULL, '', 1, '2021-04-15 01:48:11', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
