/*
Navicat MySQL Data Transfer

Source Server         : MYSQL
Source Server Version : 50521
Source Host           : localhost:3306
Source Database       : tracintermodal

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2015-07-10 18:28:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jqm_cooperatives
-- ----------------------------
DROP TABLE IF EXISTS `jqm_cooperatives`;
CREATE TABLE `jqm_cooperatives` (
  `coopID` int(11) NOT NULL,
  `coop` varchar(50) DEFAULT NULL,
  `coop_color` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`coopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jqm_cooperatives
-- ----------------------------
INSERT INTO `jqm_cooperatives` VALUES ('1', 'West Coast', '#EADBA2');
INSERT INTO `jqm_cooperatives` VALUES ('2', 'Mountain', '#CAA89F');
INSERT INTO `jqm_cooperatives` VALUES ('3', 'Midwest', '#C5B2CE');
INSERT INTO `jqm_cooperatives` VALUES ('4', 'Chicago Ohio Valley', '#C1D8E6');
INSERT INTO `jqm_cooperatives` VALUES ('5', 'Midsouth', '#B6CBA4');
INSERT INTO `jqm_cooperatives` VALUES ('6', ' Southeast', '#90BCD5');
INSERT INTO `jqm_cooperatives` VALUES ('7', 'Gulf', '#ECC896');

-- ----------------------------
-- Table structure for jqm_locations
-- ----------------------------
DROP TABLE IF EXISTS `jqm_locations`;
CREATE TABLE `jqm_locations` (
  `regionID` varchar(5) DEFAULT NULL,
  `locationID` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `metro_city` varchar(100) DEFAULT NULL,
  `lat` double DEFAULT '0',
  `lon` double DEFAULT '0',
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jqm_locations
-- ----------------------------
INSERT INTO `jqm_locations` VALUES ('METRO', '1', 'CSX Buffalo', '1252 William St Rear', 'Buffalo', 'NY', 'Buffalo', '42.8864468', '-78.8783689');
INSERT INTO `jqm_locations` VALUES ('METRO', '2', 'Red Hook Container Terminal – Brooklyn', '70 Hamilton Avenue', 'Brooklyn', 'NY', 'NY/NJ', '40.6786907', '-74.0036426');
INSERT INTO `jqm_locations` VALUES ('METRO', '3', 'APM', '5080 McLester street', 'Elizabeth', 'NJ', 'NY/NJ', '40.669178', '-74.1591192');
INSERT INTO `jqm_locations` VALUES ('METRO', '4', 'Maher Chassis Depot', '1510 Bay Avenue', 'Elizabeth', 'NJ', 'NY/NJ', '40.676305', '-74.1570156');
INSERT INTO `jqm_locations` VALUES ('METRO', '5', 'Global Chassis Depot', 'Colony Road ', 'Jersey City', 'NJ', 'NY/NJ', '40.681617', '-74.0790305');
INSERT INTO `jqm_locations` VALUES ('METRO', '6', 'NS – Croxton', '100 County Rd', 'Jersey City', 'NJ', 'NY/NJ', '40.7612376', '-74.0675096');
INSERT INTO `jqm_locations` VALUES ('METRO', '7', 'Ironbound', '921 Delancy Street', 'Newark', 'NJ', 'NY/NJ', '40.7128631', '-74.140081');
INSERT INTO `jqm_locations` VALUES ('METRO', '8', 'CSX – Little Ferry', '2200 83rd. St', 'North Bergen', 'NJ', 'NY/NJ', '40.8107104', '-74.0189008');
INSERT INTO `jqm_locations` VALUES ('METRO', '9', 'PNCT Chassis Depot', '1100 Polaris Street', 'Port Newark', 'NJ', 'NY/NJ', '40.735657', '-74.1723667');
INSERT INTO `jqm_locations` VALUES ('METRO', '10', 'Red Hook Container Terminal – Port Newark', '138 Marsh Street', 'Port Newark', 'NJ', 'NY/NJ', '40.6944975', '-74.1496946');
INSERT INTO `jqm_locations` VALUES ('METRO', '11', 'CSX – South Kearny', '700 Old Fish House Rd', 'South Kearny', 'NJ', 'NY/NJ', '40.7407374', '-74.0883112');
INSERT INTO `jqm_locations` VALUES ('METRO', '12', 'NYCT', '300 Western Ave.', 'Staten Island', 'NY', 'NY/NJ', '40.6374543', '-74.1851231');
INSERT INTO `jqm_locations` VALUES ('METRO', '13', 'CSX – Philadelphia', '3400 S. Christopher Columbus Blvd.', 'Philadelphia', 'PA', 'Philadelphia, PA', '39.9018064', '-75.1458038');
INSERT INTO `jqm_locations` VALUES ('METRO', '14', 'Packer Ave', '3301 Christopher Columbus BLVD', 'Philadelphia', 'PA', 'Philadelphia, PA', '39.9051624', '-75.1397918');
INSERT INTO `jqm_locations` VALUES ('METRO', '15', 'Tioga Marine Terminal', '3451 North Delaware Avenue, (Delaware River at Tioga Street)', 'Philadelphia', 'PA', 'Philadelphia, PA', '39.995109', '-75.101876');
INSERT INTO `jqm_locations` VALUES ('METRO', '16', 'CSX – Baltimore', '4801 Keither Ave.', 'Baltimore', 'MD', 'Baltimore, MD', '39.2656966', '-76.5534929');
INSERT INTO `jqm_locations` VALUES ('METRO', '17', 'MIT Dundalk', '2700 Broening Hwy', 'Baltimore', 'MD', 'Baltimore, MD', '39.2483224', '-76.5346878');
INSERT INTO `jqm_locations` VALUES ('METRO', '18', 'NS – Baltimore', '4800 East Lombard Street', 'Baltimore', 'MD', 'Baltimore, MD', '39.2918928', '-76.5555213');
INSERT INTO `jqm_locations` VALUES ('METRO', '19', 'Seagirt', '2600 Broening Hwy', 'Baltimore', 'MD', 'Baltimore, MD', '39.2559708', '-76.5383839');
INSERT INTO `jqm_locations` VALUES ('TMEP', '20', 'CSX – Bedford Park', '7000 W. 71st. St.', 'Bedford Park', 'IL', 'Chicago', '41.7629174', '-87.795606');
INSERT INTO `jqm_locations` VALUES ('TMEP', '21', 'CSX – 59th St.', '2101 W. 59th St.', 'Chicago', 'IL', 'Chicago', '41.7859693', '-87.6771022');
INSERT INTO `jqm_locations` VALUES ('TMEP', '22', 'CNRR', '16800 S. Center St.', 'Harvey', 'IL', 'Chicago', '41.5846171', '-87.6484155');
INSERT INTO `jqm_locations` VALUES ('TMEP', '23', 'Integrated Ind. – Joliet', '785 Draper Avenue', 'Joliet', 'IL', 'Chicago', '41.5390222', '-88.0547253');
INSERT INTO `jqm_locations` VALUES ('TMEP', '24', 'Kentucky Container', '5550 Este Avenue', 'Cincinnati', 'OH', 'Cincinnati', '39.1848048', '-84.5015886');
INSERT INTO `jqm_locations` VALUES ('TMEP', '25', 'CSX – Cleveland', '601 E. 152nd St.', 'Cleveland', 'OH', 'Cleveland', '41.5638277', '-81.5755362');
INSERT INTO `jqm_locations` VALUES ('TMEP', '26', 'Mason Dixon', '2700 Transport Rd.', 'Cleveland', 'OH', 'Cleveland', '41.485925', '-81.670833');
INSERT INTO `jqm_locations` VALUES ('TMEP', '27', 'American Marine Express', '765 E. 140th Street', 'Cleveland', 'OH', 'Cleveland', '41.5598292', '-81.5851967');
INSERT INTO `jqm_locations` VALUES ('TMEP', '28', 'Trimodal', '2001 Walcutt Rd.', 'Columbus', 'OH', 'Columbus', '39.990961', '-83.138946');
INSERT INTO `jqm_locations` VALUES ('TMEP', '29', 'CSX – Columbus', '2351 W. Belt Dr.', 'Columbus', 'OH', 'Columbus', '39.314528', '-84.375855');
INSERT INTO `jqm_locations` VALUES ('TMEP', '30', 'CSX – Detroit', '6750 Dix Ave.', 'Detroit', 'MI', 'Detroit', '42.3160643', '-83.1174443');
INSERT INTO `jqm_locations` VALUES ('TMEP', '31', 'Chassis Pro', '5740 Federal Street', 'Detroit', 'MI', 'Detroit', '42.323663', '-83.108609');
INSERT INTO `jqm_locations` VALUES ('TMEP', '32', 'CNRR', '600 Fern St.', 'Ferndale', 'MI', 'Detroit', '42.4504355', '-83.1169142');
INSERT INTO `jqm_locations` VALUES ('TMEP', '33', 'CSX', '501 S. County Rd. 800 E', 'Avon ', 'IN', 'Indianapolis', '39.755834', '-86.381078');
INSERT INTO `jqm_locations` VALUES ('TMEP', '34', 'M&M Transport Inc.', '2800 Enterprise St.', 'Indianapolis', 'IN', 'Indianapolis', '39.806282', '-86.033209');
INSERT INTO `jqm_locations` VALUES ('TMEP', '35', 'NS Rail Appliance Park', '4913 Heller Street', 'Louisville', 'KY', 'Louisville', '38.181293', '-85.657353');
INSERT INTO `jqm_locations` VALUES ('TMEP', '36', 'NS – Pittsburgh', '701 Wall Avenue', 'Pittsburgh', 'PA', 'Pittsburgh', '40.4062518', '-79.779914');
INSERT INTO `jqm_locations` VALUES ('TMEP', '37', 'CSX – Nashville', '3086 Sidco Drive', 'Nashville', 'TN', 'Nashville', '36.0962536', '-86.7569048');
INSERT INTO `jqm_locations` VALUES ('TMEP', '38', 'CSX – Atlanta (Hulsey)', '173 Boulevard S.E.', 'Atlanta', 'GA', 'Atlanta', '33.7493114', '-84.3699475');
INSERT INTO `jqm_locations` VALUES ('TMEP', '39', 'CSX – Atlanta (Fairburn)', '6700 McLarin Road', 'Fairburn', 'GA', 'Atlanta', '33.5491465', '-84.6004193');
INSERT INTO `jqm_locations` VALUES ('TMEP', '40', 'CSX – Charlotte', '5430 Hovis Road', 'Charlotte', 'NC', 'Charlotte', '35.271795', '-80.893658');
INSERT INTO `jqm_locations` VALUES ('TMEP', '41', 'CSX – Jacksonville', '5902 Sportsman Club Road', 'Jacksonville', 'FL', 'Jacksonville', '30.386771', '-81.768023');
INSERT INTO `jqm_locations` VALUES ('TMWP', '42', 'CN Ramp - Chippewa Falls', '1160 West River  St.', 'Chippewa', 'WI', 'Chippewa', '44.927225', '-91.4104822');
INSERT INTO `jqm_locations` VALUES ('TMWP', '43', 'BNSF', '1701 Pierce Butler Rt.', 'St.Paul', 'MN', 'St.Paul', '44.9695497', '-93.1742954');
INSERT INTO `jqm_locations` VALUES ('TMWP', '44', 'BNSF', '3930 NW Yeon', 'Portland', 'OR', 'Portland', '45.553054', '-122.723547');
INSERT INTO `jqm_locations` VALUES ('TMWP', '45', 'BNSF', '44 S Handord St.', 'Seattle', 'WA', 'Seattle', '47.5755916', '-122.3369709');
INSERT INTO `jqm_locations` VALUES ('TMWP', '46', 'BNSF', '12400 51st. Pl South', 'Seattle ', 'WA', 'Seattle', '47.4926682', '-122.2706442');
INSERT INTO `jqm_locations` VALUES ('TMMP', '47', 'UP – Iowa Interstate', '2722 South Avenue', 'Council Bluff', 'IA', 'Council Bluff', '41.8780025', '-93.097702');
INSERT INTO `jqm_locations` VALUES ('TMMP', '48', 'UP – DUPO', 'Highway 3 & State Street', 'Dupo', 'IL', 'St. Louis', '38.5124226', '-90.2092468');
INSERT INTO `jqm_locations` VALUES ('TMMP', '49', 'UP – NEFF', '4801 Gardener Ave', 'Kansas City', 'MO', 'Kansas City', '39.125673', '-94.523848');
INSERT INTO `jqm_locations` VALUES ('TMMP', '50', 'CSX – KC', '3301 East 147th Street', 'Kansas City', 'MO', 'Kansas City', '38.86014', '-94.5738624');
INSERT INTO `jqm_locations` VALUES ('TGRP', '51', 'ESS', '3839 E Overton Rd.', 'Dallas', 'TX', 'Dallas', '32.7241083', '-96.7653479');
INSERT INTO `jqm_locations` VALUES ('TGRP', '52', 'KCS – Dallas', '11931 Shiloh Rd.', 'Dallas', 'TX', 'Dallas', '32.8585414', '-96.6658697');
INSERT INTO `jqm_locations` VALUES ('TGRP', '53', 'BNSF – Alliance', '1111 Intermodal Pkwy', 'Haslet', 'TX', 'Dallas', '32.9901076', '-97.349706');
INSERT INTO `jqm_locations` VALUES ('TGRP', '54', 'UPRR Dallas (DIT)', '3701 South I-45', 'Wilmer', 'TX', 'Dallas', '32.6124651', '-96.6894073');
INSERT INTO `jqm_locations` VALUES ('TGRP', '55', 'Twin Cities', '7180 Copperqueen Dr.', 'El Paso', 'TX', 'El Paso', '31.756789', '-106.379128');
INSERT INTO `jqm_locations` VALUES ('TGRP', '56', 'UPRR Santa Teresa', '9050 Strauss Road', 'El Paso', 'TX', 'El Paso', '31.7775757', '-106.4424559');
INSERT INTO `jqm_locations` VALUES ('TGRP', '57', 'WWinners Container Yard', '10000 Wallisville Rd', 'Houston', 'TX', 'Houston', '29.793478', '-95.253632');
INSERT INTO `jqm_locations` VALUES ('TGRP', '58', 'BNSF – Pearland', '214 Brisbane Rd.', 'Houston', 'TX', 'Houston', '29.6395376', '-95.290796');
INSERT INTO `jqm_locations` VALUES ('TGRP', '59', 'UPRR Englewood', '5500 Wallisville Road', 'Houston', 'TX', 'Houston', '29.7872864', '-95.3146905');
INSERT INTO `jqm_locations` VALUES ('TGRP', '60', 'UPRR Settegast', '6800 Kirkpatrick Blvd.', 'Houston', 'TX', 'Houston', '29.826276', '-95.290365');
INSERT INTO `jqm_locations` VALUES ('TGRP', '61', 'Integrated Marine Service', '500 East Barbours Cut Blvd', 'La Porte', 'TX', 'Houston', '29.6734254', '-95.0149068');
INSERT INTO `jqm_locations` VALUES ('TGRP', '62', 'Port of Houston – Barbours Cut', '1515 East Barbours Cut Blvd', 'La Porte', 'TX', 'Houston', '29.682058', '-94.9935');
INSERT INTO `jqm_locations` VALUES ('TGRP', '63', 'Port of Houston – Bayport', '12855 Port Road', 'Seabrook', 'TX', 'Houston', '29.6044148', '-94.9991525');
INSERT INTO `jqm_locations` VALUES ('TGRP', '64', 'WWinners Container Yard', '3611 Speedway Run', 'Von Ormy', 'TX', 'San Antonio', '29.2780362', '-98.5762012');
INSERT INTO `jqm_locations` VALUES ('TGRP', '65', 'UPRR San Antonio', '13001 I-35 South', 'Von Ormy', 'TX', 'San Antonio', '29.2957435', '-98.6348543');
INSERT INTO `jqm_locations` VALUES ('TGRP', '66', 'UPRR NOLA', '100 Avondale Garden Road', 'Avondale', 'LA', 'New Orleans', '29.9196299', '-90.207688');
INSERT INTO `jqm_locations` VALUES ('TGRP', '67', 'Avondale Container East', '7800 Almonaster Blvd.', 'New Orleans', 'LA', 'New Orleans', '30.009626', '-89.9772949');
INSERT INTO `jqm_locations` VALUES ('TGRP', '68', 'Avondale Container West', '101 Avondale Garden Rd.', 'Westego', 'LA', 'New Orleans', '29.9196204', '-90.2076528');
INSERT INTO `jqm_locations` VALUES ('TGRP', '69', 'CSX – Mobile', '2000 Industrial Canal Road East', 'Mobile', 'AL', 'Mobile', '30.7171237', '-88.0514002');
INSERT INTO `jqm_locations` VALUES ('TGRP', '70', 'Mobile Container Term', '901 Ezra Trice Blvd', 'Mobile', 'AL', 'Mobile', '30.667243', '-88.0419921');
INSERT INTO `jqm_locations` VALUES ('TGRP', '71', 'Ports America', '2510 Guy N. Verger Boulevard', 'Tampa', 'FL', 'Tampa', '27.9254581', '-82.4332892');
INSERT INTO `jqm_locations` VALUES ('TGRP', '72', 'CSX – Tampa', '1901 North 62nd Street', 'Tampa', 'FL', 'Tampa', '27.95903', '-82.388722');
INSERT INTO `jqm_locations` VALUES ('TPNP', '73', 'SSA Marine Terminal – T18', '1050 SW Spokane Street', 'Seattle', 'WA', 'Seattle', '47.5714431', '-122.3482955');
INSERT INTO `jqm_locations` VALUES ('TPNP', '74', 'SSA Marine Terminal – T30', '2431 East Marginal Way South', 'Seattle', 'WA', 'Seattle', '47.583473', '-122.341347');
INSERT INTO `jqm_locations` VALUES ('TPNP', '75', 'ConGlobal Ind.', '1 S Idaho St.', 'Seattle', 'WA', 'Seattle', '47.564581', '-122.3446851');
INSERT INTO `jqm_locations` VALUES ('TPNP', '76', 'Total Terminals Inc. (TTI)', '401 Alaskan Way', 'Seattle', 'WA', 'Seattle', '47.6017703', '-122.3366477');
INSERT INTO `jqm_locations` VALUES ('TPNP', '77', 'Washington United Terminal (WUT)', '1815 Port of Tacoma Road', 'Tacoma', 'WA', 'Tacoma', '47.2619598', '-122.3902002');
INSERT INTO `jqm_locations` VALUES ('TPNP', '78', 'Northwest Container Service', '1801 Taylor Way', 'Tacoma', 'WA', 'Tacoma', '47.273748', '-122.386131');
INSERT INTO `jqm_locations` VALUES ('TPNP', '79', 'Olympic Container Terminal (OCT)', '710 Port of Tacoma Road', 'Tacoma', 'WA', 'Tacoma', '47.2701659', '-122.4091762');
INSERT INTO `jqm_locations` VALUES ('TPNP', '80', 'Husky Terminal', '1101 Port of Tacoma Road', 'Tacoma', 'WA', 'Tacoma', '47.2693357', '-122.4048869');
INSERT INTO `jqm_locations` VALUES ('TPNP', '81', 'ConGlobal Ind.', '1501 N Schmeer Rd', 'Portland', 'OR', 'Portland', '45.590219', '-122.683503');
INSERT INTO `jqm_locations` VALUES ('TPNP', '82', 'Northwest Container Service', '11920 N. Burgard Rd.', 'Portland', 'OR', 'Portland', '45.6074849', '-122.76562');
INSERT INTO `jqm_locations` VALUES ('TPNP', '83', 'Port of Portland (ICTSI T6)', '7201 N. Marine Dr.', 'Portland', 'OR', 'Portland', '45.6422482', '-122.7514897');
INSERT INTO `jqm_locations` VALUES ('TPNP', '84', 'Portland Container Repair', '9449 N. Burgard Way', 'Portland', 'OR', 'Portland', '45.6133691', '-122.7742584');
INSERT INTO `jqm_locations` VALUES ('TNCP', '85', 'ConGlobal Ind.', '555A Maritime St.', 'Oakland', 'CA', 'Oakland', '37.8047118', '-122.3124958');
INSERT INTO `jqm_locations` VALUES ('TNCP', '86', 'Oakland International Container Terminal (OICT – East)', '1999 Middle Harbor Road', 'Oakland', 'CA', 'Oakland', '37.7977839', '-122.3050423');
INSERT INTO `jqm_locations` VALUES ('TNCP', '87', 'Oakland International Container Terminal (OICT – West)', '2505 Middle Harbor Road', 'Oakland', 'CA', 'Oakland', '37.8032232', '-122.3202359');
INSERT INTO `jqm_locations` VALUES ('TNCP', '88', 'Ports America Outer Harbor Terminal', '1599 Maritime Street', 'Oakland', 'CA', 'Oakland', '37.8153393', '-122.3082773');
INSERT INTO `jqm_locations` VALUES ('TNCP', '89', 'UPRR Oakland', '1408 Middle Harbor Road', 'Oakland', 'CA', 'Oakland', '37.7977062', '-122.2980443');
INSERT INTO `jqm_locations` VALUES ('TMVP', '90', 'CSX Ramp', '20103 Johnson Road', 'Marysville', 'OH', 'Marysville', '40.2911995', '-83.5046089');
INSERT INTO `jqm_locations` VALUES ('TPCP', '91', 'Columbia Container Services', '1155 Polaris Street', 'Elizabeth', 'NJ', 'NYNJ', '40.6741555', '-74.1643196');
INSERT INTO `jqm_locations` VALUES ('TPCP', '92', 'C&C Maintenance & Repair', '487 Bourne Avenue', 'Garden City', 'GA', 'Savannah', '32.1266955', '-81.1711919');
INSERT INTO `jqm_locations` VALUES ('TPCP', '93', 'ConGlobal Industries', '2534 Spruill Avenue', 'Charleston', 'SC', 'Charleston', '32.8451182', '-79.9582776');
INSERT INTO `jqm_locations` VALUES ('TPCP', '94', 'ConGlobal Industries', '1802 Hwy 146 North', 'LaPorte', 'TX', 'Houston', '29.6433525', '-95.0188656');
INSERT INTO `jqm_locations` VALUES ('TPSP', '95', 'TRAC Service Center', '400 E. Redondo Beach Boulevard', 'Los Angeles', 'CA', 'LA/LB', '33.8926612', '-118.26865');
INSERT INTO `jqm_locations` VALUES ('TPSP', '96', 'ConGlobal Ind.-LA/LB', '1711 Alameda Street', 'Los Angeles', 'CA', 'LA/LB', '33.799161', '-118.2454401');
INSERT INTO `jqm_locations` VALUES ('TPCP', '97', 'ConGlobal Industries', '1 S Idaho Street', 'Seattle', 'WA', 'Seattle', '47.564581', '-122.3446851');
INSERT INTO `jqm_locations` VALUES ('TPCP', '98', 'ConGlobal Industries', '555A Maritime Street', 'Oakland', 'CA', 'Oakland', '37.8047118', '-122.3124958');
INSERT INTO `jqm_locations` VALUES ('TPCP', '99', 'ConGlobal Industries', '23264 South Youngs Road', 'Channahon', 'IL', 'Chicago', '41.461265', '-88.178898');
INSERT INTO `jqm_locations` VALUES ('TPCP', '100', 'ConGlobal Industries', '6401 W. 46th Street', 'Forest View', 'IL', 'Chicago', '41.8103673', '-87.7862953');
INSERT INTO `jqm_locations` VALUES ('TPCP', '101', 'ConGlobal Industries', '1684 Florida Street', 'Memphis', 'TN', 'Memphis', '35.100357', '-90.061676');

-- ----------------------------
-- Table structure for jqm_regions
-- ----------------------------
DROP TABLE IF EXISTS `jqm_regions`;
CREATE TABLE `jqm_regions` (
  `regionID` varchar(5) NOT NULL,
  `region` varchar(50) DEFAULT NULL,
  `region_color` varchar(8) DEFAULT NULL,
  `region_map` bit(1) DEFAULT NULL,
  PRIMARY KEY (`regionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jqm_regions
-- ----------------------------
INSERT INTO `jqm_regions` VALUES ('metro', 'TRAC METRO POOL', '#2993D1', '');
INSERT INTO `jqm_regions` VALUES ('tgrp', 'TRAC GULF REGIONAL POOL', '#B3D9F0', '');
INSERT INTO `jqm_regions` VALUES ('tmep', 'TRAC MARINE EASTERN POOL', '#7ABBE5', '');
INSERT INTO `jqm_regions` VALUES ('tmmp', 'TRAC MARINE MIDWEST POOL', '#1B3862', '');
INSERT INTO `jqm_regions` VALUES ('tmvp', 'TRAC MARYSVILLE POOL', null, '\0');
INSERT INTO `jqm_regions` VALUES ('tmwp', 'TRAC MARINE WESTERN POOL', '#949599', '');
INSERT INTO `jqm_regions` VALUES ('tncp', 'TRAC NORTHERN CALIFORNIA POOL', '#FABD6A', '');
INSERT INTO `jqm_regions` VALUES ('tpcp', 'TRAC PREMIUM CHASSIS POOL', null, '\0');
INSERT INTO `jqm_regions` VALUES ('tpnp', 'TRAC PACIFIC NORTHWEST POOL', '#6F6D72', '');
INSERT INTO `jqm_regions` VALUES ('tpsp', 'TRAC PACIFIC SOUTHWEST POOL', '#F4D988', '');

-- ----------------------------
-- Table structure for jqm_states
-- ----------------------------
DROP TABLE IF EXISTS `jqm_states`;
CREATE TABLE `jqm_states` (
  `countryID` varchar(2) NOT NULL DEFAULT '',
  `stateID` varchar(2) NOT NULL DEFAULT '',
  `state` varchar(50) DEFAULT NULL,
  `coopID` int(11) DEFAULT NULL,
  PRIMARY KEY (`countryID`,`stateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jqm_states
-- ----------------------------
INSERT INTO `jqm_states` VALUES ('us', 'ak', 'Alaska', null);
INSERT INTO `jqm_states` VALUES ('us', 'al', 'Alabama', '6');
INSERT INTO `jqm_states` VALUES ('us', 'ar', 'Arkansas', null);
INSERT INTO `jqm_states` VALUES ('us', 'az', 'Arizona', null);
INSERT INTO `jqm_states` VALUES ('us', 'ca', 'California', '1');
INSERT INTO `jqm_states` VALUES ('us', 'co', 'Colorado', '2');
INSERT INTO `jqm_states` VALUES ('us', 'ct', 'Connecticut', null);
INSERT INTO `jqm_states` VALUES ('us', 'dc', 'D. Columbia', null);
INSERT INTO `jqm_states` VALUES ('us', 'de', 'Delaware', null);
INSERT INTO `jqm_states` VALUES ('us', 'fl', 'Florida', '6');
INSERT INTO `jqm_states` VALUES ('us', 'ga', 'Georgia', '6');
INSERT INTO `jqm_states` VALUES ('us', 'hi', 'Hawaii', null);
INSERT INTO `jqm_states` VALUES ('us', 'ia', 'Iowa', null);
INSERT INTO `jqm_states` VALUES ('us', 'id', 'Idaho', null);
INSERT INTO `jqm_states` VALUES ('us', 'il', 'Illinois', '4');
INSERT INTO `jqm_states` VALUES ('us', 'in', 'Indiana', '4');
INSERT INTO `jqm_states` VALUES ('us', 'ks', 'Kansas', '3');
INSERT INTO `jqm_states` VALUES ('us', 'ky', 'Kentucky', '5');
INSERT INTO `jqm_states` VALUES ('us', 'la', 'Louisiana', '7');
INSERT INTO `jqm_states` VALUES ('us', 'ma', 'Massachusetts', null);
INSERT INTO `jqm_states` VALUES ('us', 'md', 'Maryland', null);
INSERT INTO `jqm_states` VALUES ('us', 'me', 'Maine', null);
INSERT INTO `jqm_states` VALUES ('us', 'mi', 'Michigan', '4');
INSERT INTO `jqm_states` VALUES ('us', 'mn', 'Minnesota', null);
INSERT INTO `jqm_states` VALUES ('us', 'mo', 'Missouri', '3');
INSERT INTO `jqm_states` VALUES ('us', 'ms', 'Mississippi', '7');
INSERT INTO `jqm_states` VALUES ('us', 'mt', 'Montana', null);
INSERT INTO `jqm_states` VALUES ('us', 'nc', 'North Carolina', '6');
INSERT INTO `jqm_states` VALUES ('us', 'nd', 'North Dakota', null);
INSERT INTO `jqm_states` VALUES ('us', 'ne', 'Nebraska', '3');
INSERT INTO `jqm_states` VALUES ('us', 'nh', 'New Hampshire', null);
INSERT INTO `jqm_states` VALUES ('us', 'nj', 'New Jersey', null);
INSERT INTO `jqm_states` VALUES ('us', 'nm', 'New Mexico', null);
INSERT INTO `jqm_states` VALUES ('us', 'nv', 'Nevada', null);
INSERT INTO `jqm_states` VALUES ('us', 'ny', 'New York', null);
INSERT INTO `jqm_states` VALUES ('us', 'oh', 'Ohio', '4');
INSERT INTO `jqm_states` VALUES ('us', 'ok', 'Oklahoma', null);
INSERT INTO `jqm_states` VALUES ('us', 'or', 'Oregon', null);
INSERT INTO `jqm_states` VALUES ('us', 'pa', 'Pennsylvania', null);
INSERT INTO `jqm_states` VALUES ('us', 'pr', 'Puerto Rico', null);
INSERT INTO `jqm_states` VALUES ('us', 'ri', 'Rhode Island', null);
INSERT INTO `jqm_states` VALUES ('us', 'sc', 'South Carolina', '6');
INSERT INTO `jqm_states` VALUES ('us', 'sd', 'South Dakota', null);
INSERT INTO `jqm_states` VALUES ('us', 'tn', 'Tennessee', '5');
INSERT INTO `jqm_states` VALUES ('us', 'tx', 'Texas', '7');
INSERT INTO `jqm_states` VALUES ('us', 'ut', 'Utah', '2');
INSERT INTO `jqm_states` VALUES ('us', 'va', 'Virginia', null);
INSERT INTO `jqm_states` VALUES ('us', 'vt', 'Vermont', null);
INSERT INTO `jqm_states` VALUES ('us', 'wa', 'Washington', null);
INSERT INTO `jqm_states` VALUES ('us', 'wi', 'Wisconsin', '4');
INSERT INTO `jqm_states` VALUES ('us', 'wv', 'West Virginia', null);
INSERT INTO `jqm_states` VALUES ('us', 'wy', 'Wyoming', null);
