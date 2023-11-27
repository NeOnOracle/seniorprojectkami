-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2023 at 05:35 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aicook`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `ID` varchar(5) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`ID`, `Name`, `Category`) VALUES
('F0001', 'milk', 'animal product'),
('F0002', 'cheese', 'animal product'),
('F0003', 'egg', 'animal product'),
('F0004', 'parmesan cheese', 'animal product'),
('F0005', 'american cheese', 'animal product'),
('F0006', 'cheddar cheese', 'animal product'),
('F0007', 'cottage cheese', 'animal product'),
('F0008', 'mozzarella cheese', 'animal product'),
('F0009', 'greek yogurt', 'animal product'),
('F0010', 'yogurt', 'animal product'),
('F0011', 'butter', 'animal product'),
('F0012', 'buttermilk', 'animal product'),
('F0013', 'cream cheese', 'animal product'),
('F0014', 'cream', 'animal product'),
('F0015', 'heavy cream', 'animal product'),
('F0016', 'sour cream', 'animal product'),
('F0017', 'salt', 'condiment'),
('F0018', 'mustard', 'condiment'),
('F0019', 'oil', 'oil'),
('F0020', 'canola oil', 'oil'),
('F0021', 'corn oil', 'oil'),
('F0022', 'vegetable oil', 'oil'),
('F0023', 'olive oil', 'oil'),
('F0024', 'ground turkey', 'poultry'),
('F0025', 'turkey', 'poultry'),
('F0026', 'chicken', 'poultry'),
('F0027', 'salsa', 'sauce'),
('F0028', 'sauce', 'sauce'),
('F0029', 'hot dogs', 'processed meat'),
('F0030', 'frankfurter', 'processed meat'),
('F0031', 'sausage', 'processed meat'),
('F0032', 'italian pork sausage', 'processed meat'),
('F0033', 'ham', 'processed meat'),
('F0034', 'chorizo pork sausage', 'processed meat'),
('F0035', 'grapefruit juice', 'fruit'),
('F0036', 'peaches', 'fruit'),
('F0037', 'figs', 'fruit'),
('F0038', 'kiwi', 'fruit'),
('F0039', 'kiwifruit', 'fruit'),
('F0040', 'cantaloupe', 'fruit'),
('F0041', 'melons', 'fruit'),
('F0042', 'nectarines', 'fruit'),
('F0043', 'oranges', 'fruit'),
('F0044', 'strawberries', 'fruit'),
('F0045', 'pears', 'fruit'),
('F0046', 'olives', 'fruit'),
('F0047', 'bananas', 'fruit'),
('F0048', 'apples', 'fruit'),
('F0049', 'apple juice', 'fruit'),
('F0050', 'orange juice', 'fruit'),
('F0051', 'grape juice', 'fruit'),
('F0052', 'cranberry juice', 'fruit'),
('F0053', 'raspberries', 'fruit'),
('F0054', 'blueberries', 'fruit'),
('F0055', 'grapes', 'fruit'),
('F0056', 'applesauce', 'fruit'),
('F0057', 'pineapple', 'fruit'),
('F0058', 'cherries', 'fruit'),
('F0059', 'pork', 'pork'),
('F0060', 'tomatoes', 'vegetable'),
('F0061', 'beans', 'vegetable'),
('F0062', 'broccoli', 'vegetable'),
('F0063', 'kale', 'vegetable'),
('F0064', 'onion rings', 'vegetable'),
('F0065', 'pickles', 'vegetable'),
('F0066', 'carrots', 'vegetable'),
('F0067', 'lettuce', 'vegetable'),
('F0068', 'romaine lettuce', 'vegetable'),
('F0069', 'ketchup', 'vegetable'),
('F0070', 'onions', 'vegetable'),
('F0071', 'garlic', 'vegetable'),
('F0072', 'mushroom', 'vegetable'),
('F0073', 'spinach', 'vegetable'),
('F0075', 'tomato juice', 'vegetable'),
('F0076', 'peppers', 'vegetable'),
('F0077', 'potatoes', 'vegetable'),
('F0078', 'sweet potatoes', 'vegetable'),
('F0079', 'celery', 'vegetable'),
('F0080', 'cucumber', 'vegetable'),
('F0081', 'cabbage', 'vegetable'),
('F0082', 'green beans', 'vegetable'),
('F0083', 'cassava flour', 'vegetable'),
('F0084', 'almonds', 'nut'),
('F0085', 'nuts', 'nut'),
('F0086', 'sunflower seeds', 'nut'),
('F0087', 'seeds', 'nut'),
('F0088', 'sesame butter', 'nut'),
('F0089', 'almond butter', 'nut'),
('F0090', 'flaxseed', 'nut'),
('F0091', 'sesame seed butter (tahini)', 'nut'),
('F0092', 'ground flaxseed meal', 'nut'),
('F0093', 'brazil nuts', 'nut'),
('F0094', 'cashews', 'nut'),
('F0095', 'pumpkin seeds (pepitas)', 'nut'),
('F0096', 'hazelnuts', 'nut'),
('F0097', 'macadamia nuts', 'nut'),
('F0098', 'pistachio nuts', 'nut'),
('F0099', 'sunflower seed kernels', 'nut'),
('F0100', 'coconut flour', 'nut'),
('F0101', 'chestnut flour', 'nut'),
('F0102', 'beef', 'beef'),
('F0103', 'almond milk', 'nut milk'),
('F0104', 'oat milk', 'nut milk'),
('F0105', 'haddock', 'seafood'),
('F0106', 'fish', 'seafood'),
('F0107', 'pollock', 'seafood'),
('F0108', 'tuna', 'seafood'),
('F0109', 'hummus', 'legume'),
('F0110', 'peanut butter', 'legume'),
('F0111', 'soy milk', 'legume'),
('F0112', 'peanuts', 'legume'),
('F0113', 'white bread', 'grain'),
('F0114', 'bread', 'grain'),
('F0115', 'oatmeal cookies with raisins', 'grain'),
('F0116', 'cookies', 'grain'),
('F0117', 'whole wheat bread', 'grain'),
('F0118', 'sugar', 'sugar'),
('F0119', 'flour', 'refined grain'),
('F0120', 'oats', 'refined grain'),
('F0121', 'buckwheat', 'refined grain'),
('F0122', 'millet', 'refined grain'),
('F0123', 'rice', 'refined grain'),
('F0124', 'amaranth', 'refined grain'),
('F0125', 'quinoa', 'refined grain'),
('F0126', 'brown rice', 'refined grain'),
('F0127', 'white rice', 'refined grain'),
('F0128', 'sorghum', 'refined grain'),
('F0129', 'rye', 'refined grain'),
('F0130', 'barley', 'refined grain');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_in_stock`
--

CREATE TABLE `ingredient_in_stock` (
  `ID` int(11) NOT NULL,
  `UserID` varchar(5) DEFAULT NULL,
  `IngredientID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient_in_stock`
--

INSERT INTO `ingredient_in_stock` (`ID`, `UserID`, `IngredientID`) VALUES
(1, 'U0001', 'F0001'),
(2, 'U0001', 'F0002'),
(3, 'U0001', 'F0003'),
(4, 'U0001', 'F0007'),
(5, 'U0001', 'F0011'),
(6, 'U0001', 'F0023'),
(7, 'U0001', 'F0040'),
(8, 'U0001', 'F0052'),
(9, 'U0001', 'F0067'),
(10, 'U0001', 'F0101'),
(11, 'U0002', 'F0003'),
(12, 'U0002', 'F0016'),
(13, 'U0002', 'F0017'),
(14, 'U0002', 'F0121'),
(15, 'U0002', 'F0047'),
(16, 'U0002', 'F0022'),
(17, 'U0002', 'F0080'),
(18, 'U0002', 'F0062'),
(19, 'U0002', 'F0111'),
(20, 'U0002', 'F0122'),
(21, 'U0003', 'F0029'),
(22, 'U0003', 'F0030'),
(23, 'U0003', 'F0004'),
(24, 'U0003', 'F0020'),
(25, 'U0003', 'F0033'),
(26, 'U0003', 'F0063'),
(27, 'U0003', 'F0045'),
(28, 'U0003', 'F0086'),
(29, 'U0003', 'F0090'),
(30, 'U0003', 'F0069');

-- --------------------------------------------------------

--
-- Table structure for table `user_has_preference`
--

CREATE TABLE `user_has_preference` (
  `ID` int(11) NOT NULL,
  `UserID` varchar(5) DEFAULT NULL,
  `PrefCode` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_has_preference`
--

INSERT INTO `user_has_preference` (`ID`, `UserID`, `PrefCode`) VALUES
(1, 'U0001', 'P0005'),
(2, 'U0001', 'P0009');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `ID` varchar(5) NOT NULL,
  `FName` varchar(50) NOT NULL,
  `LName` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`ID`, `FName`, `LName`, `Username`, `Password`, `Email`) VALUES
('U0001', 'James', 'Bond', 'jamesbond007', '007', 'jamesbond007@gmail.com'),
('U0002', 'Charlie', 'Brown', 'charlieBrown1968', 'snoopDoggIsMaDogg', 'charlieBrown1968@hotmail.com'),
('U0003', 'Ash', 'Ketchum', 'AshKetchum151', 'theverybestlikenooneeverwas', 'ketchum151@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_preference`
--

CREATE TABLE `user_preference` (
  `ID` varchar(5) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_preference`
--

INSERT INTO `user_preference` (`ID`, `Name`, `Category`) VALUES
('P0001', 'milk', 'allergy'),
('P0002', 'eggs', 'allergy'),
('P0003', 'tree nuts', 'allergy'),
('P0004', 'peanuts', 'allergy'),
('P0005', 'soybeans', 'allergy'),
('P0006', 'fish', 'allergy'),
('P0007', 'crustacean shellfish', 'allergy'),
('P0008', 'wheat', 'allergy'),
('P0009', 'sesame', 'allergy'),
('P0010', 'vegetarian', 'diet'),
('P0011', 'pescetarian', 'diet'),
('P0012', 'vegan', 'diet'),
('P0013', 'dairy-free', 'diet'),
('P0014', 'gluten free', 'diet'),
('P0015', 'paleo', 'diet'),
('P0016', 'raw food', 'diet'),
('P0017', 'keto', 'diet'),
('P0018', 'judaism', 'religious diet'),
('P0019', 'islam', 'religious diet'),
('P0020', 'roman catholicism', 'religious diet'),
('P0021', 'mormonism', 'religious diet'),
('P0022', 'seventh-day adventist', 'religious diet'),
('P0023', 'hinduism', 'religious diet'),
('P0024', 'buddhism', 'religious diet'),
('P0025', 'sikhism', 'religious diet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ingredient_in_stock`
--
ALTER TABLE `ingredient_in_stock`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `IngredientID` (`IngredientID`);

--
-- Indexes for table `user_has_preference`
--
ALTER TABLE `user_has_preference`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `PrefCode` (`PrefCode`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `user_preference`
--
ALTER TABLE `user_preference`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredient_in_stock`
--
ALTER TABLE `ingredient_in_stock`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user_has_preference`
--
ALTER TABLE `user_has_preference`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredient_in_stock`
--
ALTER TABLE `ingredient_in_stock`
  ADD CONSTRAINT `ingredient_in_stock_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user_info` (`ID`),
  ADD CONSTRAINT `ingredient_in_stock_ibfk_2` FOREIGN KEY (`IngredientID`) REFERENCES `ingredient` (`ID`);

--
-- Constraints for table `user_has_preference`
--
ALTER TABLE `user_has_preference`
  ADD CONSTRAINT `user_has_preference_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user_info` (`ID`),
  ADD CONSTRAINT `user_has_preference_ibfk_2` FOREIGN KEY (`PrefCode`) REFERENCES `user_preference` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
