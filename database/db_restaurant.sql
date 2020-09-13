-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2020 at 11:37 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_coupon`
--

CREATE TABLE `tb_coupon` (
  `coupon_ID` int(100) NOT NULL,
  `coupon_code` varchar(20) NOT NULL,
  `coupon_desc` text NOT NULL,
  `discount` int(5) NOT NULL COMMENT 'percent',
  `date_expire` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_coupon`
--

INSERT INTO `tb_coupon` (`coupon_ID`, `coupon_code`, `coupon_desc`, `discount`, `date_expire`) VALUES
(1, 'GO2018', 'this coupon code will make the total order amount 10% less', 10, '2021-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer`
--

CREATE TABLE `tb_customer` (
  `customer_id` int(100) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `l_name` varchar(30) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_customer`
--

INSERT INTO `tb_customer` (`customer_id`, `f_name`, `l_name`, `phone_no`, `username`, `password`) VALUES
(1, 'Jessamine', 'Cena', '09973891649', 'jessaminecena@gmail.com', '$2y$12$tJRN212GCUhNXc/cUWQtNO7xJ5QbdVIl0uILG4JJJ9rT6TcCKfWTG');

-- --------------------------------------------------------

--
-- Table structure for table `tb_fooditem`
--

CREATE TABLE `tb_fooditem` (
  `fooditem_ID` int(100) NOT NULL,
  `menucat_ID` int(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `unit` varchar(10) NOT NULL,
  `price` double NOT NULL,
  `img_directory` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_fooditem`
--

INSERT INTO `tb_fooditem` (`fooditem_ID`, `menucat_ID`, `name`, `description`, `unit`, `price`, `img_directory`) VALUES
(1, 1, 'Hotdog', '1 pc Hotdog Sed porttitor lectus nibh. Nulla quis lorem ut libero malesuada feugiat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.', 'PHP', 60.5, 'assets/images/food/hotdog.jpg'),
(2, 1, 'Cheeseburger', '1 pc Cheeseburger Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Nulla porttitor accumsan tincidunt.', 'PHP', 90.75, 'assets/images/food/cheeseburger.jpg'),
(3, 1, 'Fries', '1 pc regular Fries Vivamus suscipit tortor eget felis porttitor volutpat. Pellentesque in ipsum id orci porta dapibus. Pellentesque in ipsum id orci porta dapibus.', 'PHP', 45, 'assets/images/food/fries.jpg'),
(4, 2, 'Coke', '1 pc of Coke in can Nulla quis lorem ut libero malesuada feugiat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.', 'PHP', 55, 'assets/images/food/coke.jpg'),
(5, 2, 'Sprite ', '1 pc of Sprite in can Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Nulla porttitor accumsan tincidunt.', 'PHP', 55, 'assets/images/food/sprite.jpg'),
(6, 2, 'Tea', '1 cup of tea Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla quis lorem ut libero malesuada feugiat. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.', 'PHP', 35.5, 'assets/images/food/tea.jpg'),
(7, 3, 'Chicken Combo Meal', '3 pcs of fried chicken,1 pc of regular fries, 1 pc of cheeseburger with drinks. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.', 'PHP', 199.9, 'assets/images/food/chickencombo.jpg'),
(8, 3, 'Pork Combo Meal', '1 pc of fried porchop with rice, soup and fruits on the side. Nulla quis lorem ut libero malesuada feugiat. Pellentesque in ipsum id orci porta dapibus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.', 'PHP', 175.5, 'assets/images/food/porkcombo.jpg'),
(9, 3, 'Fish Combo Meal', '1 pc of grilled Salmon and Swai with rice. Nulla quis lorem ut libero malesuada feugiat. Donec rutrum congue leo eget malesuada. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.', 'PHP', 250.3, 'assets/images/food/fishcombo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_menucategory`
--

CREATE TABLE `tb_menucategory` (
  `menucat_ID` int(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_menucategory`
--

INSERT INTO `tb_menucategory` (`menucat_ID`, `name`, `description`) VALUES
(1, 'Burgers', 'Sample Menu: Hotdog, Cheeseburger, Fries'),
(2, 'Beverages', 'Sample Menu: Coke, Sprite, Tea'),
(3, 'Combo Meals', 'Sample Menu: Chicken Combo Meal, Pork Combo, Fish Combo');

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `order_ID` int(100) NOT NULL,
  `customer_ID` int(100) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_order_items`
--

CREATE TABLE `tb_order_items` (
  `order_items_ID` int(100) NOT NULL,
  `order_ID` int(100) NOT NULL,
  `fooditem_ID` int(100) NOT NULL,
  `quantity` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_payment`
--

CREATE TABLE `tb_payment` (
  `payment_ID` int(100) NOT NULL,
  `customer_ID` int(100) NOT NULL,
  `order_ID` int(100) NOT NULL,
  `coupon_ID` int(100) NOT NULL,
  `tax` int(5) NOT NULL COMMENT 'percent',
  `total_amount` double NOT NULL,
  `payment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_coupon`
--
ALTER TABLE `tb_coupon`
  ADD PRIMARY KEY (`coupon_ID`);

--
-- Indexes for table `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `tb_fooditem`
--
ALTER TABLE `tb_fooditem`
  ADD PRIMARY KEY (`fooditem_ID`),
  ADD KEY `menucat_ID` (`menucat_ID`);

--
-- Indexes for table `tb_menucategory`
--
ALTER TABLE `tb_menucategory`
  ADD PRIMARY KEY (`menucat_ID`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`order_ID`),
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Indexes for table `tb_order_items`
--
ALTER TABLE `tb_order_items`
  ADD PRIMARY KEY (`order_items_ID`),
  ADD KEY `order_ID` (`order_ID`),
  ADD KEY `fooditem_ID` (`fooditem_ID`);

--
-- Indexes for table `tb_payment`
--
ALTER TABLE `tb_payment`
  ADD PRIMARY KEY (`payment_ID`),
  ADD KEY `customer_ID` (`customer_ID`,`order_ID`,`coupon_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_coupon`
--
ALTER TABLE `tb_coupon`
  MODIFY `coupon_ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `customer_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_fooditem`
--
ALTER TABLE `tb_fooditem`
  MODIFY `fooditem_ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_menucategory`
--
ALTER TABLE `tb_menucategory`
  MODIFY `menucat_ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `order_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_order_items`
--
ALTER TABLE `tb_order_items`
  MODIFY `order_items_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_payment`
--
ALTER TABLE `tb_payment`
  MODIFY `payment_ID` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
