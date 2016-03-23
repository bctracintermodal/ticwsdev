-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.48-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema jquerymaps
--

CREATE DATABASE IF NOT EXISTS jquerymaps;
USE jquerymaps;

--
-- Definition of table `jqm_cooperatives`
--

DROP TABLE IF EXISTS `jqm_cooperatives`;
CREATE TABLE `jqm_cooperatives` (
  `coopID` int(11) NOT NULL,
  `coop` varchar(50) DEFAULT NULL,
  `coop_color` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`coopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jqm_cooperatives`
--

/*!40000 ALTER TABLE `jqm_cooperatives` DISABLE KEYS */;
INSERT INTO `jqm_cooperatives` (`coopID`,`coop`,`coop_color`) VALUES 
 (1,'West Coast','#EADBA2'),
 (2,'Mountain','#CAA89F'),
 (3,'Midwest','#C5B2CE'),
 (4,'Chicago Ohio Valley','#C1D8E6'),
 (5,'Midsouth','#B6CBA4'),
 (6,' Southeast','#90BCD5'),
 (7,'Gulf','#ECC896');
/*!40000 ALTER TABLE `jqm_cooperatives` ENABLE KEYS */;


--
-- Definition of table `jqm_locations`
--

DROP TABLE IF EXISTS `jqm_locations`;
CREATE TABLE `jqm_locations` (
  `regionID` varchar(25) NOT NULL,
  `locationID` int(11) NOT NULL,
  `location` varchar(75) DEFAULT NULL,
  `metro_city` varchar(75) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `city` varchar(75) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `HoursOfOp` varchar(75) DEFAULT NULL,
  `LiveLiftHours` varchar(10) DEFAULT NULL,
  `PoolType` varchar(75) DEFAULT NULL,
  `PoolName` varchar(500) DEFAULT NULL,
  `MPID` varchar(75) DEFAULT NULL,
  `MarkerID` varchar(75) DEFAULT NULL,
  `Comments` varchar(75) DEFAULT NULL,
  `CreateUser` varchar(75) DEFAULT NULL,
  `CreateDate` varchar(75) DEFAULT NULL,
  `UpdateUser` varchar(75) DEFAULT NULL,
  `UpdateDate` varchar(75) DEFAULT NULL,
  `is_tpcp` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`locationID`),
  UNIQUE KEY `ID_UNIQUE` (`locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jqm_locations`
--

/*!40000 ALTER TABLE `jqm_locations` DISABLE KEYS */;
INSERT INTO `jqm_locations` (`regionID`,`locationID`,`location`,`metro_city`,`address`,`city`,`state`,`zip`,`Phone`,`lat`,`lon`,`HoursOfOp`,`LiveLiftHours`,`PoolType`,`PoolName`,`MPID`,`MarkerID`,`Comments`,`CreateUser`,`CreateDate`,`UpdateUser`,`UpdateDate`,`is_tpcp`) VALUES 
 ('SATC',1,'Conglobal Industries','Charleston, SC','2534 Spruill Ave','Charleston','SC','29405','843-744-7892',32.845321,-79.958256,'','','CCM','SACP','BIRMINGHAM','BIRMINGHAM','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00','on'),
 ('TGRP',2,'Chickasaw Container','Mobile, AL','49 N Conception Street Rd','Mobile','AL','36610','251-457-7300',30.7231373,-88.0741164,'','','CCM','GCCP ','GULF','GULFREGIONAL5','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',3,'CSX - Mobile','Mobile, AL','2000 Industrial Canal Road East','Mobile','AL','36602','251-434-1361',30.710013,-88.0473087,'','','TRAC, CCM','TRAC Gulf Regional Pool - TGRP, GCCP','GULF','GULFREGIONAL5','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',4,'HIIC - Huntsville','Huntsville, AL','2850 Wall Triana Highway','Huntsville','AL','35824','256-772-7084',34.6464008,-86.7592375,'','','CCM','MCCP','HUNTSVILLE','HUNTSVILLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',5,'Mobile Container Term','Mobile, AL','901 Ezra Trice Blvd','Mobile','AL','36603','251-410-6100',30.664793,-88.039743,'','','TRAC','TRAC Gulf Regional Pool - TGRP','GULF','GULFREGIONAL5','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('SATC',6,'NS - McCalla','Birmingham, AL','7100 Crescent Way','McCalla','AL','35111','205-432-4104',33.2275126,-87.123822,'','','CCM','SACP','BIRMINGHAM','BIRMINGHAM','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',7,'UP Marion','Memphis, TN','5500 Kuhn Road','Marion','AR','72364','501-373-2862',35.1925006,-90.262287,'','','CCM','MCCP','MEMPHIS','MEMPHIS','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPSP',8,'BNSF - Commerce','Los Angeles, CA','6300 East Sheila Street','Los Angeles','CA','90040','323-267-4232',33.9937878,-118.1452685,'','','WCCP,Pool of Pools','WCCP,TRAC Pacific Southwest Pool - TPSP','GE','CA1','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPSP',9,'BNSF - Hobart','Los Angeles, CA','4940 Sheila Street','Los Angeles','CA','90040','323-267-4232',34.0017143,-118.1708168,'','','WCCP,Pool of Pools','WCCP,TRAC Pacific Southwest Pool - TPSP','GE','CA1','','PS-8333','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('',12,'Oakland International Container Terminal (OICT - East)','Oakland, CA','1999 Middle Harbor Road','Oakland','CA','80205','801-212-4131',37.7996508,-122.308004,'','','TRAC','TRAC Northern California Pool - TNCP','GE','CA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('',13,'Oakland International Container Terminal (OICT - West)','Oakland, CA','2505 Middle Harbor Road','Oakland','CA','80640','303-287-3379',37.8032232,-122.3202359,'','','TRAC','TRAC Northern California Pool - TNCP','GE','CA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('',14,'Ports America Outer Harbor Terminal','Oakland, CA','1599 Maritime Street','Oakland','CA','94607','510-464-8600',37.8153393,-122.3082773,'','','TRAC','TRAC Northern California Pool - TNCP','GE','CA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('TPSP',15,'SSA Marine Terminals Pier A','Long Beach, CA','700 Pier A Plaza','Long Beach','CA','90023','562-491-4000',33.7725463,-118.238588,'','','WCCP,Pool of Pools','WCCP,TRAC Pacific Southwest Pool - TPSP','GE','CA1','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPSP',16,'SSA Marine Terminals Pier J','Long Beach, CA','1521 Pier J Avenue','Long Beach','CA','90813','562-983-1001',33.7742759,-118.2091302,'','','WCCP,Pool of Pools','WCCP,TRAC Pacific Southwest Pool - TPSP','GE','CA1','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPSP',17,'TraPac Terminal ','Long Beach, CA','920 W. Harry Bridges Blvd.','Wilmington','CA','94607','310-830-2000',33.770015,-118.278701,'','','Pool Of Pools','TRAC Pacific Southwest Pool - TPSP','GE','CA1','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('',18,'UPRR Oakland','Oakland, CA','1408 Middle Harbor Road','Oakland','CA','94607','800-877-5123',37.7977062,-122.2980443,'','','TRAC','TRAC Northern California Pool - TNCP','GE','CA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('TPSP',19,'UPRR Ramp ICTF','Long Beach, CA','2401 E. Sepulveda Blvd.','Long Beach','CA','90802','562-490-7040',33.8055403,-118.2230981,'','','WCCP,Pool of Pools','WCCP,TRAC Pacific Southwest Pool - TPSP','GE','CA1','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPSP',20,'UPRR Ramp LATC','Los Angeles, CA','750 Lamar Street','Los Angeles','CA','90031','909-685-2927',34.0640704,-118.2235492,'','','WCCP,Pool of Pools','WCCP,TRAC Pacific Southwest Pool - TPSP','GE','CA1','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPSP',21,'UPRR Ramp UPLA','Los Angeles, CA','4341 E. Washington Blvd','Commerce','CA','90023','800-877-5123',34.0078496,-118.1820033,'','','WCCP','WCCP','GE','CA1','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPSP',22,'TTI - Pier T','Long Beach, CA','301 Hanjin Rd','Long Beach','CA','90802','562-256-2660',33.7603099,-118.2283331,'','','Pool Of Pools','TRAC Pacific Southwest Pool - TPSP','GE','CA1','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPSP',23,'ITS','Long Beach, CA','1281 Pier J Way','Long Beach','CA','90802','562-435-7781',33.7564421,-118.2204202,'','','Pool Of Pools','TRAC Pacific Southwest Pool - TPSP','GE','CA1','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPSP',25,'WBCT','Los Angeles, CA','2050 John S. Gibson Blvd.','San Pedro','CA','90731','310-519-2349',33.7672989,-118.28135,'','','Pool Of Pools','TRAC Pacific Southwest Pool - TPSP','GE','CA1','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPSP ',26,'Seaside Terminal / STS','Los Angeles, CA','425 So. Palos Verdes St.','San Pedro','CA','90731','310-732-7678',33.7404816,-118.2816326,'','','Pool Of Pools','TRAC Pacific Southwest Pool - TPSP','GE','CA1','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('DCTC',27,'BNSF','Denver, CO','585 W. 53rd Place','Denver','CO','80216','303-480-7920',39.796755,-104.9955406,'','','CCM','DCCP','DENVER','DENVER','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('',28,'Crown Container','Denver, CO','10051 Dallas Street','Henderson','CO','80640','303-287-3379',39.878834,-104.879561,'','','CCM','DCCP','DENVER','DENVER','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 (' ',29,'Denver Intermodal Xpress','Denver, CO','3400 E. 54th Ave','Denver','CO','80216','303-297-3631',39.7946153,-104.9476958,'','','CCM','DCCP','DENVER','DENVER','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('DCTC',30,'UPRR Denver','Denver, CO','1851 East 40th Ave.','Denver','CO','80205','801-212-4131',39.7729858,-104.9650964,'','','CCM','DCCP','DENVER','DENVER','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',31,'APMT - Jacksonville ','Jacksonville, FL','5800 William Mills St','Jacksonville','FL','32219','904-757-8266',30.392715,-81.537905,'','','CCM','SACP','JACK','JACKSONVILLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',32,'CSX - Jacksonville ','Jacksonville, FL','5902 Sportsman Club Road','Jacksonville','FL','32219','904-695-7000',30.3862019,-81.7656754,'','','CCM','SACP','JACK','JACKSONVILLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',33,'CSX - Tampa','Tampa, FL','1901 North 62nd Street','Tampa','FL','36169','813-626-4190',27.9610491,-82.3843918,'','','TRAC, CCM','TRAC Gulf Regional Pool - TGRP,SACP','TAMPA','TAMPA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',34,'FEC - Jacksonville','Jacksonville, FL','6140 Philips Hwy','Jacksonville','FL','32216','904-538-6100',30.2638102,-81.6164725,'','','CCM','SACP','JACK','JACKSONVILLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',35,'NS - Jacksonville ','Jacksonville, FL','4267 1/2 North Edgewood Drive','Jacksonville','FL','32254','904-366-1456',30.3706801,-81.7323685,'','','CCM','SACP','JACK','JACKSONVILLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',36,'Ports America','Tampa, FL','2510 Guy N. Verger Boulevard','Tampa','FL','33605','813-242-1900',27.9254581,-82.4332892,'','','TRAC','TRAC Gulf Regional Pool - TGRP','TAMPA','TAMPA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',37,'Talleyrand Terminal','Jacksonville, FL','3001 Talleyrand Ave','Jacksonville','FL','32206','904-353-0418',30.355187,-81.622782,'','','CCM','SACP','JACK','JACKSONVILLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',38,'Trapac Terminal-Jacksonville ','Jacksonville, FL','9834 New Berlin Rd','Jacksonville','FL','32226','904-714-0185',30.4045449,-81.5655008,'','','CCM','SACP','JACK','JACKSONVILLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',39,'CSX - Atlanta (Fairburn)','Atlanta, GA','6700 McLarin Road','Fairburn','GA','30213','770-306-6268',33.5491465,-84.6004193,'','','TRAC, CCM','TRAC Marine Eastern Pool â€“ TMEP, SACP','ATL','ATLANTA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 (' TMEP',40,'CSX - Atlanta (Hulsey)','Atlanta, GA','173 Boulevard S.E.','Atlanta','GA','30312','404-350-5220',33.7512129,-84.3679442,'','','TRAC, CCM','TRAC Marine Eastern Pool â€“ TMEP, SACP','ATL','ATLANTA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('TMEP',41,'CSX - Savannah ','Savannah, GA','3000 Tremont Road','Savannah','GA','31405','912-201-9291',32.0669323,-81.1391724,'','','CCM','SACP','SAV','SAVANNAH','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 (' ',42,'Conglobal Industries','Oakland, CA','555A Maritime Street','Oakland','CA','94607','510-350-0780',37.804958,-122.312464,'','','CCM','SACP','SAV','SAVANNAH','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00','on'),
 ('',43,'Garden City Terminal','Savannah, GA','2 Main Street','Garden City','GA','31408','912-963-5526',32.1237161,-81.1507957,'','','CCM','SACP','ATL','ATLANTA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('TMEP',44,'NS - Austell','Atlanta, GA','6000 Dr. Luke Glenn Garrett, Jr. Memorial Highway','Austell','GA','30106','770-405-3501',33.8246121,-84.6544592,'','','CCM','SACP','ATL','ATLANTA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('TMEP',45,'NS - Inman','Atlanta, GA','1600 Marietta Road NW, Gate 6','Atlanta','GA','30318','404-792-5146',33.7728676,-84.4251233,'','','CCM','SACP','ATL','ATLANTA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('TMMP',46,'UPRR/Iowa Interstate','Omaha, NE','2722 South Avenue','Council Bluff','IA','51503','712-325-9370',41.2343146,-95.8343576,'','','TRAC','TRAC Marine Midwest Pool - TMMP','COUNCIL','COUNCIL','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('COTC',47,'BNSF','Chicago, IL','26664 Baseline Rd.','Elwood','IL','60421','815-424-2200',41.3815441,-88.1477009,'','','TRAC, CCM','CMA, COCP','CHICAGO','CHICAGO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('COTC',48,'BNSF','Chicago, IL','3526 West 43rd St.','Chicago','IL','60632','773-579-5222',41.8155825,-87.712639,'','','TRAC, CCM','CMA, COCP','CHICAGO','CHICAGO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('COTC',49,'BNSF','Chicago, IL','5601 West 26th St.','Cicero','IL','60804','708-924-5331',41.843345,-87.764284,'','','TRAC, CCM','CMA, COCP','CHICAGO','CHICAGO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',50,'CNRR','Chicago, IL','16800 S. Center St.','Harvey','IL','60426','708-225-5900',41.5846251,-87.6461677,'','','TRAC','TRAC Marine Eastern Pool â€“ TMEP','CHICAGO','CHICAGO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('COCP',51,'CP Rail - Chassis Yard (TFC)','Chicago, IL','415 E.Green St.','Bensenville','IL','60106','630-694-9022',41.953262,-87.9330709,'','','CCM','COCP','CHICAGO','CHICAGO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',52,'CSX - 59th St.','Chicago, IL','2101 W. 59th St.','Chicago','IL','60636','773-358-4410',41.7857947,-87.6770387,'','','TRAC, CCM','TRAC Marine Eastern Pool â€“ TMEP, COCP','CHICAGO','CHICAGO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',53,'CSX - Bedford Park','Chicago, IL','7000 W. 71st. St.','Bedford Park','IL','60638','708-563-6115',41.7643739,-87.7938674,'','','TRAC, CCM','TRAC Marine Eastern Pool â€“ TMEP, COCP','CHICAGO','CHICAGO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMMP',54,'CSX East St. Louis','St. Louis, MO','3900 Rose Lake Road','East St. Louis','IL','62201','618-482-2656',38.6518991,-89.572281,'','','CCM','MWCP','St.LOUIS','St.LOUIS','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',55,'Integrated Ind. - Joliet','Chicago, IL','785 Draper Avenue','Joliet','IL','60432','773-299-1970',41.5390222,-88.0547253,'','','TRAC, CCM','TRAC Marine Eastern Pool â€“ TMEP, COCP','CHICAGO','CHICAGO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMMP',56,'UP - DUPO','St. Louis, MO','Highway 3 & State Street','Dupo','IL','62239','800-877-5123',38.5124226,-90.2092468,'','','TRAC, CCM','TRAC Marine Midwest Pool - TMMP, MWCP','St.LOUIS','St.LOUIS','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('',57,'UPRR - Global II ','Northlake, IL','301 W. Lake St.','Northlake','IL','60164','800-877-5123',41.8998365,-87.9145597,'','','CCM','COCP','CHICAGO','CHICAGO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('',58,'UPRR - Global III','Rochelle, IL','2701 Intermodal Dr.','Rochelle','IL','60168','800-877-5123',41.9031906,-89.0870188,'','','CCM','COCP','ROCHELLE','ROCHELLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',59,'UPRR - Global IV (JIT)','Chicago, IL','3000 S. Patterson Rd.','Joliet','IL','60436','800-877-5123',41.4800638,-88.1185669,'','','CCM','COCP','CHICAGO','CHICAGO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',60,'CNRR ','Indianapolis, IN','1585 S. Senate Ave.','Indianapolis','IN','46225','317-262-3336',39.7465023,-86.1642851,'','','CCM','COCP','INDIAN','INDIAN','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',61,'Conglobal Industries','Chicago, IL','23264 S. Youngs Road','Channahon','IL','60410','773-890-4800',41.461442,-88.178823,'','','TRAC, CCM','TRAC Marine Eastern Pool â€“ TMEP, COCP','INDIAN','INDIAN','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00','on'),
 ('TMEP',62,'M&M Transport Inc.','Indianapolis, IN','6238 W. Minnesota','Indianapolis','IN','46241','317-247-5444',39.7393409,-86.2690494,'','','TRAC','TRAC Marine Eastern Pool â€“ TMEP','INDIAN','INDIAN','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',63,'NS Rail Appliance Park','Louisville, KY','4913 Heller Street','Louisville','KY','40218','502-479-5401',38.181293,-85.657353,'','','CCM','COCP','LOUIS','LOUIS','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',65,'Avondale Container East','New Orleans, LA','7800 Almonaster Blvd.','New Orleans','LA','70126','504-241-3071',30.0069981,-90.0005908,'','','TRAC','TRAC Gulf Regional Pool - TGRP','NOLA','NOLA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',66,'Avondale Container West','Westego, LA','101 Avondale Garden Rd.','Westego','LA','70094','504-436-8696',29.9196204,-90.2076528,'','','TRAC','TRAC Gulf Regional Pool - TGRP','NOLA','NOLA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('GCTC',67,'BNSF NOLA','New Orleans, LA','539 Bridge City Avenue','Westego','LA','70094','504-437-5680',29.9323278,-90.1664605,'','','CCM','GCCP','NOLA','NOLA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',68,'CSX NOLA','New Orleans, LA','7801 Almonaster Avenue','New Orleans','LA','70126','504-244-4333',30.008572,-90.001049,'','','CCM','GCCP','NOLA','NOLA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',69,'New Orleans Terminasl','New Orleans, LA','50 Napoleon Avenue','New Orleans','LA','70115','504-522-2551',29.9127883,-90.1025755,'','','CCM','GCCP','NOLA','NOLA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',70,'Ports America','New Orleans, LA','49 Nashville Avenue','New Orleans','LA','70115','504-894-6367',29.9154958,-90.1205088,'','','CCM','GCCP','NOLA','NOLA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP ',71,'UPRR NOLA','New Orleans, LA','100 Avondale Garden Road','Avondale','LA','70094','504-342-3682',29.9196299,-90.207688,'','','TRAC, CCM','TRAC Gulf Regional Pool - TGRP, GCCP','NOLA','NOLA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',72,'NS - New Orleans','New Orleans, LA','2900 Florida Avenue','New Orleans','LA','70117','504-942-3257',29.984833,-90.041727,'','','CCM','GCCP','NOLA','NOLA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',73,'CSX - Baltimore','Baltimore, MD','4801 Keith Ave.','Baltimore','MD','21224','410-354-5491',39.2656966,-76.5534929,'','','TRAC Pool','TRAC Metro Pool','MP','METROPOOL','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('METRO',74,'MIT Dundalk','Baltimore, MD','2700 Broening Hwy','Baltimore','MD','21222','410-282-4260',39.2580689,-76.5330378,'','','TRAC Pool','TRAC Metro Pool','MP','METROPOOL','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',75,'NS - Baltimore','Baltimore, MD','4800 East Lombard Street','Baltimore','MD','21224','410-558-1529',39.2918928,-76.5555213,'','','TRAC Pool','TRAC Metro Pool','MP','METROPOOL','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',76,'Seagirt','Baltimore, MD','2600 Broening Hwy','Baltimore','MD','21222','410-288-8600',39.2559708,-76.5383839,'','','TRAC Pool','TRAC Metro Pool','MP','METROPOOL','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('TMEP',77,'Chassis Pro','Detroit, MI','5740 Federal Street','Detroit','MI','48209','313-925-3156',42.323663,-83.108609,'','','TRAC Pool','TRAC Marine Eastern Pool â€“ TMEP','DETROIT','DETROIT','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',78,'CNRR','Detroit, MI','600 Fern St.','Ferndale','MI','48220','248-691-6953',42.4504355,-83.1169142,'','','TRAC Pool','TRAC Marine Eastern Pool â€“ TMEP','DETROIT','DETROIT','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',79,'CSX - Detroit','Detroit, MI','6750 Dix Ave.','Detroit','MI','48209','313-842-2213',42.3160643,-83.1174443,'','','TRAC, CCM','TRAC Marine Eastern Pool â€“ TMEP, COCP','DETROIT','DETROIT','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',80,'NS - Rickenbacker','Columbus, MI','3329 Thoroughbred Dr.','Columbus','MI','43217','614-492-4808',40.0652851,-83.1203849,'','','CCM','COCP','COLUMBUS','COLUMBUS','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('COTC',81,'NS Rail - Detroit (Livernois)','Detroit, MI','2725 Livernois Ave','Detroit','MI','48209','313-297-5571',42.320443,-83.116805,'','','CCM','COCP','DETROIT','DETROIT','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMWP',82,'BNSF','St.Paul, MN','1701 Pierce Butler Rt.','St.Paul','MN','55104','651-298-7021',44.9695497,-93.1742954,'','','TRAC','TRAC Marine Western Pool - TMWP','STPAUL','STPAUL','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMMP',83,'BNSF','St. Louis, MO','3500 Wellington Ct','St. Louis','MO','63139','314-768-7090',38.599526,-90.3152794,'','','CCM','MWCP','ST.LOUIS','ST.LOUIS','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMMP',84,'BNSF Argentine','Kansas City, MO','720 S 38th St','Kansas City','MO','66106','915-551-4207',39.0863516,-94.6726336,'','','CCM','MWCP','KANSASCITY','KANSASCITY','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMMP',85,'CSX - KC','Kansas City, MO','3301 East 147th Street','Kansas City','MO','64147','816-318-8844',38.86014,-94.5738624,'','','TRAC, CCM','TRAC Marine Midwest Pool - TMMP, MWCP','KANSASCITY','KANSASCITY','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMMP',86,'KCS - KC','Kansas City, MO','3301 East 147th Street','Kansas City','MO','64147','800-468-6527',38.86014,-94.5738624,'','','CCM','MWCP','KANSASCITY','KANSASCITY','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMMP',87,'UP - NEFF','Kansas City, MO','4801 Gardener Ave','Kansas City','MO','64120','800-877-5123',39.125673,-94.523848,'','','TRAC, CCM','TRAC Marine Midwest Pool - TMMP, MWCP','KANSASCITY','KANSASCITY','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',88,'CSX - Charlotte ','Charlotte, NC','5430 Hovis Road','Charlotte','NC','28206','704-392-3102',35.271795,-80.893658,'','','TRAC, CCM','TRAC Marine Eastern Pool â€“ TMEP, SACP ','CHANC','CHARLOTTE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('TMEP',89,'NCSPA','Long Beach, CA','2202 Burnett Blvd','Wilmington','NC','28401','910-343-6378',34.1962731,-77.9483305,'','','CCM','SACP','WILMINGTON-NC','WILMINGTON-NC','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('SATC',90,'NS - Charlotte ','Charlotte, NC','1803 N. Brevard Street','Charlotte','NC','28206','704-378-3796',35.240728,-80.818578,'','','CCM','SACP','CHANC','CHARLOTTE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('METRO',91,'APM','Elizabeth, NJ','5080 McLester street','Elizabeth','NJ','7207','908-558-6000',40.669178,-74.1591192,'','','TRAC','TRAC Metro Pool','MP','METROPOOL7','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',92,'CSX - Little Ferry','North Bergen, NJ','2200 83rd. St','North Bergen','NJ','7047','973-274-2470',40.8107104,-74.0189008,'','','TRAC','TRAC Metro Pool','MP','METROPOOL7','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',93,'CSX - South Kearny','South Kearny, NJ','700 Old Fish House Rd','South Kearny','NJ','07032','973-274-2470',40.7407374,-74.0883112,'','','TRAC','TRAC Metro Pool','MP','METROPOOL7','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',95,'Ironbound','Newark, NJ','921 Delancy Street','Newark','NJ','7105','973-741-0950',40.7091602,-74.1293765,'','','TRAC','TRAC Metro Pool','MP','METROPOOL7','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',96,'Maher Chassis Depot','Elizabeth, NJ','1510 Bay avenue','Elizabeth','NJ','7201','908-249-4230',40.676305,-74.1570156,'','','TRAC','TRAC Metro Pool','MP','METROPOOL7','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',97,'NS - Croxton','Jersey City, NJ','100 County Rd','Jersey City','NJ','7307','201-239-3242',40.7620995,-74.0679681,'','','TRAC','TRAC Metro Pool','MP','METROPOOL7','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',98,'PNCT Chassis Depot','Port Newark, NJ','1100 Polaris Street','Port Newark','NJ','07114','908-355-1638',40.6967435,-74.1650991,'','','TRAC','TRAC Metro Pool','MP','METROPOOL7','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',99,'Red Hook Container Terminal - Port Newark','Port Newark, NJ','138 Marsh Street','Port Newark','NJ','07114','973-522-0999',40.6967435,-74.1650991,'','','TRAC','TRAC Metro Pool','MP','METROPOOL7','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',100,'CSX Buffalo','Buffalo, NY','1252 William St Rear','Buffalo','NY','14206','716-891-6736',42.8820351,-78.8099472,'','','TRAC','TRAC Metro Pool','BUFF','BU','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',101,'NYCT','Staten Island, NY','300 Western Ave.','Staten Island','NY','10303','718-568-1700',40.6338299,-74.182461,'','','TRAC','TRAC Metro Pool','MP','METROPOOL7','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',102,'Red Hook Container Terminal - Brooklyn','New York, NY','70 Hamilton Avenue','Brooklyn','NY','11231','718-875-0777',40.6839716,-74.0062426,'','','TRAC','TRAC Metro Pool','MP','METROPOOL7','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('TMEP',103,'CSX - Cleveland','Cleveland, OH','601 E. 152nd St.','Cleveland','OH','44110','216-268-7076',41.5638277,-81.5755362,'','','TRAC','TRAC Marine Eastern Pool â€“ TMEP','CLEVE','CLEVE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',104,'CSX - Columbus','Columbus, OH','2351 W. Belt Dr.','Columbus','OH','43228','614-850-1711',39.314528,-84.375855,'','','TRAC, CCM','TRAC Marine Eastern Pool â€“ TMEP, COCP','COLUMBUS','COLUMBUS','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',105,'Kentucky Container ','Cincinnati, OH','5550 Este Avenue','Cincinnati','OH','45232','513-262-4393',39.1840035,-84.5006524,'','','TRAC','TRAC Marine Eastern Pool â€“ TMEP','CINN','CINN','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',106,'Mason Dixon','Cleveland, OH','2700 Transport Rd.','Cleveland','OH','44115','216-298-4086',41.485925,-81.670833,'','','TRAC','TRAC Marine Eastern Pool â€“ TMEP','CLEVE','CLEVE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('COTC',107,'NS - Cleveland','Cleveland, OH','5300 Greenhurst Dr.','Maple Heights','OH','44137','216-518-8407',41.4194248,-81.5752834,'','','CCM','COCP','CLEVE','CLEVE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMEP',108,'Trimodal','Columbus, OH','2001 Walcutt Rd.','Columbus','OH','43228','614-876-6325',39.990961,-83.138946,'','','TRAC','TRAC Marine Eastern Pool â€“ TMEP','COLUMBUS','COLUMBUS','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPNP',109,'BNSF - Portland','Portland, OR','3930 NW Yeon ','Portland','OR','97210','503-241-4484',45.5497792,-122.7224054,'','','TRAC','TRAC Marine Western Pool - TMWP','PORTLAND','PORTLAND','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPNP',110,'ConGlobal Ind.','Portland, OR','1501 N Schmeer Rd','Portland','OR','97217','503-265-4104',45.590219,-122.683503,'','','TRAC','TRAC Pacific Northwest Pool - TPNP','PORTLAND','PORTLAND','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPNP',111,'Northwest Container Service','Portland, OR','11920 N. Burgard Rd.','Portland','OR','97203','503-290-2250',45.6074849,-122.76562,'','','TRAC','TRAC Pacific Northwest Pool - TPNP','PORTLAND','PORTLAND','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPNP',112,'Port of Portland (ICTSI T6)','Portland, OR','7201 N. Marine Dr.','Portland','OR','97203','503-415-6000',45.6422482,-122.7514897,'','','TRAC','TRAC Pacific Northwest Pool - TPNP','PORTLAND','PORTLAND','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPNP',113,'Portland Container Repair','Portland, OR','9449 N. Burgard Way','Portland','OR','97203','503-286-5961',45.6133691,-122.7742584,'','','TRAC','TRAC Pacific Northwest Pool - TPNP','PORTLAND','PORTLAND','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',114,'CSX - Philadelphia','Philadelphia, PA','3400 S. Christopher Columbus Blvd.','Philadelphia','PA','19148','215-218-3324',39.9018064,-75.1458038,'','','TRAC','TRAC Metro Pool','MP','METROPOOL5','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',115,'Packer Ave','Philadelphia, PA','3301 Christopher Columbus BLVD','Philadelphia','PA','19148','215-551-2873',39.9051624,-75.1397918,'','','TRAC','TRAC Metro Pool','MP','METROPOOL5','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('METRO',116,'Tioga Marine Terminal','Philadelphia, PA','3451 North Delaware Avenue, (Delaware River at Tioga Street)','Philadelphia','PA','19134','215-790-4455',39.9951659,-75.1019272,'','','TRAC','TRAC Metro Pool','MP','METROPOOL5','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('SATC',117,'CSX - Charleston ','Charleston, SC','4201 Meeting Street Road','Charleston','SC','29405','843-745-5340',32.8693742,-79.9951718,'','','CCM','SACP','CHASC','CHARLESTON','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('',118,'North Charleston Terminal ','Charleston, SC','1000 Remount Rd','North Charleston','SC','29406','843-745-6529',32.904959,-79.961139,'','','CCM','SACP','CHASC','CHARLESTON','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('',119,'NS - Charleston ','Charleston, SC','4350 Goer Drive','North Charleston','SC','29406','843-566-8043',32.8681073,-80.0034929,'','','CCM','SACP','CHASC','CHARLESTON','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('SATC',120,'Wando Welch ','Charleston, SC','400 Long Point Rd.','Mt. Pleasant','SC','29464','843-856-7006',32.8333512,-79.88288,'','','CCM','SACP','CHASC','CHARLESTON','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('MCTC',121,'BNSF','Memphis, TN','5280 Shelby Dr.','Memphis','TN','38118','901-433-5114',35.0204889,-89.8876879,'','','CCM','MCCP','NASHVILLIE','NASHVILLIE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('MCTC ',122,'CNRR - Memphis ','Memphis, TN','3588 Paul Lowry Road','Memphis','TN','38109','901-789-6377',35.0449351,-90.1533598,'','','CCM','MCCP','MEMPHIS','MEMPHIS','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('MCTC',123,'CSX - Memphis','Memphis, TN','3588 Paul Lowry Road','Memphis','TN','38109','901-566-4200',35.0449351,-90.1533598,'','','CCM','MCCP','MEMPHIS','MEMPHIS','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('',124,'CSX - Nashville','Nashville, TN','3086 Sidco Drive','Nashville','TN','37204','615-664-2607',36.0961085,-86.7569218,'','','TRAC, CCM','TRAC Marine Eastern Pool â€“ TMEP, MCCP','NASHVILLE','NASHVILLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',125,'BNSF - Alliance','Dallas, TX','1111 Intermodal Pkwy','Haslet','TX','76052','817-224-7166',32.9794512,-97.3273795,'','','TRAC, CCM','TRAC Gulf Regional Pool - TGRP, GCCP','DALLAS','DALLAS','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',126,'BNSF - El Paso','El Paso, TX','805 South Santa Fe St.','El Paso','TX','79901','915-534-2372',31.7517279,-106.488659,'','','CCM','GCCP','ELPASO','ELPASO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('TGRP',127,'BNSF - Pearland','Houston, TX','214 Brisbane Rd.','Houston','TX','77061','713-847-3128',29.6395376,-95.290796,'','','TRAC, CCM','TRAC Gulf Regional Pool - TGRP, GCCP','HOUSTON','HOUSTON','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',128,'ESS ','Dallas, TX','3839 E Overton Rd.','Dallas','TX','75216','214-374-3995',32.726895,-96.764111,'','','TRAC','TRAC Gulf Regional Pool - TGRP','DALLAS','DALLAS','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('TPCP',129,'ConGlobal Industries','Houston','1802 Highway 146 North','La Porte','TX','77572','281 470-0304',29.650455,-95.030501,'','','TRAC, CCM','TRAC Gulf Regional Pool - TGRP, GCCP','HOUSTON','HOUSTON','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00','on'),
 ('TGRP',130,'Wylie Intermodal Terminal (Dallas)','Dallas, TX','2800 SH 78 North','Wylie','TX','75098','972-836-0739',33.022817,-96.4741464,'','','TRAC, CCM','TRAC Gulf Regional Pool - TGRP, GCCP','DALLAS','DALLAS','','PS-8332','9/17/2013 12:00','bchamoff','7/14/2015 15:56',''),
 ('TGRP',131,'Port of Houston - Barbours Cut','La Porte, TX','1515 East Barbours Cut Blvd','La Porte','TX','77571','281-470-1800',29.6819781,-94.9935502,'','','TRAC, CCM','TRAC Gulf Regional Pool - TGRP, GCCP','HOUSTON','HOUSTON','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',132,'Port of Houston - Bayport','Seabrook, TX','12855 Port Road','Seabrook','TX','77586','281-291-6000',29.6044148,-94.9991525,'','','TRAC, CCM','TRAC Gulf Regional Pool - TGRP, GCCP','HOUSTON','HOUSTON','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',133,'Twin Cities','El Paso, TX','7180 Copperqueen Dr.','El Paso','TX','79915','915-781-0776',31.756789,-106.379128,'','','TRAC','TRAC Gulf Regional Pool - TGRP','ELPASO','ELPASO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',135,'UPRR Dallas (DIT)','Dallas, TX','3701 South I-45','Wilmer','TX','75172','800-877-5123',32.5963199,-96.6794742,'','','TRAC, CCM','TRAC Gulf Regional Pool - TGRP, GCCP','DALLAS','DALLAS','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',136,'UPRR Englewood','Houston, TX','5500 Wallisville Road','Houston','TX','77020','800-877-5123',29.7872864,-95.3146905,'','','TRAC, CCM','TRAC Gulf Regional Pool - TGRP, GCCP','HOUSTON','HOUSTON','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',137,'UPRR Laredo','Laredo, TX','I-35 North, Mile Marker #12','Laredo','TX','78041','800-877-5123',27.5676627,-99.4450439,'','','CCM','GCCP','LAREDO','LAREDO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',138,'UPRR Mesquite','Dallas, TX','4100 Forney','Mesquite','TX','75149','800-877-5123',32.7851717,-96.6564553,'','','CCM','GCCP','DALLAS','DALLAS','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',139,'UPRR San Antonio','San Antonio, TX','13001 I-35 South','Von Ormy','TX','78202','800-877-5123',29.3240155,-98.6007776,'','','TRAC, CCM','TRAC Gulf Regional Pool - TGRP, GCCP','SANANTIONIO','SANANTIONIO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',140,'UPRR Settegast','Houston, TX','6800 Kirkpatrick Blvd.','Houston','TX','77028','800-877-5123',29.8249884,-95.290685,'','','TRAC, CCM','TRAC Gulf Regional Pool - TGRP, GCCP','HOUSTON','HOUSTON','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',141,'WWinners Container Yard','San','3611 Speedway Run','Von Ormy','TX','78073','210-227-3901',29.2780362,-98.5762012,'','','TRAC','TRAC Gulf Regional Pool - TGRP','SANANTIONIO','SANANTIONIO','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TGRP',142,'WWinners Container Yard','Houston, TX','10000 Wallisville Rd','Houston','TX','77013','713-675-1200',29.7897084,-95.2540543,'','','TRAC','TRAC Gulf Regional Pool - TGRP','HOUSTON','HOUSTON','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 (' ',143,'Harrington Trucking','Salt Lake City, UT','510 South Delong Street','Salt Lake City','UT','84104','801-975-1266',40.7580913,-111.9533795,'','','CCM','DCCP','SALTLAKE','SALTLAKE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('DCTC',144,'UPRR Salt Lake City','Salt Lake City, UT','1045 South 5500 West','Salt Lake City','UT','84104','801-212-4131',40.749569,-112.0189401,'','','CCM','DCCP','SALTLAKE','SALTLAKE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPNP',145,'BNSF','Seattle, WA','44 S Handord St.','Seattle','WA','98134','206-625-6013',47.5755916,-122.3369709,'','','TRAC','TRAC Marine Western Pool - TMWP','SEATTLE','SEATTLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPNP',146,'BNSF ','Seattle , WA','12400 51st. Pl South','Seattle ','WA','98178','206-658-1688',47.4926682,-122.2706442,'','','TRAC','TRAC Marine Western Pool - TMWP','SEATTLE','SEATTLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPNP',147,'Conglobal Industries','Seattle, WA','1 S Idaho St.','Seattle','WA','98134','206-624-8180',47.564784,-122.344782,'','','TRAC','TRAC Pacific Northwest Pool - TPNP','SEATTLE','SEATTLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00','on'),
 ('TPNP',149,'Northwest Container Service','Tacoma, WA','1801 Taylor Way','Tacoma','WA','98421','253-272-3134',47.273748,-122.386131,'','','TRAC','TRAC Pacific Northwest Pool - TPNP','TACOMA','TACOMA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPNP',150,'Olympic Container Terminal (OCT)','Tacoma, WA','710 Port of Tacoma Road','Tacoma','WA','98421','253-779-6500',47.2701659,-122.4091762,'','','TRAC','TRAC Pacific Northwest Pool - TPNP','TACOMA','TACOMA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPNP',151,'SSA Marine Terminal - T18','Seattle, WA','1050 SW Spokane Street','Seattle','WA','98134','206-654-3700',47.5714431,-122.3482955,'','','TRAC','TRAC Pacific Northwest Pool - TPNP','SEATTLE','SEATTLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPNP',152,'SSA Marine Terminal - T30','Seattle, WA','2431 East Marginal Way South','Seattle','WA','98134','206-461-9169',47.583473,-122.341347,'','','TRAC','TRAC Pacific Northwest Pool - TPNP','SEATTLE','SEATTLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPNP',153,'Total Terminals Inc. (TTI)','Seattle, WA','401 Alaskan Way','Seattle','WA','98104','206-622-9130',47.5970487,-122.3366007,'','','TRAC','TRAC Pacific Northwest Pool - TPNP','SEATTLE','SEATTLE','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TPNP',154,'Washington United Terminal (WUT)','Tacoma, WA','1815 Port of Tacoma Road','Tacoma','WA','98421','253-396-4900',47.2619598,-122.3902002,'','','TRAC','TRAC Pacific Northwest Pool - TPNP','TACOMA','TACOMA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',NULL),
 ('TMWP',155,'Chippewa Falls - CN Ramp','Chippewa, WI','1160 West River  St.','Chippewa','WI','54729','715-450-7283',44.927225,-91.4104822,'','','TRAC','TRAC Marine Western Pool - TMWP','CHIPPEWA','CHIPPEWA','','PS-8332','9/17/2013 12:00','PS-8332','9/17/2013 12:00',''),
 ('TPNP',156,'Husky Terminal','Tacoma, WA','1101 Port of Tacoma Road','Tacoma','WA','98421','253-627-6963',47.2693357,-122.4048869,NULL,NULL,'TRAC','TRAC Pacific Northwest Pool - TPNP','TACOMA','TACOMA',NULL,'PS-8867 ','9/20/2013 12:00','PS-8867 ','9/20/2013 12:00',NULL),
 ('TMEP',157,'American Marine Express','Cleveland, OH','765 E. 140th Street','Cleveland','OH','44110','216-298-3005',41.5598292,-81.5851967,NULL,NULL,'TRAC','TRAC Marine Eastern Pool â€“ TMEP','CLEVE','CLEVE',NULL,'PS-8332','4/14/2014','PS-8332','4/14/2014',NULL),
 ('TGRP',158,'UPRR Santa Teresa','El Paso, TX','9050 Strauss Road','El Paso','TX','88008','800-877-5123',31.8397756,-106.6880841,NULL,NULL,'TRAC, CCM','TRAC Gulf Regional Pool - TGRP, GCCP','ELPASO','ELPASO',NULL,'PS-8332','4/16/2014','PS-8332','4/16/2014',NULL),
 ('METRO',159,'NS - Pittsburgh','Pittsburgh, PA','701 Wall Avenue','Wall','PA','15148','412-893-5525',40.3949761,-79.7769737,NULL,NULL,'TRAC','TRAC Marine Eastern Pool â€“ TMEP','PTSBG','PITTSBURGH',NULL,'PS-8332','8/7/2014','PS-8332','8/7/2014',NULL),
 ('TMEP',161,'Miami Container Repair','Miami, FL','9801 Northwest 106th Street','Medley','FL','33178','305-863-0040',25.870838,-80.355957,NULL,NULL,'TRAC','TMEP','Miami','Miami',NULL,'PS-8332','2/20/2015','PS-8332','2/20/2015',NULL),
 ('TPSP',163,'APMT Pier 400','Los Angeles, CA','500 Navy Way Berths 401-404','Los Angeles','CA','90731','310-221-4000',33.7241323,-118.2643567,NULL,NULL,'Pool Of Pools','TRAC Pacific Southwest Pool - TPSP','GE','CA1',NULL,'PS-8332','6/8/2015','PS-8332','6/8/2015',NULL),
 ('TPSP',164,'CA United Terminal (CUT)','Los Angeles, CA','2525 Navy Way Berths 405-406','Los Angeles','CA','90731','310- 521-5000',33.7241323,-118.2643567,NULL,NULL,'Pool Of Pools','TRAC Pacific Southwest Pool - TPSP','GE','CA1',NULL,'PS-8332','6/8/2015','PS-8332','6/8/2015',NULL),
 ('TPSP',165,'Global Gateway South (GGS)','Los Angeles, CA','614 Terminal Way Berths 302-305','Los Angeles','CA','90731','310 548-8700',33.7241323,-118.2643567,NULL,NULL,'Pool Of Pools','TRAC Pacific Southwest Pool - TPSP','GE','CA1',NULL,'PS-8332','6/8/2015','PS-8332','6/8/2015',NULL),
 ('TPSP',166,'Long Beach Container Terminals (LBCT)','Long Beach, CA','1171 Pier F Ave','Long Beach','CA','90802','562-435-8585',33.750997,-118.2099252,NULL,NULL,'Pool Of Pools','TRAC Pacific Southwest Pool - TPSP','GE','CA1',NULL,'PS-8332','6/8/2015','PS-8332','6/8/2015',''),
 ('TPSP',167,'Yusen Terminal (YTI)','Los Angeles, CA','701 New Dock Street Berths 212-225','Los Angeles','CA','90731','310-548-8000',33.7241323,-118.2643567,NULL,NULL,'Pool Of Pools','TRAC Pacific Southwest Pool - TPSP','GE','CA1',NULL,'PS-8332','6/8/2015','PS-8332','6/8/2015',NULL),
 ('TPCP',168,'C&C Maintenance','Savannah, GA','487 Bourne Ave','Garden City','GA','31408','912-233-5045',32.126988,-81.171074,NULL,NULL,'Private Pool','TRAC Private Chassis Pool - TPCP','CHICAGO','CHICAGO',NULL,'PS-8332','6/10/2015','PS-8332','6/10/2015','on'),
 ('TPCP',169,'Conglobal Industries','Chicago, IL','6401 W. 46th St','Forest View','IL','60402','708-484-0900',41.808896,-87.792044,NULL,NULL,'Private Pool','TRAC Private Chassis Pool - TPCP','CHICAGO','CHICAGO',NULL,'PS-8332','6/10/2015','PS-8332','6/10/2015','on'),
 ('METRO',170,'Columbia Container Depot','Elizabeth, NJ','1155 Polaris St','Elizabeth','NJ','07201','908-965-2035',40.675992,-74.161986,NULL,NULL,'Private Pool','TRAC Private Chassis Pool - TPCP','MP','METROPOOL7',NULL,'PS-8332','6/10/2015','PS-8332','6/10/2015','on'),
 ('TPCP',171,'Conglobal Industries','Memphis, TN','1684 Florida Street','Memphis','TN','38109','901-942-4835',35.101784,-90.062265,NULL,NULL,'Private Pool','TRAC Private Chassis Pool - TPCP','MEMPHIS','MEMPHIS',NULL,'PS-8332','6/16/2015','PS-8332','6/16/2015','on'),
 ('TMEP',172,'CPG Louisville (S. Park)','Louisville, KY','1803 South Park Road','Louisville','KY','40219','502-969-3562',38.118055,-85.733499,NULL,NULL,'TRAC','TRAC Marine Eastern Pool - TMEP','LOUIS','LOUIS',NULL,'bchamoff','6/26/2015','bchamoff','6/26/2015',NULL),
 ('',174,'Conglobal Industries','Long Beach, CA','1711 Alameda Street','Wilmington ','CA','90748','310-513-6101	',33.799107,-118.245193,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'on'),
 ('',175,'TRAC Service Center','Los Angeles, CA','400 E. Redondo Beach Boulevard','Gardena','CA','90248','562-618-5124',33.89267,-118.268435,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'on');
/*!40000 ALTER TABLE `jqm_locations` ENABLE KEYS */;


--
-- Definition of table `jqm_locations_backup`
--

DROP TABLE IF EXISTS `jqm_locations_backup`;
CREATE TABLE `jqm_locations_backup` (
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jqm_locations_backup`
--

/*!40000 ALTER TABLE `jqm_locations_backup` DISABLE KEYS */;
INSERT INTO `jqm_locations_backup` (`regionID`,`locationID`,`location`,`address`,`city`,`state`,`metro_city`,`lat`,`lon`) VALUES 
 ('METRO',1,'CSX Buffalo','1252 William St Rear','Buffalo','NY','Buffalo',42.8864468,-78.8783689),
 ('METRO',2,'Red Hook Container Terminal – Brooklyn','70 Hamilton Avenue','Brooklyn','NY','NY/NJ',40.6786907,-74.0036426),
 ('METRO',3,'APM','5080 McLester street','Elizabeth','NJ','NY/NJ',40.669178,-74.1591192),
 ('METRO',4,'Maher Chassis Depot','1510 Bay Avenue','Elizabeth','NJ','NY/NJ',40.676305,-74.1570156),
 ('METRO',5,'Global Chassis Depot','Colony Road ','Jersey City','NJ','NY/NJ',40.681617,-74.0790305),
 ('METRO',6,'NS – Croxton','100 County Rd','Jersey City','NJ','NY/NJ',40.7612376,-74.0675096),
 ('METRO',7,'Ironbound','921 Delancy Street','Newark','NJ','NY/NJ',40.7128631,-74.140081),
 ('METRO',8,'CSX – Little Ferry','2200 83rd. St','North Bergen','NJ','NY/NJ',40.8107104,-74.0189008),
 ('METRO',9,'PNCT Chassis Depot','1100 Polaris Street','Port Newark','NJ','NY/NJ',40.735657,-74.1723667),
 ('METRO',10,'Red Hook Container Terminal – Port Newark','138 Marsh Street','Port Newark','NJ','NY/NJ',40.6944975,-74.1496946),
 ('METRO',11,'CSX – South Kearny','700 Old Fish House Rd','South Kearny','NJ','NY/NJ',40.7407374,-74.0883112),
 ('METRO',12,'NYCT','300 Western Ave.','Staten Island','NY','NY/NJ',40.6374543,-74.1851231),
 ('METRO',13,'CSX – Philadelphia','3400 S. Christopher Columbus Blvd.','Philadelphia','PA','Philadelphia, PA',39.9018064,-75.1458038),
 ('METRO',14,'Packer Ave','3301 Christopher Columbus BLVD','Philadelphia','PA','Philadelphia, PA',39.9051624,-75.1397918),
 ('METRO',15,'Tioga Marine Terminal','3451 North Delaware Avenue, (Delaware River at Tioga Street)','Philadelphia','PA','Philadelphia, PA',39.995109,-75.101876),
 ('METRO',16,'CSX – Baltimore','4801 Keither Ave.','Baltimore','MD','Baltimore, MD',39.2656966,-76.5534929),
 ('METRO',17,'MIT Dundalk','2700 Broening Hwy','Baltimore','MD','Baltimore, MD',39.2483224,-76.5346878),
 ('METRO',18,'NS – Baltimore','4800 East Lombard Street','Baltimore','MD','Baltimore, MD',39.2918928,-76.5555213),
 ('METRO',19,'Seagirt','2600 Broening Hwy','Baltimore','MD','Baltimore, MD',39.2559708,-76.5383839),
 ('TMEP',20,'CSX – Bedford Park','7000 W. 71st. St.','Bedford Park','IL','Chicago',41.7629174,-87.795606),
 ('TMEP',21,'CSX – 59th St.','2101 W. 59th St.','Chicago','IL','Chicago',41.7859693,-87.6771022),
 ('TMEP',22,'CNRR','16800 S. Center St.','Harvey','IL','Chicago',41.5846171,-87.6484155),
 ('TMEP',23,'Integrated Ind. – Joliet','785 Draper Avenue','Joliet','IL','Chicago',41.5390222,-88.0547253),
 ('TMEP',24,'Kentucky Container','5550 Este Avenue','Cincinnati','OH','Cincinnati',39.1848048,-84.5015886),
 ('TMEP',25,'CSX – Cleveland','601 E. 152nd St.','Cleveland','OH','Cleveland',41.5638277,-81.5755362),
 ('TMEP',26,'Mason Dixon','2700 Transport Rd.','Cleveland','OH','Cleveland',41.485925,-81.670833),
 ('TMEP',27,'American Marine Express','765 E. 140th Street','Cleveland','OH','Cleveland',41.5598292,-81.5851967),
 ('TMEP',28,'Trimodal','2001 Walcutt Rd.','Columbus','OH','Columbus',39.990961,-83.138946),
 ('TMEP',29,'CSX – Columbus','2351 W. Belt Dr.','Columbus','OH','Columbus',39.314528,-84.375855),
 ('TMEP',30,'CSX – Detroit','6750 Dix Ave.','Detroit','MI','Detroit',42.3160643,-83.1174443),
 ('TMEP',31,'Chassis Pro','5740 Federal Street','Detroit','MI','Detroit',42.323663,-83.108609),
 ('TMEP',32,'CNRR','600 Fern St.','Ferndale','MI','Detroit',42.4504355,-83.1169142),
 ('TMEP',33,'CSX','501 S. County Rd. 800 E','Avon ','IN','Indianapolis',39.755834,-86.381078),
 ('TMEP',34,'M&M Transport Inc.','2800 Enterprise St.','Indianapolis','IN','Indianapolis',39.806282,-86.033209),
 ('TMEP',35,'NS Rail Appliance Park','4913 Heller Street','Louisville','KY','Louisville',38.181293,-85.657353),
 ('TMEP',36,'NS – Pittsburgh','701 Wall Avenue','Pittsburgh','PA','Pittsburgh',40.4062518,-79.779914),
 ('TMEP',37,'CSX – Nashville','3086 Sidco Drive','Nashville','TN','Nashville',36.0962536,-86.7569048),
 ('TMEP',38,'CSX – Atlanta (Hulsey)','173 Boulevard S.E.','Atlanta','GA','Atlanta',33.7493114,-84.3699475),
 ('TMEP',39,'CSX – Atlanta (Fairburn)','6700 McLarin Road','Fairburn','GA','Atlanta',33.5491465,-84.6004193),
 ('TMEP',40,'CSX – Charlotte','5430 Hovis Road','Charlotte','NC','Charlotte',35.271795,-80.893658),
 ('TMEP',41,'CSX – Jacksonville','5902 Sportsman Club Road','Jacksonville','FL','Jacksonville',30.386771,-81.768023),
 ('TMWP',42,'CN Ramp - Chippewa Falls','1160 West River  St.','Chippewa','WI','Chippewa',44.927225,-91.4104822),
 ('TMWP',43,'BNSF','1701 Pierce Butler Rt.','St.Paul','MN','St.Paul',44.9695497,-93.1742954),
 ('TMWP',44,'BNSF','3930 NW Yeon','Portland','OR','Portland',45.553054,-122.723547),
 ('TMWP',45,'BNSF','44 S Handord St.','Seattle','WA','Seattle',47.5755916,-122.3369709),
 ('TMWP',46,'BNSF','12400 51st. Pl South','Seattle ','WA','Seattle',47.4926682,-122.2706442),
 ('TMMP',47,'UP – Iowa Interstate','2722 South Avenue','Council Bluff','IA','Council Bluff',41.8780025,-93.097702),
 ('TMMP',48,'UP – DUPO','Highway 3 & State Street','Dupo','IL','St. Louis',38.5124226,-90.2092468),
 ('TMMP',49,'UP – NEFF','4801 Gardener Ave','Kansas City','MO','Kansas City',39.125673,-94.523848),
 ('TMMP',50,'CSX – KC','3301 East 147th Street','Kansas City','MO','Kansas City',38.86014,-94.5738624),
 ('TGRP',51,'ESS','3839 E Overton Rd.','Dallas','TX','Dallas',32.7241083,-96.7653479),
 ('TGRP',52,'KCS – Dallas','11931 Shiloh Rd.','Dallas','TX','Dallas',32.8585414,-96.6658697),
 ('TGRP',53,'BNSF – Alliance','1111 Intermodal Pkwy','Haslet','TX','Dallas',32.9901076,-97.349706),
 ('TGRP',54,'UPRR Dallas (DIT)','3701 South I-45','Wilmer','TX','Dallas',32.6124651,-96.6894073),
 ('TGRP',55,'Twin Cities','7180 Copperqueen Dr.','El Paso','TX','El Paso',31.756789,-106.379128),
 ('TGRP',56,'UPRR Santa Teresa','9050 Strauss Road','El Paso','TX','El Paso',31.7775757,-106.4424559),
 ('TGRP',57,'WWinners Container Yard','10000 Wallisville Rd','Houston','TX','Houston',29.793478,-95.253632),
 ('TGRP',58,'BNSF – Pearland','214 Brisbane Rd.','Houston','TX','Houston',29.6395376,-95.290796),
 ('TGRP',59,'UPRR Englewood','5500 Wallisville Road','Houston','TX','Houston',29.7872864,-95.3146905),
 ('TGRP',60,'UPRR Settegast','6800 Kirkpatrick Blvd.','Houston','TX','Houston',29.826276,-95.290365),
 ('TGRP',61,'Integrated Marine Service','500 East Barbours Cut Blvd','La Porte','TX','Houston',29.6734254,-95.0149068),
 ('TGRP',62,'Port of Houston – Barbours Cut','1515 East Barbours Cut Blvd','La Porte','TX','Houston',29.682058,-94.9935),
 ('TGRP',63,'Port of Houston – Bayport','12855 Port Road','Seabrook','TX','Houston',29.6044148,-94.9991525),
 ('TGRP',64,'WWinners Container Yard','3611 Speedway Run','Von Ormy','TX','San Antonio',29.2780362,-98.5762012),
 ('TGRP',65,'UPRR San Antonio','13001 I-35 South','Von Ormy','TX','San Antonio',29.2957435,-98.6348543),
 ('TGRP',66,'UPRR NOLA','100 Avondale Garden Road','Avondale','LA','New Orleans',29.9196299,-90.207688),
 ('TGRP',67,'Avondale Container East','7800 Almonaster Blvd.','New Orleans','LA','New Orleans',30.009626,-89.9772949),
 ('TGRP',68,'Avondale Container West','101 Avondale Garden Rd.','Westego','LA','New Orleans',29.9196204,-90.2076528),
 ('TGRP',69,'CSX – Mobile','2000 Industrial Canal Road East','Mobile','AL','Mobile',30.7171237,-88.0514002),
 ('TGRP',70,'Mobile Container Term','901 Ezra Trice Blvd','Mobile','AL','Mobile',30.667243,-88.0419921),
 ('TGRP',71,'Ports America','2510 Guy N. Verger Boulevard','Tampa','FL','Tampa',27.9254581,-82.4332892),
 ('TGRP',72,'CSX – Tampa','1901 North 62nd Street','Tampa','FL','Tampa',27.95903,-82.388722),
 ('TPNP',73,'SSA Marine Terminal – T18','1050 SW Spokane Street','Seattle','WA','Seattle',47.5714431,-122.3482955),
 ('TPNP',74,'SSA Marine Terminal – T30','2431 East Marginal Way South','Seattle','WA','Seattle',47.583473,-122.341347),
 ('TPNP',75,'ConGlobal Ind.','1 S Idaho St.','Seattle','WA','Seattle',47.564581,-122.3446851),
 ('TPNP',76,'Total Terminals Inc. (TTI)','401 Alaskan Way','Seattle','WA','Seattle',47.6017703,-122.3366477),
 ('TPNP',77,'Washington United Terminal (WUT)','1815 Port of Tacoma Road','Tacoma','WA','Tacoma',47.2619598,-122.3902002),
 ('TPNP',78,'Northwest Container Service','1801 Taylor Way','Tacoma','WA','Tacoma',47.273748,-122.386131),
 ('TPNP',79,'Olympic Container Terminal (OCT)','710 Port of Tacoma Road','Tacoma','WA','Tacoma',47.2701659,-122.4091762),
 ('TPNP',80,'Husky Terminal','1101 Port of Tacoma Road','Tacoma','WA','Tacoma',47.2693357,-122.4048869),
 ('TPNP',81,'ConGlobal Ind.','1501 N Schmeer Rd','Portland','OR','Portland',45.590219,-122.683503),
 ('TPNP',82,'Northwest Container Service','11920 N. Burgard Rd.','Portland','OR','Portland',45.6074849,-122.76562),
 ('TPNP',83,'Port of Portland (ICTSI T6)','7201 N. Marine Dr.','Portland','OR','Portland',45.6422482,-122.7514897),
 ('TPNP',84,'Portland Container Repair','9449 N. Burgard Way','Portland','OR','Portland',45.6133691,-122.7742584),
 ('TNCP',85,'ConGlobal Ind.','555A Maritime St.','Oakland','CA','Oakland',37.8047118,-122.3124958),
 ('TNCP',86,'Oakland International Container Terminal (OICT – East)','1999 Middle Harbor Road','Oakland','CA','Oakland',37.7977839,-122.3050423),
 ('TNCP',87,'Oakland International Container Terminal (OICT – West)','2505 Middle Harbor Road','Oakland','CA','Oakland',37.8032232,-122.3202359),
 ('TNCP',88,'Ports America Outer Harbor Terminal','1599 Maritime Street','Oakland','CA','Oakland',37.8153393,-122.3082773),
 ('TNCP',89,'UPRR Oakland','1408 Middle Harbor Road','Oakland','CA','Oakland',37.7977062,-122.2980443),
 ('TMVP',90,'CSX Ramp','20103 Johnson Road','Marysville','OH','Marysville',40.2911995,-83.5046089),
 ('TPCP',91,'Columbia Container Services','1155 Polaris Street','Elizabeth','NJ','NYNJ',40.6741555,-74.1643196),
 ('TPCP',92,'C&C Maintenance & Repair','487 Bourne Avenue','Garden City','GA','Savannah',32.1266955,-81.1711919),
 ('TPCP',93,'ConGlobal Industries','2534 Spruill Avenue','Charleston','SC','Charleston',32.8451182,-79.9582776),
 ('TPCP',94,'ConGlobal Industries','1802 Hwy 146 North','LaPorte','TX','Houston',29.6433525,-95.0188656),
 ('TPCP',95,'TRAC Service Center','400 E. Redondo Beach Boulevard','Los Angeles','CA','LA/LB',33.8926612,-118.26865),
 ('TPCP',96,'ConGlobal Ind.-LA/LB','1711 Alameda Street','Los Angeles','CA','LA/LB',33.799161,-118.2454401),
 ('TPCP',97,'ConGlobal Industries','1 S Idaho Street','Seattle','WA','Seattle',47.564581,-122.3446851),
 ('TPCP',98,'ConGlobal Industries','555A Maritime Street','Oakland','CA','Oakland',37.8047118,-122.3124958),
 ('TPCP',99,'ConGlobal Industries','23264 South Youngs Road','Channahon','IL','Chicago',41.461265,-88.178898),
 ('TPCP',100,'ConGlobal Industries','6401 W. 46th Street','Forest View','IL','Chicago',41.8103673,-87.7862953),
 ('TPCP',101,'ConGlobal Industries','1684 Florida Street','Memphis','TN','Memphis',35.100357,-90.061676),
 ('TPCP',104,'Conglobal Depot-Channahon ','23264 South Youngs Rd','Channahon','IL','Channahon',41.461265,-88.178898),
 ('TPCP',105,'Columbia Depot ','1155 Polaris St','Elizabeth','NJ','Elizabeth',40.675788,-74.161943),
 ('TPCP',106,'Conglobal Depot-Forest View ','6401 W. 46th St','Forest View','IL','Forest View',41.8103673,-87.7862953),
 ('TPCP',107,'Conglobal Depot-Memphis ','1684 Florida St','Memphis','TN','Memphis',35.100357,-90.061676),
 ('TPCP',108,'Conglobal Depot-Oakland ','555A Maritime St','Oakland','CA','Oakland',37.8047118,-122.3124958),
 ('TPCP',109,'ConGlobal Ind.','1 S Idaho St.','Seattle','WA','Seattle',47.564581,-122.3446851),
 ('TPCP',110,'ConGlobal Depot-LA/LB','1711 Alameda Street','Los Angeles','CA','Los Angeles',35.100357,-90.061676),
 ('TPCP',111,'C & C in Savannah, GA ','487 Bourne Avenue','Garden City','GA','Garden City',32.1267111,-81.1711927),
 ('TPCP',112,'TRAC Service Center','400 E. Redondo Beach Boulevard','Los Angeles','CA','Los Angeles',33.8926612,-118.26865),
 ('TPCP',113,'ConGlobal Ind.','1802 Hwy 146 North ','LaPorte','TX','LaPorte',29.679398,-95.028979),
 ('TPCP',114,'ConGlobal Ind.','2534 Spruill Avenue ','North Charleston','SC','North Charleston',32.8451182,-79.9582776),
 ('BNSF',116,'BNSF','1111 Intermoda Pkwy','Haslet','TX','Haslet',32.9901076,-97.349706),
 ('BNSF',117,'BNSF','4814 Lamar Ave','Memphis','TN','Memphis',35.026065,-89.9025966),
 ('BNSF',118,'BNSF','805 S Santa Fe St.','El Paso','TX','El Paso',31.7517279,-106.488659),
 ('BNSF',119,'BNSF','1800 N Dickey','Spokane ','WA','Spokane ',47.6742989,-117.3219094),
 ('BNSF',120,'BNSF','585 West 53rd Pl','Denver','CO','Denver',39.796755,-104.9955406),
 ('ACTDP',121,'TRI-MODAL SERVICE INC.\r\n','2001 WALCUT ROAD\r\n','COLUMBUS\r\n','OH','COLUMBUS',39.9799927,-83.1382976),
 ('ACTDP',122,'TRAC - CHICAGO SERVICE CENTER','1800 W. 43RD STREET','CHICAGO','IL','CHICAGO',41.817299,-87.670642),
 ('ACTDP',123,'TRAC LOS ANGELES SERVICE CENTER','370-400 EAST REDONDO BEACH BLVD','GARDENA','CA','GARDENA',33.8926286,-118.2809947);
/*!40000 ALTER TABLE `jqm_locations_backup` ENABLE KEYS */;


--
-- Definition of table `jqm_natdom`
--

DROP TABLE IF EXISTS `jqm_natdom`;
CREATE TABLE `jqm_natdom` (
  `regionID` varchar(25) NOT NULL,
  `locationID` int(11) NOT NULL,
  `location` varchar(75) DEFAULT NULL,
  `metro_city` varchar(75) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `city` varchar(75) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `HoursOfOp` varchar(75) DEFAULT NULL,
  `LiveLiftHours` varchar(10) DEFAULT NULL,
  `PoolType` varchar(75) DEFAULT NULL,
  `PoolName` varchar(500) DEFAULT NULL,
  `MPID` varchar(75) DEFAULT NULL,
  `MarkerID` varchar(75) DEFAULT NULL,
  `Comments` varchar(75) DEFAULT NULL,
  `CreateUser` varchar(75) DEFAULT NULL,
  `CreateDate` varchar(75) DEFAULT NULL,
  `UpdateUser` varchar(75) DEFAULT NULL,
  `UpdateDate` varchar(75) DEFAULT NULL,
  `is_tpcp` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`locationID`),
  UNIQUE KEY `ID_UNIQUE` (`locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jqm_natdom`
--

/*!40000 ALTER TABLE `jqm_natdom` DISABLE KEYS */;
INSERT INTO `jqm_natdom` (`regionID`,`locationID`,`location`,`metro_city`,`address`,`city`,`state`,`zip`,`Phone`,`lat`,`lon`,`HoursOfOp`,`LiveLiftHours`,`PoolType`,`PoolName`,`MPID`,`MarkerID`,`Comments`,`CreateUser`,`CreateDate`,`UpdateUser`,`UpdateDate`,`is_tpcp`) VALUES 
 ('',77,'CSX','Chicago, IL','2101 W. 59th St. ','Chicago','IL','60636','773-358-4410',41.7859693,-87.6771022,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',78,'BNSF','Haslet, TX','1111 Intermoda Pkwy','Haslet','TX','76052','817-224-7166',32.9794512,-97.3273795,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',79,'BNSF','Fairburn, GA','6700 Mclarin Road','Fairburn','GA','30213','817-867-0225',33.5491465,-84.6004193,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',80,'CSX','Fairburn, GA','6700 McLarin Rd.    ','Fairburn','GA','30213','770-306-6245',33.5491465,-84.6004193,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',81,'CSX','Atlanta, GA','173 Boulevard SE ','Atlanta','GA','30312','404-350-5220',33.7493114,-84.3699475,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',82,'CSX','Baltimore, MD','4801 Keith Ave. ','Baltimore','MD','21224','410-354-5491',39.2656966,-76.5534929,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',83,'CSX','Bedford Park, IL','7000 W. 71st. St. ','Bedford Park','IL','60638','708-563-6115',41.7629174,-87.795606,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',84,'CP/SOO','Chicago, IL','225 South Canal St','Chicago','IL','60606','312-322-4269',41.8787342,-87.6393969,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',85,'BNSF','Birmingham, AL','401 Finley Blvd West','Birmingham','AL','35204','205-320-3682',33.53096,-86.843741,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',86,'CSX','Allston, MA','100 Cambridge St. ','Allston','MA','','508-797-6333',42.3601491,-71.1208648,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',87,'CSX','Buffalo, NY','1252 William St. Rear ','Buffalo','NY','14206','716-891-6736',42.8820351,-78.8099472,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',88,'CSX','Chambersburg, PA','700 Kriner Rd','Chambersburg','PA','17202','717-709-7800',39.9048335,-77.6545538,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',89,'CSX','Charleston, SC','4201 Meeting St. Rd','Charleston','SC','29405','843-745-5340',32.8693742,-79.9951718,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',90,'CSX','Charlotte, NC','5430 Hovis Rd. ','Charlotte','NC','28208','704-392-3102',35.271795,-80.893658,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',91,'NS','Chicago, IL','361 West 47th St','Chicago','IL','60609','773-451-1510',41.8088824,-87.6362481,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',92,'NS','Chicago, IL','6300 South Indiana Ave','Chicago','IL','60637','773-538-9330',41.7801224,-87.6205281,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',93,'NS','Chicago, IL','2040 East 106th St','Chicago','IL','60617','773-978-8128',41.7035178,-87.5712812,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',94,'NS','Chicago, IL','7526 South Western Ave','Chicago','IL','60629','773-933-5693',41.7567139,-87.6831135,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',95,'BNSF','Cicero, IL','5601 West 26th St.','Cicero','IL','60804','708-924-5331',41.843345,-87.764284,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',96,'BNSF','Chicago, IL','3526 West 43rd St.','Chicago','IL','60632','773-579-5222',41.8155462,-87.7126054,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',97,'BNSF','Hodgkins, IL','7600 Santa Fe Dr.','Hodgkins','IL','60525','708-482-5145',41.750807,-87.870251,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',98,'CNRR','Harvey, IL','15840 West Ave ','Harvey','IL','60426','708-225-5900',41.6019675,-87.6450433,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',99,'UP','Chicago, IL','436 West 25th Place','Chicago','IL','60616','800-877-5123',41.8463948,-87.6353665,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',100,'CSX','Cincinnati, OH','2149 Western Ave. ','Cincinnati','OH','45214','513-369-5291',39.1213933,-84.5385943,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',101,'CSX','Cleveland, OH','601 E. 152nd St.','Cleveland','OH','44110','216-268-7076',41.5638277,-81.5755362,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',102,'CSX','Columbus, OH','2351 W. Belt Dr.','Columbus','OH','43228','614-850-1711',39.314528,-84.375855,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',104,'BNSF','Denver, CO','585 West 53rd Pl','Denver','CO','80216','303-480-7925',39.796755,-104.9955406,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',105,'CSX','Detroit, MI','6750 Dix Ave. ','Detroit','MI','48209','313-842-2213',42.3160643,-83.1174443,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',106,'CNRR','Ferndale, MI','600 Fern St','Ferndale','MI','48220','248-691-6953',42.4504355,-83.1169142,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',107,'UP','Dupo, IL','Highway 3 & State Street','Dupo','IL','62239','800-877-5123',38.5124226,-90.2092468,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',108,'CSX','East St. Louis, IL','3900 Rose Lake Rd. ','East St. Louis','IL','62201','618-482-2656',38.6338426,-89.5722931,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',109,'BNSF','El Paso, TX','805 S Santa Fe St.','El Paso','TX','79901','915-534-2392',31.7517279,-106.488659,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',110,'CSX','Evansville, IN','2710 Dixie Flyer Rd','Evansville','IN','47712','812-465-1794',37.9637396,-87.606965,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',111,'FEC','Ft. Lauderdale , FL','3125 South Andrews Avenue','Ft. Lauderdale ','FL','33316','954-524-6031',26.086241,-80.139832,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',112,'BNSF','Fresno , CA','2989 S Golden State Frontage Rd.','Fresno ','CA','93725','559-457-7630',36.691131,-119.7501321,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',113,'FEC','Ft. Pierce, FL','353 Florida Ave','Ft. Pierce','FL','34950','305-889-5592',27.437863,-80.321817,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',114,'UP','Chicago, IL','1425 South Western Ave.','Chicago','IL','60608','800-877-5123',41.8621204,-87.6853786,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',115,'UP','Northlake, IL','301 W. Lake St','Northlake','IL','60164','800-877-5123',41.8998365,-87.9145597,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',116,'NS','Greensboro, NC','1105 Merritt Dr','Greensboro','NC','27407','336-370-2484',36.0561898,-79.8549642,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',117,'BNSF','Houston, TX','214 Brisbane Rd.','Houston','TX','77061','713-847-3128',29.6395376,-95.290796,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',118,'CSX','East Avon, IN','501 S. City Rd. 800 ','East Avon','IN','46123','317-838-3389',39.755834,-86.381078,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',119,'CNRR','Richland, MS','360 Industrial Park Rd','Richland','MS','39218','601-592-1814',32.2545029,-90.1521887,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',120,'KCS','Richland, MS','360 Industrial Rd','Richland','MS','39218','',32.2109459,-90.155194,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',121,'CSX','Jacksonville, FL','5902 Sportsman Club Rd.','Jacksonville','FL','32219','904-695-700',30.386771,-81.768023,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',122,'FEC','Jacksonville, FL','6140 Phillips Hwy','Jacksonville','FL','32216','305-889-5559',30.2577194,-81.6139505,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',123,'NS','Jacksonville, FL','4267 1/2 North Edgwood Dr','Jacksonville','FL','32254','904-366-1410',30.3708659,-81.7335893,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',124,'BNSF','Kansas City, KS','720 S 38th St.','Kansas City','KS','66106','913-551-4207',39.0863516,-94.6726336,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',125,'KCS','Kansas City, MO','3301 E 147th St','Kansas City','MO','64147','816-318-8844',38.86014,-94.5738624,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',126,'NS','Kansas City, MO','4800 North Kimball','Kansas City','MO','64161','816-346-2052',39.1567047,-94.4389493,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',127,'KCS','Loredo, TX','604 Serrano Road','Loredo','TX','78046','956-721-5729',27.3781176,-99.3229213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',128,'CSX','North Bergen, NJ','2200 83rd. St ','North Bergen','NJ','','973-274-2470',40.8107104,-74.0189008,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',129,'BNSF','Los Angeles , CA','3770 East Washington Blvd.','Los Angeles ','CA','90023','323-267-4223',34.0128962,-118.2007352,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',130,'BNSF','Memphis, TN','4814 Lamar Ave','Memphis','TN','38118','901-433-5100',35.026065,-89.9025966,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',131,'CSX','Memphis, TN','3588 Paul Lowry Rd.','Memphis','TN','38109','901-566-4200',35.0673973,-90.1504223,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',132,'NS','Memphis, TN','2648 Spottswood Ave','Memphis','TN','38114','901-320-1970',35.1141821,-89.9738211,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',133,'CNRR','Memphis, TN','3588 Paul Lowry Rd.','Memphis','TN','38109','',35.0673973,-90.1504223,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',134,'FEC','Miami Springs, FL','7300 NW 69th Ave Rd.','Miami Springs','FL','33166','305-889-5683',25.8223198,-80.289495,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',135,'CSX','Mobile, AL','Industrial Canal Rd.','Mobile','AL','36602','251-434-1381',30.7106885,-88.0473287,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',136,'CSX','Nahsville, TN','3086 Sidco Dr. ','Nahsville','TN','37204','615-664-2699',36.0961085,-86.7569218,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',137,'CSX','New Orleans, LA','7801 Almonaster Ave. ','New Orleans','LA','70126','504-224-4333',30.008572,-90.001049,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',138,'CNRR','Harahan, LA','2351 Hickory Ave','Harahan','LA','70123','504-734-6914',29.9725056,-90.2088047,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',139,'CSX','North Bergen, NJ','6201 Tonnelle Ave.','North Bergen','NJ','','201-902-1003',40.7955032,-74.0259903,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',140,'BNSF','Oakland, CA','333 Maritime St.','Oakland','CA','94607','510-231-2662',37.8127944,-122.3109318,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',141,'CSX','Orlando, FL','8850 Atlantic Ave. ','Orlando','FL','32824','407-850-3550',28.439335,-81.3594601,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',142,'CSX','Philadelphia, PA','3400 S. Christopher Columbus Blvd. ','Philadelphia','PA','19148','215-218-3324',39.9550562,-75.1392012,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',143,'BNSF','Glendale, AZ','5281 N. Tom Murrary Rd','Glendale','AZ','85301','602-382-5857',33.5148924,-112.1605032,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',144,'BNSF','Portland, OR','3930 NW Yeon ','Portland','OR','97210','503-241-4484',45.5497792,-122.7224054,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',145,'CSX','Portsmouth, VA','1 Harper Ave, ','Portsmouth','VA','23707','757-393-3925',36.8469663,-76.3288734,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',146,'UP','Rochelle, IL','2701 Intermodal Dr','Rochelle','IL','61068','800-877-5123',41.9031906,-89.0870188,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',147,'BNSF','San Bernardino, CA','1535 W. 4th St.','San Bernardino','CA','92411','909-386-4303',34.1064427,-117.3196955,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',148,'CSX','Savannah, GA','3000 Tremont Ave.','Savannah','GA','31405','912-201-9299',32.067056,-81.1402434,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',149,'NS','Savannah, GA','1 Charlie Gay Drive','Savannah','GA','31408','912-966-3292',32.1007102,-81.1699209,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',150,'BNSF','Seattle, WA','44 S Handord St.','Seattle','WA','98134','206-625-6013',47.5755916,-122.3369709,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',151,'CSX','South Kearney, NJ','700 Old Fish House Rd','South Kearney','NJ','','973-274-2470',40.0583238,-74.4056612,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',152,'BNSF','Seattle , WA','12400 51st. Pl South','Seattle ','WA','98178','206-658-1688',47.4926682,-122.2706442,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',153,'BNSF','Spokane , WA','1800 N Dickey','Spokane ','WA','99211','509-370-1463',47.6742989,-117.3219094,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',154,'CSX','West Springfield, MA','151 Day St. ','West Springfield','MA','','508-797-6333',42.0987148,-72.6151735,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',155,'NS','St. Louis, MO','7021 Hall St','St. Louis','MO','63147','314-679-1790',38.699159,-90.219831,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',156,'BNSF','St. Louis, MO','3500 Wellington Ct., Bldg 3','St. Louis','MO','63139','314-768-7090',38.599526,-90.3152794,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',157,'BNSF','St.Paul, MN','1701 Pierce Butler Rt.','St.Paul','MN','55104','651-298-7021',44.9695497,-93.1742954,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',158,'BNSF','Stockton, CA','6540 Austin Road','Stockton','CA','95215','209-460-6023',37.9064539,-121.179326,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',159,'CSX','Syracuse, NY','CSX Acces Rd. E. ','Syracuse','NY','13057','315-656-5709',43.0653446,-76.0785332,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',160,'CSX','Tampa, FL','1901 North 62nd St. ','Tampa','FL','33619','813-626-5301',27.95903,-82.388722,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',161,'NS','Titusville, FL','6601 Tico Rd','Titusville','FL','32780','321-268-6019',28.524327,-80.792995,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',162,'NS','Toledo, OH','2101 Hill Ave','Toledo','OH','43607','419-381-5574',41.637885,-83.5932413,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',163,'CSX','Worcester, MA','271 Franklin St. ','Worcester','MA','','508-797-6333',42.2618395,-71.7876727,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',164,'UP','Dolton, IL','147th & Indiana','Dolton','IL','60419','800-877-5123',41.6281194,-87.6171836,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('',165,'Wylie Intermodal Terminal','Wylie, TX','2800 SH 78 North','Wylie','TX','75098','972-836-0739',33.022817,-96.474146,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jqm_natdom` ENABLE KEYS */;


--
-- Definition of table `jqm_regions`
--

DROP TABLE IF EXISTS `jqm_regions`;
CREATE TABLE `jqm_regions` (
  `regionID` varchar(5) NOT NULL,
  `region` varchar(50) DEFAULT NULL,
  `region_color` varchar(8) DEFAULT NULL,
  `region_map` bit(1) DEFAULT NULL,
  PRIMARY KEY (`regionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jqm_regions`
--

/*!40000 ALTER TABLE `jqm_regions` DISABLE KEYS */;
INSERT INTO `jqm_regions` (`regionID`,`region`,`region_color`,`region_map`) VALUES 
 ('gccp','TRAC GULF CONSOLIDATED CHASSIS POOL','#FF00FF',0x01),
 ('metro','TRAC METRO POOL','#2993D1',0x01),
 ('tgrp','TRAC GULF REGIONAL POOL','#B3D9F0',0x01),
 ('tmep','TRAC MARINE EASTERN POOL','#090',0x01),
 ('tmmp','TRAC MARINE MIDWEST POOL','#1B3862',0x01),
 ('tmvp','TRAC MARYSVILLE POOL',NULL,0x00),
 ('tmwp','TRAC MARINE WESTERN POOL','#949599',0x01),
 ('tncp','TRAC NORTHERN CALIFORNIA POOL','#FABD6A',0x01),
 ('tpnp','TRAC PACIFIC NORTHWEST POOL','#6F6D72',0x01),
 ('tpsp','TRAC PACIFIC SOUTHWEST POOL','#F4D988',0x01);
/*!40000 ALTER TABLE `jqm_regions` ENABLE KEYS */;


--
-- Definition of table `jqm_states`
--

DROP TABLE IF EXISTS `jqm_states`;
CREATE TABLE `jqm_states` (
  `countryID` varchar(2) NOT NULL DEFAULT '',
  `stateID` varchar(2) NOT NULL DEFAULT '',
  `state` varchar(50) DEFAULT NULL,
  `coopID` int(11) DEFAULT NULL,
  PRIMARY KEY (`countryID`,`stateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jqm_states`
--

/*!40000 ALTER TABLE `jqm_states` DISABLE KEYS */;
INSERT INTO `jqm_states` (`countryID`,`stateID`,`state`,`coopID`) VALUES 
 ('us','ak','Alaska',NULL),
 ('us','al','Alabama',6),
 ('us','ar','Arkansas',NULL),
 ('us','az','Arizona',NULL),
 ('us','ca','California',1),
 ('us','co','Colorado',2),
 ('us','ct','Connecticut',NULL),
 ('us','dc','D. Columbia',NULL),
 ('us','de','Delaware',NULL),
 ('us','fl','Florida',6),
 ('us','ga','Georgia',6),
 ('us','hi','Hawaii',NULL),
 ('us','ia','Iowa',NULL),
 ('us','id','Idaho',NULL),
 ('us','il','Illinois',4),
 ('us','in','Indiana',4),
 ('us','ks','Kansas',3),
 ('us','ky','Kentucky',5),
 ('us','la','Louisiana',7),
 ('us','ma','Massachusetts',NULL),
 ('us','md','Maryland',NULL),
 ('us','me','Maine',NULL),
 ('us','mi','Michigan',4),
 ('us','mn','Minnesota',NULL),
 ('us','mo','Missouri',3),
 ('us','ms','Mississippi',7),
 ('us','mt','Montana',NULL),
 ('us','nc','North Carolina',6),
 ('us','nd','North Dakota',NULL),
 ('us','ne','Nebraska',3),
 ('us','nh','New Hampshire',NULL),
 ('us','nj','New Jersey',NULL),
 ('us','nm','New Mexico',NULL),
 ('us','nv','Nevada',NULL),
 ('us','ny','New York',NULL),
 ('us','oh','Ohio',4),
 ('us','ok','Oklahoma',NULL),
 ('us','or','Oregon',NULL),
 ('us','pa','Pennsylvania',NULL),
 ('us','pr','Puerto Rico',NULL),
 ('us','ri','Rhode Island',NULL),
 ('us','sc','South Carolina',6),
 ('us','sd','South Dakota',NULL),
 ('us','tn','Tennessee',5),
 ('us','tx','Texas',7),
 ('us','ut','Utah',2),
 ('us','va','Virginia',NULL),
 ('us','vt','Vermont',NULL),
 ('us','wa','Washington',NULL),
 ('us','wi','Wisconsin',4),
 ('us','wv','West Virginia',NULL),
 ('us','wy','Wyoming',NULL);
/*!40000 ALTER TABLE `jqm_states` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
