-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2024 at 03:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grocerydatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `groceryitems`
--

CREATE TABLE `groceryitems` (
  `item_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `availability` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `groceryitems`
--

INSERT INTO `groceryitems` (`item_id`, `name`, `image_url`, `category`, `price`, `quantity`, `availability`) VALUES
(1, 'Apple', 'http://localhost/WebsiteProject/GroceryImages/Apple.jpg', 'Fruit', 5.00, 10, 1),
(2, 'Banana', 'http://localhost/WebsiteProject/GroceryImages/Banana.jpg\r\n', 'Fruit', 23.20, 10, 1),
(3, 'Mango', 'http://localhost/WebsiteProject/GroceryImages/Mango.jpg\r\n', 'Fruit', 2.00, 10, 1),
(7, 'Carrots', 'http://localhost/WebsiteProject/GroceryImages/Carrots.jpg\r\n', 'Vegetables', 10.00, 10, 1),
(8, 'Lettuce', 'http://localhost/WebsiteProject/GroceryImages/Lettuce.jpg\r\n', 'Vegetables', 3.75, 10, 1),
(9, 'Tomatoes', 'http://localhost/WebsiteProject/GroceryImages/Tomatoes.jpg\r\n', 'Vegetables', 1.30, 10, 1),
(10, 'Chicken', 'http://localhost/WebsiteProject/GroceryImages/Chicken.jpeg\r\n', 'Meat', 8.00, 10, 1),
(11, 'Sausage', 'http://localhost/WebsiteProject/GroceryImages/Sausages.jpeg\r\n', 'Meat', 8.60, 10, 1),
(12, 'Beef', 'http://localhost/WebsiteProject/GroceryImages/Beef.jpg\r\n', 'Meat', 4.50, 10, 1),
(13, 'Fish Fingers', 'http://localhost/WebsiteProject/GroceryImages/Fish Fingers.jpg\r\n', 'Fish', 8.00, 10, 1),
(14, 'Salmon', 'http://localhost/WebsiteProject/GroceryImages/Salmon.jpg\r\n', 'Fish', 15.30, 10, 1),
(15, 'Brim', 'http://localhost/WebsiteProject/GroceryImages/Brim.jpg\r\n', 'Fish', 8.00, 10, 1),
(16, 'Milk1', 'http://localhost/WebsiteProject/GroceryImages/Milk1.jpeg\r\n', 'Milk', 8.00, 10, 1),
(17, 'Milk2', 'http://localhost/WebsiteProject/GroceryImages/Milk2.jpg\r\n', 'Milk', 2.00, 10, 1),
(18, 'Milk3', 'http://localhost/WebsiteProject/GroceryImages/Milk 3.jpg\r\n', 'Milk', 2.45, 10, 1),
(19, 'Eggs 12 Pack', 'http://localhost/WebsiteProject/GroceryImages/Eggs 12 Pack.jpeg\r\n', 'Eggs', 10.30, 10, 1),
(20, 'Eggs 6 Pack', 'http://localhost/WebsiteProject/GroceryImages/Eggs 6 Pack.jpg\r\n', 'Eggs', 10.30, 10, 1),
(21, 'Eggs 24 Pack', 'http://localhost/WebsiteProject/GroceryImages/Eggs 24 Pack.jpg\r\n', 'Eggs', 10.30, 10, 1),
(22, 'Red Wine', 'http://localhost/WebsiteProject/GroceryImages/Red Wine.jpeg\r\n', 'Wine', 22.50, 10, 1),
(23, 'White Wine', 'http://localhost/WebsiteProject/GroceryImages/White Wine.jpg\r\n', 'Wine', 37.10, 10, 1),
(24, 'Pino Grigio', 'http://localhost/WebsiteProject/GroceryImages/Pino Grigio.jpeg\r\n', 'Wine', 40.50, 10, 1),
(25, 'VB Beer', 'http://localhost/WebsiteProject/GroceryImages/VB Beer.jpeg\r\n', 'Beer', 8.00, 10, 1),
(26, 'Tooheys Beer', 'http://localhost/WebsiteProject/GroceryImages/Tooheys Beer1.jpg', 'Beer', 10.50, 10, 1),
(27, 'Stone&Wood', 'http://localhost/WebsiteProject/GroceryImages/Stone&Wood Beer.jpg\r\n', 'Beer', 5.80, 10, 1),
(28, 'Curry', 'http://localhost/WebsiteProject/GroceryImages/Curry.jpeg\r\n', 'Readymeals', 5.00, 10, 1),
(29, 'Butter Chicken', 'http://localhost/WebsiteProject/GroceryImages/Butter Chicken.jpeg\r\n', 'Readymeals', 10.00, 10, 1),
(30, 'Spaghetti Bolognese', 'http://localhost/WebsiteProject/GroceryImages/Spaghetti.jpeg\r\n', 'Readymeals', 15.00, 10, 1),
(31, 'Corn', 'http://localhost/WebsiteProject/GroceryImages/Corn.jpeg\r\n', 'Cannedgoods', 2.50, 10, 1),
(32, 'Baked Beans', 'http://localhost/WebsiteProject/GroceryImages/Baked Beans.jpg\r\n', 'Cannedgoods', 2.50, 10, 1),
(33, 'Mixed Vegetables', 'http://localhost/WebsiteProject/GroceryImages/Mixed Vegetables.jpeg\r\n', 'Cannedgoods', 2.50, 10, 1),
(34, 'Flat Noodle', 'http://localhost/WebsiteProject/GroceryImages/Flat Noodle.jpeg\r\n', 'Pasta', 5.50, 10, 1),
(35, 'Spaghetti Premium', 'http://localhost/WebsiteProject/GroceryImages/Spaghetti Premium.jpeg\r\n', 'Pasta', 6.50, 10, 1),
(36, 'Spaghetti', 'http://localhost/WebsiteProject/GroceryImages/Spaghetti Uncooked.jpeg\r\n', 'Pasta', 2.50, 10, 1),
(37, 'Bread', 'http://localhost/WebsiteProject/GroceryImages/Bread.jpg\r\n', 'Bread', 3.00, 10, 1),
(38, 'Rolls', 'http://localhost/WebsiteProject/GroceryImages/Rolls.jpg\r\n', 'Bread', 1.20, 10, 1),
(39, 'Buns', 'http://localhost/WebsiteProject/GroceryImages/Buns.jpg\r\n', 'Bread', 6.30, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` text NOT NULL,
  `username` varchar(18) NOT NULL,
  `email` varchar(21) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groceryitems`
--
ALTER TABLE `groceryitems`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groceryitems`
--
ALTER TABLE `groceryitems`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
