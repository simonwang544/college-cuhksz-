USE proj;

INSERT INTO User (UserID, UserName, Phone, Email, UserAddress) VALUES
(1, 'Mona', '13567051078', '1093582973@gmail.com', 'Muse'),
(2, 'Amber', '13184528242', '2220367206@gmail.com', 'Shaw'),
(3, 'Barbara', '13282815150', '37453128830@gmail.com', 'Diligentia'),
(4, 'Klee', '13209664463', '41508882943@gmail.com', 'Muse'),
(5, 'Eula', '13131927136', '22868949008@gmail.com', 'Harmonia'),
(6, 'Kuki', '13192788489', '9459486771@gmail.com', 'Ling'),
(7, 'Collei', '13378019004', '0048338270@gmail.com', 'Muse'),
(8, 'Nolle', '13694989152', '1290375058@gmail.com', 'Diligentia'),
(9, 'Fischl', '13219846403', '7699922263@gmail.com', 'Shaw'),
(10, 'Kirara', '13679682498', '2141419682@gmail.com', 'Shaw'),
(11, 'Dori', '13185715616', '2683423803@gmail.com', 'Ling'),
(12, 'Yelan', '13184909722', '5397262751@gmail.com', 'Harmonia'),
(13, 'Xiangling', '13270087930', '26715776149@gmail.com', 'Harmonia'),
(14, 'Ningguang', '13643705018', '88818324566@gmail.com', 'Ling'),
(15, 'Albedo', '13230921235', '124109284@gmail.com', 'Shaw'),
(16, 'Mika', '13628951286', '4835729345@gmail.com', 'Shaw'),
(17, 'Kaeya', '13178302583', '32574938759@gmail.com', 'Ling'),
(18, 'Diluc', '13112857398', '4326434872@gmail.com', 'Harmonia'),
(19, 'Jean', '13245906931', '35433335234@gmail.com', 'Harmonia'),
(20, 'Tighnari', '13670394851', '257067432@gmail.com', 'Ling'),
(21, 'Aether', '15337009199', '4606880@gmail.com', 'Muse'),
(22, 'Lumine', '13731105814', '137509150@gmail.com', 'Muse'),
(23, 'Paimon', '15595088422', '1235127682@gmail.com', 'Minerva'),
(24, 'Keqing', '13122109493', '0980172351@gmail.com', 'Diligentia'),
(25, 'Xiao', '13765722972', '123987925@gmail.com', 'Diligentia'),
(26, 'Zhongli', '14925189562', '1233284970@gmail.com', 'Shaw'),
(27, 'Qiqi', '13600287577', '3451986352@gmail.com', 'Ling'),
(28, 'Yanfei', '13513263913', '1231897893@gmail.com', 'Ling'),
(29, 'Alhaitham', '14983774132', '3519826352@gmail.com', 'Minerva'),
(30, 'Dehya', '14907399734', '3451263525@gmail.com', 'Minerva');

INSERT INTO ExpressStation (StationID, StationLocation, Capacity, OpeningHours) VALUES
(1, 'Harmonia', 100, '8:00-17:00'),
(2, 'Student Center', 150, '9:00-18:00'),
(3, 'Teaching Bldg C', 120, '10:00-18:00');

INSERT INTO Store (StoreID, StoreLocation, Capacity, StoreName) VALUES
(1, 'Shaw', 100, 'Cat''s Tail'),
(2, 'Muse', 80, 'Good Hunter'),
(3, 'Diligentia', 80, 'Northland Bank');

INSERT INTO Staff (StaffID, StaffName, JoinDate, Salary, TeleNum, WorkingHours)
VALUES (1, 'Furina', '2023/10/13', 30, '19028374837', 8),
(2, 'Shenhe', '2023/3/10', 31, '12938474247', 9),
(3, 'Ganyu', '2023/12/2', 27, '12938164758', 10),
(4, 'KamisatoAyato', '2023/3/26', 29, '10284756382', 8),
(5, 'Yoimiya', '2023/6/21', 34, '12283740198', 6),
(6, 'Nilou', '2023/12/3', 33, '11283748273', 7),
(7, 'Lynette', '2023/2/2', 30, '10192834732', 4),
(8, 'Nahida', '2023/10/27', 29, '17398266453', 8),
(9, 'Paimon', '2023/6/22', 32, '18943035023', 9),
(10, 'Barbara', '2023/2/17', 31, '18133370199', 10),
(11, 'Bennett', '2023/4/28', 33, '10473272004', 7),
(12, 'Diluc', '2023/7/12', 33, '15568414981', 9),
(13, 'Fischl', '2023/11/20', 35, '11799367203', 6),
(14, 'Klee', '2023/9/9', 26, '15944644344', 6),
(15, 'Zhongli', '2023/7/15', 31, '18437550159', 6),
(16, 'Navia', '2023/12/26', 32, '13050124203', 7),
(17, 'Charlotte', '2023/1/10', 32, '12075902729', 6),
(18, 'Faruzan', '2023/7/31', 33, '12332341291', 10),
(19, 'Acheron', '2023/10/5', 26, '14682300606', 7),
(20, 'Kafka', '2023/8/31', 30, '13388823208', 9),
(21, 'Seele', '2023/10/20', 34, '18382843043', 7);

INSERT INTO Deliveryman (StaffID, PreferredArea) VALUES
(1, 'Upper Campus'),
(2, 'Lower Campus'),
(3, 'Upper Campus'),
(4, 'Lower Campus'),
(5, 'Lower Campus'),
(6, 'Upper Campus'),
(7, 'Lower Campus'),
(8, 'Lower Campus'),
(9, 'Upper Campus'),
(10, 'Lower Campus'),
(11, 'Lower Campus'),
(12, 'Upper Campus');

INSERT INTO Saleperson (StaffID, SalesCommissionRatio, StoreID) VALUES
(13.0, 0.03, 1.0),
(14.0, 0.02, 1.0),
(15.0, 0.025, 1.0),
(16.0, 0.03, 2.0),
(17.0, 0.023, 2.0),
(18.0, 0.028, 2.0),
(19.0, 0.022, 3.0),
(20.0, 0.026, 3.0),
(21.0, 0.02, 3.0);

INSERT INTO Responsible (StaffID, StationID) VALUES
(1, 2),
(1, 3),
(1, 1),
(2, 2),
(2, 3),
(2, 1),
(3, 3),
(3, 1),
(3, 2),
(4, 2),
(4, 1),
(4, 3),
(5, 1),
(6, 1),
(7, 1),
(7, 3),
(8, 3),
(9, 3),
(9, 1),
(10, 2),
(11, 1),
(11, 2),
(11, 3),
(12, 1),
(12, 3),
(12, 2);

INSERT INTO Product (ProductID, Price, ProductCondition) VALUES
(1, 43.11, 'damaged'),
(2, 12.29, 'used but not damaged'),
(3, 3.19, 'used with annonation'),
(4, 12.18, 'damaged'),
(5, 9.35, 'used but not damaged'),
(6, 4.0, 'used but not damaged'),
(7, 47.96, 'used with annonation'),
(8, 22.58, 'unused'),
(9, 15.48, 'damaged'),
(10, 37.0, 'used with annonation'),
(11, 10.74, 'used but not damaged'),
(12, 3.52, 'used but not damaged'),
(13, 18.32, 'used with annonation'),
(14, 51.81, 'unused'),
(15, 22.86, 'used but not damaged'),
(16, 24.49, 'unused'),
(17, 17.4, 'used with annonation'),
(18, 62.95, 'unused'),
(19, 21.45, 'used with annonation'),
(20, 26.97, 'used with annonation'),
(21, 15.4, 'unused'),
(22, 15.84, 'unused'),
(23, 11.4, 'used but not damaged'),
(24, 29.93, 'damaged'),
(25, 13.47, 'used with annonation'),
(26, 19.82, 'used with annonation'),
(27, 22.38, 'unused'),
(28, 20.15, 'damaged'),
(29, 33.92, 'damaged'),
(30, 17.44, 'unused'),
(31, 25.89, 'used but not damaged'),
(32, 4.84, 'damaged'),
(33, 14.32, 'used with annonation'),
(34, 7.78, 'damaged'),
(35, 29.89, 'damaged'),
(36, 29.97, 'used but not damaged'),
(37, 15.09, 'used but not damaged'),
(38, 5.07, 'used with annonation'),
(39, 30.29, 'damaged'),
(40, 35.45, 'unused'),
(41, 41.65, 'used with annonation'),
(42, 17.71, 'used with annonation'),
(43, 32.52, 'damaged'),
(44, 49.18, 'used with annonation'),
(45, 14.91, 'damaged'),
(46, 12.43, 'damaged'),
(47, 10.46, 'used but not damaged'),
(48, 22.88, 'damaged'),
(49, 1.78, 'damaged'),
(50, 42.63, 'used with annonation'),
(51, 17.53, 'used with annonation'),
(52, 12.2, 'used with annonation'),
(53, 32.83, 'used with annonation'),
(54, 20.51, 'used with annonation'),
(55, 16.95, 'used with annonation'),
(56, 35.82, 'used with annonation'),
(57, 16.73, 'used but not damaged'),
(58, 19.53, 'used but not damaged'),
(59, 43.17, 'unused'),
(60, 33.37, 'used with annonation'),
(61, 16.05, 'used but not damaged'),
(62, 45.87, 'used but not damaged'),
(63, 25.39, 'used with annonation'),
(64, 18.48, 'unused'),
(65, 24.61, 'unused'),
(66, 21.85, 'used with annonation'),
(67, 16.0, 'used with annonation'),
(68, 11.12, 'unused'),
(69, 29.46, 'used with annonation'),
(70, 10.01, 'unused'),
(71, 6.49, 'used with annonation'),
(72, 11.42, 'used but not damaged'),
(73, 1.3, 'unused'),
(74, 12.47, 'damaged'),
(75, 21.24, 'damaged'),
(76, 9.29, 'used but not damaged'),
(77, 9.19, 'used but not damaged'),
(78, 37.24, 'damaged'),
(79, 21.33, 'damaged'),
(80, 28.38, 'unused'),
(81, 31.37, 'unused'),
(82, 6.82, 'unused'),
(83, 50.62, 'damaged'),
(84, 16.21, 'unused'),
(85, 11.96, 'damaged'),
(86, 17.39, 'damaged'),
(87, 2.5, 'used but not damaged'),
(88, 35.42, 'used but not damaged'),
(89, 18.41, 'used but not damaged'),
(90, 33.44, 'unused'),
(91, 23.72, 'unused'),
(92, 28.22, 'used but not damaged'),
(93, 44.45, 'used but not damaged'),
(94, 17.16, 'unused'),
(95, 37.36, 'used but not damaged'),
(96, 29.3, 'damaged'),
(97, 36.07, 'used with annonation'),
(98, 39.72, 'used but not damaged'),
(99, 21.13, 'damaged'),
(100, 7.17, 'used but not damaged'),
(101, 11.48, 'unused'),
(102, 15.36, 'damaged'),
(103, 2.63, 'unused'),
(104, 2.17, 'unused'),
(105, 24.86, 'used with annonation'),
(106, 35.85, 'damaged'),
(107, 22.09, 'used but not damaged'),
(108, 22.17, 'used but not damaged'),
(109, 49.96, 'used but not damaged'),
(110, 38.82, 'unused'),
(111, 9.11, 'damaged'),
(112, 20.85, 'used but not damaged'),
(113, 9.81, 'unused'),
(114, 40.42, 'damaged'),
(115, 11.72, 'used but not damaged'),
(116, 2.73, 'damaged'),
(117, 16.96, 'damaged'),
(118, 36.75, 'used with annonation'),
(119, 21.98, 'unused'),
(120, 34.7, 'unused'),
(121, 0.71, 'damaged'),
(122, 6.51, 'unused'),
(123, 18.5, 'damaged'),
(124, 27.11, 'damaged'),
(125, 10.91, 'used with annonation'),
(126, 6.66, 'used but not damaged'),
(127, 26.64, 'used with annonation'),
(128, 7.69, 'unused'),
(129, 22.97, 'unused'),
(130, 22.94, 'unused'),
(131, 1.87, 'unused'),
(132, 14.97, 'unused'),
(133, 18.83, 'unused'),
(134, 52.31, 'damaged'),
(135, 2.09, 'damaged'),
(136, 11.57, 'unused'),
(137, 13.66, 'used but not damaged'),
(138, 11.83, 'damaged'),
(139, 12.85, 'unused'),
(140, 21.38, 'unused'),
(141, 19.25, 'damaged'),
(142, 29.68, 'used with annonation'),
(143, 18.05, 'used with annonation'),
(144, 21.42, 'unused'),
(145, 31.73, 'unused'),
(146, 21.86, 'used but not damaged'),
(147, 26.47, 'used but not damaged'),
(148, 40.16, 'damaged'),
(149, 18.71, 'used but not damaged'),
(150, 20.84, 'damaged'),
(151, 33.23, 'unused'),
(152, 20.75, 'used with annonation'),
(153, 16.67, 'unused'),
(154, 35.81, 'unused'),
(155, 5.44, 'damaged'),
(156, 7.5, 'damaged'),
(157, 36.06, 'used with annonation'),
(158, 38.62, 'damaged'),
(159, 34.29, 'damaged'),
(160, 17.32, 'unused'),
(161, 26.37, 'unused'),
(162, 40.42, 'used with annonation'),
(163, 27.92, 'used with annonation'),
(164, 3.55, 'damaged'),
(165, 27.37, 'damaged'),
(166, 10.42, 'used but not damaged'),
(167, 21.79, 'unused'),
(168, 4.34, 'unused'),
(169, 8.02, 'unused'),
(170, 38.99, 'damaged'),
(171, 19.37, 'unused'),
(172, 28.17, 'unused'),
(173, 9.37, 'damaged'),
(174, 26.55, 'used with annonation'),
(175, 16.58, 'unused'),
(176, 18.93, 'damaged'),
(177, 21.37, 'unused'),
(178, 5.78, 'damaged'),
(179, 7.43, 'used but not damaged'),
(180, 34.76, 'damaged'),
(181, 31.64, 'damaged'),
(182, 29.53, 'unused'),
(183, 10.92, 'damaged'),
(184, 27.7, 'used with annonation'),
(185, 24.37, 'used with annonation'),
(186, 7.12, 'damaged'),
(187, 42.25, 'used with annonation'),
(188, 35.89, 'used but not damaged'),
(189, 53.25, 'damaged'),
(190, 13.08, 'unused'),
(191, 29.66, 'unused'),
(192, 19.26, 'used with annonation'),
(193, 30.34, 'used with annonation'),
(194, 44.64, 'used but not damaged'),
(195, 8.97, 'damaged'),
(196, 8.5, 'used but not damaged'),
(197, 3.79, 'unused'),
(198, 41.04, 'damaged'),
(199, 11.9, 'used but not damaged'),
(200, 37.44, 'unused');

INSERT INTO Book(ProductID, ISBN, Title, PublicationYear, Genre, Author) VALUES
(1,'1098119444','Rust Atomics and Locks',2023,'textbook','Mara Bos'),
(2,'1119865905','The Official ACT Prep Guide 2022-2023, (Book + Online Course)',2022,'textbook','ACT'),
(4,'1484274369','Learn to Program with Assembly',2021,'textbook','Jonathan Bartlett'),
(8,'1803362812','The Unofficial Zelda Cookbook',2022,'textbook','Thibaud Villanova'),
(9,'394576500','Mapplethorpe: A Biography',1995,'fiction','Patricia Morrisroe'),
(10,'1789347394','Mastering Windows Group Policy',2018,'textbook','Jordan Krause'),
(11,'1549776673','Python',2017,'textbook','Timothy C. Needham'),
(12,'3319130714','Data Structures and Algorithms with Python (Undergraduate Topics in Computer Science)',2015,'textbook','Kent D. Lee'),
(13,'452011817','Africans and Their History',1998,'fiction','Joseph E. Harris'),
(14,'451410602','Death''s Door',2002,'fiction','Michael Slade'),
(15,'1119787335','The Official ACT Mathematics Guide',2021,'textbook','ACT'),
(16,'1593278551','Linux Basics for Hackers',2018,'textbook','OccupyTheWeb'),
(18,'109811020X','Kubernetes: Up and Running',2022,'textbook','Brendan Burns'),
(19,'156731399X','The Peaceful Warrior Collection',2000,'fiction','Dan Millman'),
(20,'044990962X','Hero''s Daughter',1994,'fiction','Maureen Murdock'),
(21,'553379690','One Hundred and One Ways',2000,'fiction','MAKO YOSHIKAWA'),
(22,'1804619620','Terraform for Google Cloud Essential Guide',2023,'textbook','Bernd Nordhausen'),
(23,'1546488332','Python (2nd Edition)',2017,'textbook','Jamie Chan'),
(24,'080246520X','Pilgrims Progress: In Today''s English',1964,'fiction','John Bunyan'),
(25,'030730261X','Ready, Set, Go!: A Counting Book (Little Golden Book)',1995,'fiction','Emma Jones'),
(26,'1803238011','Event-Driven Architecture in Golang',2022,'textbook','Michael Stack'),
(28,'1119787602','Python All-in-One For Dummies (For Dummies (Computer/Tech))',2021,'textbook','John C. Shovic'),
(29,'1838987339','Unity 2020 Mobile Game Development',2020,'textbook','John P. Doran'),
(30,'157345320X','Praise to the Man',1997,'fiction','Larry Barkdull'),
(31,'330311115','Greenmantle: A New Tale of Magic &amp; Wonder',1992,'fiction','Charles De Lint'),
(32,'1119658810','AWS Certified Security Study Guide',2021,'textbook','Marcello Zillo Neto'),
(33,'1098117816','Software Architecture',2021,'textbook','Neal Ford'),
(34,'515135283','Without Fail',2003,'fiction','Lee Child'),
(35,'1449357016','Python Pocket Reference',2014,'textbook','Mark Lutz'),
(36,'154101636X','Blue Team Field Manual (BTFM) (RTFM)',2017,'textbook','Alan J White'),
(37,'1576730700','Wise Man''s House (Palisades Pure Romance)',1997,'fiction','Melody Carlson'),
(38,'847818721','Great Pasta Sauces',1995,'fiction','Sally Griffiths'),
(40,'525230211','Water dog: revolutionary rapid training method,',1964,'fiction','Richard A Wolters'),
(41,'168050696X','Powerful Command-Line Applications in Go',2022,'textbook','Ricardo Gerardi'),
(42,'340728620','The Rainbow Journey',1999,'fiction','Brenda Davies'),
(43,'345330021','King of the Murgos (Malloreon, Book 2)',1988,'fiction','David Eddings'),
(44,'999081411','The Complete Software Developer''s Career Guide',2017,'textbook','John Sonmez'),
(45,'75574179','A History of the Modern World',1991,'fiction','R. R. Palmer'),
(46,'440486815','Thimble Summer (Yearling Newbery)',1987,'fiction','Elizabeth Enright'),
(47,'1578512611','Unleashing the Killer App: Digital Strategies for Market Dominance',2000,'fiction','Larry Downes'),
(48,'192800442','The Dictionary of Cricket',1996,'fiction','Michael Rundell'),
(49,'1737384426','Ultimate Go Notebook',2021,'textbook','William Kennedy'),
(51,'373263716','Singing The Sadness (Worldwide Library Mysteries)',2001,'fiction','Reginald Hill'),
(52,'180323654X','Mastering Windows Security and Hardening',2022,'textbook','Mark Dunkerley'),
(53,'1316519333','The Principles of Deep Learning Theory',2022,'textbook','Daniel A. Roberts'),
(54,'149322302X','Python 3',2022,'textbook','Johannes Ernesti'),
(55,'1840789336','Windows 11 for Seniors in easy steps',2022,'textbook','Michael Price'),
(56,'671014730','SHE''S COME UNDONE (Oprah''s Book Club (Hardcover))',1997,'fiction','Wally Lamb'),
(57,'937721735','All-American Low-Fat Meals in Minutes: Recipes and Menus for Special Occasions or Every Day',1991,'fiction','M.J. Smith'),
(58,'752215329','In Search of British Heroes: A Companion to the Channel 4 Series Fact or Fiction',2003,'fiction','Tony Robinson'),
(59,'080755393X','The Mystery in the Snow (Boxcar Children Mysteries, 32)',1992,'fiction','Gertrude Chandler Warner'),
(60,'451198859','Never Sorry: A Leigh Koslow Mystery (Leigh Koslow Mystery Series)',1999,'fiction','Edie Claire'),
(61,'1098108302','Fundamentals of Data Engineering',2022,'textbook','Joe Reis'),
(62,'1803239867','Elevating Game Experiences with Unreal Engine 5',2022,'textbook','Goncalo Marques'),
(63,'1837630518','Mastering Linux Security and Hardening',2023,'textbook','Donald A. Tevault'),
(64,'804113475','Ladder of Years',1997,'fiction','Anne Tyler'),
(65,'1838430210','Understanding Distributed Systems, Second Edition',2022,'textbook','Roberto Vitillo'),
(66,'692980652','Retro Game Dev: C64 Edition (RetroGameDev)',2017,'textbook','Derek Morris'),
(67,'1544511817','YouTube Secrets:',2018,'textbook','Sean Cannell'),
(68,'446606243','The Tenth Justice',1998,'fiction','Brad Meltzer'),
(69,'1617293709','Grokking Deep Learning',2019,'textbook','Andrew Trask'),
(70,'133769402','Assembly Language for x86 Processors',2014,'textbook','Kip Irvine'),
(71,'1803240636','Microsoft Certified Azure Data Fundamentals (Exam DP-900) Certification Guide',2022,'textbook','Marcelo Leite'),
(73,'1551664917','Charm School',1999,'fiction','Susan Wiggs'),
(74,'1930353316','Secret Under the Floorboard (Sammy and Brian Mystery)',2001,'fiction','Ken Munro'),
(75,'1502958082','xchg rax,rax',2014,'textbook','xorpd'),
(76,'1617292230','Grokking Algorithms',2016,'textbook','Aditya Bhargava'),
(77,'912697083','The Crooked Pitch: An Account of the Curveball in American Baseball History',1984,'fiction','Martin Quigley'),
(79,'1803232579','Functional Python Programming',2022,'textbook','Steven F. Lott'),
(82,'1492052590','Programming Rust',2021,'textbook','Jim Blandy'),
(83,'8429729941','Reflexions de sala i alcova',1995,'fiction','Ramon Solsona'),
(84,'984782869','Cracking the Coding Interview',2015,'textbook','Gayle Laakmann McDowell'),
(85,'425163970','A Touch of the Grape (Hemlock Falls Mysteries)',1998,'fiction','Claudia Bishop'),
(86,'1803241438','Learn Java 17 Programming',2022,'textbook','Nick Samoylov'),
(89,'380725150','Black Hornet (New Orleans Mystery)',1996,'fiction','James Sallis'),
(90,'1572229160','Sql Guide (Quick Study',2005,'textbook','Inc. BarCharts'),
(91,'3499170523','Anatomie der menschlichen Destruktivit',1996,'fiction','Erich Fromm'),
(92,'648098737','Raspberry Pi Operating System Assembly Language',2021,'textbook','Bruce Smith'),
(93,'195032721','Science Fiction: A Historical Anthology (Galaxy Books)',1983,'fiction','Eric S. Rabkin'),
(94,'1647824192','Power and Prediction',2022,'textbook','Ajay Agrawal'),
(95,'1492043451','Fundamentals of Software Architecture',2020,'textbook','Mark Richards'),
(97,'807041653','Beyond God the Father Toward a Philosoph',1974,'fiction','Mary Daly'),
(99,'1491952024','JavaScript',2020,'textbook','David Flanagan'),
(100,'1119002257','Storytelling with Data',2015,'textbook','Cole Nussbaumer Knaflic'),
(101,'821762966','Enduring Love (Zebra Bouquet Romances, No 6)',1999,'fiction','Ann Josephson'),
(102,'1736526723','LFM',2021,'textbook','Tim Bryant'),
(103,'1801810214','An Ethical Guide to Cyber Anonymity',2022,'textbook','Kushantha Gunawardana'),
(104,'1803242396','Microsoft Cybersecurity Architect Exam Ref SC-100',2023,'textbook','Dwayne Natwick'),
(105,'1718501544','Bug Bounty Bootcamp',2021,'textbook','Vickie Li'),
(106,'679745963','The Man on the Balcony: The Story of a Crime (Vintage Crime/Black Lizard)',1993,'fiction','Maj Sjowall'),
(107,'345386663','Garfield Pulls His Weight (No. 26)',1994,'fiction','Jim Davis'),
(108,'593450957','Princeton Review AP World History: Modern Prep, 2023',2022,'textbook','The Princeton Review'),
(110,'446521663','Host Family',2000,'fiction','Mameve Medwed'),
(111,'394825683','Emperors New Clothes',1995,'fiction','Disney Book Club'),
(112,'1098118731','The Staff Engineer''s Path',2022,'textbook','Tanya Reilly'),
(114,'804106665','Paris 2005',1991,'fiction','Carlo Zezza'),
(115,'037382503X','Tyler #3 Wisconsin Wedding (Tyler, No 3)',1992,'fiction','Carla Neggers'),
(117,'1718502702','Python Crash Course, 3rd Edition',2023,'textbook','Eric Matthes'),
(118,'1801075271','Hands-On Microsoft Teams',2021,'textbook','Joao Ferreira'),
(119,'446612618','A Kiss Remembered',2003,'fiction','Sandra Brown'),
(120,'1491927577','Linux Pocket Guide',2016,'textbook',' Daniel Barrett '),
(121,'8481301485','El Amante De L. Chaterley',2001,'fiction','D. H. Lawrence'),
(122,'1804613878','Clean Code in PHP',2022,'textbook','Carsten Windler'),
(123,'1098121953','C# 10 in a Nutshell',2022,'textbook','Joseph Albahari'),
(124,'1801072329','Learning Tableau 2022',2022,'textbook','Joshua N. Milligan'),
(125,'970575203','Tickles Tabitha''s Cancer-tankerous Mommy',2001,'fiction','Amelia Frahm'),
(126,'173543115X','Hypothesis Testing',2020,'textbook','Jim Frost'),
(128,'149207294X','Practical Statistics for Data Scientists:',2020,'textbook','Peter Bruce'),
(129,'590939599','Go Eat Worms! (Goosebumps Presents TV Book #9)',1997,'fiction','Tracey West'),
(130,'1801071101','Expert Python Programming',2021,'textbook','Michal Jaworski'),
(133,'814806406','Bosch',2000,'fiction','Joseph Emile Muller'),
(134,'373264771','Crazy Love (Wwl Mystery, 477)',2003,'fiction','Steve Brewer'),
(135,'1119846471','Windows 11 For Dummies',2021,'textbook','Andy Rathbone'),
(136,'1492082791','Software Engineering at Google',2020,'textbook','Titus Winters'),
(137,'1800564244','CompTIA Security+',2020,'textbook','Ian Neil'),
(138,'553246526','Incredible Journey',1978,'fiction','Sheila Burnford'),
(139,'1800562659','Microsoft Azure Security Technologies Certification and Beyond',2021,'textbook','David Okeyode'),
(140,'671677128','LIGHT A SINGLE CANDLE',1989,'fiction','David Butler'),
(141,'517480859','Walt Disney World and Epcot Center',1986,'fiction','V. Childs'),
(142,'1617296864','Deep Learning with Python, Second Edition',2021,'textbook','Francois Chollet'),
(143,'1801812446','Unreal Engine 5 Character Creation, Animation, and Cinematics',2022,'textbook','Henk Venter'),
(144,'201633612','Design Patterns',1994,'textbook','Erich Gamma'),
(145,'645127965','Learning Microsoft Intune',2023,'textbook','Scott Duffey'),
(146,'2253064459','La Bicyclette bleue, tome 4 : Noir tango',1993,'fiction','Rgine Deforges'),
(148,'515117870','The Gambler',1995,'fiction','Lois Greiman'),
(149,'1801073872','Sculpting the Blender Way',2022,'textbook','Xury Greer'),
(150,'60972459','Tracks RI',2004,'fiction','Louise Erdrich'),
(151,'28612434','The Unofficial Guide to Atlanta (3rd ed. Serial.)',1996,'fiction','Fred Brown'),
(152,'910313059','Caring Is What Counts, No. 5 (Tale from the Care Bears)',1983,'fiction','Ward Johnson'),
(153,'1492045527','Deep Learning for Coders with Fastai and PyTorch:',2020,'textbook','Jeremy Howard'),
(155,'1727521900','Computer Programming: The Bible',2018,'textbook','CyberPunk Architects'),
(156,'225313998X','L''homme nu',1996,'fiction','Simmons d.'),
(157,'843949562','Judas Eyes',2002,'fiction','Barry Hoffman'),
(158,'1264268963','Mike Meyers'' CompTIA Network+ Certification Passport, Seventh Edition (Exam N10-008) (Mike Meyers'' Certification Passport)',44719,'textbook','Jonathan Weissman'),
(159,'893037893','Programming the 65816',2015,'textbook','David Eyes'),
(160,'1838556370','Practical Threat Intelligence and Data-Driven Threat Hunting',2021,'textbook','Valentina Costa-Gazcn'),
(162,'1672429730','Kali Linux Hacking',2019,'textbook','Ethem Mining'),
(163,'1800569009','AWS Certified Machine Learning Specialty',2021,'textbook','Somanath Nanda'),
(164,'525459243','Winnie the Pooh Storybook Treasury',0,'fiction','A A Milne'),
(165,'578973839','Ace the Data Science Interview',2021,'textbook','Nick Singh'),
(166,'1801813094','Certified Ethical Hacker (CEH) v12 312-50 Exam Guide',2022,'textbook','Dale Meredith'),
(168,'1565048628','Court of All Kings: A Changeling : The Dreaming Novel (Immortal Eyes, Book 3)',1996,'fiction','Jackie Cassada'),
(170,'63046067','Build',2022,'textbook','Tony Fadell'),
(171,'1118008189','HTML and CSS',2011,'textbook','Jon Duckett'),
(172,'1956630198','Securing Microsoft 365',2022,'textbook','Joe Stocker'),
(173,'1423244230','Python Standard Library',2020,'textbook','Berajah Jayne'),
(175,'981166045X','Geometry of Deep Learning',2022,'textbook','Jong Chul Ye'),
(177,'1617299596','100 Go Mistakes and How to Avoid Them',2022,'textbook','Teiva Harsanyi'),
(178,'1945051752','SQL QuickStart Guide',2019,'textbook','Walter Shields'),
(179,'821734970','Defiant Ecstasy',1991,'fiction','Janelle Taylor'),
(180,'1636100007','HTML and CSS QuickStart Guide',2021,'textbook','David DuRocher'),
(181,'1788297237','Mastering Microsoft Power BI',2018,'textbook','Brett Powell'),
(182,'1119830729','Excel All-in-One For Dummies (For Dummies (Computer/Tech))',2021,'textbook','Paul McFedries'),
(183,'1484250753','Beginning x64 Assembly Programming',2019,'textbook','Jo Van Hoey'),
(184,'1484240626','Modern X86 Assembly Language Programming',2018,'textbook','Daniel Kusswurm'),
(185,'1800560419','Data Engineering with AWS',2021,'textbook','Gareth Eagar'),
(186,'933478208','Chronic Fatigue Syndrome and the Yeast Connection: A Get-Well Guide for People With This Often Misunderstood Illness--And Those Who Care for Them',1992,'fiction','William G. Crook'),
(187,'451626222','Ovid the Metamorphoses',1960,'fiction','Horace Gregory'),
(188,'1098135121','Learning eBPF',2023,'textbook','Liz Rice'),
(189,'1492077216','Learning Go',2021,'textbook','Jon Bodner'),
(190,'1119705150','MCA Microsoft Certified Associate Azure Administrator Study Guide',2022,'textbook','Rithin Skaria'),
(191,'723002746','Times Concise Atlas of the World',1985,'fiction','Times Books'),
(192,'1492050202','Linux Observability with BPF',2019,'textbook','David Calavera'),
(193,'1951204042','A Programmer''s Guide to Computer Science Vol. 2',2020,'textbook','William M. Springer II'),
(194,'1718501129','Black Hat Python, 2nd Edition',2021,'textbook','Justin Seitz'),
(196,'380545020','Bet You Can''t!',1983,'fiction','Vicki Cobb'),
(197,'394744292','The Firefighter''s Cookbook',1986,'fiction','John Sineno'),
(198,'1804614017','Transitioning to Java',2023,'textbook','Ken Fogel'),
(199,'821732056','Wild Texas Heart',1990,'fiction','Deana James'),
(200,'1593080603','The Prince and Other Writings (Barnes &amp; Noble Classics)',2003,'fiction','Niccolo Machiavelli');

INSERT INTO Note (ProductID, TargetCourse) VALUES
(3, 'MAT1002'),
(5, 'CSC3002'),
(6, 'CSC1002'),
(7, 'MAT1001'),
(17, 'CSC3050'),
(27, 'MAT1001'),
(39, 'DDA4210'),
(50, 'MAT2040'),
(72, 'CSC3150'),
(78, 'MAT3007'),
(80, 'DDA4210'),
(81, 'BIO1008'),
(87, 'CSC3050'),
(88, 'CSC3150'),
(96, 'CSC3050'),
(98, 'BIO1008'),
(109, 'CSC4001'),
(113, 'CSC3050'),
(116, 'BIO1008'),
(127, 'CSC3002'),
(131, 'DDA4210'),
(132, 'CSC3050'),
(147, 'CSC3150'),
(154, 'BIO1008'),
(161, 'CSC2003'),
(167, 'CSC3150'),
(169, 'MAT1002'),
(174, 'CSC2003'),
(176, 'CSC4001'),
(195, 'CSC3170');

INSERT INTO Porder (OrderID, OrderDate, OrderStatus, OrderType, TotalPrice, SalepersonID, UserID, DeliverID, StationID) VALUES
(1, '2023/1/4', 'Done', 'Purchased', 2.13, 13, 23, 9, 2),
(2, '2023/1/4', 'Done', 'Purchased', 3.15, 15, 23, 4, 2),
(3, '2023/1/14', 'Done', 'Purchased', 0.33, 17, 11, 2, 3),
(4, '2023/1/15', 'Done', 'Purchased', 2.65, 13, 14, 8, 1),
(5, '2023/1/15', 'Done', 'Purchased', 4.47, 15, 11, 2, 2),
(6, '2023/1/27', 'Done', 'Purchased', 1.61, 17, 26, 1, 3),
(7, '2023/1/30', 'Done', 'Purchased', 4.46, 16, 20, 5, 2),
(8, '2023/2/3', 'Done', 'Purchased', 3.02, 15, 24, 3, 1),
(9, '2023/2/20', 'Done', 'Purchased', 3.98, 18, 22, 9, 3),
(10, '2023/2/22', 'Done', 'Purchased', 1.5, 17, 4, 10, 3),
(11, '2023/2/24', 'Done', 'Purchased', 3.15, 17, 8, 10, 1),
(12, '2023/3/6', 'Done', 'Purchased', 2.36, 16, 3, 8, 3),
(13, '2023/3/10', 'Done', 'Purchased', 1.44, 20, 7, 5, 1),
(14, '2023/3/14', 'Done', 'Purchased', 3.67, 15, 24, 5, 2),
(15, '2023/3/21', 'Done', 'Purchased', 3.99, 20, 3, 10, 2),
(16, '2023/3/22', 'Done', 'Sold', 0.0, 16, 5, 9, 1),
(17, '2023/3/25', 'Done', 'Sold', 0.0, 16, 9, 9, 2),
(18, '2023/4/2', 'Done', 'Purchased', 4.87, 14, 13, 7, 2),
(19, '2023/4/4', 'Done', 'Purchased', 2.35, 20, 17, 3, 3),
(20, '2023/4/18', 'Done', 'Purchased', 1.8, 19, 2, 1, 3),
(21, '2023/5/9', 'Done', 'Purchased', 3.63, 19, 20, 11, 2),
(22, '2023/5/19', 'Done', 'Sold', 0.0, 15, 7, 7, 1),
(23, '2023/5/23', 'Done', 'Purchased', 4.22, 15, 29, 11, 1),
(24, '2023/6/2', 'Done', 'Purchased', 1.46, 17, 13, 10, 1),
(25, '2023/6/4', 'Done', 'Sold', 0.0, 20, 21, 3, 1),
(26, '2023/6/11', 'Done', 'Sold', 0.0, 15, 19, 10, 2),
(27, '2023/6/16', 'Done', 'Sold', 0.0, 14, 28, 10, 2),
(28, '2023/7/3', 'Done', 'Purchased', 4.88, 21, 6, 5, 2),
(29, '2023/7/22', 'Done', 'Purchased', 1.18, 17, 11, 5, 3),
(30, '2023/7/25', 'Done', 'Purchased', 1.21, 13, 5, 8, 1),
(31, '2023/8/6', 'Done', 'Sold', 0.0, 19, 18, 12, 1),
(32, '2023/8/7', 'Done', 'Sold', 0.0, 20, 21, 11, 2),
(33, '2023/8/7', 'Done', 'Purchased', 3.68, 21, 15, 7, 3),
(34, '2023/8/7', 'Done', 'Purchased', 4.12, 17, 1, 8, 3),
(35, '2023/8/9', 'Done', 'Sold', 0.0, 20, 17, 3, 3),
(36, '2023/8/9', 'Done', 'Sold', 0.0, 18, 10, 3, 3),
(37, '2023/8/24', 'Done', 'Purchased', 2.85, 17, 5, 3, 1),
(38, '2023/8/31', 'Done', 'Sold', 0.0, 19, 16, 2, 1),
(39, '2023/9/1', 'Done', 'Purchased', 3.74, 21, 11, 6, 3),
(40, '2023/9/10', 'Done', 'Sold', 0.0, 13, 7, 4, 1),
(41, '2023/9/15', 'Done', 'Sold', 0.0, 15, 2, 8, 1),
(42, '2023/9/22', 'Done', 'Sold', 0.0, 15, 2, 3, 1),
(43, '2023/10/1', 'Done', 'Sold', 0.0, 18, 13, 12, 3),
(44, '2023/10/3', 'Done', 'Sold', 0.0, 19, 25, 6, 1),
(45, '2023/10/11', 'Done', 'Purchased', 4.28, 15, 22, 10, 3),
(46, '2023/10/17', 'Done', 'Sold', 0.0, 14, 17, 10, 1),
(47, '2023/11/14', 'Done', 'Purchased', 1.7, 13, 8, 2, 2),
(48, '2023/11/17', 'To be fetched', 'Purchased', 2.39, 18, 15, 12, 3),
(49, '2023/11/17', 'Paid', 'Purchased', 1.91, 19, 9, 11, 1),
(50, '2023/11/25', 'To be fetched', 'Sold', 0.0, 18, 8, 9, 3),
(51, '2023/11/26', 'To be fetched', 'Purchased', 0.66, 19, 25, 5, 1),
(52, '2023/12/3', 'Paid', 'Purchased', 1.59, 19, 12, 9, 3),
(53, '2023/12/22', 'Paid', 'Purchased', 1.12, 15, 4, 10, 2),
(54, '2023/12/22', 'Paid', 'Purchased', 0.64, 13, 13, 6, 3),
(55, '2024/1/1', 'To be fetched', 'Purchased', 2.6, 14, 17, 12, 1),
(56, '2024/1/17', 'Done', 'Purchased', 2.06, 15, 18, 7, 3),
(57, '2024/1/24', 'Done', 'Sold', 0.0, 14, 18, 12, 1),
(58, '2024/2/3', 'Done', 'Sold', 0.0, 15, 28, 3, 1),
(59, '2024/2/9', 'Paid', 'Purchased', 4.92, 18, 25, 10, 3),
(60, '2024/2/10', 'Done', 'Purchased', 4.83, 15, 30, 8, 3),
(61, '2024/2/12', 'Paid', 'Purchased', 3.98, 17, 24, 11, 1),
(62, '2024/2/15', 'Done', 'Purchased', 0.44, 13, 18, 6, 2),
(63, '2024/2/29', 'Paid', 'Sold', 0.0, 21, 8, 8, 1),
(64, '2024/3/3', 'Paid', 'Purchased', 3.83, 16, 7, 1, 1),
(65, '2024/3/9', 'Done', 'Sold', 0.0, 20, 9, 6, 2),
(66, '2024/3/9', 'Done', 'Purchased', 2.85, 14, 13, 10, 2),
(67, '2024/3/16', 'To be fetched', 'Purchased', 0.03, 19, 28, 8, 1),
(68, '2024/3/21', 'To be fetched', 'Sold', 0.0, 16, 2, 2, 3),
(69, '2024/3/21', 'Done', 'Purchased', 3.91, 15, 1, 8, 2),
(70, '2024/3/22', 'Done', 'Sold', 0.0, 19, 13, 2, 2),
(71, '2024/3/22', 'Done', 'Purchased', 0.36, 17, 7, 10, 1),
(72, '2024/3/24', 'Done', 'Sold', 0.0, 21, 18, 7, 2),
(73, '2024/3/31', 'To be fetched', 'Sold', 0.0, 18, 9, 2, 2),
(74, '2024/4/3', 'Paid', 'Sold', 0.0, 20, 7, 11, 1),
(75, '2024/4/14', 'Done', 'Sold', 0.0, 17, 27, 1, 3),
(76, '2024/4/18', 'Paid', 'Purchased', 0.35, 14, 15, 9, 1);

INSERT INTO OrderProduct (OrderId, ProductID) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 13),
(5, 14),
(5, 15),
(6, 16),
(6, 17),
(6, 18),
(6, 19),
(7, 20),
(7, 21),
(7, 22),
(7, 23),
(7, 24),
(7, 25),
(8, 26),
(8, 27),
(8, 28),
(8, 29),
(9, 30),
(9, 31),
(9, 32),
(10, 33),
(10, 34),
(10, 35),
(10, 36),
(10, 37),
(10, 38),
(11, 39),
(11, 40),
(11, 41),
(11, 42),
(11, 43),
(11, 44),
(12, 45),
(12, 46),
(12, 47),
(12, 48),
(12, 49),
(13, 50),
(13, 51),
(13, 52),
(13, 53),
(13, 54),
(14, 55),
(14, 56),
(14, 57),
(15, 58),
(15, 59),
(15, 60),
(15, 61),
(15, 62),
(16, 25),
(16, 29),
(16, 50),
(16, 59),
(17, 4),
(17, 34),
(18, 63),
(18, 64),
(18, 65),
(19, 66),
(19, 67),
(19, 68),
(20, 69),
(20, 70),
(21, 71),
(21, 72),
(21, 73),
(21, 74),
(21, 75),
(21, 76),
(22, 21),
(22, 35),
(22, 44),
(22, 58),
(22, 68),
(23, 77),
(23, 78),
(23, 79),
(24, 80),
(24, 81),
(24, 82),
(24, 83),
(24, 84),
(24, 85),
(25, 48),
(25, 55),
(25, 57),
(26, 5),
(26, 16),
(26, 31),
(26, 37),
(26, 45),
(26, 51),
(26, 70),
(26, 79),
(26, 80),
(27, 52),
(27, 65),
(28, 86),
(28, 87),
(28, 88),
(28, 89),
(28, 90),
(28, 91),
(29, 92),
(29, 93),
(29, 94),
(30, 95),
(30, 96),
(30, 97),
(30, 98),
(30, 99),
(31, 13),
(31, 41),
(31, 61),
(31, 74),
(31, 75),
(31, 78),
(32, 26),
(32, 63),
(32, 88),
(32, 95),
(33, 100),
(33, 101),
(34, 102),
(34, 103),
(34, 104),
(34, 105),
(35, 7),
(35, 22),
(35, 36),
(35, 47),
(35, 49),
(35, 60),
(35, 66),
(35, 73),
(35, 90),
(35, 99),
(36, 11),
(36, 18),
(36, 32),
(36, 64),
(36, 82),
(36, 91),
(37, 106),
(37, 107),
(37, 108),
(37, 109),
(37, 110),
(37, 111),
(37, 112),
(37, 113),
(38, 72),
(38, 83),
(38, 93),
(38, 97),
(38, 98),
(38, 101),
(38, 105),
(39, 114),
(39, 115),
(39, 116),
(40, 12),
(40, 56),
(40, 71),
(40, 112),
(41, 6),
(41, 8),
(41, 19),
(41, 20),
(41, 76),
(41, 104),
(41, 116),
(42, 10),
(42, 14),
(42, 38),
(42, 77),
(42, 113),
(42, 114),
(43, 3),
(43, 86),
(43, 92),
(43, 96),
(44, 2),
(44, 23),
(44, 100),
(44, 106),
(44, 108),
(45, 117),
(45, 118),
(45, 119),
(46, 9),
(46, 27),
(46, 28),
(46, 30),
(46, 107),
(46, 110),
(46, 115),
(47, 120),
(47, 121),
(47, 122),
(47, 123),
(48, 124),
(48, 125),
(48, 126),
(48, 127),
(48, 128),
(49, 129),
(49, 130),
(49, 131),
(49, 132),
(49, 133),
(49, 134),
(49, 135),
(50, 94),
(51, 136),
(51, 137),
(51, 138),
(51, 139),
(51, 140),
(51, 141),
(51, 142),
(52, 143),
(52, 144),
(52, 145),
(52, 146),
(52, 147),
(53, 148),
(53, 149),
(53, 150),
(53, 151),
(53, 152),
(54, 153),
(55, 154),
(55, 155),
(55, 156),
(55, 157),
(56, 158),
(56, 159),
(56, 160),
(56, 161),
(57, 146),
(58, 111),
(59, 162),
(59, 163),
(59, 164),
(60, 165),
(60, 166),
(60, 167),
(60, 168),
(60, 169),
(60, 170),
(61, 171),
(61, 172),
(61, 173),
(61, 174),
(62, 175),
(62, 176),
(62, 177),
(62, 178),
(63, 15),
(63, 118),
(63, 141),
(63, 142),
(63, 151),
(63, 166),
(64, 179),
(64, 180),
(64, 181),
(64, 182),
(65, 69),
(65, 84),
(65, 129),
(65, 149),
(65, 152),
(65, 157),
(65, 164),
(65, 167),
(65, 176),
(65, 181),
(66, 183),
(66, 184),
(66, 185),
(67, 186),
(67, 187),
(67, 188),
(68, 53),
(69, 189),
(69, 190),
(69, 191),
(69, 192),
(69, 193),
(70, 85),
(70, 139),
(70, 175),
(70, 179),
(70, 190),
(71, 194),
(71, 195),
(72, 109),
(72, 126),
(72, 172),
(72, 178),
(72, 183),
(72, 186),
(73, 39),
(73, 137),
(73, 140),
(73, 147),
(73, 148),
(73, 170),
(73, 173),
(73, 177),
(74, 67),
(74, 134),
(74, 180),
(74, 182),
(74, 191),
(74, 195),
(75, 33),
(75, 40),
(75, 46),
(75, 54),
(75, 117),
(75, 136),
(75, 150),
(75, 162),
(76, 196),
(76, 197),
(76, 198),
(76, 199),
(76, 200);