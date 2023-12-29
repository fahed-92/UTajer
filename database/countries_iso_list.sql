-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 09, 2021 at 02:15 PM
-- Server version: 10.1.47-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sfbritplconnect`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries_iso_list`
--

CREATE TABLE `countries_iso_list` (
  `id` int(11) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `iso2` varchar(40) NOT NULL,
  `iso3` varchar(40) NOT NULL,
  `dialling_code` varchar(40) NOT NULL,
  `abbreviations` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries_iso_list`
--

INSERT INTO `countries_iso_list` (`id`, `country_name`, `iso2`, `iso3`, `dialling_code`, `abbreviations`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '93', 'AF'),
(2, 'Aland Islands', 'AX', 'ALA', '358', 'AX'),
(3, 'Albania', 'AL', 'ALB', '355', 'AL'),
(4, 'Algeria', 'DZ', 'DZA', '213', 'DZ'),
(5, 'American Samoa', 'AS', 'ASM', '100684', 'AS'),
(6, 'Andorra', 'AD', 'AND', '376', 'AD'),
(7, 'Angola', 'AO', 'AGO', '244', 'AO'),
(8, 'Anguilla', 'AI', 'AIA', '100264', 'AI'),
(9, 'Antarctica', 'AQ', 'ATA', '672', 'AQ'),
(10, 'Antigua and Barbuda', 'AG', 'ATG', '100268', 'AG'),
(11, 'Argentina', 'AR', 'ARG', '54', 'AR'),
(12, 'Armenia', 'AM', 'ARM', '374', 'AM'),
(13, 'Aruba', 'AW', 'ABW', '297', 'AW'),
(14, 'Australia', 'AU', 'AUS', '61', 'AU'),
(15, 'Austria', 'AT', 'AUT', '43', 'AT'),
(16, 'Azerbaijan', 'AZ', 'AZE', '994', 'AZ'),
(17, 'Bahamas', 'BS', 'BHS', '100242', 'BS'),
(18, 'Bahrain', 'BH', 'BHR', '973', 'BH'),
(19, 'Bangladesh', 'BD', 'BGD', '880', 'BD'),
(20, 'Barbados', 'BB', 'BRB', '100246', 'BB'),
(21, 'Belarus', 'BY', 'BLR', '375', 'BV'),
(22, 'Belgium', 'BE', 'BEL', '32', 'BE'),
(23, 'Belize', 'BZ', 'BLZ', '501', 'BZ'),
(24, 'Benin', 'BJ', 'BEN', '229', 'BJ'),
(25, 'Bermuda', 'BM', 'BMU', '100441', 'BM'),
(26, 'Bhutan', 'BT', 'BTN', '975', 'BT'),
(27, 'Bolivia', 'BO', 'BOL', '591', 'BO'),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '599', ''),
(29, 'Bosnia and Herzegovina', 'BA', 'BIH', '387', 'BA'),
(30, 'Botswana', 'BW', 'BWA', '267', 'BW'),
(31, 'Bouvet Island', 'BV', 'BVT', '', 'BV'),
(32, 'Brazil', 'BR', 'BRA', '55', 'BR'),
(33, 'British Indian Ocean Territory', 'IO', 'IOT', '246', 'IO'),
(34, 'Brunei', 'BN', 'BRN', '673', ''),
(35, 'Bulgaria', 'BG', 'BGR', '359', 'BG'),
(36, 'Burkina Faso', 'BF', 'BFA', '226', 'BF'),
(37, 'Burundi', 'BI', 'BDI', '257', 'BI'),
(38, 'Cambodia', 'KH', 'KHM', '855', 'KH'),
(39, 'Cameroon', 'CM', 'CMR', '237', 'CM'),
(40, 'Canada', 'CA', 'CAN', '1', 'CA'),
(41, 'Cape Verde', 'CV', 'CPV', '238', 'CV'),
(42, 'Cayman Islands', 'KY', 'CYM', '100345', 'KY'),
(43, 'Central African Republic', 'CF', 'CAF', '236', 'CF'),
(44, 'Chad', 'TD', 'TCD', '235', 'TD'),
(45, 'Channel Islands', 'CI', 'CIV', '225', ''),
(46, 'Chile', 'CL', 'CHL', '56', 'CL'),
(47, 'China', 'CN', 'CHN', '86', 'CN'),
(48, 'Christmas Island', 'CX', 'CXR', '61', 'CX'),
(49, 'Cocos (Keeling) Islands', 'CC', 'CCK', '61', 'CC'),
(50, 'Colombia', 'CO', 'COL', '57', 'CO'),
(51, 'Comoros', 'KM', 'COM', '269', 'KM'),
(52, 'Congo', 'CG', 'COG', '242', 'CG'),
(53, 'Cook Islands', 'CK', 'COK', '682', 'CK'),
(54, 'Costa Rica', 'CR', 'CRI', '506', 'CR'),
(55, 'Croatia', 'HR', 'HRV', '385', ''),
(56, 'Cuba', 'CU', 'CUB', '53', 'CU'),
(57, 'Curacao', 'CW', 'CUW', '599', ''),
(58, 'Cyprus', 'CY', 'CYP', '357', 'CY'),
(59, 'Czech Republic', 'CZ', 'CZE', '420', 'CZ'),
(60, 'Democratic Republic of the Congo', 'CD', 'COD', '243', 'CD'),
(61, 'Denmark', 'DK', 'DNK', '45', 'DK'),
(62, 'Djibouti', 'DJ', 'DJI', '253', 'DJ'),
(63, 'Dominica', 'DM', 'DMA', '100767', 'DM'),
(64, 'Dominican Republic', 'DO', 'DOM', '100809', 'DO'),
(65, 'Ecuador', 'EC', 'ECU', '593', 'EC'),
(66, 'Egypt', 'EG', 'EGY', '20', 'EG'),
(67, 'El Salvador', 'SV', 'SLV', '503', 'SV'),
(68, 'Equatorial Guinea', 'GQ', 'GNQ', '240', 'GQ'),
(69, 'Eritrea', 'ER', 'ERI', '291', 'ER'),
(70, 'Estonia', 'EE', 'EST', '372', 'EE'),
(71, 'Ethiopia', 'ET', 'ETH', '251', 'ET'),
(72, 'Falkland Islands', 'FK', 'FLK', '500', ''),
(73, 'Faroe Islands', 'FO', 'FRO', '298', 'FO'),
(74, 'Fiji', 'FJ', 'FJI', '679', 'FJ'),
(75, 'Finland', 'FI', 'FIN', '358', 'FI'),
(76, 'France', 'FR', 'FRA', '33', 'FR'),
(77, 'French Guiana', 'GF', 'GUF', '594', 'GF'),
(78, 'French Polynesia', 'PF', 'PYF', '689', 'PF'),
(79, 'French Southern Territories', 'TF', 'ATF', '', ''),
(80, 'Gabon', 'GA', 'GAB', '241', 'GA'),
(81, 'Gambia', 'GM', 'GMB', '220', 'GM'),
(82, 'Georgia', 'GE', 'GEO', '995', 'GE'),
(83, 'Germany', 'DE', 'DEU', '49', 'DE'),
(84, 'Ghana', 'GH', 'GHA', '233', 'GH'),
(85, 'Gibraltar', 'GI', 'GIB', '350', 'GI'),
(86, 'Greece', 'GR', 'GRC', '30', 'GR'),
(87, 'Greenland', 'GL', 'GRL', '299', 'GL'),
(88, 'Grenada', 'GD', 'GRD', '100473', 'GD'),
(89, 'Guadaloupe', 'GP', 'GLP', '590', ''),
(90, 'Guam', 'GU', 'GUM', '100671', 'GU'),
(91, 'Guatemala', 'GT', 'GTM', '502', 'GT'),
(92, 'Guernsey', 'GG', 'GGY', '44', ''),
(93, 'Guinea', 'GN', 'GIN', '224', 'GN'),
(94, 'Guinea-Bissau', 'GW', 'GNB', '245', 'GW'),
(95, 'Guyana', 'GY', 'GUY', '592', 'GY'),
(96, 'Haiti', 'HT', 'HTI', '509', 'HT'),
(97, 'Heard Island and McDonald Islands', 'HM', 'HMD', '', 'HM'),
(98, 'Honduras', 'HN', 'HND', '504', 'HN'),
(99, 'Hong Kong', 'HK', 'HKG', '852', 'HK'),
(100, 'Hungary', 'HU', 'HUN', '36', 'HU'),
(101, 'Iceland', 'IS', 'ISL', '354', ''),
(102, 'India', 'IN', 'IND', '91', 'IN'),
(103, 'Indonesia', 'ID', 'IDN', '62', 'ID'),
(104, 'Iran', 'IR', 'IRN', '98', 'IR'),
(105, 'Iraq', 'IQ', 'IRQ', '964', 'IQ'),
(106, 'Ireland', 'IE', 'IRL', '353', 'IE'),
(107, 'Isle of Man', 'IM', 'IMN', '44', ''),
(108, 'Israel', 'IL', 'ISR', '972', 'IL'),
(109, 'Italy', 'IT', 'ITA', '39', 'IT'),
(110, 'Jamaica', 'JM', 'JAM', '100876', 'JM'),
(111, 'Japan', 'JP', 'JPN', '81', 'JP'),
(112, 'Jersey', 'JE', 'JEY', '44', ''),
(113, 'Jordan', 'JO', 'JOR', '962', 'JO'),
(114, 'Kazakhstan', 'KZ', 'KAZ', '7', 'KZ'),
(115, 'Kenya', 'KE', 'KEN', '254', 'KE'),
(116, 'Kiribati', 'KI', 'KIR', '686', 'KI'),
(117, 'Kosovo', 'XK', '', '381', ''),
(118, 'Kuwait', 'KW', 'KWT', '965', 'KW'),
(119, 'Kyrgyzstan', 'KG', 'KGZ', '996', 'KG'),
(120, 'Laos', 'LA', 'LAO', '856', 'LA'),
(121, 'Latvia', 'LV', 'LVA', '371', 'LV'),
(122, 'Lebanon', 'LB', 'LBN', '961', 'LB'),
(123, 'Lesotho', 'LS', 'LSO', '266', 'LS'),
(124, 'Liberia', 'LR', 'LBR', '231', 'LR'),
(125, 'Libya', 'LY', 'LBY', '218', 'LY'),
(126, 'Liechtenstein', 'LI', 'LIE', '423', 'LI'),
(127, 'Lithuania', 'LT', 'LTU', '370', 'LT'),
(128, 'Luxembourg', 'LU', 'LUX', '352', 'LU'),
(129, 'Macao', 'MO', 'MAC', '853', 'MO'),
(130, 'Macedonia', 'MK', 'MKD', '389', 'MK'),
(131, 'Madagascar', 'MG', 'MDG', '261', 'MG'),
(132, 'Malawi', 'MW', 'MWI', '265', 'MW'),
(133, 'Malaysia', 'MY', 'MYS', '60', 'MY'),
(134, 'Maldives', 'MV', 'MDV', '960', 'MV'),
(135, 'Mali', 'ML', 'MLI', '223', 'ML'),
(136, 'Malta', 'MT', 'MLT', '356', 'MT'),
(137, 'Marshall Islands', 'MH', 'MHL', '692', 'MH'),
(138, 'Martinique', 'MQ', 'MTQ', '596', 'MQ'),
(139, 'Mauritania', 'MR', 'MRT', '222', 'MR'),
(140, 'Mauritius', 'MU', 'MUS', '230', 'MU'),
(141, 'Mayotte', 'YT', 'MYT', '262', 'YT'),
(142, 'Mexico', 'MX', 'MEX', '52', 'MX'),
(143, 'Micronesia', 'FM', 'FSM', '691', ''),
(144, 'Moldava', 'MD', 'MDA', '373', ''),
(145, 'Monaco', 'MC', 'MCO', '377', 'MC'),
(146, 'Mongolia', 'MN', 'MNG', '976', 'MN'),
(147, 'Montenegro', 'ME', 'MNE', '382', ''),
(148, 'Montserrat', 'MS', 'MSR', '100664', 'MS'),
(149, 'Morocco', 'MA', 'MAR', '212', 'MA'),
(150, 'Mozambique', 'MZ', 'MOZ', '258', 'MZ'),
(151, 'Myanmar (Burma)', 'MM', 'MMR', '95', ''),
(152, 'Namibia', 'NA', 'NAM', '264', 'NA'),
(153, 'Nauru', 'NR', 'NRU', '674', 'NR'),
(154, 'Nepal', 'NP', 'NPL', '977', 'NP'),
(155, 'Netherlands', 'NL', 'NLD', '31', 'NL'),
(156, 'New Caledonia', 'NC', 'NCL', '687', 'NC'),
(157, 'New Zealand', 'NZ', 'NZL', '64', ''),
(158, 'Nicaragua', 'NI', 'NIC', '505', 'NI'),
(159, 'Niger', 'NE', 'NER', '227', 'NE'),
(160, 'Nigeria', 'NG', 'NGA', '234', 'NG'),
(161, 'Niue', 'NU', 'NIU', '683', 'NU'),
(162, 'Norfolk Island', 'NF', 'NFK', '672', 'NF'),
(163, 'North Korea', 'KP', 'PRK', '850', ''),
(164, 'Northern Mariana Islands', 'MP', 'MNP', '100670', 'MP'),
(165, 'Norway', 'NO', 'NOR', '47', 'NO'),
(166, 'Oman', 'OM', 'OMN', '968', 'OM'),
(167, 'Pakistan', 'PK', 'PAK', '92', 'PK'),
(168, 'Palau', 'PW', 'PLW', '680', 'PW'),
(169, 'Palestine', 'PS', 'PSE', '970', ''),
(170, 'Panama', 'PA', 'PAN', '507', 'PA'),
(171, 'Papua New Guinea', 'PG', 'PNG', '675', 'PG'),
(172, 'Paraguay', 'PY', 'PRY', '595', 'PY'),
(173, 'Peru', 'PE', 'PER', '51', 'PE'),
(174, 'Philippines', 'PH', 'PHL', '63', 'PH'),
(175, 'Pitcairn', 'PN', 'PCN', '', 'PN'),
(176, 'Poland', 'PL', 'POL', '48', 'PL'),
(177, 'Portugal', 'PT', 'PRT', '351', 'PT'),
(178, 'Puerto Rico', 'PR', 'PRI', '100939', 'PR'),
(179, 'Qatar', 'QA', 'QAT', '974', 'QA'),
(180, 'Reunion', 'RE', 'REU', '262', 'RE'),
(181, 'Romania', 'RO', 'ROU', '40', 'RO'),
(182, 'Russia', 'RU', 'RUS', '7', ''),
(183, 'Rwanda', 'RW', 'RWA', '250', 'RW'),
(184, 'Saint Barthelemy', 'BL', 'BLM', '590', ''),
(185, 'Saint Helena', 'SH', 'SHN', '290', 'SH'),
(186, 'Saint Kitts and Nevis', 'KN', 'KNA', '100869', 'KN'),
(187, 'Saint Lucia', 'LC', 'LCA', '100758', 'LC'),
(188, 'Saint Martin', 'MF', 'MAF', '590', ''),
(189, 'Saint Pierre and Miquelon', 'PM', 'SPM', '508', 'PM'),
(190, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '100784', 'VC'),
(191, 'Samoa', 'WS', 'WSM', '685', 'WS'),
(192, 'San Marino', 'SM', 'SMR', '378', 'SM'),
(193, 'Sao Tome and Principe', 'ST', 'STP', '239', 'ST'),
(194, 'Saudi Arabia', 'SA', 'SAU', '966', 'SA'),
(195, 'Senegal', 'SN', 'SEN', '221', 'SN'),
(196, 'Serbia', 'RS', 'SRB', '381', ''),
(197, 'Seychelles', 'SC', 'SYC', '248', 'SC'),
(198, 'Sierra Leone', 'SL', 'SLE', '232', 'SL'),
(199, 'Singapore', 'SG', 'SGP', '65', 'SG'),
(200, 'Sint Maarten', 'SX', 'SXM', '100721', ''),
(201, 'Slovakia', 'SK', 'SVK', '421', 'SK'),
(202, 'Slovenia', 'SI', 'SVN', '386', 'SI'),
(203, 'Solomon Islands', 'SB', 'SLB', '677', 'SB'),
(204, 'Somalia', 'SO', 'SOM', '252', 'SO'),
(205, 'South Africa', 'ZA', 'ZAF', '27', 'ZA'),
(206, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', '500', ''),
(207, 'South Korea', 'KR', 'KOR', '82', ''),
(208, 'South Sudan', 'SS', 'SSD', '211', ''),
(209, 'Spain', 'ES', 'ESP', '34', 'ES'),
(210, 'Sri Lanka', 'LK', 'LKA', '94', 'LK'),
(211, 'Sudan', 'SD', 'SDN', '249', 'SD'),
(212, 'Suriname', 'SR', 'SUR', '597', 'SR'),
(213, 'Svalbard and Jan Mayen', 'SJ', 'SJM', '47', 'SJ'),
(214, 'Swaziland', 'SZ', 'SWZ', '268', 'SZ'),
(215, 'Sweden', 'SE', 'SWE', '46', 'SE'),
(216, 'Switzerland', 'CH', 'CHE', '41', 'CH'),
(217, 'Syria', 'SY', 'SYR', '963', 'SY'),
(218, 'Taiwan', 'TW', 'TWN', '886', 'TW'),
(219, 'Tajikistan', 'TJ', 'TJK', '992', 'TJ'),
(220, 'Tanzania', 'TZ', 'TZA', '255', 'TZ'),
(221, 'Thailand', 'TH', 'THA', '66', 'TH'),
(222, 'Timor-Leste (East Timor),', 'TL', 'TLS', '670', ''),
(223, 'Togo', 'TG', 'TGO', '228', 'TG'),
(224, 'Tokelau', 'TK', 'TKL', '690', 'TK'),
(225, 'Tonga', 'TO', 'TON', '676', 'TO'),
(226, 'Trinidad and Tobago', 'TT', 'TTO', '100868', 'TT'),
(227, 'Tunisia', 'TN', 'TUN', '216', 'TN'),
(228, 'Turkey', 'TR', 'TUR', '90', 'TR'),
(229, 'Turkmenistan', 'TM', 'TKM', '993', 'TM'),
(230, 'Turks and Caicos Islands', 'TC', 'TCA', '100649', 'TC'),
(231, 'Tuvalu', 'TV', 'TUV', '688', 'TV'),
(232, 'Uganda', 'UG', 'UGA', '256', 'UG'),
(233, 'Ukraine', 'UA', 'UKR', '380', 'UA'),
(234, 'United Arab Emirates', 'AE', 'ARE', '971', 'AE'),
(235, 'United Kingdom', 'GB', 'GBR', '44', 'UK'),
(236, 'United Kingdom (offshore)', 'G2', 'GB2', '', ''),
(237, 'United States', 'US', 'USA', '1', 'US'),
(238, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 'UM'),
(239, 'Uruguay', 'UY', 'URY', '598', 'UY'),
(240, 'Uzbekistan', 'UZ', 'UZB', '998', 'UZ'),
(241, 'Vanuatu', 'VU', 'VUT', '678', 'VU'),
(242, 'Vatican City', 'VA', 'VAT', '39', ''),
(243, 'Venezuela', 'VE', 'VEN', '58', 'VE'),
(244, 'Vietnam', 'VN', 'VNM', '84', ''),
(245, 'Virgin Islands, British', 'VG', 'VGB', '100284', ''),
(246, 'Virgin Islands, US', 'VI', 'VIR', '100340', ''),
(247, 'Wallis and Futuna', 'WF', 'WLF', '681', 'WF'),
(248, 'Western Sahara', 'EH', 'ESH', '212', 'EH'),
(249, 'Yemen', 'YE', 'YEM', '967', 'YE'),
(250, 'Zambia', 'ZM', 'ZMB', '260', 'ZM'),
(251, 'Zimbabwe', 'ZW', 'ZWE', '263', 'ZW'),
(252, 'England', 'GB', 'GBR', '44', NULL),
(253, 'Scotland', 'GB', 'GBR', '44', NULL),
(254, 'Wales', 'GB', 'GBR', '44', NULL),
(255, 'Great Britain', 'GB', 'GBR', '44', NULL),
(256, 'Northern Ireland', 'GB', 'GBR', '44', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries_iso_list`
--
ALTER TABLE `countries_iso_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries_iso_list`
--
ALTER TABLE `countries_iso_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
