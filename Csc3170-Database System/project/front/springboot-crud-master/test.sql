/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80036
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 80036
File Encoding         : 65001

Date: 2024-04-21 13:47:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `ProductID` int NOT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `PublicationYear` int DEFAULT NULL,
  `Genre` varchar(255) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '1098119444', 'Rust Atomics and Locks', '2023', 'textbook', 'Mara Bos');
INSERT INTO `book` VALUES ('2', '1119865905', 'The Official ACT Prep Guide 2022-2023, (Book + Online Course)', '2022', 'textbook', 'ACT');
INSERT INTO `book` VALUES ('4', '1484274369', 'Learn to Program with Assembly', '2021', 'textbook', 'Jonathan Bartlett');
INSERT INTO `book` VALUES ('8', '1803362812', 'The Unofficial Zelda Cookbook', '2022', 'textbook', 'Thibaud Villanova');
INSERT INTO `book` VALUES ('9', '394576500', 'Mapplethorpe: A Biography', '1995', 'fiction', 'Patricia Morrisroe');
INSERT INTO `book` VALUES ('10', '1789347394', 'Mastering Windows Group Policy', '2018', 'textbook', 'Jordan Krause');
INSERT INTO `book` VALUES ('11', '1549776673', 'Python', '2017', 'textbook', 'Timothy C. Needham');
INSERT INTO `book` VALUES ('12', '3319130714', 'Data Structures and Algorithms with Python (Undergraduate Topics in Computer Science)', '2015', 'textbook', 'Kent D. Lee');
INSERT INTO `book` VALUES ('13', '452011817', 'Africans and Their History', '1998', 'fiction', 'Joseph E. Harris');
INSERT INTO `book` VALUES ('14', '451410602', 'Death\'s Door', '2002', 'fiction', 'Michael Slade');
INSERT INTO `book` VALUES ('15', '1119787335', 'The Official ACT Mathematics Guide', '2021', 'textbook', 'ACT');
INSERT INTO `book` VALUES ('16', '1593278551', 'Linux Basics for Hackers', '2018', 'textbook', 'OccupyTheWeb');
INSERT INTO `book` VALUES ('18', '109811020X', 'Kubernetes: Up and Running', '2022', 'textbook', 'Brendan Burns');
INSERT INTO `book` VALUES ('19', '156731399X', 'The Peaceful Warrior Collection', '2000', 'fiction', 'Dan Millman');
INSERT INTO `book` VALUES ('20', '044990962X', 'Hero\'s Daughter', '1994', 'fiction', 'Maureen Murdock');
INSERT INTO `book` VALUES ('21', '553379690', 'One Hundred and One Ways', '2000', 'fiction', 'MAKO YOSHIKAWA');
INSERT INTO `book` VALUES ('22', '1804619620', 'Terraform for Google Cloud Essential Guide', '2023', 'textbook', 'Bernd Nordhausen');
INSERT INTO `book` VALUES ('23', '1546488332', 'Python (2nd Edition)', '2017', 'textbook', 'Jamie Chan');
INSERT INTO `book` VALUES ('24', '080246520X', 'Pilgrims Progress: In Today\'s English', '1964', 'fiction', 'John Bunyan');
INSERT INTO `book` VALUES ('25', '030730261X', 'Ready, Set, Go!: A Counting Book (Little Golden Book)', '1995', 'fiction', 'Emma Jones');
INSERT INTO `book` VALUES ('26', '1803238011', 'Event-Driven Architecture in Golang', '2022', 'textbook', 'Michael Stack');
INSERT INTO `book` VALUES ('28', '1119787602', 'Python All-in-One For Dummies (For Dummies (Computer/Tech))', '2021', 'textbook', 'John C. Shovic');
INSERT INTO `book` VALUES ('29', '1838987339', 'Unity 2020 Mobile Game Development', '2020', 'textbook', 'John P. Doran');
INSERT INTO `book` VALUES ('30', '157345320X', 'Praise to the Man', '1997', 'fiction', 'Larry Barkdull');
INSERT INTO `book` VALUES ('31', '330311115', 'Greenmantle: A New Tale of Magic &amp; Wonder', '1992', 'fiction', 'Charles De Lint');
INSERT INTO `book` VALUES ('32', '1119658810', 'AWS Certified Security Study Guide', '2021', 'textbook', 'Marcello Zillo Neto');
INSERT INTO `book` VALUES ('33', '1098117816', 'Software Architecture', '2021', 'textbook', 'Neal Ford');
INSERT INTO `book` VALUES ('34', '515135283', 'Without Fail', '2003', 'fiction', 'Lee Child');
INSERT INTO `book` VALUES ('35', '1449357016', 'Python Pocket Reference', '2014', 'textbook', 'Mark Lutz');
INSERT INTO `book` VALUES ('36', '154101636X', 'Blue Team Field Manual (BTFM) (RTFM)', '2017', 'textbook', 'Alan J White');
INSERT INTO `book` VALUES ('37', '1576730700', 'Wise Man\'s House (Palisades Pure Romance)', '1997', 'fiction', 'Melody Carlson');
INSERT INTO `book` VALUES ('38', '847818721', 'Great Pasta Sauces', '1995', 'fiction', 'Sally Griffiths');
INSERT INTO `book` VALUES ('40', '525230211', 'Water dog: revolutionary rapid training method,', '1964', 'fiction', 'Richard A Wolters');
INSERT INTO `book` VALUES ('41', '168050696X', 'Powerful Command-Line Applications in Go', '2022', 'textbook', 'Ricardo Gerardi');
INSERT INTO `book` VALUES ('42', '340728620', 'The Rainbow Journey', '1999', 'fiction', 'Brenda Davies');
INSERT INTO `book` VALUES ('43', '345330021', 'King of the Murgos (Malloreon, Book 2)', '1988', 'fiction', 'David Eddings');
INSERT INTO `book` VALUES ('44', '999081411', 'The Complete Software Developer\'s Career Guide', '2017', 'textbook', 'John Sonmez');
INSERT INTO `book` VALUES ('45', '75574179', 'A History of the Modern World', '1991', 'fiction', 'R. R. Palmer');
INSERT INTO `book` VALUES ('46', '440486815', 'Thimble Summer (Yearling Newbery)', '1987', 'fiction', 'Elizabeth Enright');
INSERT INTO `book` VALUES ('47', '1578512611', 'Unleashing the Killer App: Digital Strategies for Market Dominance', '2000', 'fiction', 'Larry Downes');
INSERT INTO `book` VALUES ('48', '192800442', 'The Dictionary of Cricket', '1996', 'fiction', 'Michael Rundell');
INSERT INTO `book` VALUES ('49', '1737384426', 'Ultimate Go Notebook', '2021', 'textbook', 'William Kennedy');
INSERT INTO `book` VALUES ('51', '373263716', 'Singing The Sadness (Worldwide Library Mysteries)', '2001', 'fiction', 'Reginald Hill');
INSERT INTO `book` VALUES ('52', '180323654X', 'Mastering Windows Security and Hardening', '2022', 'textbook', 'Mark Dunkerley');
INSERT INTO `book` VALUES ('53', '1316519333', 'The Principles of Deep Learning Theory', '2022', 'textbook', 'Daniel A. Roberts');
INSERT INTO `book` VALUES ('54', '149322302X', 'Python 3', '2022', 'textbook', 'Johannes Ernesti');
INSERT INTO `book` VALUES ('55', '1840789336', 'Windows 11 for Seniors in easy steps', '2022', 'textbook', 'Michael Price');
INSERT INTO `book` VALUES ('56', '671014730', 'SHE\'S COME UNDONE (Oprah\'s Book Club (Hardcover))', '1997', 'fiction', 'Wally Lamb');
INSERT INTO `book` VALUES ('57', '937721735', 'All-American Low-Fat Meals in Minutes: Recipes and Menus for Special Occasions or Every Day', '1991', 'fiction', 'M.J. Smith');
INSERT INTO `book` VALUES ('58', '752215329', 'In Search of British Heroes: A Companion to the Channel 4 Series Fact or Fiction', '2003', 'fiction', 'Tony Robinson');
INSERT INTO `book` VALUES ('59', '080755393X', 'The Mystery in the Snow (Boxcar Children Mysteries, 32)', '1992', 'fiction', 'Gertrude Chandler Warner');
INSERT INTO `book` VALUES ('60', '451198859', 'Never Sorry: A Leigh Koslow Mystery (Leigh Koslow Mystery Series)', '1999', 'fiction', 'Edie Claire');
INSERT INTO `book` VALUES ('61', '1098108302', 'Fundamentals of Data Engineering', '2022', 'textbook', 'Joe Reis');
INSERT INTO `book` VALUES ('62', '1803239867', 'Elevating Game Experiences with Unreal Engine 5', '2022', 'textbook', 'Goncalo Marques');
INSERT INTO `book` VALUES ('63', '1837630518', 'Mastering Linux Security and Hardening', '2023', 'textbook', 'Donald A. Tevault');
INSERT INTO `book` VALUES ('64', '804113475', 'Ladder of Years', '1997', 'fiction', 'Anne Tyler');
INSERT INTO `book` VALUES ('65', '1838430210', 'Understanding Distributed Systems, Second Edition', '2022', 'textbook', 'Roberto Vitillo');
INSERT INTO `book` VALUES ('66', '692980652', 'Retro Game Dev: C64 Edition (RetroGameDev)', '2017', 'textbook', 'Derek Morris');
INSERT INTO `book` VALUES ('67', '1544511817', 'YouTube Secrets:', '2018', 'textbook', 'Sean Cannell');
INSERT INTO `book` VALUES ('68', '446606243', 'The Tenth Justice', '1998', 'fiction', 'Brad Meltzer');
INSERT INTO `book` VALUES ('69', '1617293709', 'Grokking Deep Learning', '2019', 'textbook', 'Andrew Trask');
INSERT INTO `book` VALUES ('70', '133769402', 'Assembly Language for x86 Processors', '2014', 'textbook', 'Kip Irvine');
INSERT INTO `book` VALUES ('71', '1803240636', 'Microsoft Certified Azure Data Fundamentals (Exam DP-900) Certification Guide', '2022', 'textbook', 'Marcelo Leite');
INSERT INTO `book` VALUES ('73', '1551664917', 'Charm School', '1999', 'fiction', 'Susan Wiggs');
INSERT INTO `book` VALUES ('74', '1930353316', 'Secret Under the Floorboard (Sammy and Brian Mystery)', '2001', 'fiction', 'Ken Munro');
INSERT INTO `book` VALUES ('75', '1502958082', 'xchg rax,rax', '2014', 'textbook', 'xorpd');
INSERT INTO `book` VALUES ('76', '1617292230', 'Grokking Algorithms', '2016', 'textbook', 'Aditya Bhargava');
INSERT INTO `book` VALUES ('77', '912697083', 'The Crooked Pitch: An Account of the Curveball in American Baseball History', '1984', 'fiction', 'Martin Quigley');
INSERT INTO `book` VALUES ('79', '1803232579', 'Functional Python Programming', '2022', 'textbook', 'Steven F. Lott');
INSERT INTO `book` VALUES ('82', '1492052590', 'Programming Rust', '2021', 'textbook', 'Jim Blandy');
INSERT INTO `book` VALUES ('83', '8429729941', 'Reflexions de sala i alcova', '1995', 'fiction', 'Ramon Solsona');
INSERT INTO `book` VALUES ('84', '984782869', 'Cracking the Coding Interview', '2015', 'textbook', 'Gayle Laakmann McDowell');
INSERT INTO `book` VALUES ('85', '425163970', 'A Touch of the Grape (Hemlock Falls Mysteries)', '1998', 'fiction', 'Claudia Bishop');
INSERT INTO `book` VALUES ('86', '1803241438', 'Learn Java 17 Programming', '2022', 'textbook', 'Nick Samoylov');
INSERT INTO `book` VALUES ('89', '380725150', 'Black Hornet (New Orleans Mystery)', '1996', 'fiction', 'James Sallis');
INSERT INTO `book` VALUES ('90', '1572229160', 'Sql Guide (Quick Study', '2005', 'textbook', 'Inc. BarCharts');
INSERT INTO `book` VALUES ('91', '3499170523', 'Anatomie der menschlichen Destruktivit', '1996', 'fiction', 'Erich Fromm');
INSERT INTO `book` VALUES ('92', '648098737', 'Raspberry Pi Operating System Assembly Language', '2021', 'textbook', 'Bruce Smith');
INSERT INTO `book` VALUES ('93', '195032721', 'Science Fiction: A Historical Anthology (Galaxy Books)', '1983', 'fiction', 'Eric S. Rabkin');
INSERT INTO `book` VALUES ('94', '1647824192', 'Power and Prediction', '2022', 'textbook', 'Ajay Agrawal');
INSERT INTO `book` VALUES ('95', '1492043451', 'Fundamentals of Software Architecture', '2020', 'textbook', 'Mark Richards');
INSERT INTO `book` VALUES ('97', '807041653', 'Beyond God the Father Toward a Philosoph', '1974', 'fiction', 'Mary Daly');
INSERT INTO `book` VALUES ('99', '1491952024', 'JavaScript', '2020', 'textbook', 'David Flanagan');
INSERT INTO `book` VALUES ('100', '1119002257', 'Storytelling with Data', '2015', 'textbook', 'Cole Nussbaumer Knaflic');
INSERT INTO `book` VALUES ('101', '821762966', 'Enduring Love (Zebra Bouquet Romances, No 6)', '1999', 'fiction', 'Ann Josephson');
INSERT INTO `book` VALUES ('102', '1736526723', 'LFM', '2021', 'textbook', 'Tim Bryant');
INSERT INTO `book` VALUES ('103', '1801810214', 'An Ethical Guide to Cyber Anonymity', '2022', 'textbook', 'Kushantha Gunawardana');
INSERT INTO `book` VALUES ('104', '1803242396', 'Microsoft Cybersecurity Architect Exam Ref SC-100', '2023', 'textbook', 'Dwayne Natwick');
INSERT INTO `book` VALUES ('105', '1718501544', 'Bug Bounty Bootcamp', '2021', 'textbook', 'Vickie Li');
INSERT INTO `book` VALUES ('106', '679745963', 'The Man on the Balcony: The Story of a Crime (Vintage Crime/Black Lizard)', '1993', 'fiction', 'Maj Sjowall');
INSERT INTO `book` VALUES ('107', '345386663', 'Garfield Pulls His Weight (No. 26)', '1994', 'fiction', 'Jim Davis');
INSERT INTO `book` VALUES ('108', '593450957', 'Princeton Review AP World History: Modern Prep, 2023', '2022', 'textbook', 'The Princeton Review');
INSERT INTO `book` VALUES ('110', '446521663', 'Host Family', '2000', 'fiction', 'Mameve Medwed');
INSERT INTO `book` VALUES ('111', '394825683', 'Emperors New Clothes', '1995', 'fiction', 'Disney Book Club');
INSERT INTO `book` VALUES ('112', '1098118731', 'The Staff Engineer\'s Path', '2022', 'textbook', 'Tanya Reilly');
INSERT INTO `book` VALUES ('114', '804106665', 'Paris 2005', '1991', 'fiction', 'Carlo Zezza');
INSERT INTO `book` VALUES ('115', '037382503X', 'Tyler #3 Wisconsin Wedding (Tyler, No 3)', '1992', 'fiction', 'Carla Neggers');
INSERT INTO `book` VALUES ('117', '1718502702', 'Python Crash Course, 3rd Edition', '2023', 'textbook', 'Eric Matthes');
INSERT INTO `book` VALUES ('118', '1801075271', 'Hands-On Microsoft Teams', '2021', 'textbook', 'Joao Ferreira');
INSERT INTO `book` VALUES ('119', '446612618', 'A Kiss Remembered', '2003', 'fiction', 'Sandra Brown');
INSERT INTO `book` VALUES ('120', '1491927577', 'Linux Pocket Guide', '2016', 'textbook', ' Daniel Barrett ');
INSERT INTO `book` VALUES ('121', '8481301485', 'El Amante De L. Chaterley', '2001', 'fiction', 'D. H. Lawrence');
INSERT INTO `book` VALUES ('122', '1804613878', 'Clean Code in PHP', '2022', 'textbook', 'Carsten Windler');
INSERT INTO `book` VALUES ('123', '1098121953', 'C# 10 in a Nutshell', '2022', 'textbook', 'Joseph Albahari');
INSERT INTO `book` VALUES ('124', '1801072329', 'Learning Tableau 2022', '2022', 'textbook', 'Joshua N. Milligan');
INSERT INTO `book` VALUES ('125', '970575203', 'Tickles Tabitha\'s Cancer-tankerous Mommy', '2001', 'fiction', 'Amelia Frahm');
INSERT INTO `book` VALUES ('126', '173543115X', 'Hypothesis Testing', '2020', 'textbook', 'Jim Frost');
INSERT INTO `book` VALUES ('128', '149207294X', 'Practical Statistics for Data Scientists:', '2020', 'textbook', 'Peter Bruce');
INSERT INTO `book` VALUES ('129', '590939599', 'Go Eat Worms! (Goosebumps Presents TV Book #9)', '1997', 'fiction', 'Tracey West');
INSERT INTO `book` VALUES ('130', '1801071101', 'Expert Python Programming', '2021', 'textbook', 'Michal Jaworski');
INSERT INTO `book` VALUES ('133', '814806406', 'Bosch', '2000', 'fiction', 'Joseph Emile Muller');
INSERT INTO `book` VALUES ('134', '373264771', 'Crazy Love (Wwl Mystery, 477)', '2003', 'fiction', 'Steve Brewer');
INSERT INTO `book` VALUES ('135', '1119846471', 'Windows 11 For Dummies', '2021', 'textbook', 'Andy Rathbone');
INSERT INTO `book` VALUES ('136', '1492082791', 'Software Engineering at Google', '2020', 'textbook', 'Titus Winters');
INSERT INTO `book` VALUES ('137', '1800564244', 'CompTIA Security+', '2020', 'textbook', 'Ian Neil');
INSERT INTO `book` VALUES ('138', '553246526', 'Incredible Journey', '1978', 'fiction', 'Sheila Burnford');
INSERT INTO `book` VALUES ('139', '1800562659', 'Microsoft Azure Security Technologies Certification and Beyond', '2021', 'textbook', 'David Okeyode');
INSERT INTO `book` VALUES ('140', '671677128', 'LIGHT A SINGLE CANDLE', '1989', 'fiction', 'David Butler');
INSERT INTO `book` VALUES ('141', '517480859', 'Walt Disney World and Epcot Center', '1986', 'fiction', 'V. Childs');
INSERT INTO `book` VALUES ('142', '1617296864', 'Deep Learning with Python, Second Edition', '2021', 'textbook', 'Francois Chollet');
INSERT INTO `book` VALUES ('143', '1801812446', 'Unreal Engine 5 Character Creation, Animation, and Cinematics', '2022', 'textbook', 'Henk Venter');
INSERT INTO `book` VALUES ('144', '201633612', 'Design Patterns', '1994', 'textbook', 'Erich Gamma');
INSERT INTO `book` VALUES ('145', '645127965', 'Learning Microsoft Intune', '2023', 'textbook', 'Scott Duffey');
INSERT INTO `book` VALUES ('146', '2253064459', 'La Bicyclette bleue, tome 4 : Noir tango', '1993', 'fiction', 'Rgine Deforges');
INSERT INTO `book` VALUES ('148', '515117870', 'The Gambler', '1995', 'fiction', 'Lois Greiman');
INSERT INTO `book` VALUES ('149', '1801073872', 'Sculpting the Blender Way', '2022', 'textbook', 'Xury Greer');
INSERT INTO `book` VALUES ('150', '60972459', 'Tracks RI', '2004', 'fiction', 'Louise Erdrich');
INSERT INTO `book` VALUES ('151', '28612434', 'The Unofficial Guide to Atlanta (3rd ed. Serial.)', '1996', 'fiction', 'Fred Brown');
INSERT INTO `book` VALUES ('152', '910313059', 'Caring Is What Counts, No. 5 (Tale from the Care Bears)', '1983', 'fiction', 'Ward Johnson');
INSERT INTO `book` VALUES ('153', '1492045527', 'Deep Learning for Coders with Fastai and PyTorch:', '2020', 'textbook', 'Jeremy Howard');
INSERT INTO `book` VALUES ('155', '1727521900', 'Computer Programming: The Bible', '2018', 'textbook', 'CyberPunk Architects');
INSERT INTO `book` VALUES ('156', '225313998X', 'L\'homme nu', '1996', 'fiction', 'Simmons d.');
INSERT INTO `book` VALUES ('157', '843949562', 'Judas Eyes', '2002', 'fiction', 'Barry Hoffman');
INSERT INTO `book` VALUES ('158', '1264268963', 'Mike Meyers\' CompTIA Network+ Certification Passport, Seventh Edition (Exam N10-008) (Mike Meyers\' Certification Passport)', '44719', 'textbook', 'Jonathan Weissman');
INSERT INTO `book` VALUES ('159', '893037893', 'Programming the 65816', '2015', 'textbook', 'David Eyes');
INSERT INTO `book` VALUES ('160', '1838556370', 'Practical Threat Intelligence and Data-Driven Threat Hunting', '2021', 'textbook', 'Valentina Costa-Gazcn');
INSERT INTO `book` VALUES ('162', '1672429730', 'Kali Linux Hacking', '2019', 'textbook', 'Ethem Mining');
INSERT INTO `book` VALUES ('163', '1800569009', 'AWS Certified Machine Learning Specialty', '2021', 'textbook', 'Somanath Nanda');
INSERT INTO `book` VALUES ('164', '525459243', 'Winnie the Pooh Storybook Treasury', '0', 'fiction', 'A A Milne');
INSERT INTO `book` VALUES ('165', '578973839', 'Ace the Data Science Interview', '2021', 'textbook', 'Nick Singh');
INSERT INTO `book` VALUES ('166', '1801813094', 'Certified Ethical Hacker (CEH) v12 312-50 Exam Guide', '2022', 'textbook', 'Dale Meredith');
INSERT INTO `book` VALUES ('168', '1565048628', 'Court of All Kings: A Changeling : The Dreaming Novel (Immortal Eyes, Book 3)', '1996', 'fiction', 'Jackie Cassada');
INSERT INTO `book` VALUES ('170', '63046067', 'Build', '2022', 'textbook', 'Tony Fadell');
INSERT INTO `book` VALUES ('171', '1118008189', 'HTML and CSS', '2011', 'textbook', 'Jon Duckett');
INSERT INTO `book` VALUES ('172', '1956630198', 'Securing Microsoft 365', '2022', 'textbook', 'Joe Stocker');
INSERT INTO `book` VALUES ('173', '1423244230', 'Python Standard Library', '2020', 'textbook', 'Berajah Jayne');
INSERT INTO `book` VALUES ('175', '981166045X', 'Geometry of Deep Learning', '2022', 'textbook', 'Jong Chul Ye');
INSERT INTO `book` VALUES ('177', '1617299596', '100 Go Mistakes and How to Avoid Them', '2022', 'textbook', 'Teiva Harsanyi');
INSERT INTO `book` VALUES ('178', '1945051752', 'SQL QuickStart Guide', '2019', 'textbook', 'Walter Shields');
INSERT INTO `book` VALUES ('179', '821734970', 'Defiant Ecstasy', '1991', 'fiction', 'Janelle Taylor');
INSERT INTO `book` VALUES ('180', '1636100007', 'HTML and CSS QuickStart Guide', '2021', 'textbook', 'David DuRocher');
INSERT INTO `book` VALUES ('181', '1788297237', 'Mastering Microsoft Power BI', '2018', 'textbook', 'Brett Powell');
INSERT INTO `book` VALUES ('182', '1119830729', 'Excel All-in-One For Dummies (For Dummies (Computer/Tech))', '2021', 'textbook', 'Paul McFedries');
INSERT INTO `book` VALUES ('183', '1484250753', 'Beginning x64 Assembly Programming', '2019', 'textbook', 'Jo Van Hoey');
INSERT INTO `book` VALUES ('184', '1484240626', 'Modern X86 Assembly Language Programming', '2018', 'textbook', 'Daniel Kusswurm');
INSERT INTO `book` VALUES ('185', '1800560419', 'Data Engineering with AWS', '2021', 'textbook', 'Gareth Eagar');
INSERT INTO `book` VALUES ('186', '933478208', 'Chronic Fatigue Syndrome and the Yeast Connection: A Get-Well Guide for People With This Often Misunderstood Illness--And Those Who Care for Them', '1992', 'fiction', 'William G. Crook');
INSERT INTO `book` VALUES ('187', '451626222', 'Ovid the Metamorphoses', '1960', 'fiction', 'Horace Gregory');
INSERT INTO `book` VALUES ('188', '1098135121', 'Learning eBPF', '2023', 'textbook', 'Liz Rice');
INSERT INTO `book` VALUES ('189', '1492077216', 'Learning Go', '2021', 'textbook', 'Jon Bodner');
INSERT INTO `book` VALUES ('190', '1119705150', 'MCA Microsoft Certified Associate Azure Administrator Study Guide', '2022', 'textbook', 'Rithin Skaria');
INSERT INTO `book` VALUES ('191', '723002746', 'Times Concise Atlas of the World', '1985', 'fiction', 'Times Books');
INSERT INTO `book` VALUES ('192', '1492050202', 'Linux Observability with BPF', '2019', 'textbook', 'David Calavera');
INSERT INTO `book` VALUES ('193', '1951204042', 'A Programmer\'s Guide to Computer Science Vol. 2', '2020', 'textbook', 'William M. Springer II');
INSERT INTO `book` VALUES ('194', '1718501129', 'Black Hat Python, 2nd Edition', '2021', 'textbook', 'Justin Seitz');
INSERT INTO `book` VALUES ('196', '380545020', 'Bet You Can\'t!', '1983', 'fiction', 'Vicki Cobb');
INSERT INTO `book` VALUES ('197', '394744292', 'The Firefighter\'s Cookbook', '1986', 'fiction', 'John Sineno');
INSERT INTO `book` VALUES ('198', '1804614017', 'Transitioning to Java', '2023', 'textbook', 'Ken Fogel');
INSERT INTO `book` VALUES ('199', '821732056', 'Wild Texas Heart', '1990', 'fiction', 'Deana James');
INSERT INTO `book` VALUES ('200', '1593080603', 'The Prince and Other Writings (Barnes &amp; Noble Classics)', '2003', 'fiction', 'Niccolo Machiavelli');

-- ----------------------------
-- Table structure for `deliveryman`
-- ----------------------------
DROP TABLE IF EXISTS `deliveryman`;
CREATE TABLE `deliveryman` (
  `StaffID` int NOT NULL,
  `PreferredArea` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `deliveryman_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of deliveryman
-- ----------------------------
INSERT INTO `deliveryman` VALUES ('1', 'Upper Campus');
INSERT INTO `deliveryman` VALUES ('2', 'Lower Campus');
INSERT INTO `deliveryman` VALUES ('3', 'Upper Campus');
INSERT INTO `deliveryman` VALUES ('4', 'Lower Campus');
INSERT INTO `deliveryman` VALUES ('5', 'Lower Campus');
INSERT INTO `deliveryman` VALUES ('6', 'Upper Campus');
INSERT INTO `deliveryman` VALUES ('7', 'Lower Campus');
INSERT INTO `deliveryman` VALUES ('8', 'Lower Campus');
INSERT INTO `deliveryman` VALUES ('9', 'Upper Campus');
INSERT INTO `deliveryman` VALUES ('10', 'Lower Campus');
INSERT INTO `deliveryman` VALUES ('11', 'Lower Campus');
INSERT INTO `deliveryman` VALUES ('12', 'Upper Campus');

-- ----------------------------
-- Table structure for `expressstation`
-- ----------------------------
DROP TABLE IF EXISTS `expressstation`;
CREATE TABLE `expressstation` (
  `StationID` int NOT NULL,
  `StationLocation` varchar(255) DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  `OpeningHours` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`StationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of expressstation
-- ----------------------------
INSERT INTO `expressstation` VALUES ('1', 'Harmonia', '100', '8:00-17:00');
INSERT INTO `expressstation` VALUES ('2', 'Student Center', '150', '9:00-18:00');
INSERT INTO `expressstation` VALUES ('3', 'Teaching Bldg C', '120', '10:00-18:00');

-- ----------------------------
-- Table structure for `note`
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `ProductID` int NOT NULL,
  `TargetCourse` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  CONSTRAINT `note_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('3', 'MAT1002');
INSERT INTO `note` VALUES ('5', 'CSC3002');
INSERT INTO `note` VALUES ('6', 'CSC1002');
INSERT INTO `note` VALUES ('7', 'MAT1001');
INSERT INTO `note` VALUES ('17', 'CSC3050');
INSERT INTO `note` VALUES ('27', 'MAT1001');
INSERT INTO `note` VALUES ('39', 'DDA4210');
INSERT INTO `note` VALUES ('50', 'MAT2040');
INSERT INTO `note` VALUES ('72', 'CSC3150');
INSERT INTO `note` VALUES ('78', 'MAT3007');
INSERT INTO `note` VALUES ('80', 'DDA4210');
INSERT INTO `note` VALUES ('81', 'BIO1008');
INSERT INTO `note` VALUES ('87', 'CSC3050');
INSERT INTO `note` VALUES ('88', 'CSC3150');
INSERT INTO `note` VALUES ('96', 'CSC3050');
INSERT INTO `note` VALUES ('98', 'BIO1008');
INSERT INTO `note` VALUES ('109', 'CSC4001');
INSERT INTO `note` VALUES ('113', 'CSC3050');
INSERT INTO `note` VALUES ('116', 'BIO1008');
INSERT INTO `note` VALUES ('127', 'CSC3002');
INSERT INTO `note` VALUES ('131', 'DDA4210');
INSERT INTO `note` VALUES ('132', 'CSC3050');
INSERT INTO `note` VALUES ('147', 'CSC3150');
INSERT INTO `note` VALUES ('154', 'BIO1008');
INSERT INTO `note` VALUES ('161', 'CSC2003');
INSERT INTO `note` VALUES ('167', 'CSC3150');
INSERT INTO `note` VALUES ('169', 'MAT1002');
INSERT INTO `note` VALUES ('174', 'CSC2003');
INSERT INTO `note` VALUES ('176', 'CSC4001');
INSERT INTO `note` VALUES ('195', 'CSC3170');

-- ----------------------------
-- Table structure for `orderproduct`
-- ----------------------------
DROP TABLE IF EXISTS `orderproduct`;
CREATE TABLE `orderproduct` (
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `porder` (`OrderID`),
  CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of orderproduct
-- ----------------------------
INSERT INTO `orderproduct` VALUES ('1', '1');
INSERT INTO `orderproduct` VALUES ('1', '2');
INSERT INTO `orderproduct` VALUES ('44', '2');
INSERT INTO `orderproduct` VALUES ('1', '3');
INSERT INTO `orderproduct` VALUES ('43', '3');
INSERT INTO `orderproduct` VALUES ('2', '4');
INSERT INTO `orderproduct` VALUES ('17', '4');
INSERT INTO `orderproduct` VALUES ('2', '5');
INSERT INTO `orderproduct` VALUES ('26', '5');
INSERT INTO `orderproduct` VALUES ('2', '6');
INSERT INTO `orderproduct` VALUES ('41', '6');
INSERT INTO `orderproduct` VALUES ('3', '7');
INSERT INTO `orderproduct` VALUES ('35', '7');
INSERT INTO `orderproduct` VALUES ('3', '8');
INSERT INTO `orderproduct` VALUES ('41', '8');
INSERT INTO `orderproduct` VALUES ('3', '9');
INSERT INTO `orderproduct` VALUES ('46', '9');
INSERT INTO `orderproduct` VALUES ('4', '10');
INSERT INTO `orderproduct` VALUES ('42', '10');
INSERT INTO `orderproduct` VALUES ('4', '11');
INSERT INTO `orderproduct` VALUES ('36', '11');
INSERT INTO `orderproduct` VALUES ('4', '12');
INSERT INTO `orderproduct` VALUES ('40', '12');
INSERT INTO `orderproduct` VALUES ('5', '13');
INSERT INTO `orderproduct` VALUES ('31', '13');
INSERT INTO `orderproduct` VALUES ('5', '14');
INSERT INTO `orderproduct` VALUES ('42', '14');
INSERT INTO `orderproduct` VALUES ('5', '15');
INSERT INTO `orderproduct` VALUES ('63', '15');
INSERT INTO `orderproduct` VALUES ('6', '16');
INSERT INTO `orderproduct` VALUES ('26', '16');
INSERT INTO `orderproduct` VALUES ('6', '17');
INSERT INTO `orderproduct` VALUES ('6', '18');
INSERT INTO `orderproduct` VALUES ('36', '18');
INSERT INTO `orderproduct` VALUES ('6', '19');
INSERT INTO `orderproduct` VALUES ('41', '19');
INSERT INTO `orderproduct` VALUES ('7', '20');
INSERT INTO `orderproduct` VALUES ('41', '20');
INSERT INTO `orderproduct` VALUES ('7', '21');
INSERT INTO `orderproduct` VALUES ('22', '21');
INSERT INTO `orderproduct` VALUES ('7', '22');
INSERT INTO `orderproduct` VALUES ('35', '22');
INSERT INTO `orderproduct` VALUES ('7', '23');
INSERT INTO `orderproduct` VALUES ('44', '23');
INSERT INTO `orderproduct` VALUES ('7', '24');
INSERT INTO `orderproduct` VALUES ('7', '25');
INSERT INTO `orderproduct` VALUES ('16', '25');
INSERT INTO `orderproduct` VALUES ('8', '26');
INSERT INTO `orderproduct` VALUES ('32', '26');
INSERT INTO `orderproduct` VALUES ('8', '27');
INSERT INTO `orderproduct` VALUES ('46', '27');
INSERT INTO `orderproduct` VALUES ('8', '28');
INSERT INTO `orderproduct` VALUES ('46', '28');
INSERT INTO `orderproduct` VALUES ('8', '29');
INSERT INTO `orderproduct` VALUES ('16', '29');
INSERT INTO `orderproduct` VALUES ('9', '30');
INSERT INTO `orderproduct` VALUES ('46', '30');
INSERT INTO `orderproduct` VALUES ('9', '31');
INSERT INTO `orderproduct` VALUES ('26', '31');
INSERT INTO `orderproduct` VALUES ('9', '32');
INSERT INTO `orderproduct` VALUES ('36', '32');
INSERT INTO `orderproduct` VALUES ('10', '33');
INSERT INTO `orderproduct` VALUES ('75', '33');
INSERT INTO `orderproduct` VALUES ('10', '34');
INSERT INTO `orderproduct` VALUES ('17', '34');
INSERT INTO `orderproduct` VALUES ('10', '35');
INSERT INTO `orderproduct` VALUES ('22', '35');
INSERT INTO `orderproduct` VALUES ('10', '36');
INSERT INTO `orderproduct` VALUES ('35', '36');
INSERT INTO `orderproduct` VALUES ('10', '37');
INSERT INTO `orderproduct` VALUES ('26', '37');
INSERT INTO `orderproduct` VALUES ('10', '38');
INSERT INTO `orderproduct` VALUES ('42', '38');
INSERT INTO `orderproduct` VALUES ('11', '39');
INSERT INTO `orderproduct` VALUES ('73', '39');
INSERT INTO `orderproduct` VALUES ('11', '40');
INSERT INTO `orderproduct` VALUES ('75', '40');
INSERT INTO `orderproduct` VALUES ('11', '41');
INSERT INTO `orderproduct` VALUES ('31', '41');
INSERT INTO `orderproduct` VALUES ('11', '42');
INSERT INTO `orderproduct` VALUES ('11', '43');
INSERT INTO `orderproduct` VALUES ('11', '44');
INSERT INTO `orderproduct` VALUES ('22', '44');
INSERT INTO `orderproduct` VALUES ('12', '45');
INSERT INTO `orderproduct` VALUES ('26', '45');
INSERT INTO `orderproduct` VALUES ('12', '46');
INSERT INTO `orderproduct` VALUES ('75', '46');
INSERT INTO `orderproduct` VALUES ('12', '47');
INSERT INTO `orderproduct` VALUES ('35', '47');
INSERT INTO `orderproduct` VALUES ('12', '48');
INSERT INTO `orderproduct` VALUES ('25', '48');
INSERT INTO `orderproduct` VALUES ('12', '49');
INSERT INTO `orderproduct` VALUES ('35', '49');
INSERT INTO `orderproduct` VALUES ('13', '50');
INSERT INTO `orderproduct` VALUES ('16', '50');
INSERT INTO `orderproduct` VALUES ('13', '51');
INSERT INTO `orderproduct` VALUES ('26', '51');
INSERT INTO `orderproduct` VALUES ('13', '52');
INSERT INTO `orderproduct` VALUES ('27', '52');
INSERT INTO `orderproduct` VALUES ('13', '53');
INSERT INTO `orderproduct` VALUES ('68', '53');
INSERT INTO `orderproduct` VALUES ('13', '54');
INSERT INTO `orderproduct` VALUES ('75', '54');
INSERT INTO `orderproduct` VALUES ('14', '55');
INSERT INTO `orderproduct` VALUES ('25', '55');
INSERT INTO `orderproduct` VALUES ('14', '56');
INSERT INTO `orderproduct` VALUES ('40', '56');
INSERT INTO `orderproduct` VALUES ('14', '57');
INSERT INTO `orderproduct` VALUES ('25', '57');
INSERT INTO `orderproduct` VALUES ('15', '58');
INSERT INTO `orderproduct` VALUES ('22', '58');
INSERT INTO `orderproduct` VALUES ('15', '59');
INSERT INTO `orderproduct` VALUES ('16', '59');
INSERT INTO `orderproduct` VALUES ('15', '60');
INSERT INTO `orderproduct` VALUES ('35', '60');
INSERT INTO `orderproduct` VALUES ('15', '61');
INSERT INTO `orderproduct` VALUES ('31', '61');
INSERT INTO `orderproduct` VALUES ('15', '62');
INSERT INTO `orderproduct` VALUES ('18', '63');
INSERT INTO `orderproduct` VALUES ('32', '63');
INSERT INTO `orderproduct` VALUES ('18', '64');
INSERT INTO `orderproduct` VALUES ('36', '64');
INSERT INTO `orderproduct` VALUES ('18', '65');
INSERT INTO `orderproduct` VALUES ('27', '65');
INSERT INTO `orderproduct` VALUES ('19', '66');
INSERT INTO `orderproduct` VALUES ('35', '66');
INSERT INTO `orderproduct` VALUES ('19', '67');
INSERT INTO `orderproduct` VALUES ('74', '67');
INSERT INTO `orderproduct` VALUES ('19', '68');
INSERT INTO `orderproduct` VALUES ('22', '68');
INSERT INTO `orderproduct` VALUES ('20', '69');
INSERT INTO `orderproduct` VALUES ('65', '69');
INSERT INTO `orderproduct` VALUES ('20', '70');
INSERT INTO `orderproduct` VALUES ('26', '70');
INSERT INTO `orderproduct` VALUES ('21', '71');
INSERT INTO `orderproduct` VALUES ('40', '71');
INSERT INTO `orderproduct` VALUES ('21', '72');
INSERT INTO `orderproduct` VALUES ('38', '72');
INSERT INTO `orderproduct` VALUES ('21', '73');
INSERT INTO `orderproduct` VALUES ('35', '73');
INSERT INTO `orderproduct` VALUES ('21', '74');
INSERT INTO `orderproduct` VALUES ('31', '74');
INSERT INTO `orderproduct` VALUES ('21', '75');
INSERT INTO `orderproduct` VALUES ('31', '75');
INSERT INTO `orderproduct` VALUES ('21', '76');
INSERT INTO `orderproduct` VALUES ('41', '76');
INSERT INTO `orderproduct` VALUES ('23', '77');
INSERT INTO `orderproduct` VALUES ('42', '77');
INSERT INTO `orderproduct` VALUES ('23', '78');
INSERT INTO `orderproduct` VALUES ('31', '78');
INSERT INTO `orderproduct` VALUES ('23', '79');
INSERT INTO `orderproduct` VALUES ('26', '79');
INSERT INTO `orderproduct` VALUES ('24', '80');
INSERT INTO `orderproduct` VALUES ('26', '80');
INSERT INTO `orderproduct` VALUES ('24', '81');
INSERT INTO `orderproduct` VALUES ('24', '82');
INSERT INTO `orderproduct` VALUES ('36', '82');
INSERT INTO `orderproduct` VALUES ('24', '83');
INSERT INTO `orderproduct` VALUES ('38', '83');
INSERT INTO `orderproduct` VALUES ('24', '84');
INSERT INTO `orderproduct` VALUES ('65', '84');
INSERT INTO `orderproduct` VALUES ('24', '85');
INSERT INTO `orderproduct` VALUES ('70', '85');
INSERT INTO `orderproduct` VALUES ('28', '86');
INSERT INTO `orderproduct` VALUES ('43', '86');
INSERT INTO `orderproduct` VALUES ('28', '87');
INSERT INTO `orderproduct` VALUES ('28', '88');
INSERT INTO `orderproduct` VALUES ('32', '88');
INSERT INTO `orderproduct` VALUES ('28', '89');
INSERT INTO `orderproduct` VALUES ('28', '90');
INSERT INTO `orderproduct` VALUES ('35', '90');
INSERT INTO `orderproduct` VALUES ('28', '91');
INSERT INTO `orderproduct` VALUES ('36', '91');
INSERT INTO `orderproduct` VALUES ('29', '92');
INSERT INTO `orderproduct` VALUES ('43', '92');
INSERT INTO `orderproduct` VALUES ('29', '93');
INSERT INTO `orderproduct` VALUES ('38', '93');
INSERT INTO `orderproduct` VALUES ('29', '94');
INSERT INTO `orderproduct` VALUES ('50', '94');
INSERT INTO `orderproduct` VALUES ('30', '95');
INSERT INTO `orderproduct` VALUES ('32', '95');
INSERT INTO `orderproduct` VALUES ('30', '96');
INSERT INTO `orderproduct` VALUES ('43', '96');
INSERT INTO `orderproduct` VALUES ('30', '97');
INSERT INTO `orderproduct` VALUES ('38', '97');
INSERT INTO `orderproduct` VALUES ('30', '98');
INSERT INTO `orderproduct` VALUES ('38', '98');
INSERT INTO `orderproduct` VALUES ('30', '99');
INSERT INTO `orderproduct` VALUES ('35', '99');
INSERT INTO `orderproduct` VALUES ('33', '100');
INSERT INTO `orderproduct` VALUES ('44', '100');
INSERT INTO `orderproduct` VALUES ('33', '101');
INSERT INTO `orderproduct` VALUES ('38', '101');
INSERT INTO `orderproduct` VALUES ('34', '102');
INSERT INTO `orderproduct` VALUES ('34', '103');
INSERT INTO `orderproduct` VALUES ('34', '104');
INSERT INTO `orderproduct` VALUES ('41', '104');
INSERT INTO `orderproduct` VALUES ('34', '105');
INSERT INTO `orderproduct` VALUES ('38', '105');
INSERT INTO `orderproduct` VALUES ('37', '106');
INSERT INTO `orderproduct` VALUES ('44', '106');
INSERT INTO `orderproduct` VALUES ('37', '107');
INSERT INTO `orderproduct` VALUES ('46', '107');
INSERT INTO `orderproduct` VALUES ('37', '108');
INSERT INTO `orderproduct` VALUES ('44', '108');
INSERT INTO `orderproduct` VALUES ('37', '109');
INSERT INTO `orderproduct` VALUES ('72', '109');
INSERT INTO `orderproduct` VALUES ('37', '110');
INSERT INTO `orderproduct` VALUES ('46', '110');
INSERT INTO `orderproduct` VALUES ('37', '111');
INSERT INTO `orderproduct` VALUES ('58', '111');
INSERT INTO `orderproduct` VALUES ('37', '112');
INSERT INTO `orderproduct` VALUES ('40', '112');
INSERT INTO `orderproduct` VALUES ('37', '113');
INSERT INTO `orderproduct` VALUES ('42', '113');
INSERT INTO `orderproduct` VALUES ('39', '114');
INSERT INTO `orderproduct` VALUES ('42', '114');
INSERT INTO `orderproduct` VALUES ('39', '115');
INSERT INTO `orderproduct` VALUES ('46', '115');
INSERT INTO `orderproduct` VALUES ('39', '116');
INSERT INTO `orderproduct` VALUES ('41', '116');
INSERT INTO `orderproduct` VALUES ('45', '117');
INSERT INTO `orderproduct` VALUES ('75', '117');
INSERT INTO `orderproduct` VALUES ('45', '118');
INSERT INTO `orderproduct` VALUES ('63', '118');
INSERT INTO `orderproduct` VALUES ('45', '119');
INSERT INTO `orderproduct` VALUES ('47', '120');
INSERT INTO `orderproduct` VALUES ('47', '121');
INSERT INTO `orderproduct` VALUES ('47', '122');
INSERT INTO `orderproduct` VALUES ('47', '123');
INSERT INTO `orderproduct` VALUES ('48', '124');
INSERT INTO `orderproduct` VALUES ('48', '125');
INSERT INTO `orderproduct` VALUES ('48', '126');
INSERT INTO `orderproduct` VALUES ('72', '126');
INSERT INTO `orderproduct` VALUES ('48', '127');
INSERT INTO `orderproduct` VALUES ('48', '128');
INSERT INTO `orderproduct` VALUES ('49', '129');
INSERT INTO `orderproduct` VALUES ('65', '129');
INSERT INTO `orderproduct` VALUES ('49', '130');
INSERT INTO `orderproduct` VALUES ('49', '131');
INSERT INTO `orderproduct` VALUES ('49', '132');
INSERT INTO `orderproduct` VALUES ('49', '133');
INSERT INTO `orderproduct` VALUES ('49', '134');
INSERT INTO `orderproduct` VALUES ('74', '134');
INSERT INTO `orderproduct` VALUES ('49', '135');
INSERT INTO `orderproduct` VALUES ('51', '136');
INSERT INTO `orderproduct` VALUES ('75', '136');
INSERT INTO `orderproduct` VALUES ('51', '137');
INSERT INTO `orderproduct` VALUES ('73', '137');
INSERT INTO `orderproduct` VALUES ('51', '138');
INSERT INTO `orderproduct` VALUES ('51', '139');
INSERT INTO `orderproduct` VALUES ('70', '139');
INSERT INTO `orderproduct` VALUES ('51', '140');
INSERT INTO `orderproduct` VALUES ('73', '140');
INSERT INTO `orderproduct` VALUES ('51', '141');
INSERT INTO `orderproduct` VALUES ('63', '141');
INSERT INTO `orderproduct` VALUES ('51', '142');
INSERT INTO `orderproduct` VALUES ('63', '142');
INSERT INTO `orderproduct` VALUES ('52', '143');
INSERT INTO `orderproduct` VALUES ('52', '144');
INSERT INTO `orderproduct` VALUES ('52', '145');
INSERT INTO `orderproduct` VALUES ('52', '146');
INSERT INTO `orderproduct` VALUES ('57', '146');
INSERT INTO `orderproduct` VALUES ('52', '147');
INSERT INTO `orderproduct` VALUES ('73', '147');
INSERT INTO `orderproduct` VALUES ('53', '148');
INSERT INTO `orderproduct` VALUES ('73', '148');
INSERT INTO `orderproduct` VALUES ('53', '149');
INSERT INTO `orderproduct` VALUES ('65', '149');
INSERT INTO `orderproduct` VALUES ('53', '150');
INSERT INTO `orderproduct` VALUES ('75', '150');
INSERT INTO `orderproduct` VALUES ('53', '151');
INSERT INTO `orderproduct` VALUES ('63', '151');
INSERT INTO `orderproduct` VALUES ('53', '152');
INSERT INTO `orderproduct` VALUES ('65', '152');
INSERT INTO `orderproduct` VALUES ('54', '153');
INSERT INTO `orderproduct` VALUES ('55', '154');
INSERT INTO `orderproduct` VALUES ('55', '155');
INSERT INTO `orderproduct` VALUES ('55', '156');
INSERT INTO `orderproduct` VALUES ('55', '157');
INSERT INTO `orderproduct` VALUES ('65', '157');
INSERT INTO `orderproduct` VALUES ('56', '158');
INSERT INTO `orderproduct` VALUES ('56', '159');
INSERT INTO `orderproduct` VALUES ('56', '160');
INSERT INTO `orderproduct` VALUES ('56', '161');
INSERT INTO `orderproduct` VALUES ('59', '162');
INSERT INTO `orderproduct` VALUES ('75', '162');
INSERT INTO `orderproduct` VALUES ('59', '163');
INSERT INTO `orderproduct` VALUES ('59', '164');
INSERT INTO `orderproduct` VALUES ('65', '164');
INSERT INTO `orderproduct` VALUES ('60', '165');
INSERT INTO `orderproduct` VALUES ('60', '166');
INSERT INTO `orderproduct` VALUES ('63', '166');
INSERT INTO `orderproduct` VALUES ('60', '167');
INSERT INTO `orderproduct` VALUES ('65', '167');
INSERT INTO `orderproduct` VALUES ('60', '168');
INSERT INTO `orderproduct` VALUES ('60', '169');
INSERT INTO `orderproduct` VALUES ('60', '170');
INSERT INTO `orderproduct` VALUES ('73', '170');
INSERT INTO `orderproduct` VALUES ('61', '171');
INSERT INTO `orderproduct` VALUES ('61', '172');
INSERT INTO `orderproduct` VALUES ('72', '172');
INSERT INTO `orderproduct` VALUES ('61', '173');
INSERT INTO `orderproduct` VALUES ('73', '173');
INSERT INTO `orderproduct` VALUES ('61', '174');
INSERT INTO `orderproduct` VALUES ('62', '175');
INSERT INTO `orderproduct` VALUES ('70', '175');
INSERT INTO `orderproduct` VALUES ('62', '176');
INSERT INTO `orderproduct` VALUES ('65', '176');
INSERT INTO `orderproduct` VALUES ('62', '177');
INSERT INTO `orderproduct` VALUES ('73', '177');
INSERT INTO `orderproduct` VALUES ('62', '178');
INSERT INTO `orderproduct` VALUES ('72', '178');
INSERT INTO `orderproduct` VALUES ('64', '179');
INSERT INTO `orderproduct` VALUES ('70', '179');
INSERT INTO `orderproduct` VALUES ('64', '180');
INSERT INTO `orderproduct` VALUES ('74', '180');
INSERT INTO `orderproduct` VALUES ('64', '181');
INSERT INTO `orderproduct` VALUES ('65', '181');
INSERT INTO `orderproduct` VALUES ('64', '182');
INSERT INTO `orderproduct` VALUES ('74', '182');
INSERT INTO `orderproduct` VALUES ('66', '183');
INSERT INTO `orderproduct` VALUES ('72', '183');
INSERT INTO `orderproduct` VALUES ('66', '184');
INSERT INTO `orderproduct` VALUES ('66', '185');
INSERT INTO `orderproduct` VALUES ('67', '186');
INSERT INTO `orderproduct` VALUES ('72', '186');
INSERT INTO `orderproduct` VALUES ('67', '187');
INSERT INTO `orderproduct` VALUES ('67', '188');
INSERT INTO `orderproduct` VALUES ('69', '189');
INSERT INTO `orderproduct` VALUES ('69', '190');
INSERT INTO `orderproduct` VALUES ('70', '190');
INSERT INTO `orderproduct` VALUES ('69', '191');
INSERT INTO `orderproduct` VALUES ('74', '191');
INSERT INTO `orderproduct` VALUES ('69', '192');
INSERT INTO `orderproduct` VALUES ('69', '193');
INSERT INTO `orderproduct` VALUES ('71', '194');
INSERT INTO `orderproduct` VALUES ('71', '195');
INSERT INTO `orderproduct` VALUES ('74', '195');
INSERT INTO `orderproduct` VALUES ('76', '196');
INSERT INTO `orderproduct` VALUES ('76', '197');
INSERT INTO `orderproduct` VALUES ('76', '198');
INSERT INTO `orderproduct` VALUES ('76', '199');
INSERT INTO `orderproduct` VALUES ('76', '200');

-- ----------------------------
-- Table structure for `porder`
-- ----------------------------
DROP TABLE IF EXISTS `porder`;
CREATE TABLE `porder` (
  `OrderID` int NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `OrderStatus` varchar(50) DEFAULT NULL,
  `OrderType` varchar(50) DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  `SalepersonID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `DeliverID` int DEFAULT NULL,
  `StationID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `SalepersonID` (`SalepersonID`),
  KEY `UserID` (`UserID`),
  KEY `DeliverID` (`DeliverID`),
  KEY `StationID` (`StationID`),
  CONSTRAINT `porder_ibfk_1` FOREIGN KEY (`SalepersonID`) REFERENCES `saleperson` (`StaffID`),
  CONSTRAINT `porder_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `porder_ibfk_3` FOREIGN KEY (`DeliverID`) REFERENCES `deliveryman` (`StaffID`),
  CONSTRAINT `porder_ibfk_4` FOREIGN KEY (`StationID`) REFERENCES `expressstation` (`StationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of porder
-- ----------------------------
INSERT INTO `porder` VALUES ('1', '2023-01-04', 'Done', 'Purchased', '2.13', '13', '23', '9', '2');
INSERT INTO `porder` VALUES ('2', '2023-01-04', 'Done', 'Purchased', '3.15', '15', '23', '4', '2');
INSERT INTO `porder` VALUES ('3', '2023-01-14', 'Done', 'Purchased', '0.33', '17', '11', '2', '3');
INSERT INTO `porder` VALUES ('4', '2023-01-15', 'Done', 'Purchased', '2.65', '13', '14', '8', '1');
INSERT INTO `porder` VALUES ('5', '2023-01-15', 'Done', 'Purchased', '4.47', '15', '11', '2', '2');
INSERT INTO `porder` VALUES ('6', '2023-01-27', 'Done', 'Purchased', '1.61', '17', '26', '1', '3');
INSERT INTO `porder` VALUES ('7', '2023-01-30', 'Done', 'Purchased', '4.46', '16', '20', '5', '2');
INSERT INTO `porder` VALUES ('8', '2023-02-03', 'Done', 'Purchased', '3.02', '15', '24', '3', '1');
INSERT INTO `porder` VALUES ('9', '2023-02-20', 'Done', 'Purchased', '3.98', '18', '22', '9', '3');
INSERT INTO `porder` VALUES ('10', '2023-02-22', 'Done', 'Purchased', '1.50', '17', '4', '10', '3');
INSERT INTO `porder` VALUES ('11', '2023-02-24', 'Done', 'Purchased', '3.15', '17', '8', '10', '1');
INSERT INTO `porder` VALUES ('12', '2023-03-06', 'Done', 'Purchased', '2.36', '16', '3', '8', '3');
INSERT INTO `porder` VALUES ('13', '2023-03-10', 'Done', 'Purchased', '1.44', '20', '7', '5', '1');
INSERT INTO `porder` VALUES ('14', '2023-03-14', 'Done', 'Purchased', '3.67', '15', '24', '5', '2');
INSERT INTO `porder` VALUES ('15', '2023-03-21', 'Done', 'Purchased', '3.99', '20', '3', '10', '2');
INSERT INTO `porder` VALUES ('16', '2023-03-22', 'Done', 'Sold', '0.00', '16', '5', '9', '1');
INSERT INTO `porder` VALUES ('17', '2023-03-25', 'Done', 'Sold', '0.00', '16', '9', '9', '2');
INSERT INTO `porder` VALUES ('18', '2023-04-02', 'Done', 'Purchased', '4.87', '14', '13', '7', '2');
INSERT INTO `porder` VALUES ('19', '2023-04-04', 'Done', 'Purchased', '2.35', '20', '17', '3', '3');
INSERT INTO `porder` VALUES ('20', '2023-04-18', 'Done', 'Purchased', '1.80', '19', '2', '1', '3');
INSERT INTO `porder` VALUES ('21', '2023-05-09', 'Done', 'Purchased', '3.63', '19', '20', '11', '2');
INSERT INTO `porder` VALUES ('22', '2023-05-19', 'Done', 'Sold', '0.00', '15', '7', '7', '1');
INSERT INTO `porder` VALUES ('23', '2023-05-23', 'Done', 'Purchased', '4.22', '15', '29', '11', '1');
INSERT INTO `porder` VALUES ('24', '2023-06-02', 'Done', 'Purchased', '1.46', '17', '13', '10', '1');
INSERT INTO `porder` VALUES ('25', '2023-06-04', 'Done', 'Sold', '0.00', '20', '21', '3', '1');
INSERT INTO `porder` VALUES ('26', '2023-06-11', 'Done', 'Sold', '0.00', '15', '19', '10', '2');
INSERT INTO `porder` VALUES ('27', '2023-06-16', 'Done', 'Sold', '0.00', '14', '28', '10', '2');
INSERT INTO `porder` VALUES ('28', '2023-07-03', 'Done', 'Purchased', '4.88', '21', '6', '5', '2');
INSERT INTO `porder` VALUES ('29', '2023-07-22', 'Done', 'Purchased', '1.18', '17', '11', '5', '3');
INSERT INTO `porder` VALUES ('30', '2023-07-25', 'Done', 'Purchased', '1.21', '13', '5', '8', '1');
INSERT INTO `porder` VALUES ('31', '2023-08-06', 'Done', 'Sold', '0.00', '19', '18', '12', '1');
INSERT INTO `porder` VALUES ('32', '2023-08-07', 'Done', 'Sold', '0.00', '20', '21', '11', '2');
INSERT INTO `porder` VALUES ('33', '2023-08-07', 'Done', 'Purchased', '3.68', '21', '15', '7', '3');
INSERT INTO `porder` VALUES ('34', '2023-08-07', 'Done', 'Purchased', '4.12', '17', '1', '8', '3');
INSERT INTO `porder` VALUES ('35', '2023-08-09', 'Done', 'Sold', '0.00', '20', '17', '3', '3');
INSERT INTO `porder` VALUES ('36', '2023-08-09', 'Done', 'Sold', '0.00', '18', '10', '3', '3');
INSERT INTO `porder` VALUES ('37', '2023-08-24', 'Done', 'Purchased', '2.85', '17', '5', '3', '1');
INSERT INTO `porder` VALUES ('38', '2023-08-31', 'Done', 'Sold', '0.00', '19', '16', '2', '1');
INSERT INTO `porder` VALUES ('39', '2023-09-01', 'Done', 'Purchased', '3.74', '21', '11', '6', '3');
INSERT INTO `porder` VALUES ('40', '2023-09-10', 'Done', 'Sold', '0.00', '13', '7', '4', '1');
INSERT INTO `porder` VALUES ('41', '2023-09-15', 'Done', 'Sold', '0.00', '15', '2', '8', '1');
INSERT INTO `porder` VALUES ('42', '2023-09-22', 'Done', 'Sold', '0.00', '15', '2', '3', '1');
INSERT INTO `porder` VALUES ('43', '2023-10-01', 'Done', 'Sold', '0.00', '18', '13', '12', '3');
INSERT INTO `porder` VALUES ('44', '2023-10-03', 'Done', 'Sold', '0.00', '19', '25', '6', '1');
INSERT INTO `porder` VALUES ('45', '2023-10-11', 'Done', 'Purchased', '4.28', '15', '22', '10', '3');
INSERT INTO `porder` VALUES ('46', '2023-10-17', 'Done', 'Sold', '0.00', '14', '17', '10', '1');
INSERT INTO `porder` VALUES ('47', '2023-11-14', 'Done', 'Purchased', '1.70', '13', '8', '2', '2');
INSERT INTO `porder` VALUES ('48', '2023-11-17', 'To be fetched', 'Purchased', '2.39', '18', '15', '12', '3');
INSERT INTO `porder` VALUES ('49', '2023-11-17', 'Paid', 'Purchased', '1.91', '19', '9', '11', '1');
INSERT INTO `porder` VALUES ('50', '2023-11-25', 'To be fetched', 'Sold', '0.00', '18', '8', '9', '3');
INSERT INTO `porder` VALUES ('51', '2023-11-26', 'To be fetched', 'Purchased', '0.66', '19', '25', '5', '1');
INSERT INTO `porder` VALUES ('52', '2023-12-03', 'Paid', 'Purchased', '1.59', '19', '12', '9', '3');
INSERT INTO `porder` VALUES ('53', '2023-12-22', 'Paid', 'Purchased', '1.12', '15', '4', '10', '2');
INSERT INTO `porder` VALUES ('54', '2023-12-22', 'Paid', 'Purchased', '0.64', '13', '13', '6', '3');
INSERT INTO `porder` VALUES ('55', '2024-01-01', 'To be fetched', 'Purchased', '2.60', '14', '17', '12', '1');
INSERT INTO `porder` VALUES ('56', '2024-01-17', 'Done', 'Purchased', '2.06', '15', '18', '7', '3');
INSERT INTO `porder` VALUES ('57', '2024-01-24', 'Done', 'Sold', '0.00', '14', '18', '12', '1');
INSERT INTO `porder` VALUES ('58', '2024-02-03', 'Done', 'Sold', '0.00', '15', '28', '3', '1');
INSERT INTO `porder` VALUES ('59', '2024-02-09', 'Paid', 'Purchased', '4.92', '18', '25', '10', '3');
INSERT INTO `porder` VALUES ('60', '2024-02-10', 'Done', 'Purchased', '4.83', '15', '30', '8', '3');
INSERT INTO `porder` VALUES ('61', '2024-02-12', 'Paid', 'Purchased', '3.98', '17', '24', '11', '1');
INSERT INTO `porder` VALUES ('62', '2024-02-15', 'Done', 'Purchased', '0.44', '13', '18', '6', '2');
INSERT INTO `porder` VALUES ('63', '2024-02-29', 'Paid', 'Sold', '0.00', '21', '8', '8', '1');
INSERT INTO `porder` VALUES ('64', '2024-03-03', 'Paid', 'Purchased', '3.83', '16', '7', '1', '1');
INSERT INTO `porder` VALUES ('65', '2024-03-09', 'Done', 'Sold', '0.00', '20', '9', '6', '2');
INSERT INTO `porder` VALUES ('66', '2024-03-09', 'Done', 'Purchased', '2.85', '14', '13', '10', '2');
INSERT INTO `porder` VALUES ('67', '2024-03-16', 'To be fetched', 'Purchased', '0.03', '19', '28', '8', '1');
INSERT INTO `porder` VALUES ('68', '2024-03-21', 'To be fetched', 'Sold', '0.00', '16', '2', '2', '3');
INSERT INTO `porder` VALUES ('69', '2024-03-21', 'Done', 'Purchased', '3.91', '15', '1', '8', '2');
INSERT INTO `porder` VALUES ('70', '2024-03-22', 'Done', 'Sold', '0.00', '19', '13', '2', '2');
INSERT INTO `porder` VALUES ('71', '2024-03-22', 'Done', 'Purchased', '0.36', '17', '7', '10', '1');
INSERT INTO `porder` VALUES ('72', '2024-03-24', 'Done', 'Sold', '0.00', '21', '18', '7', '2');
INSERT INTO `porder` VALUES ('73', '2024-03-31', 'To be fetched', 'Sold', '0.00', '18', '9', '2', '2');
INSERT INTO `porder` VALUES ('74', '2024-04-03', 'Paid', 'Sold', '0.00', '20', '7', '11', '1');
INSERT INTO `porder` VALUES ('75', '2024-04-14', 'Done', 'Sold', '0.00', '17', '27', '1', '3');
INSERT INTO `porder` VALUES ('76', '2024-04-18', 'Paid', 'Purchased', '0.35', '14', '15', '9', '1');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `ProductID` int NOT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ProductCondition` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '43.11', 'damaged');
INSERT INTO `product` VALUES ('2', '12.29', 'used but not damaged');
INSERT INTO `product` VALUES ('3', '3.19', 'used with annonation');
INSERT INTO `product` VALUES ('4', '12.18', 'damaged');
INSERT INTO `product` VALUES ('5', '9.35', 'used but not damaged');
INSERT INTO `product` VALUES ('6', '4.00', 'used but not damaged');
INSERT INTO `product` VALUES ('7', '47.96', 'used with annonation');
INSERT INTO `product` VALUES ('8', '22.58', 'unused');
INSERT INTO `product` VALUES ('9', '15.48', 'damaged');
INSERT INTO `product` VALUES ('10', '37.00', 'used with annonation');
INSERT INTO `product` VALUES ('11', '10.74', 'used but not damaged');
INSERT INTO `product` VALUES ('12', '3.52', 'used but not damaged');
INSERT INTO `product` VALUES ('13', '18.32', 'used with annonation');
INSERT INTO `product` VALUES ('14', '51.81', 'unused');
INSERT INTO `product` VALUES ('15', '22.86', 'used but not damaged');
INSERT INTO `product` VALUES ('16', '24.49', 'unused');
INSERT INTO `product` VALUES ('17', '17.40', 'used with annonation');
INSERT INTO `product` VALUES ('18', '62.95', 'unused');
INSERT INTO `product` VALUES ('19', '21.45', 'used with annonation');
INSERT INTO `product` VALUES ('20', '26.97', 'used with annonation');
INSERT INTO `product` VALUES ('21', '15.40', 'unused');
INSERT INTO `product` VALUES ('22', '15.84', 'unused');
INSERT INTO `product` VALUES ('23', '11.40', 'used but not damaged');
INSERT INTO `product` VALUES ('24', '29.93', 'damaged');
INSERT INTO `product` VALUES ('25', '13.47', 'used with annonation');
INSERT INTO `product` VALUES ('26', '19.82', 'used with annonation');
INSERT INTO `product` VALUES ('27', '22.38', 'unused');
INSERT INTO `product` VALUES ('28', '20.15', 'damaged');
INSERT INTO `product` VALUES ('29', '33.92', 'damaged');
INSERT INTO `product` VALUES ('30', '17.44', 'unused');
INSERT INTO `product` VALUES ('31', '25.89', 'used but not damaged');
INSERT INTO `product` VALUES ('32', '4.84', 'damaged');
INSERT INTO `product` VALUES ('33', '14.32', 'used with annonation');
INSERT INTO `product` VALUES ('34', '7.78', 'damaged');
INSERT INTO `product` VALUES ('35', '29.89', 'damaged');
INSERT INTO `product` VALUES ('36', '29.97', 'used but not damaged');
INSERT INTO `product` VALUES ('37', '15.09', 'used but not damaged');
INSERT INTO `product` VALUES ('38', '5.07', 'used with annonation');
INSERT INTO `product` VALUES ('39', '30.29', 'damaged');
INSERT INTO `product` VALUES ('40', '35.45', 'unused');
INSERT INTO `product` VALUES ('41', '41.65', 'used with annonation');
INSERT INTO `product` VALUES ('42', '17.71', 'used with annonation');
INSERT INTO `product` VALUES ('43', '32.52', 'damaged');
INSERT INTO `product` VALUES ('44', '49.18', 'used with annonation');
INSERT INTO `product` VALUES ('45', '14.91', 'damaged');
INSERT INTO `product` VALUES ('46', '12.43', 'damaged');
INSERT INTO `product` VALUES ('47', '10.46', 'used but not damaged');
INSERT INTO `product` VALUES ('48', '22.88', 'damaged');
INSERT INTO `product` VALUES ('49', '1.78', 'damaged');
INSERT INTO `product` VALUES ('50', '42.63', 'used with annonation');
INSERT INTO `product` VALUES ('51', '17.53', 'used with annonation');
INSERT INTO `product` VALUES ('52', '12.20', 'used with annonation');
INSERT INTO `product` VALUES ('53', '32.83', 'used with annonation');
INSERT INTO `product` VALUES ('54', '20.51', 'used with annonation');
INSERT INTO `product` VALUES ('55', '16.95', 'used with annonation');
INSERT INTO `product` VALUES ('56', '35.82', 'used with annonation');
INSERT INTO `product` VALUES ('57', '16.73', 'used but not damaged');
INSERT INTO `product` VALUES ('58', '19.53', 'used but not damaged');
INSERT INTO `product` VALUES ('59', '43.17', 'unused');
INSERT INTO `product` VALUES ('60', '33.37', 'used with annonation');
INSERT INTO `product` VALUES ('61', '16.05', 'used but not damaged');
INSERT INTO `product` VALUES ('62', '45.87', 'used but not damaged');
INSERT INTO `product` VALUES ('63', '25.39', 'used with annonation');
INSERT INTO `product` VALUES ('64', '18.48', 'unused');
INSERT INTO `product` VALUES ('65', '24.61', 'unused');
INSERT INTO `product` VALUES ('66', '21.85', 'used with annonation');
INSERT INTO `product` VALUES ('67', '16.00', 'used with annonation');
INSERT INTO `product` VALUES ('68', '11.12', 'unused');
INSERT INTO `product` VALUES ('69', '29.46', 'used with annonation');
INSERT INTO `product` VALUES ('70', '10.01', 'unused');
INSERT INTO `product` VALUES ('71', '6.49', 'used with annonation');
INSERT INTO `product` VALUES ('72', '11.42', 'used but not damaged');
INSERT INTO `product` VALUES ('73', '1.30', 'unused');
INSERT INTO `product` VALUES ('74', '12.47', 'damaged');
INSERT INTO `product` VALUES ('75', '21.24', 'damaged');
INSERT INTO `product` VALUES ('76', '9.29', 'used but not damaged');
INSERT INTO `product` VALUES ('77', '9.19', 'used but not damaged');
INSERT INTO `product` VALUES ('78', '37.24', 'damaged');
INSERT INTO `product` VALUES ('79', '21.33', 'damaged');
INSERT INTO `product` VALUES ('80', '28.38', 'unused');
INSERT INTO `product` VALUES ('81', '31.37', 'unused');
INSERT INTO `product` VALUES ('82', '6.82', 'unused');
INSERT INTO `product` VALUES ('83', '50.62', 'damaged');
INSERT INTO `product` VALUES ('84', '16.21', 'unused');
INSERT INTO `product` VALUES ('85', '11.96', 'damaged');
INSERT INTO `product` VALUES ('86', '17.39', 'damaged');
INSERT INTO `product` VALUES ('87', '2.50', 'used but not damaged');
INSERT INTO `product` VALUES ('88', '35.42', 'used but not damaged');
INSERT INTO `product` VALUES ('89', '18.41', 'used but not damaged');
INSERT INTO `product` VALUES ('90', '33.44', 'unused');
INSERT INTO `product` VALUES ('91', '23.72', 'unused');
INSERT INTO `product` VALUES ('92', '28.22', 'used but not damaged');
INSERT INTO `product` VALUES ('93', '44.45', 'used but not damaged');
INSERT INTO `product` VALUES ('94', '17.16', 'unused');
INSERT INTO `product` VALUES ('95', '37.36', 'used but not damaged');
INSERT INTO `product` VALUES ('96', '29.30', 'damaged');
INSERT INTO `product` VALUES ('97', '36.07', 'used with annonation');
INSERT INTO `product` VALUES ('98', '39.72', 'used but not damaged');
INSERT INTO `product` VALUES ('99', '21.13', 'damaged');
INSERT INTO `product` VALUES ('100', '7.17', 'used but not damaged');
INSERT INTO `product` VALUES ('101', '11.48', 'unused');
INSERT INTO `product` VALUES ('102', '15.36', 'damaged');
INSERT INTO `product` VALUES ('103', '2.63', 'unused');
INSERT INTO `product` VALUES ('104', '2.17', 'unused');
INSERT INTO `product` VALUES ('105', '24.86', 'used with annonation');
INSERT INTO `product` VALUES ('106', '35.85', 'damaged');
INSERT INTO `product` VALUES ('107', '22.09', 'used but not damaged');
INSERT INTO `product` VALUES ('108', '22.17', 'used but not damaged');
INSERT INTO `product` VALUES ('109', '49.96', 'used but not damaged');
INSERT INTO `product` VALUES ('110', '38.82', 'unused');
INSERT INTO `product` VALUES ('111', '9.11', 'damaged');
INSERT INTO `product` VALUES ('112', '20.85', 'used but not damaged');
INSERT INTO `product` VALUES ('113', '9.81', 'unused');
INSERT INTO `product` VALUES ('114', '40.42', 'damaged');
INSERT INTO `product` VALUES ('115', '11.72', 'used but not damaged');
INSERT INTO `product` VALUES ('116', '2.73', 'damaged');
INSERT INTO `product` VALUES ('117', '16.96', 'damaged');
INSERT INTO `product` VALUES ('118', '36.75', 'used with annonation');
INSERT INTO `product` VALUES ('119', '21.98', 'unused');
INSERT INTO `product` VALUES ('120', '34.70', 'unused');
INSERT INTO `product` VALUES ('121', '0.71', 'damaged');
INSERT INTO `product` VALUES ('122', '6.51', 'unused');
INSERT INTO `product` VALUES ('123', '18.50', 'damaged');
INSERT INTO `product` VALUES ('124', '27.11', 'damaged');
INSERT INTO `product` VALUES ('125', '10.91', 'used with annonation');
INSERT INTO `product` VALUES ('126', '6.66', 'used but not damaged');
INSERT INTO `product` VALUES ('127', '26.64', 'used with annonation');
INSERT INTO `product` VALUES ('128', '7.69', 'unused');
INSERT INTO `product` VALUES ('129', '22.97', 'unused');
INSERT INTO `product` VALUES ('130', '22.94', 'unused');
INSERT INTO `product` VALUES ('131', '1.87', 'unused');
INSERT INTO `product` VALUES ('132', '14.97', 'unused');
INSERT INTO `product` VALUES ('133', '18.83', 'unused');
INSERT INTO `product` VALUES ('134', '52.31', 'damaged');
INSERT INTO `product` VALUES ('135', '2.09', 'damaged');
INSERT INTO `product` VALUES ('136', '11.57', 'unused');
INSERT INTO `product` VALUES ('137', '13.66', 'used but not damaged');
INSERT INTO `product` VALUES ('138', '11.83', 'damaged');
INSERT INTO `product` VALUES ('139', '12.85', 'unused');
INSERT INTO `product` VALUES ('140', '21.38', 'unused');
INSERT INTO `product` VALUES ('141', '19.25', 'damaged');
INSERT INTO `product` VALUES ('142', '29.68', 'used with annonation');
INSERT INTO `product` VALUES ('143', '18.05', 'used with annonation');
INSERT INTO `product` VALUES ('144', '21.42', 'unused');
INSERT INTO `product` VALUES ('145', '31.73', 'unused');
INSERT INTO `product` VALUES ('146', '21.86', 'used but not damaged');
INSERT INTO `product` VALUES ('147', '26.47', 'used but not damaged');
INSERT INTO `product` VALUES ('148', '40.16', 'damaged');
INSERT INTO `product` VALUES ('149', '18.71', 'used but not damaged');
INSERT INTO `product` VALUES ('150', '20.84', 'damaged');
INSERT INTO `product` VALUES ('151', '33.23', 'unused');
INSERT INTO `product` VALUES ('152', '20.75', 'used with annonation');
INSERT INTO `product` VALUES ('153', '16.67', 'unused');
INSERT INTO `product` VALUES ('154', '35.81', 'unused');
INSERT INTO `product` VALUES ('155', '5.44', 'damaged');
INSERT INTO `product` VALUES ('156', '7.50', 'damaged');
INSERT INTO `product` VALUES ('157', '36.06', 'used with annonation');
INSERT INTO `product` VALUES ('158', '38.62', 'damaged');
INSERT INTO `product` VALUES ('159', '34.29', 'damaged');
INSERT INTO `product` VALUES ('160', '17.32', 'unused');
INSERT INTO `product` VALUES ('161', '26.37', 'unused');
INSERT INTO `product` VALUES ('162', '40.42', 'used with annonation');
INSERT INTO `product` VALUES ('163', '27.92', 'used with annonation');
INSERT INTO `product` VALUES ('164', '3.55', 'damaged');
INSERT INTO `product` VALUES ('165', '27.37', 'damaged');
INSERT INTO `product` VALUES ('166', '10.42', 'used but not damaged');
INSERT INTO `product` VALUES ('167', '21.79', 'unused');
INSERT INTO `product` VALUES ('168', '4.34', 'unused');
INSERT INTO `product` VALUES ('169', '8.02', 'unused');
INSERT INTO `product` VALUES ('170', '38.99', 'damaged');
INSERT INTO `product` VALUES ('171', '19.37', 'unused');
INSERT INTO `product` VALUES ('172', '28.17', 'unused');
INSERT INTO `product` VALUES ('173', '9.37', 'damaged');
INSERT INTO `product` VALUES ('174', '26.55', 'used with annonation');
INSERT INTO `product` VALUES ('175', '16.58', 'unused');
INSERT INTO `product` VALUES ('176', '18.93', 'damaged');
INSERT INTO `product` VALUES ('177', '21.37', 'unused');
INSERT INTO `product` VALUES ('178', '5.78', 'damaged');
INSERT INTO `product` VALUES ('179', '7.43', 'used but not damaged');
INSERT INTO `product` VALUES ('180', '34.76', 'damaged');
INSERT INTO `product` VALUES ('181', '31.64', 'damaged');
INSERT INTO `product` VALUES ('182', '29.53', 'unused');
INSERT INTO `product` VALUES ('183', '10.92', 'damaged');
INSERT INTO `product` VALUES ('184', '27.70', 'used with annonation');
INSERT INTO `product` VALUES ('185', '24.37', 'used with annonation');
INSERT INTO `product` VALUES ('186', '7.12', 'damaged');
INSERT INTO `product` VALUES ('187', '42.25', 'used with annonation');
INSERT INTO `product` VALUES ('188', '35.89', 'used but not damaged');
INSERT INTO `product` VALUES ('189', '53.25', 'damaged');
INSERT INTO `product` VALUES ('190', '13.08', 'unused');
INSERT INTO `product` VALUES ('191', '29.66', 'unused');
INSERT INTO `product` VALUES ('192', '19.26', 'used with annonation');
INSERT INTO `product` VALUES ('193', '30.34', 'used with annonation');
INSERT INTO `product` VALUES ('194', '44.64', 'used but not damaged');
INSERT INTO `product` VALUES ('195', '8.97', 'damaged');
INSERT INTO `product` VALUES ('196', '8.50', 'used but not damaged');
INSERT INTO `product` VALUES ('197', '3.79', 'unused');
INSERT INTO `product` VALUES ('198', '41.04', 'damaged');
INSERT INTO `product` VALUES ('199', '11.90', 'used but not damaged');
INSERT INTO `product` VALUES ('200', '37.44', 'unused');

-- ----------------------------
-- Table structure for `responsible`
-- ----------------------------
DROP TABLE IF EXISTS `responsible`;
CREATE TABLE `responsible` (
  `StaffID` int NOT NULL,
  `StationID` int NOT NULL,
  PRIMARY KEY (`StaffID`,`StationID`),
  KEY `StationID` (`StationID`),
  CONSTRAINT `responsible_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `deliveryman` (`StaffID`),
  CONSTRAINT `responsible_ibfk_2` FOREIGN KEY (`StationID`) REFERENCES `expressstation` (`StationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of responsible
-- ----------------------------
INSERT INTO `responsible` VALUES ('1', '1');
INSERT INTO `responsible` VALUES ('2', '1');
INSERT INTO `responsible` VALUES ('3', '1');
INSERT INTO `responsible` VALUES ('4', '1');
INSERT INTO `responsible` VALUES ('5', '1');
INSERT INTO `responsible` VALUES ('6', '1');
INSERT INTO `responsible` VALUES ('7', '1');
INSERT INTO `responsible` VALUES ('9', '1');
INSERT INTO `responsible` VALUES ('11', '1');
INSERT INTO `responsible` VALUES ('12', '1');
INSERT INTO `responsible` VALUES ('1', '2');
INSERT INTO `responsible` VALUES ('2', '2');
INSERT INTO `responsible` VALUES ('3', '2');
INSERT INTO `responsible` VALUES ('4', '2');
INSERT INTO `responsible` VALUES ('10', '2');
INSERT INTO `responsible` VALUES ('11', '2');
INSERT INTO `responsible` VALUES ('12', '2');
INSERT INTO `responsible` VALUES ('1', '3');
INSERT INTO `responsible` VALUES ('2', '3');
INSERT INTO `responsible` VALUES ('3', '3');
INSERT INTO `responsible` VALUES ('4', '3');
INSERT INTO `responsible` VALUES ('7', '3');
INSERT INTO `responsible` VALUES ('8', '3');
INSERT INTO `responsible` VALUES ('9', '3');
INSERT INTO `responsible` VALUES ('11', '3');
INSERT INTO `responsible` VALUES ('12', '3');

-- ----------------------------
-- Table structure for `saleperson`
-- ----------------------------
DROP TABLE IF EXISTS `saleperson`;
CREATE TABLE `saleperson` (
  `StaffID` int NOT NULL,
  `SalesCommissionRatio` decimal(4,4) DEFAULT NULL,
  `StoreID` int DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `StoreID` (`StoreID`),
  CONSTRAINT `saleperson_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`),
  CONSTRAINT `saleperson_ibfk_2` FOREIGN KEY (`StoreID`) REFERENCES `store` (`StoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of saleperson
-- ----------------------------
INSERT INTO `saleperson` VALUES ('13', '0.0300', '1');
INSERT INTO `saleperson` VALUES ('14', '0.0200', '1');
INSERT INTO `saleperson` VALUES ('15', '0.0250', '1');
INSERT INTO `saleperson` VALUES ('16', '0.0300', '2');
INSERT INTO `saleperson` VALUES ('17', '0.0230', '2');
INSERT INTO `saleperson` VALUES ('18', '0.0280', '2');
INSERT INTO `saleperson` VALUES ('19', '0.0220', '3');
INSERT INTO `saleperson` VALUES ('20', '0.0260', '3');
INSERT INTO `saleperson` VALUES ('21', '0.0200', '3');

-- ----------------------------
-- Table structure for `staff`
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL,
  `StaffName` varchar(255) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `TeleNum` varchar(20) DEFAULT NULL,
  `WorkingHours` int DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('1', 'Furina', '2023-10-13', '30.00', '19028374837', '8');
INSERT INTO `staff` VALUES ('2', 'Shenhe', '2023-03-10', '31.00', '12938474247', '9');
INSERT INTO `staff` VALUES ('3', 'Ganyu', '2023-12-02', '27.00', '12938164758', '10');
INSERT INTO `staff` VALUES ('4', 'KamisatoAyato', '2023-03-26', '29.00', '10284756382', '8');
INSERT INTO `staff` VALUES ('5', 'Yoimiya', '2023-06-21', '34.00', '12283740198', '6');
INSERT INTO `staff` VALUES ('6', 'Nilou', '2023-12-03', '33.00', '11283748273', '7');
INSERT INTO `staff` VALUES ('7', 'Lynette', '2023-02-02', '30.00', '10192834732', '4');
INSERT INTO `staff` VALUES ('8', 'Nahida', '2023-10-27', '29.00', '17398266453', '8');
INSERT INTO `staff` VALUES ('9', 'Paimon', '2023-06-22', '32.00', '18943035023', '9');
INSERT INTO `staff` VALUES ('10', 'Barbara', '2023-02-17', '31.00', '18133370199', '10');
INSERT INTO `staff` VALUES ('11', 'Bennett', '2023-04-28', '33.00', '10473272004', '7');
INSERT INTO `staff` VALUES ('12', 'Diluc', '2023-07-12', '33.00', '15568414981', '9');
INSERT INTO `staff` VALUES ('13', 'Fischl', '2023-11-20', '35.00', '11799367203', '6');
INSERT INTO `staff` VALUES ('14', 'Klee', '2023-09-09', '26.00', '15944644344', '6');
INSERT INTO `staff` VALUES ('15', 'Zhongli', '2023-07-15', '31.00', '18437550159', '6');
INSERT INTO `staff` VALUES ('16', 'Navia', '2023-12-26', '32.00', '13050124203', '7');
INSERT INTO `staff` VALUES ('17', 'Charlotte', '2023-01-10', '32.00', '12075902729', '6');
INSERT INTO `staff` VALUES ('18', 'Faruzan', '2023-07-31', '33.00', '12332341291', '10');
INSERT INTO `staff` VALUES ('19', 'Acheron', '2023-10-05', '26.00', '14682300606', '7');
INSERT INTO `staff` VALUES ('20', 'Kafka', '2023-08-31', '30.00', '13388823208', '9');
INSERT INTO `staff` VALUES ('21', 'Seele', '2023-10-20', '34.00', '18382843043', '7');

-- ----------------------------
-- Table structure for `store`
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `StoreID` int NOT NULL,
  `StoreLocation` varchar(255) DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  `StoreName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', 'Shaw', '100', 'Cat\'s Tail');
INSERT INTO `store` VALUES ('2', 'Muse', '80', 'Good Hunter');
INSERT INTO `store` VALUES ('3', 'Diligentia', '80', 'Northland Bank');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserID` int NOT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `UserAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Mona', '13567051078', '1093582973@gmail.com', 'Muse');
INSERT INTO `user` VALUES ('2', 'Amber', '13184528242', '2220367206@gmail.com', 'Shaw');
INSERT INTO `user` VALUES ('3', 'Barbara', '13282815150', '37453128830@gmail.com', 'Diligentia');
INSERT INTO `user` VALUES ('4', 'Klee', '13209664463', '41508882943@gmail.com', 'Muse');
INSERT INTO `user` VALUES ('5', 'Eula', '13131927136', '22868949008@gmail.com', 'Harmonia');
INSERT INTO `user` VALUES ('6', 'Kuki', '13192788489', '9459486771@gmail.com', 'Ling');
INSERT INTO `user` VALUES ('7', 'Collei', '13378019004', '0048338270@gmail.com', 'Muse');
INSERT INTO `user` VALUES ('8', 'Nolle', '13694989152', '1290375058@gmail.com', 'Diligentia');
INSERT INTO `user` VALUES ('9', 'Fischl', '13219846403', '7699922263@gmail.com', 'Shaw');
INSERT INTO `user` VALUES ('10', 'Kirara', '13679682498', '2141419682@gmail.com', 'Shaw');
INSERT INTO `user` VALUES ('11', 'Dori', '13185715616', '2683423803@gmail.com', 'Ling');
INSERT INTO `user` VALUES ('12', 'Yelan', '13184909722', '5397262751@gmail.com', 'Harmonia');
INSERT INTO `user` VALUES ('13', 'Xiangling', '13270087930', '26715776149@gmail.com', 'Harmonia');
INSERT INTO `user` VALUES ('14', 'Ningguang', '13643705018', '88818324566@gmail.com', 'Ling');
INSERT INTO `user` VALUES ('15', 'Albedo', '13230921235', '124109284@gmail.com', 'Shaw');
INSERT INTO `user` VALUES ('16', 'Mika', '13628951286', '4835729345@gmail.com', 'Shaw');
INSERT INTO `user` VALUES ('17', 'Kaeya', '13178302583', '32574938759@gmail.com', 'Ling');
INSERT INTO `user` VALUES ('18', 'Diluc', '13112857398', '4326434872@gmail.com', 'Harmonia');
INSERT INTO `user` VALUES ('19', 'Jean', '13245906931', '35433335234@gmail.com', 'Harmonia');
INSERT INTO `user` VALUES ('20', 'Tighnari', '13670394851', '257067432@gmail.com', 'Ling');
INSERT INTO `user` VALUES ('21', 'Aether', '15337009199', '4606880@gmail.com', 'Muse');
INSERT INTO `user` VALUES ('22', 'Lumine', '13731105814', '137509150@gmail.com', 'Muse');
INSERT INTO `user` VALUES ('23', 'Paimon', '15595088422', '1235127682@gmail.com', 'Minerva');
INSERT INTO `user` VALUES ('24', 'Keqing', '13122109493', '0980172351@gmail.com', 'Diligentia');
INSERT INTO `user` VALUES ('25', 'Xiao', '13765722972', '123987925@gmail.com', 'Diligentia');
INSERT INTO `user` VALUES ('26', 'Zhongli', '14925189562', '1233284970@gmail.com', 'Shaw');
INSERT INTO `user` VALUES ('27', 'Qiqi', '13600287577', '3451986352@gmail.com', 'Ling');
INSERT INTO `user` VALUES ('28', 'Yanfei', '13513263913', '1231897893@gmail.com', 'Ling');
INSERT INTO `user` VALUES ('29', 'Alhaitham', '14983774132', '3519826352@gmail.com', 'Minerva');
INSERT INTO `user` VALUES ('30', 'Dehya', '14907399734', '3451263525@gmail.com', 'Minerva');
