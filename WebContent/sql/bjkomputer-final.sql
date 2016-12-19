--
-- Database: `bjkomputer`
--
CREATE DATABASE IF NOT EXISTS `bjkomputer` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bjkomputer`;

-- --------------------------------------------------------

--
-- Table structure for table `bj_cart`
--

CREATE TABLE `bj_cart` (
  `BJ_cartID` varchar(50) NOT NULL,
  `BJ_cartProductID` varchar(50) NOT NULL,
  `BJ_cartUserID` varchar(50) NOT NULL,
  `BJ_cartQty` int(11) DEFAULT NULL,
  `BJ_cartSubPrice` int(11) DEFAULT NULL,
  `BJ_cartStatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bj_menu`
--

CREATE TABLE `bj_menu` (
  `BJ_menuID` int(11) NOT NULL,
  `BJ_menuName` varchar(50) DEFAULT NULL,
  `BJ_menuLink` varchar(50) DEFAULT NULL,
  `BJ_menuRoleID` int(11) NOT NULL,
  `BJ_menuStatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bj_menu`
--

INSERT INTO `bj_menu` (`BJ_menuID`, `BJ_menuName`, `BJ_menuLink`, `BJ_menuRoleID`, `BJ_menuStatus`) VALUES
(1, 'Home', 'index.jsp', 1, 1),
(2, 'Product', 'pages/product.jsp', 1, 1),
(3, 'Member', 'pages/member.jsp', 1, 1),
(4, 'Transaction', 'pages/transaction.jsp', 1, 1),
(5, 'Home', 'index.jsp', 2, 1),
(6, 'Product', 'pages/product.jsp', 2, 1),
(7, 'Profile', 'pages/profile.jsp', 2, 1),
(8, 'Cart', 'pages/cart.jsp', 2, 1),
(9, 'Transaction', 'pages/transaction.jsp', 2, 1),
(10, 'Home', 'index.jsp', 3, 1),
(11, 'Product', 'pages/product.jsp', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bj_product`
--

CREATE TABLE `bj_product` (
  `BJ_productID` varchar(50) NOT NULL,
  `BJ_productName` varchar(150) DEFAULT NULL,
  `BJ_productImage` varchar(150) DEFAULT NULL,
  `BJ_productPrice` int(11) DEFAULT NULL,
  `BJ_productStock` int(11) DEFAULT NULL,
  `BJ_productDesc` text,
  `BJ_productStatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bj_product`
--

INSERT INTO `bj_product` (`BJ_productID`, `BJ_productName`, `BJ_productImage`, `BJ_productPrice`, `BJ_productStock`, `BJ_productDesc`, `BJ_productStatus`) VALUES
('PR001', 'Cooler Master IC Essential E2 Thermal Compound', '/assets/images/icessentiale2.jpg', 95000, 2, 'Best quality thermal compound from Cooler Master', 1),
('PR002', 'Corsair DDR4 Vengeance LPX PC19200 8GB', '/assets/images/corsairvengeance.png', 735000, 0, 'High performance DDR4 RAM', 1),
('PR003', 'Logitech G403 Gaming Mice', '/assets/images/g403mice.png', 1335000, 0, 'Change your mouse now! Logitech G403 is back!', 1),
('PR004', 'nVidia GeForce GTX 1080 8 GB GDDR5X - Founder Edition', '/assets/images/gtx1080.png', 10000000, 3, 'NVidia new Pascal architecture GTX 10 series!', 1),
('PR005', 'ROG SWIFT PG278Q', '/assets/images/rogmonitor.png', 10000000, 6, 'ROG Swift PG278Q 27'''', G-SYNC', 1),
('PR006', 'Samsung SSD 850 EVO M.2 500 GB', '/assets/images/ssd850m2500g.png', 2300000, 7, 'First 3D VNAND Technology SSD', 1),
('PR007', 'Samsung 950 PRO NVMe M.2 SSD 512 GB', '/assets/images/ssd950pro512.png', 4180000, 4, 'First 3D VNAND Technology SSD with PCI-E 3.0', 1),
('PR008', 'Aorus X7 DT v6', '/assets/uploaded_images/aorusx7v6.png', 10000000, 12, 'World''s Most Powerful 17.3'''' Laptop', 1),
('PR009', 'Aorus X3 v6', '/assets/uploaded_images/aorusx3v6.png', 10000000, 7, 'World''s Most Powerful 13.9'''' Laptop', 1),
('PR010', 'HP Spectre', '/assets/uploaded_images/hpspectre.jpg', 8750000, 5, 'HP Spectre Gold Edition', 1),
('PR011', 'Dell Pandora 15', '/assets/uploaded_images/dellpandora15.jpg', 10000000, 0, 'Dell Pandora - Inspiron 7559', 1),
('PR012', 'Dell XPS 13', '/assets/uploaded_images/newxps13.jpg', 9780000, 5, 'New Dell XPS 13', 1),
('PR013', 'Alienware 13', '/assets/uploaded_images/newalienware13.jpg', 9950000, 1, 'New Alienware 13 - New Design', 1),
('PR014', 'MSI VR ONE', '/assets/uploaded_images/msivrone.jpg', 9556000, 5, 'MSI VR ONE - No. 1 in VR', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bj_review`
--

CREATE TABLE `bj_review` (
  `BJ_reviewID` varchar(50) NOT NULL,
  `BJ_reviewerID` varchar(50) NOT NULL,
  `BJ_productID` varchar(50) NOT NULL,
  `BJ_reviewDesc` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bj_review`
--

INSERT INTO `bj_review` (`BJ_reviewID`, `BJ_reviewerID`, `BJ_productID`, `BJ_reviewDesc`) VALUES
('1481099572031', 'US002', 'PR006', 'Kenceng sekali!!!'),
('1481104098372', 'US001', 'PR006', 'Iklan gak bohong!!!'),
('1481172956088', 'US001', 'PR014', 'Wah VR hanya seukuran tas saja...'),
('1481180853100', 'US001', 'PR005', 'GSync Bro!!! '),
('1482166913041', 'US001', 'PR013', 'Alienware yang baru lebih kuat daripada yang lama!'),
('1482166988838', 'US001', 'PR008', 'Wah... Gak rugi beli nih laptop... i7 6820hk, oc sampai 4 ghz!!! GTX 1080 SLI lgi... GTA V 10 tabs lewat!!!'),
('1482167029264', 'US001', 'PR011', 'Ini pandora yang model lama... Performa i7 6700hq-nya tidak mengecewakan....'),
('1482167150098', 'US001', 'PR007', 'Wah kalau RAID 0 ini nyentuh 1 GB/s');

-- --------------------------------------------------------

--
-- Table structure for table `bj_role`
--

CREATE TABLE `bj_role` (
  `BJ_roleID` int(11) NOT NULL,
  `BJ_roleName` varchar(50) DEFAULT NULL,
  `BJ_roleDescription` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bj_role`
--

INSERT INTO `bj_role` (`BJ_roleID`, `BJ_roleName`, `BJ_roleDescription`) VALUES
(1, 'admin', 'Admin'),
(2, 'member', 'Member'),
(3, 'guest', 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `bj_transactiondetail`
--

CREATE TABLE `bj_transactiondetail` (
  `BJ_transID` int(11) NOT NULL,
  `BJ_transProductID` varchar(50) NOT NULL,
  `BJ_transProductQty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bj_transactiondetail`
--

INSERT INTO `bj_transactiondetail` (`BJ_transID`, `BJ_transProductID`, `BJ_transProductQty`) VALUES
(1, 'PR002', 3),
(1, 'PR013', 2),
(2, 'PR001', 3),
(2, 'PR003', 1),
(2, 'PR011', 2),
(3, 'PR001', 2),
(3, 'PR003', 1),
(4, 'PR001', 2),
(4, 'PR009', 3),
(4, 'PR011', 1),
(5, 'PR007', 1),
(5, 'PR008', 3),
(5, 'PR013', 2),
(5, 'PR014', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bj_transactionheader`
--

CREATE TABLE `bj_transactionheader` (
  `BJ_transID` int(11) NOT NULL,
  `BJ_transDate` datetime DEFAULT NULL,
  `BJ_transUserID` varchar(45) DEFAULT NULL,
  `BJ_transStatusID` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bj_transactionheader`
--

INSERT INTO `bj_transactionheader` (`BJ_transID`, `BJ_transDate`, `BJ_transUserID`, `BJ_transStatusID`) VALUES
(1, '2016-12-12 16:47:50', 'US001', '1'),
(2, '2016-12-14 23:56:52', 'US001', '2'),
(3, '2016-12-15 00:02:42', 'US002', '1'),
(4, '2016-12-15 21:35:57', 'US001', '2'),
(5, '2016-12-20 00:05:58', 'US001', '1');

-- --------------------------------------------------------

--
-- Table structure for table `bj_transactionstatus`
--

CREATE TABLE `bj_transactionstatus` (
  `BJ_transStatusID` int(11) NOT NULL,
  `BJ_transStatusDesc` varchar(50) DEFAULT NULL,
  `BJ_transStatusName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bj_transactionstatus`
--

INSERT INTO `bj_transactionstatus` (`BJ_transStatusID`, `BJ_transStatusDesc`, `BJ_transStatusName`) VALUES
(1, 'Pending', 'pending'),
(2, 'Approved', 'approved'),
(3, 'Expired', 'expired');

-- --------------------------------------------------------

--
-- Table structure for table `bj_user`
--

CREATE TABLE `bj_user` (
  `BJ_userID` varchar(50) NOT NULL COMMENT '	',
  `BJ_userName` varchar(20) DEFAULT NULL,
  `BJ_userPWD` varchar(50) DEFAULT NULL,
  `BJ_userFullName` varchar(50) DEFAULT NULL,
  `BJ_userPhone` varchar(20) DEFAULT NULL,
  `BJ_userAddr` varchar(50) DEFAULT NULL,
  `BJ_userEmail` varchar(50) DEFAULT NULL,
  `BJ_userRole` int(11) DEFAULT NULL,
  `BJ_userStatus` int(11) DEFAULT NULL,
  `BJ_userRegisterDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bj_user`
--

INSERT INTO `bj_user` (`BJ_userID`, `BJ_userName`, `BJ_userPWD`, `BJ_userFullName`, `BJ_userPhone`, `BJ_userAddr`, `BJ_userEmail`, `BJ_userRole`, `BJ_userStatus`, `BJ_userRegisterDate`) VALUES
('US001', 'jeffryang24', 'jeffryang24', 'Jeffry Angtoni', '081919666603', 'Budi Raya Street', 'jeffryangtoni24@gmail.com', 2, 1, '2016-12-03 17:20:33'),
('US002', 'johnny12', 'johnny', 'Johnny McMahon', '08776655442', 'Huta Ni Roha Street', 'johnny.kalbe@hutaniroha.co.id', 2, 1, '2016-12-03 18:02:24'),
('US003', 'admin', 'administrator', 'Administrator', '081919666603', 'Budi Raya Street', 'admin@bjkomputer.com', 1, 1, '2016-12-05 17:50:35'),
('US004', 'admin2', 'administrator', 'Staff Administrator', '087766444156', 'Dos Ni Roba Street No. 23', 'admin2@bjkomputer.com', 1, 1, '2016-12-19 23:40:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bj_cart`
--
ALTER TABLE `bj_cart`
  ADD PRIMARY KEY (`BJ_cartID`,`BJ_cartProductID`,`BJ_cartUserID`);

--
-- Indexes for table `bj_menu`
--
ALTER TABLE `bj_menu`
  ADD PRIMARY KEY (`BJ_menuID`,`BJ_menuRoleID`);

--
-- Indexes for table `bj_product`
--
ALTER TABLE `bj_product`
  ADD PRIMARY KEY (`BJ_productID`);

--
-- Indexes for table `bj_review`
--
ALTER TABLE `bj_review`
  ADD PRIMARY KEY (`BJ_reviewID`,`BJ_reviewerID`,`BJ_productID`);

--
-- Indexes for table `bj_role`
--
ALTER TABLE `bj_role`
  ADD PRIMARY KEY (`BJ_roleID`);

--
-- Indexes for table `bj_transactiondetail`
--
ALTER TABLE `bj_transactiondetail`
  ADD PRIMARY KEY (`BJ_transID`,`BJ_transProductID`);

--
-- Indexes for table `bj_transactionheader`
--
ALTER TABLE `bj_transactionheader`
  ADD PRIMARY KEY (`BJ_transID`);

--
-- Indexes for table `bj_transactionstatus`
--
ALTER TABLE `bj_transactionstatus`
  ADD PRIMARY KEY (`BJ_transStatusID`);

--
-- Indexes for table `bj_user`
--
ALTER TABLE `bj_user`
  ADD PRIMARY KEY (`BJ_userID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
