-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2024 at 09:53 PM
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
-- Database: `phone`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `Address_ID` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `customer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`Address_ID`, `Address`, `customer_ID`) VALUES
(1, '789 Elm St, Villagetown', 2),
(2, '456 Pine St, Hamletville', 1),
(3, '101 Oak St, Cityville', 3),
(4, '202 Maple St, Riverside', 4),
(5, '303 Birch St, Townsville', 5),
(6, '456 Oak St, Townsville', 6),
(7, '789 Pine St, Villagetown', 7),
(8, '101 Maple St, Hamletville', 8),
(9, '202 Elm St, Riverside', 9),
(10, '303 Cedar St, Mountainville', 10),
(11, '404 Birch St, Seaville', 11),
(12, '505 Spruce St, Hillside', 12),
(13, '606 Walnut St, Lakeside', 13),
(14, '707 Maple St, Valleytown', 14),
(15, '808 Pine St, Glendale', 15);

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `Contract_ID` int(11) NOT NULL,
  `Contract_Duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`Contract_ID`, `Contract_Duration`) VALUES
(1, 12),
(2, 24),
(3, 6),
(4, 18),
(5, 36),
(6, 12),
(7, 24),
(8, 6),
(9, 18),
(10, 36),
(11, 9),
(12, 15),
(13, 30),
(14, 3),
(15, 21);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_ID`, `first_name`, `last_name`, `contact_number`, `email_address`, `date_of_birth`, `gender`) VALUES
(1, 'Jonnnn', 'Doe', '123-456-7890', 'john.doe@example.com', '1990-01-15', 'Male'),
(2, 'Jane', 'Smith', '987-654-3210', 'jane.smith@example.com', '1985-05-22', 'Female'),
(3, 'Bob', 'Johnson', '555-123-4567', 'bob.johnson@example.com', '1988-09-10', 'Male'),
(4, 'Alice', 'Williams', '555-987-6543', 'demo@demo.com', '1992-03-18', 'Female'),
(7, 'Carlos', 'Hernandez', '555-123-7890', 'carlos.h@example.com', '1987-08-12', 'Male'),
(8, 'Rajesh', 'Patel', '555-987-6543', 'rajesh.p@example.com', '1995-04-22', 'Male'),
(9, 'Sophia', 'Johnson', '555-567-8901', 'sophia.j@example.com', '1982-11-30', 'Female'),
(10, 'Giuseppe', 'Moretti', '555-234-5678', 'giuseppe.m@example.com', '1990-06-15', 'Male'),
(11, 'Amelia', 'Rossi', '555-876-5432', 'amelia.r@example.com', '1988-02-28', 'Female'),
(12, 'Miguel', 'Lopez', '555-345-6789', 'miguel.l@example.com', '1993-09-05', 'Male'),
(13, 'Isabella', 'Martinez', '555-654-3210', 'isabella.m@example.com', '1985-07-20', 'Female'),
(14, 'Luca', 'Conti', '555-432-1098', 'luca.c@example.com', '1998-01-10', 'Male'),
(15, 'Olivia', 'Gomez', '555-789-0123', 'olivia.g@example.com', '1980-04-18', 'Female'),
(16, 'Mateo', 'Castillo', '555-210-9876', 'mateo.c@example.com', '1991-12-03', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `device_ID` int(11) NOT NULL,
  `device_name` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `manufacturer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`device_ID`, `device_name`, `brand`, `model`, `manufacturer`) VALUES
(1, 'Smartphone', 'Samsung', 'Galaxy S21', 'Samsung Electronics'),
(2, 'Laptop', 'Dell', 'XPS 13', 'Dell Technologies'),
(3, 'Tablet', 'Apple', 'iPad Air', 'Apple Inc.'),
(4, 'Smartwatch', 'Fitbit', 'Versa 3', 'Fitbit Inc.'),
(5, 'Camera', 'Canon', 'EOS Rebel T7i', 'Canon Inc.'),
(6, 'iPhone', 'Apple', '15', 'Apple'),
(7, 'Headphones', 'Sony', 'WH-1000XM4', 'Sony Corporation'),
(8, 'Smart TV', 'LG', 'OLED C1', 'LG Electronics'),
(9, 'Fitness Tracker', 'Garmin', 'Vivosmart 4', 'Garmin Ltd.'),
(10, 'Bluetooth Speaker', 'JBL', 'Flip 5', 'HARMAN International'),
(11, 'Gaming Console', 'Microsoft', 'Xbox Series X', 'Microsoft Corporation'),
(12, 'Digital Camera', 'Nikon', 'D5600', 'Nikon Corporation'),
(13, 'Wireless Mouse', 'Logitech', 'MX Master 3', 'Logitech International'),
(14, 'Coffee Maker', 'Keurig', 'K-Elite', 'Keurig Dr Pepper'),
(15, 'Robot Vacuum', 'iRobot', 'Roomba i7+', 'iRobot Corporation'),
(16, 'Air Purifier', 'Dyson', 'Pure Cool TP04', 'Dyson Ltd.');

-- --------------------------------------------------------

--
-- Table structure for table `device_details`
--

CREATE TABLE `device_details` (
  `device_ID` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `warranty_information` varchar(255) NOT NULL,
  `technical_specifications` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `device_details`
--

INSERT INTO `device_details` (`device_ID`, `price`, `warranty_information`, `technical_specifications`) VALUES
(1, 799.99, '1-year warranty', '6.2-inch display, 128GB storage, etc.'),
(2, 1499.99, '2-year warranty', '13.3-inch display, 512GB SSD, etc.'),
(3, 399.99, '6-month warranty', '10-inch display, 64GB storage, etc.'),
(4, 899.99, '3-year warranty', '15.6-inch display, 1TB HDD, etc.'),
(5, 199.99, 'No warranty', '7-inch display, 32GB storage, etc.'),
(6, 129.99, '1-year warranty', 'Over-ear, Noise-canceling, Bluetooth'),
(7, 1799.99, '2-year warranty', '4K OLED, Smart TV, WebOS'),
(8, 99.99, '6-month warranty', 'Heart rate monitor, Sleep tracking, Waterproof'),
(9, 99.95, '1-year warranty', 'Portable, Waterproof, JBL Signature Sound'),
(10, 499.99, '1-year warranty', '4K UHD, 120fps, 1TB SSD'),
(11, 699.99, '2-year warranty', '24.2MP DX-format, Full HD video, Wi-Fi'),
(12, 99.99, '1-year warranty', 'Wireless, Ergonomic design, Multi-device support'),
(13, 129.99, '1-year warranty', 'Single-serve, Strong brew, Iced coffee'),
(14, 799.99, '2-year warranty', 'Smart mapping, Clean Base Automatic Dirt Disposal'),
(15, 499.99, '2-year warranty', 'HEPA filter, Air Multiplier technology, Night mode');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_ID` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `date_of_joining` date NOT NULL,
  `branch_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_ID`, `first_name`, `last_name`, `contact_number`, `email_address`, `position`, `salary`, `date_of_joining`, `branch_ID`) VALUES
(1, 'Michael', 'Johnson', '555-123-4567', 'michael.j@example.com', 'Manager', 75000.00, '2022-03-10', 1),
(2, 'Emily', 'Brown', '555-987-6543', 'emily.b@example.com', 'Sales Associate', 50000.00, '2022-03-15', 2),
(3, 'David', 'Smith', '777-888-9999', 'david.s@example.com', 'Technician', 60000.00, '2022-02-05', 1),
(4, 'Eva', 'Miller', '222-333-4444', 'eva.m@example.com', 'Customer Service', 48000.00, '2022-01-20', 2),
(5, 'Robert', 'Davis', '111-222-3333', 'robert.d@example.com', 'Sales Manager', 80000.00, '2022-04-01', 1),
(6, 'Jatin', 'Vaira', '19478630429', 'jatinvaira@gmail.com', 'MD', 99999999.99, '2010-10-10', 2),
(7, 'Laura', 'Garcia', '555-876-5432', 'laura.g@example.com', 'Sales Associate', 55000.00, '2022-05-15', 2),
(8, 'Arjun', 'Kumar', '555-234-5678', 'arjun.k@example.com', 'Technician', 60000.00, '2022-03-01', 1),
(9, 'Alessandra', 'Ricci', '555-789-0123', 'alessandra.r@example.com', 'Manager', 75000.00, '2022-01-10', 3),
(10, 'Connor', 'Smith', '555-321-0987', 'connor.s@example.com', 'Customer Service', 48000.00, '2022-06-20', 4),
(11, 'Elena', 'Moreno', '555-210-9876', 'elena.m@example.com', 'Sales Manager', 80000.00, '2022-04-05', 1),
(12, 'Raj', 'Verma', '555-543-2109', 'raj.v@example.com', 'Technician', 60000.00, '2022-02-15', 2),
(13, 'Olivia', 'Martinez', '555-432-1098', 'olivia.m@example.com', 'Sales Associate', 50000.00, '2022-07-01', 3),
(14, 'Marco', 'Rossi', '555-678-9012', 'marco.r@example.com', 'Manager', 75000.00, '2022-08-10', 4),
(15, 'Isabella', 'Lopez', '555-789-1234', 'isabella.l@example.com', 'Technician', 60000.00, '2022-09-25', 5),
(16, 'Adrian', 'Gomez', '555-987-6543', 'adrian.g@example.com', 'Customer Service', 48000.00, '2022-10-05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_ID` int(11) NOT NULL,
  `device_ID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `purchase_Date` date NOT NULL,
  `cost_per_Unit` decimal(10,2) NOT NULL,
  `supplier_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_ID`, `device_ID`, `quantity`, `purchase_Date`, `cost_per_Unit`, `supplier_ID`) VALUES
(1, 1, 50, '2022-01-05', 700.00, 1),
(2, 2, 20, '2022-02-10', 1200.00, 2),
(3, 3, 30, '2022-03-15', 500.00, 1),
(4, 4, 15, '2022-04-20', 250.00, 3),
(5, 5, 25, '2022-05-25', 800.00, 2),
(6, 6, 52, '2023-03-25', 500.00, 3),
(7, 1, 50, '2023-01-01', 100.00, 1),
(8, 2, 30, '2023-02-05', 200.00, 2),
(9, 3, 40, '2023-03-10', 150.00, 1),
(10, 4, 20, '2023-04-15', 50.00, 3),
(11, 5, 25, '2023-05-20', 180.00, 2),
(12, 6, 60, '2023-06-25', 120.00, 3),
(13, 7, 15, '2023-07-30', 80.00, 4),
(14, 8, 35, '2023-08-04', 130.00, 5),
(15, 9, 10, '2023-09-09', 90.00, 1),
(16, 10, 18, '2023-10-14', 110.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `Manager_ID` int(11) NOT NULL,
  `Employee_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`Manager_ID`, `Employee_ID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5),
(11, 6),
(12, 7),
(13, 8),
(14, 9),
(15, 10);

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `Plan_ID` int(11) NOT NULL,
  `Plan_Name` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Monthly_Cost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`Plan_ID`, `Plan_Name`, `Description`, `Monthly_Cost`) VALUES
(1, 'Basic Plan', 'Limited data and minutes', 29.99),
(2, 'Premium Plan', 'Unlimited data and minutes', 49.99),
(3, 'Family Plan', 'Shared data and unlimited calls', 69.99),
(4, 'Business Plan', 'Customized for business needs', 99.99),
(5, 'Student Plan', 'Discounted plan for students', 19.99),
(6, 'Starter Plan', 'Basic data and minutes', 19.99),
(7, 'Family Plan', 'Shared data and unlimited calls', 69.99),
(8, 'Student Plan', 'Discounted plan for students', 14.99),
(9, 'Business Plan', 'Customized for business needs', 99.99),
(10, 'Premium Plan', 'Unlimited data and minutes', 49.99),
(11, 'Essential Plan', 'Moderate data and minutes', 29.99),
(12, 'Pro Plan', 'Advanced features and unlimited data', 79.99),
(13, 'Basic Plan', 'Limited data and minutes', 24.99),
(14, 'VIP Plan', 'Exclusive features and premium support', 149.99),
(15, 'Flex Plan', 'Flexible options for changing needs', 34.99);

-- --------------------------------------------------------

--
-- Table structure for table `plan_details`
--

CREATE TABLE `plan_details` (
  `plan_ID` int(11) NOT NULL,
  `data_limit` int(11) NOT NULL,
  `minutes_limit` int(11) NOT NULL,
  `sms_limit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plan_details`
--

INSERT INTO `plan_details` (`plan_ID`, `data_limit`, `minutes_limit`, `sms_limit`) VALUES
(1, 5, 300, 100),
(2, 2, 150, 50),
(3, 10, 500, 200),
(4, 1, 50, 20),
(5, 2, 100, 50),
(6, 5, 300, 100),
(7, 1, 50, 20),
(8, 10, 500, 200),
(9, 3, 150, 50),
(10, 8, 400, 150),
(11, 12, 800, 300),
(12, 4, 200, 80),
(13, 15, 1000, 400),
(14, 6, 250, 100);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `Sale_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `Device_ID` int(11) NOT NULL,
  `Plan_ID` int(11) NOT NULL,
  `Sale_Date` date NOT NULL,
  `Total_Price` decimal(10,2) NOT NULL,
  `Payment_Method` varchar(255) NOT NULL,
  `Contract_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`Sale_ID`, `Customer_ID`, `Employee_ID`, `Device_ID`, `Plan_ID`, `Sale_Date`, `Total_Price`, `Payment_Method`, `Contract_ID`) VALUES
(1, 1, 1, 1, 1, '2022-03-20', 799.99, 'Credit Card', 1),
(2, 2, 2, 2, 2, '2022-03-25', 1499.99, 'PayPal', 2),
(3, 3, 3, 3, 3, '2022-04-01', 399.99, 'Cash', 3),
(4, 4, 4, 4, 4, '2022-04-15', 899.99, 'Credit Card', 4),
(5, 5, 5, 5, 5, '2022-05-01', 199.99, 'PayPal', 5),
(6, 6, 1, 1, 1, '2023-01-20', 120.00, 'Credit Card', 1),
(7, 7, 2, 2, 2, '2023-02-25', 240.00, 'PayPal', 2),
(8, 8, 3, 3, 3, '2023-03-30', 180.00, 'Cash', 3),
(9, 9, 4, 4, 4, '2023-04-10', 50.00, 'Credit Card', 4),
(10, 10, 5, 5, 5, '2023-05-15', 270.00, 'PayPal', 5),
(11, 11, 6, 6, 6, '2023-06-20', 144.00, 'Cash', 6),
(12, 12, 7, 7, 7, '2023-07-25', 96.00, 'Credit Card', 7),
(13, 13, 8, 8, 8, '2023-08-30', 156.00, 'PayPal', 8),
(14, 14, 9, 9, 9, '2023-09-05', 108.00, 'Cash', 9),
(15, 15, 10, 10, 10, '2023-10-10', 165.00, 'Credit Card', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sale_device`
--

CREATE TABLE `sale_device` (
  `Sale_Device_ID` int(11) NOT NULL,
  `Sale_ID` int(11) NOT NULL,
  `Device_ID` int(11) NOT NULL,
  `Plan_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_branch`
--

CREATE TABLE `store_branch` (
  `branch_ID` int(11) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `manager_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_branch`
--

INSERT INTO `store_branch` (`branch_ID`, `branch_name`, `location`, `contact_number`, `manager_ID`) VALUES
(1, 'Main Branch', '123 Main St, Cityville', '555-111-2222', 1),
(2, 'Downtown Branch', '456 Oak St, Townsville', '555-333-4444', 2),
(3, 'East Branch', '789 Pine St, Villagetown', '555-555-5555', 3),
(4, 'West Branch', '101 Maple St, Hamletville', '555-777-8888', 4),
(5, 'Central Branch', '202 Elm St, Riverside', '555-999-0000', 5),
(6, 'South Branch', '789 Oak St, Cityville', '555-111-3333', 6),
(7, 'North Branch', '456 Pine St, Hamletville', '555-333-4444', 7),
(8, 'West Branch', '101 Cedar St, Mountainville', '555-555-5555', 8),
(9, 'East Branch', '202 Birch St, Seaville', '555-777-8888', 9),
(10, 'Central Branch', '303 Spruce St, Hillside', '555-999-0000', 10);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_ID` int(11) NOT NULL,
  `supplier_information` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_ID`, `supplier_information`) VALUES
(1, 'ABC Electronics Suppliers'),
(2, 'XYZ Tech Solutions'),
(3, 'TechMasters Ltd.'),
(4, 'Global Gadgets Inc.'),
(5, 'Quality Devices Co.'),
(6, 'PQR Electronics Distributors'),
(7, 'Tech Innovators Ltd.'),
(8, 'Global Electronics Hub'),
(9, 'Elite Gadgets Co.'),
(10, 'Smart Devices Solutions'),
(11, 'Top Tech Suppliers'),
(12, 'Future Electronics Inc.'),
(13, 'Innovative Technologies Ltd.'),
(14, 'TechXpress Distributors'),
(15, 'Prime Devices Inc.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`Address_ID`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`Contract_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`device_ID`);

--
-- Indexes for table `device_details`
--
ALTER TABLE `device_details`
  ADD PRIMARY KEY (`device_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_ID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_ID`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`Manager_ID`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`Plan_ID`);

--
-- Indexes for table `plan_details`
--
ALTER TABLE `plan_details`
  ADD PRIMARY KEY (`plan_ID`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`Sale_ID`);

--
-- Indexes for table `sale_device`
--
ALTER TABLE `sale_device`
  ADD PRIMARY KEY (`Sale_Device_ID`),
  ADD KEY `Sale_ID` (`Sale_ID`),
  ADD KEY `Device_ID` (`Device_ID`),
  ADD KEY `Plan_ID` (`Plan_ID`);

--
-- Indexes for table `store_branch`
--
ALTER TABLE `store_branch`
  ADD PRIMARY KEY (`branch_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `Address_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `contract`
--
ALTER TABLE `contract`
  MODIFY `Contract_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `device_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `device_details`
--
ALTER TABLE `device_details`
  MODIFY `device_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `Manager_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `Plan_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `plan_details`
--
ALTER TABLE `plan_details`
  MODIFY `plan_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `Sale_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sale_device`
--
ALTER TABLE `sale_device`
  MODIFY `Sale_Device_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `store_branch`
--
ALTER TABLE `store_branch`
  MODIFY `branch_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sale_device`
--
ALTER TABLE `sale_device`
  ADD CONSTRAINT `sale_device_ibfk_1` FOREIGN KEY (`Sale_ID`) REFERENCES `sale` (`Sale_ID`),
  ADD CONSTRAINT `sale_device_ibfk_2` FOREIGN KEY (`Device_ID`) REFERENCES `device` (`device_ID`),
  ADD CONSTRAINT `sale_device_ibfk_3` FOREIGN KEY (`Plan_ID`) REFERENCES `plan` (`Plan_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
