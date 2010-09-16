-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: zazabe
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.6

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author` bigint(20) NOT NULL,
  `position` bigint(20) DEFAULT NULL,
  `root_id` bigint(20) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_idx` (`author`),
  CONSTRAINT `article_author_dm_user_id` FOREIGN KEY (`author`) REFERENCES `dm_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,1,-1,21,11,12,2),(2,1,-2,21,17,18,2),(3,1,-3,21,15,16,2),(4,1,-4,21,3,4,2),(5,1,-5,21,5,6,2),(6,1,-6,21,7,8,2),(21,1,-7,21,1,20,0),(22,1,-8,21,10,13,1),(23,1,-9,21,14,19,1),(24,1,-10,21,2,9,1);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_dm_media`
--

DROP TABLE IF EXISTS `article_dm_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_dm_media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_media_id` bigint(20) NOT NULL,
  `dm_record_id` bigint(20) NOT NULL,
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `record_dm_media_idx` (`dm_record_id`,`dm_media_id`),
  KEY `dm_media_id_idx` (`dm_media_id`),
  KEY `dm_record_id_idx` (`dm_record_id`),
  CONSTRAINT `article_dm_media_dm_media_id_dm_media_id` FOREIGN KEY (`dm_media_id`) REFERENCES `dm_media` (`id`) ON DELETE CASCADE,
  CONSTRAINT `article_dm_media_dm_record_id_article_id` FOREIGN KEY (`dm_record_id`) REFERENCES `article` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_dm_media`
--

LOCK TABLES `article_dm_media` WRITE;
/*!40000 ALTER TABLE `article_dm_media` DISABLE KEYS */;
INSERT INTO `article_dm_media` VALUES (41,8,1,0),(42,7,22,-19),(43,9,23,-20),(44,10,3,0),(45,11,3,3),(46,12,3,2),(47,13,3,1),(48,14,2,0),(49,15,2,1),(50,16,2,2),(51,17,2,3),(52,18,24,-21),(53,19,4,-22),(54,20,5,-23),(55,21,6,-24),(56,22,6,-25);
/*!40000 ALTER TABLE `article_dm_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_dm_tag`
--

DROP TABLE IF EXISTS `article_dm_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_dm_tag` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `dm_tag_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`dm_tag_id`),
  KEY `article_dm_tag_dm_tag_id_dm_tag_id` (`dm_tag_id`),
  CONSTRAINT `article_dm_tag_dm_tag_id_dm_tag_id` FOREIGN KEY (`dm_tag_id`) REFERENCES `dm_tag` (`id`) ON DELETE CASCADE,
  CONSTRAINT `article_dm_tag_id_article_id` FOREIGN KEY (`id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_dm_tag`
--

LOCK TABLES `article_dm_tag` WRITE;
/*!40000 ALTER TABLE `article_dm_tag` DISABLE KEYS */;
INSERT INTO `article_dm_tag` VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(2,6),(3,7),(3,8),(3,9),(4,10),(1,11),(4,11),(5,12),(6,14),(5,24);
/*!40000 ALTER TABLE `article_dm_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_translation`
--

DROP TABLE IF EXISTS `article_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `extract` text COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `article_translation_id_article_id` FOREIGN KEY (`id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_translation`
--

LOCK TABLES `article_translation` WRITE;
/*!40000 ALTER TABLE `article_translation` DISABLE KEYS */;
INSERT INTO `article_translation` VALUES (1,'Sciopta - Real-time embedded system','The project, developed in C++, was to view the PPP frames exchanged during the use of this connection between a client and a server','# # What Sciopta?\r\nThe Sciopta company is based in  Weil em Rhein, Germany and is specialized in embedded computing.\r\nFor 18 months they developed a real-time embedded operating system named SCIOPTA, which is composed of a basic real-time kernel and libraries implementing a network protocol stack.\r\nThis operating system, version 1.0.0, is intended eventually to work on different targets and particularly on X86 cards.\r\n\r\nThe features of this operating system are:\r\n- Graphical configuration of the application\r\n- Real time system\r\n- The application can fit on a floppy and then be flashed\r\n\r\nThe physical environment of the target board is then reduced to a motherboard, a serial port and an Ethernet port. Current networks implement sockets either by Ethernet or PPP connection.\r\n\r\n# # PPP frames visualization project \r\nThe project, developed in C++, is to view the PPP frames exchanged during the use of this connection between a client and a server. Somebody located on the client performs commands on a remote server connected to the operative part to provide material to display frames exchanged. To demonstrate the capabilities of our application, the kernel will be sometimes the client and sometimes server.\r\n\r\nThe project is designed under Windows, but the core application files are compiled by a cross-compiler, which is available on Linux. Because of this constraint, we use a Linux emulator, Cygwin, which allowed us to take advantage of the Windows environment.\r\n\r\nThe small size of the nucleus SCIOPTA can run on a floppy disk booting through grub, but we have preferred to always use the same disk for the two demonstrations by downloading the necessary files with grub via the TFTP protocol. ',1,'fr','2010-08-27 15:20:56','2010-09-03 15:56:16',3),(2,'PhotoZama - personalized photo library','I completely designed and made this application during a period of three months in Madagascar for the NGO [Vozama](http://www.vozama.org \"Vozama - Sauvons les enfants malgache\").\r\nThe goal is to manage a library of tens of thousands photos.','I completely designed and made this application during a period of three months in Madagascar for the NGO [Vozama](http://www.vozama.org \"Vozama - Sauvons les enfants malgache\").\r\nThe goal is to manage a library of tens of thousands photos.\r\n\r\n# # The NGO VOZAMA\r\nVOZAMA is an NGO which has 4 main objectives:\r\n\r\n- Teach children not attending school and put them in the rails of a 2 years public or private school period.\r\n- Monitor them until the end of primary school (4 years)\r\n- Educate parents about the importance of education, their involvement is the key to success\r\n- Train these adults to become involved in their development\r\n\r\n\r\n# # Description Photozama\r\nThe purpose of this application is to order photographs to locate them easily with a database classification.\r\nThe application is coded in VB6 and Access.\r\n\r\nSeveral criteria have been set for their organizations:\r\n\r\n- Name\r\n- Theme\r\n- Date\r\n- Photographer (name, function)\r\n- Location (area, position)\r\n- Keywords\r\n\r\nIn addition, an email management has been added at the request of my supervisor, which is used to search the photographs already sent to an address or otherwise know which photos were not sent to that person.\r\nA history of all messages is available as an Excel file listing the emails already sent.\r\n\r\nThe adding process was designed to be as efficient as possible, a first menu to select photos from different folders. When adding multiple information required for the previous picture are automatically enrolled in the next recording, which can rapidly process similar photographs.\r\n\r\nPhotographs may also undergo treatment such as adjusting contrast, brightness, resizing, compression or rotation directly when adding or editing.\r\n\r\n<object width=\"480\" height=\"320\"> <param name=\"movie\" value=\"http://www.dailymotion.com/swf/video/x1trtt_photozama_tech?additionalInfos=0\"> </ param> <param name = \"allowFullScreen\" value = \"true\"> </ param> <param name=\"allowScriptAccess\" value=\"always\"> </ param> <embed type = \"application / x-shockwave-flash\" src = \"http: / / www.dailymotion.com/swf/video/x1trtt_photozama_tech?additionalInfos=0 \"width =\" 480 \"height =\" 320 \"allowFullScreen =\" true \"allowScriptAccess =\" always \"> </ embed> </ object>\r\n',1,'fr','2010-08-27 15:27:13','2010-09-03 16:51:25',4),(3,'Attac media library','The project aims to create a website offering a common library, allowing supporters of the association ATTAC exchange their documents (books, DVDs, VHS, articles, CD, CD-ROM).\r\n','The project aims to create a website offering a common library, allowing supporters of the association ATTAC exchange their documents (books, DVDs, VHS, articles, CD, CD-ROM).\r\n\r\n\r\nThis website is made with the LAMP technology.\r\nAn XML parser / XSL (Sablotron Parser) was used to display the contents of the library.\r\nAJAX was used for the search of the library.\r\nCMS SPIP 1.8.2 has been added to allow management of content by site user. They can add features and columns to be added to menus.',1,'fr','2010-08-27 15:29:44','2010-09-03 16:33:56',2),(4,'Intracom 2007 - NTIC meeting','Simple project developed with a custom MVC pattern coded in PHP5 ','**Site created as part of HETIC projects**\r\n\r\nI take part to the project as developer, the main functions that I brought to the back office are:\r\n\r\n- Managing directors with specific workflows\r\n- Management of site content in two languages\r\n- Management of pdf files for the events of the show\r\n- Managing Partner with the use of the library GD2',1,'fr','2010-08-27 15:32:17','2010-09-03 17:42:27',4),(5,'Kultura','The project is therefore, an artist area in \"MySpace\" style with management of videos, music, photos and another part containing the Kultura activities: organize Latin culture evenings.','**Site created as part of HETIC projects**\r\n\r\n\r\nThis project was my first experience as a project manager.\r\n\r\nThe project is therefore, an artist area in \"MySpace\" style with management of videos, music, photos and another part containing the Kultura activities: organize Latin culture evenings.\r\n',1,'fr','2010-08-27 15:34:17','2010-09-03 17:47:49',3),(6,'Short film - Time Is Running Out','We have two weeks to write the script, get familiar with the equipment, shooting and editing the film.','** Film made within HETIC videos weeks **\r\n\r\nWe have two weeks to write the script, get familiar with the equipment, shooting and editing the film.\r\n\r\nThe shooting has not been easy: Permissions not always granted, freezing cold when our actor was playing outside in shorts  at -5°C and coordination with the other team!\r\nBesides the deal was simple, I\'m an actor for the other team and one of their members is an actor for us...\r\nA nice collaboration but also to make difficult knowing that our player was their director!\r\n\r\n<object width=\"480\" height=\"331\"> <param name=\"movie\" value=\"http://www.dailymotion.com/swf/video/x1vcd6_timeisrunningout_creation?additionalInfos=0\"> </ param> <param name = \"allowFullScreen\" value = \"true\"> </ param> <param name=\"allowScriptAccess\" value=\"always\"> </ param> <embed type = \"application / x-shockwave-flash\" src = \"http: / / www.dailymotion.com/swf/video/x1vcd6_timeisrunningout_creation?additionalInfos=0 \"width =\" 480 \"height =\" 331 \"allowFullScreen =\" true \"allowScriptAccess =\" always \"> </ embed> </ object>\r\n\r\n** Credits: **\r\n- Yohann Ulreich: Director\r\n- Julien Ravat: Editor\r\n- Nathaniel North Cameraman\r\n- Michael Meyer Sound\r\n\r\n** Summary: **\r\nA guy is lost in a time loop, a routine is installed in his life...',1,'fr','2010-08-27 15:36:10','2010-09-03 17:52:32',6),(21,'CURSUS','nothing','',1,'fr','2010-09-02 15:48:41','2010-09-02 17:00:19',2),(22,'2002 - 2004 | Jean Mermoz High School | Saint-Louis, Alsace, France','Industrial Computing [BTS] (equivalent to [BTEC Higher National] Diploma)','This formation provide the basic knowledge of industrial data processing, a branch of applied computer science that covers the area of design and programming of computerized systems which are not computers as such — often referred to as embedded systems (PLCs, automated systems, intelligent instruments, etc).\r\n\r\nSkills:\r\n\r\n- System architecture\r\n- Assembly, C/C++\r\n- Languages theory\r\n- Software engineering\r\n- Network protocols\r\n',1,'fr','2010-09-02 16:55:51','2010-09-11 08:20:21',4),(23,'2004 - 2005 | University Institutes for Technology  | Chalon-sur-Saône, Bourgogne, France','[Professional bachelor]\'s degree in image, sound and techniques activities ','This professional bachelor\'s degree, created in the city of Niepce, the inventor of photography in 1824, aims to train professionals whose expertise in creating multimedia. It\r\nmay include paper (brochure, poster), audio-visual media (CD ROMs, DVDs) or via the Internet (website).\r\n\r\nThis training is offered in partnership with units Chalonnaises Technical Training (IUT, ENSAM), artistic and cultural ([Regional Conservatory of Music](http://www.legrandchalon.fr/136-conservatoire-de-chalon-sur-saone.htm \"\"), [Media Arts School Fructidor](http://emafructidor.com/ \"\"), [Niepce Museum](http://www.museeniepce.com/ \"\")), and industrial and commercial ([Chamber of Commerce and Industry](http://www.cci71.fr/ \"\")) .\r\n\r\n\r\nThree teaching units structured training:\r\n\r\n- General training\r\n- Tools of design and multimedia creation\r\n- Multimedia applications',1,'fr','2010-09-03 16:16:55','2010-09-11 08:20:35',3),(24,'2006 - 2008 | HETIC : Advanced Studies of Information Technologies and Communication | Montreuil, Île-de-France, France','[Master’s Degree] in Engineering and Management of Digital Communication | ','#### Information technology\r\nCovering the fundamentals of the Internet, Web static and dynamic multimedia applications, multichannel delivery and multichannel broadcasting.\r\n\r\n#### Communication and Multimedia Design\r\nRegarding the processing and analysis of information, mass media, marketing communication, corporate communication, hypertext and the Semantic Web, argumentation, graphics software, design, usability and navigation, design and drafting.\r\n\r\n#### Business and Management\r\nRegarding the management and business economics, marketing, operational and strategic marketing, financial analysis, business simulation, business strategy, ICT law, real case studies, scenario planning, business plans, venture capital, web analytics, web marketing, e-transformation, project management.\r\n',1,'fr','2010-09-03 17:23:53','2010-09-08 14:10:26',3);
/*!40000 ALTER TABLE `article_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_translation_version`
--

DROP TABLE IF EXISTS `article_translation_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_translation_version` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `extract` text COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`lang`,`version`),
  CONSTRAINT `article_translation_version_id_article_translation_id` FOREIGN KEY (`id`) REFERENCES `article_translation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_translation_version`
--

LOCK TABLES `article_translation_version` WRITE;
/*!40000 ALTER TABLE `article_translation_version` DISABLE KEYS */;
INSERT INTO `article_translation_version` VALUES (1,'fr','Sciopta - Système embarqué temps réel','Le projet, développé en C++, consiste à visualiser les trames PPP échangées lors de l\'utilisation de cette liaison entre un client et un serveur. ','## Qu\'est ce que Sciopta ?\r\nLa société Sciopta est basé à Weil em Rhein en Allemagne et est spécialisé dans l\'informatique embarquée.\r\nDepuis 18 mois elle développe un système d\'exploitation temps réel nommé SCIOPTA , qui est composé de base d\'un noyau temps réel et de librairies mettant en œuvre la pile de protocoles réseaux.\r\nCe système d\'exploitation qui est à la version 1.0.0, est destiné à terme à fonctionner sur différentes cibles et en particulier sur des cartes X86, œuvre des cartes PC.\r\n\r\nLes caractéristiques de ce système d\'exploitation sont :\r\n- Configuration graphique de l\'application\r\n- Système temps réel\r\n- L\'application peut tenir sur une disquette et ainsi être flashée\r\n\r\nL\'environnement matériel de la carte cible se réduit alors à une carte mère, un port série et un port Ethernet. Les développements réseaux actuels permettent de mettre en œuvre les sockets que ce soit par réseau Ethernet ou par liaison PPP.\r\n\r\n## Projet de visualisation des trames PPP\r\nLe projet, développé en C++, consiste à visualiser les trames PPP échangées lors de l\'utilisation de cette liaison entre un client et un serveur. Une partie située sur le client réalise des commandes à distance sur une partie opérative reliée au serveur pour donner matière à une visualisation d\'échanges de trames sur la liaison PPP. Pour mettre en évidence les fonctionnalités de notre application, le noyau SCIOPTA sera tantôt dans une version client, tantôt en serveur.\r\n\r\nLe projet est conçu sous Windows, mais le noyau SCIOPTA demande des fichiers compilés grâce à un compilateur croisé, qui n\'est disponible que sous Linux. Cette contrainte nous a obligé à utiliser un émulateur Linux, cygwin, ce qui nous a permis de profiter de l\'environnement Windows.\r\n\r\nLa taille réduite du noyau SCIOPTA nous aurai permis de le faire fonctionner sur une disquette bootant grâce à grub mais nous avons préférés utiliser toujours la même disquette en téléchargeant les fichiers nécessaires à SCIOPTA par le biais du protocole TFTP utilisé par grub.',1,'2010-08-27 15:20:56','2010-08-27 15:20:56',1),(1,'fr','Sciopta - Système embarqué temps réel','The project, developed in C++, was to view the PPP frames exchanged during the use of this connection between a client and a server','# # What Sciopta?\r\nThe Sciopta company is based in  Weil em Rhein, Germany and is specialized in embedded computing.\r\nFor 18 months they developed a real-time operating system named SCIOPTA, which is composed of a basic real-time kernel and libraries implementing a network protocol stack.\r\nThis operating system, version 1.0.0, is intended eventually to work on different targets and particularly on X86 cards.\r\n\r\nThe features of this operating system are:\r\n- Graphical configuration of the application\r\n- Real time system\r\n- The application can fit on a floppy and then be flashed\r\n\r\nThe physical environment of the target board is then reduced to a motherboard, a serial port and an Ethernet port. Current networks implement sockets either by Ethernet or PPP connection.\r\n\r\n# # PPP frames visualization project \r\nThe project, developed in C++, is to view the PPP frames exchanged during the use of this connection between a client and a server. Somebody located on the client performs commands on a remote server connected to the operative part to provide material to display frames exchanged. To demonstrate the capabilities of our application, the kernel will be sometimes the client and sometimes server.\r\n\r\nThe project is designed under Windows, but the core application files are compiled by a cross-compiler, which is available on Linux. Because of this constraint, we use a Linux emulator, Cygwin, which allowed us to take advantage of the Windows environment.\r\n\r\nThe small size of the nucleus SCIOPTA can run on a floppy disk booting through grub, but we have preferred to always use the same disk for the two demonstrations by downloading the necessary files with grub via the TFTP protocol. ',1,'2010-08-27 15:20:56','2010-09-03 15:55:25',2),(1,'fr','Sciopta - Real-time embedded system','The project, developed in C++, was to view the PPP frames exchanged during the use of this connection between a client and a server','# # What Sciopta?\r\nThe Sciopta company is based in  Weil em Rhein, Germany and is specialized in embedded computing.\r\nFor 18 months they developed a real-time embedded operating system named SCIOPTA, which is composed of a basic real-time kernel and libraries implementing a network protocol stack.\r\nThis operating system, version 1.0.0, is intended eventually to work on different targets and particularly on X86 cards.\r\n\r\nThe features of this operating system are:\r\n- Graphical configuration of the application\r\n- Real time system\r\n- The application can fit on a floppy and then be flashed\r\n\r\nThe physical environment of the target board is then reduced to a motherboard, a serial port and an Ethernet port. Current networks implement sockets either by Ethernet or PPP connection.\r\n\r\n# # PPP frames visualization project \r\nThe project, developed in C++, is to view the PPP frames exchanged during the use of this connection between a client and a server. Somebody located on the client performs commands on a remote server connected to the operative part to provide material to display frames exchanged. To demonstrate the capabilities of our application, the kernel will be sometimes the client and sometimes server.\r\n\r\nThe project is designed under Windows, but the core application files are compiled by a cross-compiler, which is available on Linux. Because of this constraint, we use a Linux emulator, Cygwin, which allowed us to take advantage of the Windows environment.\r\n\r\nThe small size of the nucleus SCIOPTA can run on a floppy disk booting through grub, but we have preferred to always use the same disk for the two demonstrations by downloading the necessary files with grub via the TFTP protocol. ',1,'2010-08-27 15:20:56','2010-09-03 15:56:16',3),(2,'fr','PhotoZama - Photothèque personnalisée','Le but de cette application est d\'ordonner des photographies pour permettre de les retrouver facilement grâce à un classement dans une base de données.\r\nL\'application est codée en VB6 et Access.','J\'ai entièrement conçu et réalisé cette application durant un stage de 3 mois à Madagascar, pour l\'ONG Vozama.\r\nLe but est de gérer une photothèque de plusieurs dizaines de milliers de photos.\r\n\r\n## L\'ONG VOZAMA\r\nVOZAMA est une ONG qui poursuit 4 objectifs principaux :\r\n\r\n- alphabétiser les enfants non scolarisés pour les mettre dans un délai de 2 ans sur les rails de l\'école publique ou privée.\r\n- assurer leur suivi jusqu\'à la fin de l\'école primaire (4 ans)\r\n- sensibiliser les parents à l\'importance de l\'éducation, leur implication étant la clé de la réussite\r\n- former ces adultes à devenir acteurs de leur développement\r\n\r\n\r\n## Description du Photozama\r\nLe but de cette application est d\'ordonner des photographies pour permettre de les retrouver facilement grâce à un classement dans une base de données.\r\nL\'application est codée en VB6 et Access.\r\n\r\nPlusieurs critères ont été définis pour leurs organisations :\r\n\r\n- nom\r\n- thème\r\n- date\r\n- photographe ( nom, prénom, fonction )\r\n- localisation ( secteur, poste )\r\n- mots clés\r\n\r\nEn plus, une gestion des courriels à été ajoutée à la demande du maître de stage, se qui permet de rechercher les photographies déjà envoyées à un destinataire ou au contraire de savoir quelle photographies n\'ont pas été envoyées à cette personne.\r\nUn historique des courriels est accessible ainsi qu\'un fichier Excel répertoriant les courriels déjà envoyé.\r\n\r\nL\'ajout à été pensé pour être le plus efficace possible, un menu permet d\'abord de sélectionner des photographies provenant de plusieurs répertoires. Lors d\'un ajout multiple, les informations indiquées pour la photographie précédente sont automatiquement inscrites dans la l\'enregistrement suivante, ce qui permet de traiter rapidement des photographies semblables.\r\n\r\nLes photographies peuvent aussi subir un traitement tel que le réglage du contraste, de la luminosité, une redimension, une compression ou une rotation directement lors de l\'ajout ou de la modification.',1,'2010-08-27 15:27:13','2010-08-27 15:27:13',1),(2,'fr','PhotoZama - Photothèque personnalisée','Le but de cette application est d\'ordonner des photographies pour permettre de les retrouver facilement grâce à un classement dans une base de données.\r\nL\'application est codée en VB6 et Access.','J\'ai entièrement conçu et réalisé cette application durant un stage de 3 mois à Madagascar, pour l\'ONG Vozama.\r\nLe but est de gérer une photothèque de plusieurs dizaines de milliers de photos.\r\n\r\n## L\'ONG VOZAMA\r\nVOZAMA est une ONG qui poursuit 4 objectifs principaux :\r\n\r\n- alphabétiser les enfants non scolarisés pour les mettre dans un délai de 2 ans sur les rails de l\'école publique ou privée.\r\n- assurer leur suivi jusqu\'à la fin de l\'école primaire (4 ans)\r\n- sensibiliser les parents à l\'importance de l\'éducation, leur implication étant la clé de la réussite\r\n- former ces adultes à devenir acteurs de leur développement\r\n\r\n\r\n## Description du Photozama\r\nLe but de cette application est d\'ordonner des photographies pour permettre de les retrouver facilement grâce à un classement dans une base de données.\r\nL\'application est codée en VB6 et Access.\r\n\r\nPlusieurs critères ont été définis pour leurs organisations :\r\n\r\n- nom\r\n- thème\r\n- date\r\n- photographe ( nom, prénom, fonction )\r\n- localisation ( secteur, poste )\r\n- mots clés\r\n\r\nEn plus, une gestion des courriels à été ajoutée à la demande du maître de stage, se qui permet de rechercher les photographies déjà envoyées à un destinataire ou au contraire de savoir quelle photographies n\'ont pas été envoyées à cette personne.\r\nUn historique des courriels est accessible ainsi qu\'un fichier Excel répertoriant les courriels déjà envoyé.\r\n\r\nL\'ajout à été pensé pour être le plus efficace possible, un menu permet d\'abord de sélectionner des photographies provenant de plusieurs répertoires. Lors d\'un ajout multiple, les informations indiquées pour la photographie précédente sont automatiquement inscrites dans la l\'enregistrement suivante, ce qui permet de traiter rapidement des photographies semblables.\r\n\r\nLes photographies peuvent aussi subir un traitement tel que le réglage du contraste, de la luminosité, une redimension, une compression ou une rotation directement lors de l\'ajout ou de la modification.\r\n\r\n<object width=\"480\" height=\"320\"><param name=\"movie\" value=\"http://www.dailymotion.com/swf/video/x1trtt_photozama_tech?additionalInfos=0\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowScriptAccess\" value=\"always\"></param><embed type=\"application/x-shockwave-flash\" src=\"http://www.dailymotion.com/swf/video/x1trtt_photozama_tech?additionalInfos=0\" width=\"480\" height=\"320\" allowfullscreen=\"true\" allowscriptaccess=\"always\"></embed></object>',1,'2010-08-27 15:27:13','2010-08-27 15:41:32',2),(2,'fr','PhotoZama - Photothèque personnalisée','I completely designed and made this application during a period of three months in Madagascar for the NGO [Vozama](http://www.vozama.org \"Vozama - Sauvons les enfants malgache\").\r\nThe goal is to manage a library of tens of thousands photos.','I completely designed and made this application during a period of three months in Madagascar for the NGO [Vozama](http://www.vozama.org \"Vozama - Sauvons les enfants malgache\").\r\nThe goal is to manage a library of tens of thousands photos.\r\n\r\n# # The NGO VOZAMA\r\nVOZAMA is an NGO which has 4 main objectives:\r\n\r\n- Teach children not attending school and put them in the rails of a 2 years public or private school period.\r\n- Monitor them until the end of primary school (4 years)\r\n- Educate parents about the importance of education, their involvement is the key to success\r\n- Train these adults to become involved in their development\r\n\r\n\r\n# # Description Photozama\r\nThe purpose of this application is to order photographs to locate them easily with a database classification.\r\nThe application is coded in VB6 and Access.\r\n\r\nSeveral criteria have been set for their organizations:\r\n\r\n- Name\r\n- Theme\r\n- Date\r\n- Photographer (name, function)\r\n- Location (area, position)\r\n- Keywords\r\n\r\nIn addition, an email management has been added at the request of my supervisor, which is used to search the photographs already sent to an address or otherwise know which photos were not sent to that person.\r\nA history of all messages is available as an Excel file listing the emails already sent.\r\n\r\nThe adding process was designed to be as efficient as possible, a first menu to select photos from different folders. When adding multiple information required for the previous picture are automatically enrolled in the next recording, which can rapidly process similar photographs.\r\n\r\nPhotographs may also undergo treatment such as adjusting contrast, brightness, resizing, compression or rotation directly when adding or editing.\r\n\r\n<object width=\"480\" height=\"320\"> <param name=\"movie\" value=\"http://www.dailymotion.com/swf/video/x1trtt_photozama_tech?additionalInfos=0\"> </ param> <param name = \"allowFullScreen\" value = \"true\"> </ param> <param name=\"allowScriptAccess\" value=\"always\"> </ param> <embed type = \"application / x-shockwave-flash\" src = \"http: / / www.dailymotion.com/swf/video/x1trtt_photozama_tech?additionalInfos=0 \"width =\" 480 \"height =\" 320 \"allowFullScreen =\" true \"allowScriptAccess =\" always \"> </ embed> </ object>\r\n',1,'2010-08-27 15:27:13','2010-09-03 16:47:41',3),(2,'fr','PhotoZama - personalized photo library','I completely designed and made this application during a period of three months in Madagascar for the NGO [Vozama](http://www.vozama.org \"Vozama - Sauvons les enfants malgache\").\r\nThe goal is to manage a library of tens of thousands photos.','I completely designed and made this application during a period of three months in Madagascar for the NGO [Vozama](http://www.vozama.org \"Vozama - Sauvons les enfants malgache\").\r\nThe goal is to manage a library of tens of thousands photos.\r\n\r\n# # The NGO VOZAMA\r\nVOZAMA is an NGO which has 4 main objectives:\r\n\r\n- Teach children not attending school and put them in the rails of a 2 years public or private school period.\r\n- Monitor them until the end of primary school (4 years)\r\n- Educate parents about the importance of education, their involvement is the key to success\r\n- Train these adults to become involved in their development\r\n\r\n\r\n# # Description Photozama\r\nThe purpose of this application is to order photographs to locate them easily with a database classification.\r\nThe application is coded in VB6 and Access.\r\n\r\nSeveral criteria have been set for their organizations:\r\n\r\n- Name\r\n- Theme\r\n- Date\r\n- Photographer (name, function)\r\n- Location (area, position)\r\n- Keywords\r\n\r\nIn addition, an email management has been added at the request of my supervisor, which is used to search the photographs already sent to an address or otherwise know which photos were not sent to that person.\r\nA history of all messages is available as an Excel file listing the emails already sent.\r\n\r\nThe adding process was designed to be as efficient as possible, a first menu to select photos from different folders. When adding multiple information required for the previous picture are automatically enrolled in the next recording, which can rapidly process similar photographs.\r\n\r\nPhotographs may also undergo treatment such as adjusting contrast, brightness, resizing, compression or rotation directly when adding or editing.\r\n\r\n<object width=\"480\" height=\"320\"> <param name=\"movie\" value=\"http://www.dailymotion.com/swf/video/x1trtt_photozama_tech?additionalInfos=0\"> </ param> <param name = \"allowFullScreen\" value = \"true\"> </ param> <param name=\"allowScriptAccess\" value=\"always\"> </ param> <embed type = \"application / x-shockwave-flash\" src = \"http: / / www.dailymotion.com/swf/video/x1trtt_photozama_tech?additionalInfos=0 \"width =\" 480 \"height =\" 320 \"allowFullScreen =\" true \"allowScriptAccess =\" always \"> </ embed> </ object>\r\n',1,'2010-08-27 15:27:13','2010-09-03 16:51:25',4),(3,'fr','Médiathèque Attac','Le projet a pour but de créer une bibliothèque commune, permettant aux sympathisants de l\'association ATTAC de s\'échanger leurs documents (livres, DVD, VHS, articles, CD, CD-ROM) en les gérant par le biai d\'une page internet.','## Objectif du projet\r\n\r\nLe projet a pour but de créer une bibliothèque commune, permettant aux sympathisants de l\'association ATTAC de s\'échanger leurs documents (livres, DVD, VHS, articles, CD, CD-ROM) en les gérant par le biai d\'une page internet.\r\n\r\n## Graphisme\r\n\r\nLe site étant destinée à être rattachée à la page principale du groupe ATTAC Saône et Loire, la charte graphique a été semblable à la leur.\r\nLes contours rouges, délimitant les différents menus on été repris. Pour leurs fonds, un jaune clair à été choisi rendant la page moins agressive. Des dominantes de rouges vifs et sombres ont été choisi pour les textes et les différentes décorations, dans la lignée de tous les sites d\'ATTAC en général.\r\nLa mise en page est entièrement gérée par des fichiers CSS, contrôlant précisément l\'aspect graphique de la page.\r\n\r\n## Techniques\r\n\r\nCette page est réalisé avec la technologie LAMP.\r\nUn analyseur XML/XSL (Parser Sablotron) à été utilisé pour afficher le contenu de la bibliothèque.\r\nAJAX à été utilisé pour le moteur de recherche de la bibliothèque.\r\nLe CMS SPIP 1.8.2 à été ajouté pour permettre une gestion de contenu par les utilisateur du site. Ils peuvent ajouter des rubriques et des articles qui viendront s\'ajouter aux menus.',1,'2010-08-27 15:29:44','2010-08-27 15:29:44',1),(3,'fr','Attac media library','The project aims to create a website offering a common library, allowing supporters of the association ATTAC exchange their documents (books, DVDs, VHS, articles, CD, CD-ROM).\r\n','The project aims to create a website offering a common library, allowing supporters of the association ATTAC exchange their documents (books, DVDs, VHS, articles, CD, CD-ROM).\r\n\r\n\r\nThis website is made with the LAMP technology.\r\nAn XML parser / XSL (Sablotron Parser) was used to display the contents of the library.\r\nAJAX was used for the search of the library.\r\nCMS SPIP 1.8.2 has been added to allow management of content by site user. They can add features and columns to be added to menus.',1,'2010-08-27 15:29:44','2010-09-03 16:33:56',2),(4,'fr','Intracom 2007 - Conférence NTIC','J’ai participé au développement de ce site.\r\nNous avons utilisé du PHP5 Objet en architecture MVC.','Site réalisé dans le cadre des projets HETIC\r\n\r\nJ’ai participé au développement de ce site.\r\nNous avons utilisé du PHP5 Objet en architecture MVC.\r\n\r\nLes principales fonctions que j’ai apporté au back office sont:\r\n\r\n- Gestion des administrateurs, avec des workflows particuliers\r\n- Gestion du contenu du site, en deux langues\r\n- Gestion des fichiers pdf pour les évènements du salon\r\n- Gestion des partenaires avec l’utilisation de la librairie GD2',0,'2010-08-27 15:32:17','2010-08-27 15:32:17',1),(4,'fr','Intracom 2007 - NTIC meeting','Simple project developed with a custom MVC pattern coded in PHP5 ','Site created as part of HETIC projects \r\n\r\nI take part to the project as developer, the main functions that I brought to the back office are:\r\n\r\n- Managing directors with specific workflows\r\n- Management of site content in two languages\r\n- Management of pdf files for the events of the show\r\n- Managing Partner with the use of the library GD2',0,'2010-08-27 15:32:17','2010-09-03 17:34:34',2),(4,'fr','Intracom 2007 - NTIC meeting','Simple project developed with a custom MVC pattern coded in PHP5 ','Site created as part of HETIC projects \r\n\r\nI take part to the project as developer, the main functions that I brought to the back office are:\r\n\r\n- Managing directors with specific workflows\r\n- Management of site content in two languages\r\n- Management of pdf files for the events of the show\r\n- Managing Partner with the use of the library GD2',1,'2010-08-27 15:32:17','2010-09-03 17:35:52',3),(4,'fr','Intracom 2007 - NTIC meeting','Simple project developed with a custom MVC pattern coded in PHP5 ','**Site created as part of HETIC projects**\r\n\r\nI take part to the project as developer, the main functions that I brought to the back office are:\r\n\r\n- Managing directors with specific workflows\r\n- Management of site content in two languages\r\n- Management of pdf files for the events of the show\r\n- Managing Partner with the use of the library GD2',1,'2010-08-27 15:32:17','2010-09-03 17:42:27',4),(5,'fr','Kultura - toute la culture latine','Le projet est conséquent, une espace artiste, dans le style “MySpace” avec gestion de vidéos, musiques, photos et une autre partie présentant les activités de Kultura, essentiellement l’organisation de soirées ayant pour thème la culture latine.','**Site réalisé dans le cadre des projets HETIC**\r\n\r\nCe site constitue ma première expérience en tant que chef de projet.\r\n\r\nLe projet est conséquent, une espace artiste, dans le style “MySpace” avec gestion de vidéos, musiques, photos et une autre partie présentant les activités de Kultura, essentiellement l’organisation de soirées ayant pour thème la culture latine.',1,'2010-08-27 15:34:17','2010-08-27 15:34:17',1),(5,'fr','Kultura - toute la culture latine','The project is therefore, an artist area in \"MySpace\" style with management of videos, music, photos and another part containing the Kultura activities: organize Latin culture evenings.','**Site created as part of HETIC projects**\r\n\r\n\r\nThis project was my first experience as a project manager.\r\n\r\nThe project is therefore, an artist area in \"MySpace\" style with management of videos, music, photos and another part containing the Kultura activities: organize Latin culture evenings.\r\n',1,'2010-08-27 15:34:17','2010-09-03 17:45:40',2),(5,'fr','Kultura','The project is therefore, an artist area in \"MySpace\" style with management of videos, music, photos and another part containing the Kultura activities: organize Latin culture evenings.','**Site created as part of HETIC projects**\r\n\r\n\r\nThis project was my first experience as a project manager.\r\n\r\nThe project is therefore, an artist area in \"MySpace\" style with management of videos, music, photos and another part containing the Kultura activities: organize Latin culture evenings.\r\n',1,'2010-08-27 15:34:17','2010-09-03 17:47:49',3),(6,'fr','Court Métrage - Time Is Running Out','Nous avons eux deux semaines pour écrire le scénario, ce familiariser avec le matériel, tourner et monter le film','**Film fait dans le cadre des semaines vidéos à HETIC**\r\n\r\nNous avons eux deux semaines pour écrire le scénario, ce familiariser avec le matériel, tourner et monter le film.\r\n\r\nLe tournage n\'a pas été simple: autorisations pas toujours accordées, un froid glacial alors que notre acteur devait jouer en caleçon dehors par - 5°C et la coordination avec l\'autre équipe !\r\nD\'ailleurs le deal était simple, je suis acteur pour l\'autre équipe et un de leurs membres joue pour nous…\r\nUne collaboration sympatique mais qui à apporter aussi des difficultés sachant que notre acteur était leur réalisateur !',1,'2010-08-27 15:36:10','2010-08-27 15:36:10',1),(6,'fr','Court Métrage - Time Is Running Out','Nous avons eux deux semaines pour écrire le scénario, ce familiariser avec le matériel, tourner et monter le film','**Film fait dans le cadre des semaines vidéos à HETIC**\r\n\r\nNous avons eux deux semaines pour écrire le scénario, ce familiariser avec le matériel, tourner et monter le film.\r\n\r\nLe tournage n\'a pas été simple: autorisations pas toujours accordées, un froid glacial alors que notre acteur devait jouer en caleçon dehors par - 5°C et la coordination avec l\'autre équipe !\r\nD\'ailleurs le deal était simple, je suis acteur pour l\'autre équipe et un de leurs membres joue pour nous…\r\nUne collaboration sympatique mais qui à apporter aussi des difficultés sachant que notre acteur était leur réalisateur !\r\n\r\n**Equipe:**\r\n- Yohann Ulreich: Réalisateur\r\n- Julien Ravat: Monteur\r\n- Natanaël Nord: Cadreur\r\n- Michel Meyer: Preneur son\r\n\r\n**Résumé:**\r\nUn gars est perdu dans une boucle temporelle depuis déjà long, la routine c’est installée dans sa vie…',1,'2010-08-27 15:36:10','2010-08-27 15:38:04',2),(6,'fr','Court métrage - Time Is Running Out','Nous avons eux deux semaines pour écrire le scénario, ce familiariser avec le matériel, tourner et monter le film','**Film fait dans le cadre des semaines vidéos à HETIC**\r\n\r\nNous avons eux deux semaines pour écrire le scénario, ce familiariser avec le matériel, tourner et monter le film.\r\n\r\nLe tournage n\'a pas été simple: autorisations pas toujours accordées, un froid glacial alors que notre acteur devait jouer en caleçon dehors par - 5°C et la coordination avec l\'autre équipe !\r\nD\'ailleurs le deal était simple, je suis acteur pour l\'autre équipe et un de leurs membres joue pour nous…\r\nUne collaboration sympatique mais qui à apporter aussi des difficultés sachant que notre acteur était leur réalisateur !\r\n\r\n**Equipe:**\r\n- Yohann Ulreich: Réalisateur\r\n- Julien Ravat: Monteur\r\n- Natanaël Nord: Cadreur\r\n- Michel Meyer: Preneur son\r\n\r\n**Résumé:**\r\nUn gars est perdu dans une boucle temporelle depuis déjà long, la routine c’est installée dans sa vie…',1,'2010-08-27 15:36:10','2010-08-27 15:38:41',3),(6,'fr','Court métrage - Time Is Running Out','Nous avons eux deux semaines pour écrire le scénario, ce familiariser avec le matériel, tourner et monter le film','**Film fait dans le cadre des semaines vidéos à HETIC**\r\n\r\nNous avons eux deux semaines pour écrire le scénario, ce familiariser avec le matériel, tourner et monter le film.\r\n\r\nLe tournage n\'a pas été simple: autorisations pas toujours accordées, un froid glacial alors que notre acteur devait jouer en caleçon dehors par - 5°C et la coordination avec l\'autre équipe !\r\nD\'ailleurs le deal était simple, je suis acteur pour l\'autre équipe et un de leurs membres joue pour nous…\r\nUne collaboration sympatique mais qui à apporter aussi des difficultés sachant que notre acteur était leur réalisateur !\r\n\r\n<object width=\"480\" height=\"331\"><param name=\"movie\" value=\"http://www.dailymotion.com/swf/video/x1vcd6_timeisrunningout_creation?additionalInfos=0\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowScriptAccess\" value=\"always\"></param><embed type=\"application/x-shockwave-flash\" src=\"http://www.dailymotion.com/swf/video/x1vcd6_timeisrunningout_creation?additionalInfos=0\" width=\"480\" height=\"331\" allowfullscreen=\"true\" allowscriptaccess=\"always\"></embed></object>\r\n\r\n**Equipe:**\r\n- Yohann Ulreich: Réalisateur\r\n- Julien Ravat: Monteur\r\n- Natanaël Nord: Cadreur\r\n- Michel Meyer: Preneur son\r\n\r\n**Résumé:**\r\nUn gars est perdu dans une boucle temporelle depuis déjà long, la routine c’est installée dans sa vie…',1,'2010-08-27 15:36:10','2010-08-27 15:40:10',4),(6,'fr','Court métrage - Time Is Running Out','We have two weeks to write the script, get familiar with the equipment, shooting and editing the film.','** Film made within HETIC videos weeks **\r\n\r\nWe have two weeks to write the script, get familiar with the equipment, shooting and editing the film.\r\n\r\nThe shooting has not been easy: Permissions not always granted, freezing cold when our actor was playing outside in shorts  at -5°C and coordination with the other team!\r\nBesides the deal was simple, I\'m an actor for the other team and one of their members is an actor for us...\r\nA nice collaboration but also to make difficult knowing that our player was their director!\r\n\r\n<object width=\"480\" height=\"331\"> <param name=\"movie\" value=\"http://www.dailymotion.com/swf/video/x1vcd6_timeisrunningout_creation?additionalInfos=0\"> </ param> <param name = \"allowFullScreen\" value = \"true\"> </ param> <param name=\"allowScriptAccess\" value=\"always\"> </ param> <embed type = \"application / x-shockwave-flash\" src = \"http: / / www.dailymotion.com/swf/video/x1vcd6_timeisrunningout_creation?additionalInfos=0 \"width =\" 480 \"height =\" 331 \"allowFullScreen =\" true \"allowScriptAccess =\" always \"> </ embed> </ object>\r\n\r\n** Credits: **\r\n- Yohann Ulreich: Director\r\n- Julien Ravat: Editor\r\n- Nathaniel North Cameraman\r\n- Michael Meyer Sound\r\n\r\n** Summary: **\r\nA guy is lost in a time loop, a routine is installed in his life...',1,'2010-08-27 15:36:10','2010-09-03 17:52:04',5),(6,'fr','Short film - Time Is Running Out','We have two weeks to write the script, get familiar with the equipment, shooting and editing the film.','** Film made within HETIC videos weeks **\r\n\r\nWe have two weeks to write the script, get familiar with the equipment, shooting and editing the film.\r\n\r\nThe shooting has not been easy: Permissions not always granted, freezing cold when our actor was playing outside in shorts  at -5°C and coordination with the other team!\r\nBesides the deal was simple, I\'m an actor for the other team and one of their members is an actor for us...\r\nA nice collaboration but also to make difficult knowing that our player was their director!\r\n\r\n<object width=\"480\" height=\"331\"> <param name=\"movie\" value=\"http://www.dailymotion.com/swf/video/x1vcd6_timeisrunningout_creation?additionalInfos=0\"> </ param> <param name = \"allowFullScreen\" value = \"true\"> </ param> <param name=\"allowScriptAccess\" value=\"always\"> </ param> <embed type = \"application / x-shockwave-flash\" src = \"http: / / www.dailymotion.com/swf/video/x1vcd6_timeisrunningout_creation?additionalInfos=0 \"width =\" 480 \"height =\" 331 \"allowFullScreen =\" true \"allowScriptAccess =\" always \"> </ embed> </ object>\r\n\r\n** Credits: **\r\n- Yohann Ulreich: Director\r\n- Julien Ravat: Editor\r\n- Nathaniel North Cameraman\r\n- Michael Meyer Sound\r\n\r\n** Summary: **\r\nA guy is lost in a time loop, a routine is installed in his life...',1,'2010-08-27 15:36:10','2010-09-03 17:52:32',6),(21,'fr','CURSUS','nothing','',0,'2010-09-02 15:48:41','2010-09-02 15:48:41',1),(21,'fr','CURSUS','nothing','',1,'2010-09-02 15:48:41','2010-09-02 17:00:19',2),(22,'fr','2002 - 2004 | Jean Mermoz High School | Saint-Louis, Alsace, France','This formation provide the basic of Industrial data processing, a branch of applied computer science that covers the area of design and programming of computerized systems which are not computers as such — often referred to as embedded systems (PLCs, automated systems, intelligent instruments, etc). ','This formation provide the basic knowledge of industrial data processing, a branch of applied computer science that covers the area of design and programming of computerized systems which are not computers as such — often referred to as embedded systems (PLCs, automated systems, intelligent instruments, etc).\r\n\r\nSkills:\r\n\r\n- System architecture\r\n- Assembly, C/C++\r\n- Languages theory\r\n- Software engineering\r\n- Network protocols\r\n',1,'2010-09-02 16:55:51','2010-09-02 16:55:51',1),(22,'fr','2002 - 2004 | Jean Mermoz High School | Saint-Louis, Alsace, France','This formation provide the basic of Industrial data processing, a branch of applied computer science that covers the area of design and programming of computerized systems which are not computers as such — often referred to as embedded systems (PLCs, automated systems, intelligent instruments, etc). ','### BTS Industrial Computing (equivalent to BTEC Higher National Diploma)\r\n\r\nThis formation provide the basic knowledge of industrial data processing, a branch of applied computer science that covers the area of design and programming of computerized systems which are not computers as such — often referred to as embedded systems (PLCs, automated systems, intelligent instruments, etc).\r\n\r\nSkills:\r\n\r\n- System architecture\r\n- Assembly, C/C++\r\n- Languages theory\r\n- Software engineering\r\n- Network protocols\r\n',1,'2010-09-02 16:55:51','2010-09-03 16:05:39',2),(22,'fr','2002 - 2004 | Jean Mermoz High School | Saint-Louis, Alsace, France','Industrial Computing (equivalent to BTEC Higher National Diploma)','This formation provide the basic knowledge of industrial data processing, a branch of applied computer science that covers the area of design and programming of computerized systems which are not computers as such — often referred to as embedded systems (PLCs, automated systems, intelligent instruments, etc).\r\n\r\nSkills:\r\n\r\n- System architecture\r\n- Assembly, C/C++\r\n- Languages theory\r\n- Software engineering\r\n- Network protocols\r\n',1,'2010-09-02 16:55:51','2010-09-08 14:04:09',3),(22,'fr','2002 - 2004 | Jean Mermoz High School | Saint-Louis, Alsace, France','Industrial Computing [BTS] (equivalent to [BTEC Higher National] Diploma)','This formation provide the basic knowledge of industrial data processing, a branch of applied computer science that covers the area of design and programming of computerized systems which are not computers as such — often referred to as embedded systems (PLCs, automated systems, intelligent instruments, etc).\r\n\r\nSkills:\r\n\r\n- System architecture\r\n- Assembly, C/C++\r\n- Languages theory\r\n- Software engineering\r\n- Network protocols\r\n',1,'2010-09-02 16:55:51','2010-09-11 08:20:21',4),(23,'fr','2004 - 2005 | University Institutes for Technology  | Chalon-sur-Saône, Bourgogne, France','This professional bachelor\'s degree aims to train professionals whose expertise in creating multimedia.','### Professional bachelor\'s degree in image, sound and techniques activities \r\n## \r\nThis professional bachelor\'s degree, created in the city of Niepce, the inventor of photography in 1824, aims to train professionals whose expertise in creating multimedia. It\r\nmay include paper (brochure, poster), audio-visual media (CD ROMs, DVDs) or via the Internet (website).\r\n\r\nThis training is offered in partnership with units Chalonnaises Technical Training (IUT, ENSAM), artistic and cultural ([Regional Conservatory of Music](http://www.legrandchalon.fr/136-conservatoire-de-chalon-sur-saone.htm \"\"), [Media Arts School Fructidor](http://emafructidor.com/ \"\"), [Niepce Museum](http://www.museeniepce.com/ \"\")), and industrial and commercial ([Chamber of Commerce and Industry](http://www.cci71.fr/ \"\")) .\r\n\r\n\r\nThree teaching units structured training:\r\n- General training\r\n- Tools of design and multimedia creation\r\n- Multimedia applications',1,'2010-09-03 16:16:55','2010-09-03 16:16:55',1),(23,'fr','2004 - 2005 | University Institutes for Technology  | Chalon-sur-Saône, Bourgogne, France','Professional bachelor\'s degree in image, sound and techniques activities ','This professional bachelor\'s degree, created in the city of Niepce, the inventor of photography in 1824, aims to train professionals whose expertise in creating multimedia. It\r\nmay include paper (brochure, poster), audio-visual media (CD ROMs, DVDs) or via the Internet (website).\r\n\r\nThis training is offered in partnership with units Chalonnaises Technical Training (IUT, ENSAM), artistic and cultural ([Regional Conservatory of Music](http://www.legrandchalon.fr/136-conservatoire-de-chalon-sur-saone.htm \"\"), [Media Arts School Fructidor](http://emafructidor.com/ \"\"), [Niepce Museum](http://www.museeniepce.com/ \"\")), and industrial and commercial ([Chamber of Commerce and Industry](http://www.cci71.fr/ \"\")) .\r\n\r\n\r\nThree teaching units structured training:\r\n\r\n- General training\r\n- Tools of design and multimedia creation\r\n- Multimedia applications',1,'2010-09-03 16:16:55','2010-09-08 14:05:27',2),(23,'fr','2004 - 2005 | University Institutes for Technology  | Chalon-sur-Saône, Bourgogne, France','[Professional bachelor]\'s degree in image, sound and techniques activities ','This professional bachelor\'s degree, created in the city of Niepce, the inventor of photography in 1824, aims to train professionals whose expertise in creating multimedia. It\r\nmay include paper (brochure, poster), audio-visual media (CD ROMs, DVDs) or via the Internet (website).\r\n\r\nThis training is offered in partnership with units Chalonnaises Technical Training (IUT, ENSAM), artistic and cultural ([Regional Conservatory of Music](http://www.legrandchalon.fr/136-conservatoire-de-chalon-sur-saone.htm \"\"), [Media Arts School Fructidor](http://emafructidor.com/ \"\"), [Niepce Museum](http://www.museeniepce.com/ \"\")), and industrial and commercial ([Chamber of Commerce and Industry](http://www.cci71.fr/ \"\")) .\r\n\r\n\r\nThree teaching units structured training:\r\n\r\n- General training\r\n- Tools of design and multimedia creation\r\n- Multimedia applications',1,'2010-09-03 16:16:55','2010-09-11 08:20:35',3),(24,'fr','2006 - 2008 | HETIC : Advanced Studies of Information Technologies and Communication | Montreuil, Île-de-France, France','Information technology | Communication and Multimedia Design | Business and Management','### Master’s Degree in Engineering and Management of Digital Communication\r\n<br />\r\n#### Information technology\r\nCovering the fundamentals of the Internet, Web static and dynamic multimedia applications, multichannel delivery and multichannel broadcasting.\r\n\r\n#### Communication and Multimedia Design\r\nRegarding the processing and analysis of information, mass media, marketing communication, corporate communication, hypertext and the Semantic Web, argumentation, graphics software, design, usability and navigation, design and drafting.\r\n\r\n#### Business and Management\r\nRegarding the management and business economics, marketing, operational and strategic marketing, financial analysis, business simulation, business strategy, ICT law, real case studies, scenario planning, business plans, venture capital, web analytics, web marketing, e-transformation, project management.\r\n',1,'2010-09-03 17:23:53','2010-09-03 17:23:53',1),(24,'fr','2006 - 2008 | HETIC : Advanced Studies of Information Technologies and Communication | Montreuil, Île-de-France, France','Master’s Degree in Engineering and Management of Digital Communication | ','#### Information technology\r\nCovering the fundamentals of the Internet, Web static and dynamic multimedia applications, multichannel delivery and multichannel broadcasting.\r\n\r\n#### Communication and Multimedia Design\r\nRegarding the processing and analysis of information, mass media, marketing communication, corporate communication, hypertext and the Semantic Web, argumentation, graphics software, design, usability and navigation, design and drafting.\r\n\r\n#### Business and Management\r\nRegarding the management and business economics, marketing, operational and strategic marketing, financial analysis, business simulation, business strategy, ICT law, real case studies, scenario planning, business plans, venture capital, web analytics, web marketing, e-transformation, project management.\r\n',1,'2010-09-03 17:23:53','2010-09-08 14:08:26',2),(24,'fr','2006 - 2008 | HETIC : Advanced Studies of Information Technologies and Communication | Montreuil, Île-de-France, France','[Master’s Degree] in Engineering and Management of Digital Communication | ','#### Information technology\r\nCovering the fundamentals of the Internet, Web static and dynamic multimedia applications, multichannel delivery and multichannel broadcasting.\r\n\r\n#### Communication and Multimedia Design\r\nRegarding the processing and analysis of information, mass media, marketing communication, corporate communication, hypertext and the Semantic Web, argumentation, graphics software, design, usability and navigation, design and drafting.\r\n\r\n#### Business and Management\r\nRegarding the management and business economics, marketing, operational and strategic marketing, financial analysis, business simulation, business strategy, ICT law, real case studies, scenario planning, business plans, venture capital, web analytics, web marketing, e-transformation, project management.\r\n',1,'2010-09-03 17:23:53','2010-09-08 14:10:26',3);
/*!40000 ALTER TABLE `article_translation_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_area`
--

DROP TABLE IF EXISTS `dm_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_layout_id` bigint(20) DEFAULT NULL,
  `dm_page_view_id` bigint(20) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_layout_id_idx` (`dm_layout_id`),
  KEY `dm_page_view_id_idx` (`dm_page_view_id`),
  CONSTRAINT `dm_area_dm_layout_id_dm_layout_id` FOREIGN KEY (`dm_layout_id`) REFERENCES `dm_layout` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_area_dm_page_view_id_dm_page_view_id` FOREIGN KEY (`dm_page_view_id`) REFERENCES `dm_page_view` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_area`
--

LOCK TABLES `dm_area` WRITE;
/*!40000 ALTER TABLE `dm_area` DISABLE KEYS */;
INSERT INTO `dm_area` VALUES (1,NULL,2,'1'),(2,NULL,3,'1'),(3,1,NULL,'left'),(4,NULL,1,'content'),(5,1,NULL,'bottom'),(6,NULL,8,'content'),(7,NULL,9,'content'),(8,NULL,10,'content'),(9,NULL,11,'content'),(10,NULL,5,'content'),(11,2,NULL,'left'),(12,2,NULL,'bottom'),(13,NULL,1,'left'),(14,NULL,1,'right'),(15,NULL,1,'bottom'),(16,NULL,7,'content'),(17,NULL,3,'content'),(18,NULL,2,'content'),(19,NULL,6,'content'),(20,3,NULL,'left'),(21,3,NULL,'bottom'),(22,NULL,12,'content'),(23,NULL,13,'content');
/*!40000 ALTER TABLE `dm_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_auto_seo`
--

DROP TABLE IF EXISTS `dm_auto_seo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_auto_seo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dmAutoSeoModuleAction_idx` (`module`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_auto_seo`
--

LOCK TABLES `dm_auto_seo` WRITE;
/*!40000 ALTER TABLE `dm_auto_seo` DISABLE KEYS */;
INSERT INTO `dm_auto_seo` VALUES (1,'article','show','2010-08-27 15:20:58','2010-08-27 15:20:58'),(2,'dmTag','show','2010-08-27 15:22:21','2010-08-27 15:22:21');
/*!40000 ALTER TABLE `dm_auto_seo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_auto_seo_translation`
--

DROP TABLE IF EXISTS `dm_auto_seo_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_auto_seo_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `h1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strip_words` text COLLATE utf8_unicode_ci,
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_auto_seo_translation_id_dm_auto_seo_id` FOREIGN KEY (`id`) REFERENCES `dm_auto_seo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_auto_seo_translation`
--

LOCK TABLES `dm_auto_seo_translation` WRITE;
/*!40000 ALTER TABLE `dm_auto_seo_translation` DISABLE KEYS */;
INSERT INTO `dm_auto_seo_translation` VALUES (1,'%article.title%','%article.title%','%article.title%',NULL,'%article.body%',NULL,NULL,'fr'),(2,'%dm_tag.name%','%dm_tag.name%','%dm_tag.name%',NULL,'%dm_tag.name%',NULL,NULL,'fr');
/*!40000 ALTER TABLE `dm_auto_seo_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_catalogue`
--

DROP TABLE IF EXISTS `dm_catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_catalogue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_lang` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `target_lang` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_catalogue`
--

LOCK TABLES `dm_catalogue` WRITE;
/*!40000 ALTER TABLE `dm_catalogue` DISABLE KEYS */;
INSERT INTO `dm_catalogue` VALUES (1,'messages.fr','en','fr'),(2,'dm.fr','en','fr');
/*!40000 ALTER TABLE `dm_catalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_comment`
--

DROP TABLE IF EXISTS `dm_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `record_model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` bigint(20) NOT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_comment`
--

LOCK TABLES `dm_comment` WRITE;
/*!40000 ALTER TABLE `dm_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_error`
--

DROP TABLE IF EXISTS `dm_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_error` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `php_class` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `module` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `env` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_error`
--

LOCK TABLES `dm_error` WRITE;
/*!40000 ALTER TABLE `dm_error` DISABLE KEYS */;
INSERT INTO `dm_error` VALUES (1,'sfError404Exception','Empty module and/or action after parsing the URL \"/content/blog/articles/\" (/).','Empty module and/or action after parsing the URL \"/content/blog/articles/\" (/).\n#0 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#1 /home/zazabe/www/zazabe/web/admin_dev.php(7): dmContext->dispatch()\n#2 {main}',NULL,NULL,'http://zazabe.mm/admin_dev.php/content/blog/articles/','dev','2010-09-02 17:49:07'),(2,'Doctrine_Record_UnknownPropertyException','Unknown record property / related component \"tags\" on \"Article\"','Unknown record property / related component \"tags\" on \"Article\"\n#0 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/doctrine/record/dmDoctrineRecord.php(700): Doctrine_Record_Filter_Standard->filterGet(Object(Article), \'tags\')\n#1 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/doctrine/record/dmDoctrineRecord.php(616): dmDoctrineRecord->_get(\'tags\', true)\n#2 /home/zazabe/www/zazabe/cache/admin/dev/modules/autoArticle/templates/_list_td_tabular.php(27): dmDoctrineRecord->get(\'tags\')\n#3 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPHPView.class.php(75): require(\'/home/zazabe/ww...\')\n#4 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPartialView.class.php(110): sfPHPView->renderFile(\'/home/zazabe/ww...\')\n#5 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/helper/PartialHelper.php(218): sfPartialView->render()\n#6 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/helper/PartialHelper.php(180): get_partial(\'article/list_td...\', Array)\n#7 /home/zazabe/www/zazabe/cache/admin/dev/modules/autoArticle/templates/_list.php(24): include_partial(\'article/list_td...\', Array)\n#8 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPHPView.class.php(75): require(\'/home/zazabe/ww...\')\n#9 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPartialView.class.php(110): sfPHPView->renderFile(\'/home/zazabe/ww...\')\n#10 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/helper/PartialHelper.php(218): sfPartialView->render()\n#11 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/helper/PartialHelper.php(180): get_partial(\'article/list\', Array)\n#12 /home/zazabe/www/zazabe/cache/admin/dev/modules/autoArticle/templates/indexSuccess.php(26): include_partial(\'article/list\', Array)\n#13 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPHPView.class.php(75): require(\'/home/zazabe/ww...\')\n#14 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPHPView.class.php(185): sfPHPView->renderFile(\'/home/zazabe/ww...\')\n#15 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(155): sfPHPView->render()\n#16 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(116): sfExecutionFilter->executeView(\'article\', \'index\', \'Success\', Array)\n#17 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(47): sfExecutionFilter->handleView(Object(sfFilterChain), Object(articleActions), \'Success\')\n#18 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfExecutionFilter->execute(Object(sfFilterChain))\n#19 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#20 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmAdminInitFilter->execute(Object(sfFilterChain))\n#21 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#22 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#23 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#24 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmRememberMeFilter->execute(Object(sfFilterChain))\n#25 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfRenderingFilter.class.php(33): sfFilterChain->execute()\n#26 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfRenderingFilter->execute(Object(sfFilterChain))\n#27 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfController.class.php(233): sfFilterChain->execute()\n#28 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfFrontWebController.class.php(48): sfController->forward(\'article\', \'index\')\n#29 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#30 /home/zazabe/www/zazabe/web/admin_dev.php(7): dmContext->dispatch()\n#31 {main}','article','index','http://zazabe.mm/admin_dev.php/content/blog/articles/index','dev','2010-09-03 17:36:38'),(3,'Doctrine_Table_Exception','Unknown relation alias title','Unknown relation alias title\n#0 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Relation/Parser.php(235): Doctrine_Relation_Parser->getRelation(\'title\', false)\n#1 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Table.php(1001): Doctrine_Relation_Parser->getRelation(\'title\', true)\n#2 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/doctrine/record/dmDoctrineRecord.php(687): Doctrine_Table->getRelation(\'title\')\n#3 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/doctrine/record/dmDoctrineRecord.php(616): dmDoctrineRecord->_get(\'title\', true)\n#4 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Access.php(72): dmDoctrineRecord->get(\'title\')\n#5 /home/zazabe/www/zazabe/lib/model/doctrine/Article.class.php(27): Doctrine_Access->__get(\'title\')\n#6 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Table.php(260): Article->setUp()\n#7 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(1123): Doctrine_Table->__construct(\'Article\', Object(Doctrine_Connection_Mysql), true)\n#8 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Relation/Parser.php(278): Doctrine_Connection->getTable(\'Article\')\n#9 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Relation/Parser.php(404): Doctrine_Relation_Parser->getImpl(\'Article\')\n#10 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Relation/Parser.php(207): Doctrine_Relation_Parser->completeDefinition(Array)\n#11 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Relation/Parser.php(250): Doctrine_Relation_Parser->getRelation(\'Articles\')\n#12 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Table.php(1011): Doctrine_Relation_Parser->getRelations()\n#13 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/doctrine/table/dmTableRelationHolder.php(24): Doctrine_Table->getRelations()\n#14 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/doctrine/table/dmTableRelationHolder.php(102): dmTableRelationHolder->getAll()\n#15 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/doctrine/table/dmTableRelationHolder.php(115): dmTableRelationHolder->getLocals()\n#16 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/generator/dmAdminDoctrineGenerator.php(50): dmTableRelationHolder->getLocalByColumnName(\'id\')\n#17 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/data/generator/dmAdminDoctrineModule/dmAdmin/parts/fieldsConfiguration.php(88): dmAdminDoctrineGenerator->getDefaultFieldsConfiguration()\n#18 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/data/generator/dmAdminDoctrineModule/dmAdmin/parts/configuration.php(15): include(\'/home/zazabe/ww...\')\n#19 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/generator/sfGenerator.class.php(84): require(\'/home/zazabe/ww...\')\n#20 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/generator/sfModelGenerator.class.php(401): sfGenerator->evalTemplate(\'../parts/config...\')\n#21 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/generator/sfModelGenerator.class.php(58): sfModelGenerator->loadConfiguration()\n#22 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/generator/sfGeneratorManager.class.php(113): sfModelGenerator->generate(Array)\n#23 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/config/sfGeneratorConfigHandler.class.php(82): sfGeneratorManager->generate(\'dmAdminDoctrine...\', Array)\n#24 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/config/sfGeneratorConfigHandler.class.php(75): sfGeneratorConfigHandler::getContent(Object(sfGeneratorManager), \'dmAdminDoctrine...\', Array)\n#25 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/config/sfConfigCache.class.php(108): sfGeneratorConfigHandler->execute(Array)\n#26 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/config/sfConfigCache.class.php(197): sfConfigCache->callHandler(\'modules/dmUserA...\', Array, \'/home/zazabe/ww...\')\n#27 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/config/sfConfigCache.class.php(249): sfConfigCache->checkConfig(\'modules/dmUserA...\', true)\n#28 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfController.class.php(186): sfConfigCache->import(\'modules/dmUserA...\', false, true)\n#29 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(94): sfController->forward(\'dmUserAdmin\', \'signin\')\n#30 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(55): sfBasicSecurityFilter->forwardToLoginAction()\n#31 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#32 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#33 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmRememberMeFilter->execute(Object(sfFilterChain))\n#34 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfRenderingFilter.class.php(33): sfFilterChain->execute()\n#35 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfRenderingFilter->execute(Object(sfFilterChain))\n#36 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfController.class.php(233): sfFilterChain->execute()\n#37 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfFrontWebController.class.php(48): sfController->forward(\'dmAdmin\', \'index\')\n#38 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#39 /home/zazabe/www/zazabe/web/admin_dev.php(7): dmContext->dispatch()\n#40 {main}','dmAdmin','index','http://zazabe.mm/admin_dev.php?XDEBUG_SESSION_START=ECLIPSE_DBGP&KEY=12838564350711','dev','2010-09-07 17:48:01'),(4,'Exception','Couldn\'t resolve host \'diem-project.org\'','Couldn\'t resolve host \'diem-project.org\'\n#0 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/sfWebBrowserPlugin/lib/sfWebBrowser.class.php(217): sfCurlAdapter->call(Object(dmWebBrowser), \'http://diem-pro...\', \'GET\', Array, Array)\n#1 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/sfWebBrowserPlugin/lib/sfWebBrowser.class.php(116): sfWebBrowser->call(\'http://diem-pro...\', \'GET\', Array, Array)\n#2 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/webService/dmDiemVersionCheck.php(50): sfWebBrowser->get(\'http://diem-pro...\')\n#3 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/webService/dmDiemVersionCheck.php(32): dmDiemVersionCheck->getLatestServerVersionForBranch(\'5.1\')\n#4 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/modules/dmAdmin/lib/BasedmAdminActions.class.php(93): dmDiemVersionCheck->isUpToDate()\n#5 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(459): BasedmAdminActions->executeVersionCheck(Object(dmWebRequest))\n#6 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(947): sfActions->execute(Object(dmWebRequest))\n#7 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(942): sfExecutionFilter->executeAction(Object(dmAdminActions))\n#8 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(928): sfExecutionFilter->handleAction(Object(sfFilterChain), Object(dmAdminActions))\n#9 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfExecutionFilter->execute(Object(sfFilterChain))\n#10 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfCacheFilter.class.php(65): sfFilterChain->execute()\n#11 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfCacheFilter->execute(Object(sfFilterChain))\n#12 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#13 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): dmAdminInitFilter->execute(Object(sfFilterChain))\n#14 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#15 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#16 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#17 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): dmRememberMeFilter->execute(Object(sfFilterChain))\n#18 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(990): sfFilterChain->execute()\n#19 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfRenderingFilter->execute(Object(sfFilterChain))\n#20 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(660): sfFilterChain->execute()\n#21 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(2347): sfController->forward(\'dmAdmin\', \'versionCheck\')\n#22 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#23 /home/zazabe/www/zazabe/web/admin.php(7): dmContext->dispatch()\n#24 {main}','dmAdmin','versionCheck','http://zazabe.mm/admin.php/+/dmAdmin/versionCheck?_=1283886105209&dm_cpi=0&dm_xhr=1','prod','2010-09-08 02:01:46'),(5,'Exception','Couldn\'t resolve host \'diem-project.org\'','Couldn\'t resolve host \'diem-project.org\'\n#0 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/sfWebBrowserPlugin/lib/sfWebBrowser.class.php(217): sfCurlAdapter->call(Object(dmWebBrowser), \'http://diem-pro...\', \'POST\', Array, Array)\n#1 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/sfWebBrowserPlugin/lib/sfWebBrowser.class.php(139): sfWebBrowser->call(\'http://diem-pro...\', \'POST\', Array, Array)\n#2 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/webService/dmReportAnonymousData.php(31): sfWebBrowser->post(\'http://diem-pro...\', Array)\n#3 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/modules/dmAdmin/lib/BasedmAdminActions.class.php(101): dmReportAnonymousData->send()\n#4 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(459): BasedmAdminActions->executeReportAnonymousData(Object(dmWebRequest))\n#5 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(947): sfActions->execute(Object(dmWebRequest))\n#6 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(942): sfExecutionFilter->executeAction(Object(dmAdminActions))\n#7 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(928): sfExecutionFilter->handleAction(Object(sfFilterChain), Object(dmAdminActions))\n#8 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfExecutionFilter->execute(Object(sfFilterChain))\n#9 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfCacheFilter.class.php(65): sfFilterChain->execute()\n#10 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfCacheFilter->execute(Object(sfFilterChain))\n#11 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#12 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): dmAdminInitFilter->execute(Object(sfFilterChain))\n#13 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#14 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#15 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#16 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): dmRememberMeFilter->execute(Object(sfFilterChain))\n#17 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(990): sfFilterChain->execute()\n#18 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfRenderingFilter->execute(Object(sfFilterChain))\n#19 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(660): sfFilterChain->execute()\n#20 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(2347): sfController->forward(\'dmAdmin\', \'reportAnonymous...\')\n#21 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#22 /home/zazabe/www/zazabe/web/admin.php(7): dmContext->dispatch()\n#23 {main}','dmAdmin','reportAnonymousData','http://zazabe.mm/admin.php/+/dmAdmin/reportAnonymousData?_=1283886106641&dm_cpi=0&dm_xhr=1','prod','2010-09-08 02:01:47'),(6,'Exception','Couldn\'t resolve host \'diem-project.org\'','Couldn\'t resolve host \'diem-project.org\'\n#0 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/sfWebBrowserPlugin/lib/sfWebBrowser.class.php(217): sfCurlAdapter->call(Object(dmWebBrowser), \'http://diem-pro...\', \'GET\', Array, Array)\n#1 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/sfWebBrowserPlugin/lib/sfWebBrowser.class.php(116): sfWebBrowser->call(\'http://diem-pro...\', \'GET\', Array, Array)\n#2 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/webService/dmDiemVersionCheck.php(50): sfWebBrowser->get(\'http://diem-pro...\')\n#3 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/webService/dmDiemVersionCheck.php(32): dmDiemVersionCheck->getLatestServerVersionForBranch(\'5.1\')\n#4 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/modules/dmAdmin/lib/BasedmAdminActions.class.php(93): dmDiemVersionCheck->isUpToDate()\n#5 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(459): BasedmAdminActions->executeVersionCheck(Object(dmWebRequest))\n#6 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(947): sfActions->execute(Object(dmWebRequest))\n#7 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(942): sfExecutionFilter->executeAction(Object(dmAdminActions))\n#8 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(928): sfExecutionFilter->handleAction(Object(sfFilterChain), Object(dmAdminActions))\n#9 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfExecutionFilter->execute(Object(sfFilterChain))\n#10 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfCacheFilter.class.php(65): sfFilterChain->execute()\n#11 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfCacheFilter->execute(Object(sfFilterChain))\n#12 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#13 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): dmAdminInitFilter->execute(Object(sfFilterChain))\n#14 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#15 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#16 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#17 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): dmRememberMeFilter->execute(Object(sfFilterChain))\n#18 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(990): sfFilterChain->execute()\n#19 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfRenderingFilter->execute(Object(sfFilterChain))\n#20 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(660): sfFilterChain->execute()\n#21 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(2347): sfController->forward(\'dmAdmin\', \'versionCheck\')\n#22 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#23 /home/zazabe/www/zazabe/web/admin.php(7): dmContext->dispatch()\n#24 {main}','dmAdmin','versionCheck','http://zazabe.mm/admin.php/+/dmAdmin/versionCheck?_=1283969224969&dm_cpi=0&dm_xhr=1','prod','2010-09-09 01:07:06'),(7,'Exception','Couldn\'t resolve host \'diem-project.org\'','Couldn\'t resolve host \'diem-project.org\'\n#0 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/sfWebBrowserPlugin/lib/sfWebBrowser.class.php(217): sfCurlAdapter->call(Object(dmWebBrowser), \'http://diem-pro...\', \'POST\', Array, Array)\n#1 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/sfWebBrowserPlugin/lib/sfWebBrowser.class.php(139): sfWebBrowser->call(\'http://diem-pro...\', \'POST\', Array, Array)\n#2 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/webService/dmReportAnonymousData.php(31): sfWebBrowser->post(\'http://diem-pro...\', Array)\n#3 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/modules/dmAdmin/lib/BasedmAdminActions.class.php(101): dmReportAnonymousData->send()\n#4 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(459): BasedmAdminActions->executeReportAnonymousData(Object(dmWebRequest))\n#5 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(947): sfActions->execute(Object(dmWebRequest))\n#6 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(942): sfExecutionFilter->executeAction(Object(dmAdminActions))\n#7 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(928): sfExecutionFilter->handleAction(Object(sfFilterChain), Object(dmAdminActions))\n#8 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfExecutionFilter->execute(Object(sfFilterChain))\n#9 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfCacheFilter.class.php(65): sfFilterChain->execute()\n#10 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfCacheFilter->execute(Object(sfFilterChain))\n#11 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#12 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): dmAdminInitFilter->execute(Object(sfFilterChain))\n#13 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#14 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#15 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#16 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): dmRememberMeFilter->execute(Object(sfFilterChain))\n#17 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(990): sfFilterChain->execute()\n#18 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(1026): sfRenderingFilter->execute(Object(sfFilterChain))\n#19 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(660): sfFilterChain->execute()\n#20 /home/zazabe/www/zazabe/cache/admin/prod/config/config_core_compile.yml.php(2347): sfController->forward(\'dmAdmin\', \'reportAnonymous...\')\n#21 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#22 /home/zazabe/www/zazabe/web/admin.php(7): dmContext->dispatch()\n#23 {main}','dmAdmin','reportAnonymousData','http://zazabe.mm/admin.php/+/dmAdmin/reportAnonymousData?_=1283969224985&dm_cpi=0&dm_xhr=1','prod','2010-09-09 01:07:07');
/*!40000 ALTER TABLE `dm_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_group`
--

DROP TABLE IF EXISTS `dm_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_group`
--

LOCK TABLES `dm_group` WRITE;
/*!40000 ALTER TABLE `dm_group` DISABLE KEYS */;
INSERT INTO `dm_group` VALUES (1,'developer','Able to read and update source code','2010-08-27 15:19:27','2010-08-27 15:19:27'),(2,'seo','Seo knowledge','2010-08-27 15:19:27','2010-08-27 15:19:27'),(3,'integrator','Integrator','2010-08-27 15:19:27','2010-08-27 15:19:27'),(4,'webmaster 1','Webmaster level 1','2010-08-27 15:19:28','2010-08-27 15:19:28'),(5,'writer','Writer','2010-08-27 15:19:28','2010-08-27 15:19:28'),(6,'front_editor','Can fast edit front widgets','2010-08-27 15:19:28','2010-08-27 15:19:28');
/*!40000 ALTER TABLE `dm_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_group_permission`
--

DROP TABLE IF EXISTS `dm_group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_group_permission` (
  `dm_group_id` bigint(20) NOT NULL DEFAULT '0',
  `dm_permission_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dm_group_id`,`dm_permission_id`),
  KEY `dm_group_permission_dm_permission_id_dm_permission_id` (`dm_permission_id`),
  CONSTRAINT `dm_group_permission_dm_group_id_dm_group_id` FOREIGN KEY (`dm_group_id`) REFERENCES `dm_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_group_permission_dm_permission_id_dm_permission_id` FOREIGN KEY (`dm_permission_id`) REFERENCES `dm_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_group_permission`
--

LOCK TABLES `dm_group_permission` WRITE;
/*!40000 ALTER TABLE `dm_group_permission` DISABLE KEYS */;
INSERT INTO `dm_group_permission` VALUES (1,1),(2,2),(3,2),(4,2),(5,2),(3,5),(3,9),(4,9),(5,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(6,16),(6,17),(6,18),(6,19),(6,20),(6,21),(6,22),(3,23),(3,24),(3,25),(2,26),(3,26),(4,26),(5,26),(3,27),(4,27),(5,27),(3,28),(2,29),(3,29),(4,29),(5,29),(2,30),(3,30),(4,30),(3,31),(4,31),(2,32),(3,32),(4,32),(2,33),(3,33),(4,33),(5,33),(3,34),(3,35),(2,36),(2,37),(2,38),(2,40),(2,41),(2,42),(2,43),(2,44),(4,46),(2,47),(3,47),(4,47),(5,47),(2,48),(3,48),(4,48),(5,48),(2,51),(3,51),(4,51),(3,52),(4,52),(3,53),(3,57);
/*!40000 ALTER TABLE `dm_group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_layout`
--

DROP TABLE IF EXISTS `dm_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_layout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'page',
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_layout`
--

LOCK TABLES `dm_layout` WRITE;
/*!40000 ALTER TABLE `dm_layout` DISABLE KEYS */;
INSERT INTO `dm_layout` VALUES (1,'Global','page','page'),(2,'Home','home','home'),(3,'Article','article','page article'),(4,'Print','print','page cursus print');
/*!40000 ALTER TABLE `dm_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_lock`
--

DROP TABLE IF EXISTS `dm_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_lock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `time` bigint(20) NOT NULL,
  `app` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `culture` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dmLockIndex_idx` (`user_id`,`module`,`action`,`record_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `dm_lock_user_id_dm_user_id` FOREIGN KEY (`user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_lock`
--

LOCK TABLES `dm_lock` WRITE;
/*!40000 ALTER TABLE `dm_lock` DISABLE KEYS */;
INSERT INTO `dm_lock` VALUES (73,1,'admin','dmLayout','edit',4,1284175645,'admin','/admin.php/tools/configuration/layouts/edit/pk/4','fr');
/*!40000 ALTER TABLE `dm_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_mail_template`
--

DROP TABLE IF EXISTS `dm_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_mail_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vars` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_mail_template`
--

LOCK TABLES `dm_mail_template` WRITE;
/*!40000 ALTER TABLE `dm_mail_template` DISABLE KEYS */;
INSERT INTO `dm_mail_template` VALUES (1,'dm_user_forgot_password','username, email, step2_url','2010-08-27 15:20:09','2010-08-27 15:20:09');
/*!40000 ALTER TABLE `dm_mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_mail_template_translation`
--

DROP TABLE IF EXISTS `dm_mail_template_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_mail_template_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `from_email` text COLLATE utf8_unicode_ci NOT NULL,
  `to_email` text COLLATE utf8_unicode_ci,
  `cc_email` text COLLATE utf8_unicode_ci,
  `bcc_email` text COLLATE utf8_unicode_ci,
  `reply_to_email` text COLLATE utf8_unicode_ci,
  `sender_email` text COLLATE utf8_unicode_ci,
  `list_unsuscribe` text COLLATE utf8_unicode_ci,
  `is_html` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_mail_template_translation_id_dm_mail_template_id` FOREIGN KEY (`id`) REFERENCES `dm_mail_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_mail_template_translation`
--

LOCK TABLES `dm_mail_template_translation` WRITE;
/*!40000 ALTER TABLE `dm_mail_template_translation` DISABLE KEYS */;
INSERT INTO `dm_mail_template_translation` VALUES (1,'Sent to a user that requests a new password','Zazabe: change your password','Hello %username%\nYou can choose a new password at %step2_url%','webmaster@domain.com','%email%',NULL,NULL,NULL,NULL,NULL,0,1,'fr');
/*!40000 ALTER TABLE `dm_mail_template_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_media`
--

DROP TABLE IF EXISTS `dm_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_media_folder_id` bigint(20) NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `legend` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(10) unsigned DEFAULT NULL,
  `dimensions` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `folderFile_idx` (`dm_media_folder_id`,`file`),
  KEY `dm_media_folder_id_idx` (`dm_media_folder_id`),
  CONSTRAINT `dm_media_dm_media_folder_id_dm_media_folder_id` FOREIGN KEY (`dm_media_folder_id`) REFERENCES `dm_media_folder` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_media`
--

LOCK TABLES `dm_media` WRITE;
/*!40000 ALTER TABLE `dm_media` DISABLE KEYS */;
INSERT INTO `dm_media` VALUES (6,1,'zazabe.png','where is my localhost ?','Michel Meyer','','image/png',317244,'600x426','2010-08-27 16:39:45','2010-08-27 16:39:46'),(7,1,'logo_mermoz.gif',NULL,NULL,NULL,'image/gif',4861,'222x102','2010-09-03 15:56:24','2010-09-03 15:56:25'),(8,1,'sciopta.jpg','Sciopta - Real-time embedded system','','','image/jpeg',3665,'183x93','2010-09-03 15:57:00','2010-09-03 15:57:01'),(9,3,'logo.gif','Professional bachelor\'s degree in image and sound activities and techniques','','','image/gif',2025,'95x99','2010-09-03 16:21:37','2010-09-03 16:21:40'),(10,3,'logo-attac.gif','Attac logo','','','image/gif',4744,'204x295','2010-09-03 16:30:21','2010-09-03 16:30:23'),(11,3,'attac-accueil.jpg','website - homepage','','','image/jpeg',50556,'300x194','2010-09-03 16:39:34','2010-09-03 16:39:35'),(12,3,'attac-article.jpg','attac -article','','','image/jpeg',58672,'293x194','2010-09-03 16:39:56','2010-09-03 16:39:57'),(13,3,'attac-media.jpg','attac - media','','','image/jpeg',46081,'292x186','2010-09-03 16:40:26','2010-09-03 16:40:27'),(14,3,'photozama-accueil.jpg','photozama - home','','','image/jpeg',96369,'767x508','2010-09-03 16:48:48','2010-09-03 16:48:49'),(15,3,'photozama-details.jpg','photozama - details','','','image/jpeg',111587,'776x402','2010-09-03 16:49:17','2010-09-03 16:49:19'),(16,3,'photozama-saisie.jpg','photozama - info','','','image/jpeg',124523,'742x539','2010-09-03 16:49:58','2010-09-03 16:49:59'),(17,3,'photozama-traitement.jpg','photozama - traitement','','','image/jpeg',124385,'794x501','2010-09-03 16:50:21','2010-09-03 16:50:23'),(18,3,'hetic.jpg','HETIC logo','','','image/jpeg',10315,'358x105','2010-09-03 17:28:53','2010-09-03 17:28:55'),(19,3,'intracom.jpg','intracom 2007 - homepage','','','image/jpeg',98173,'350x221','2010-09-03 17:35:14','2010-09-03 17:35:16'),(20,3,'kultura_vert.jpg','Kultura - Homepage','','','image/jpeg',157374,'350x340','2010-09-03 17:46:15','2010-09-03 17:46:17'),(21,3,'sany0266-medium.JPG','Time is running out ','','','image/jpeg',92512,'800x600','2010-09-03 17:53:22','2010-09-03 17:53:24'),(22,3,'sany0287-medium.JPG','Time is running out ','','','image/jpeg',77039,'800x600','2010-09-03 17:53:42','2010-09-03 17:53:44'),(23,4,'photo-zazabe.png',NULL,NULL,NULL,'image/png',30616,'180x140','2010-09-07 11:33:39','2010-09-07 11:33:42');
/*!40000 ALTER TABLE `dm_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_media_folder`
--

DROP TABLE IF EXISTS `dm_media_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_media_folder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rel_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rel_path` (`rel_path`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_media_folder`
--

LOCK TABLES `dm_media_folder` WRITE;
/*!40000 ALTER TABLE `dm_media_folder` DISABLE KEYS */;
INSERT INTO `dm_media_folder` VALUES (1,'',1,8,0),(2,'assets',4,5,1),(3,'article',2,3,1),(4,'widget',6,7,1);
/*!40000 ALTER TABLE `dm_media_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_page`
--

DROP TABLE IF EXISTS `dm_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `credentials` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recordModuleAction_idx` (`module`,`action`,`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_page`
--

LOCK TABLES `dm_page` WRITE;
/*!40000 ALTER TABLE `dm_page` DISABLE KEYS */;
INSERT INTO `dm_page` VALUES (1,'main','root',0,'',1,98,0),(2,'main','error404',0,NULL,4,5,1),(3,'main','signin',0,NULL,2,3,1),(4,'dmTag','list',0,NULL,6,63,1),(5,'article','list',0,NULL,64,85,1),(6,'article','show',1,NULL,65,66,2),(7,'dmTag','show',1,NULL,7,8,2),(8,'dmTag','show',2,NULL,9,10,2),(9,'dmTag','show',3,NULL,11,12,2),(10,'dmTag','show',4,NULL,13,14,2),(11,'dmTag','show',5,NULL,15,16,2),(12,'dmTag','show',6,NULL,17,18,2),(13,'article','show',2,NULL,67,68,2),(14,'dmTag','show',7,NULL,19,20,2),(15,'dmTag','show',8,NULL,21,22,2),(16,'dmTag','show',9,NULL,23,24,2),(17,'article','show',3,NULL,69,70,2),(18,'dmTag','show',10,NULL,25,26,2),(19,'dmTag','show',11,NULL,27,28,2),(20,'article','show',4,NULL,71,72,2),(21,'dmTag','show',12,NULL,29,30,2),(22,'dmTag','show',13,NULL,31,32,2),(23,'article','show',5,NULL,73,74,2),(24,'dmTag','show',14,NULL,33,34,2),(25,'article','show',6,NULL,75,76,2),(26,'main','zazabe',0,NULL,86,87,1),(27,'main','cursus',0,'',88,89,1),(28,'main','projects',0,NULL,90,91,1),(29,'main','about',0,NULL,92,93,1),(44,'article','show',21,NULL,77,78,2),(45,'dmTag','show',15,NULL,35,36,2),(46,'dmTag','show',16,NULL,37,38,2),(47,'dmTag','show',17,NULL,39,40,2),(48,'dmTag','show',18,NULL,41,42,2),(49,'dmTag','show',19,NULL,43,44,2),(50,'dmTag','show',20,NULL,45,46,2),(51,'article','show',22,NULL,79,80,2),(52,'dmTag','show',21,NULL,47,48,2),(53,'article','show',23,NULL,81,82,2),(54,'dmTag','show',22,NULL,49,50,2),(55,'dmTag','show',23,NULL,51,52,2),(56,'dmTag','show',24,NULL,53,54,2),(57,'dmTag','show',25,NULL,55,56,2),(58,'article','show',24,'',83,84,2),(59,'dmTag','show',26,NULL,57,58,2),(60,'dmTag','show',27,NULL,59,60,2),(61,'dmTag','show',28,NULL,61,62,2),(62,'main','cursusPrint',0,'',94,95,1),(63,'main','cursusDownload',0,NULL,96,97,1);
/*!40000 ALTER TABLE `dm_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_page_translation`
--

DROP TABLE IF EXISTS `dm_page_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_page_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `h1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auto_mod` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'snthdk',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_secure` tinyint(1) NOT NULL DEFAULT '0',
  `is_indexable` tinyint(1) NOT NULL DEFAULT '1',
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_page_translation_id_dm_page_id` FOREIGN KEY (`id`) REFERENCES `dm_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_page_translation`
--

LOCK TABLES `dm_page_translation` WRITE;
/*!40000 ALTER TABLE `dm_page_translation` DISABLE KEYS */;
INSERT INTO `dm_page_translation` VALUES (1,'','Home','Home','','','','snthdk',1,0,1,'fr'),(2,'error404','Page not found','Page not found',NULL,NULL,NULL,'snthdk',1,0,1,'fr'),(3,'security/signin','Signin','Signin',NULL,NULL,NULL,'snthdk',1,0,1,'fr'),(4,'tags','Tags','Tags',NULL,'Tags',NULL,'snthdk',1,0,1,'fr'),(5,'articles','Articles','Articles',NULL,'Articles',NULL,'snthdk',1,0,1,'fr'),(6,'articles/sciopta-real-time-embedded-system','Sciopta - Real-time embedded system','Sciopta - Real-time embedded system',NULL,'What Sciopta?\r\nThe Sciopta company is based in  Weil em Rhein, Germany and is specialized in embedded computing.\r\nFor 18 months they developed a realtime embedd',NULL,'snthdk',1,0,1,'fr'),(7,'tags/c','C++','C++',NULL,'C++',NULL,'snthdk',1,0,1,'fr'),(8,'tags/systeme-embarque','système embarqué','Système embarqué',NULL,'système embarqué',NULL,'snthdk',1,0,1,'fr'),(9,'tags/reseaux','réseaux','Réseaux',NULL,'réseaux',NULL,'snthdk',1,0,1,'fr'),(10,'tags/access','Access','Access',NULL,'Access',NULL,'snthdk',1,0,1,'fr'),(11,'tags/vb6','VB6','VB6',NULL,'VB6',NULL,'snthdk',1,0,1,'fr'),(12,'tags/desktop','Desktop','Desktop',NULL,'Desktop',NULL,'snthdk',1,0,1,'fr'),(13,'articles/photozama-personalized-photo-library','PhotoZama - personalized photo library','PhotoZama - personalized photo library',NULL,'I completely designed and made this application during a period of three months in Madagascar for the NGO Vozama.\r\nThe goal is to manage a library of tens of th',NULL,'snthdk',1,0,1,'fr'),(14,'tags/xslt','XSLT','XSLT',NULL,'XSLT',NULL,'snthdk',1,0,1,'fr'),(15,'tags/ajax','AJAX','AJAX',NULL,'AJAX',NULL,'snthdk',1,0,1,'fr'),(16,'tags/spip','SPIP','SPIP',NULL,'SPIP',NULL,'snthdk',1,0,1,'fr'),(17,'articles/attac-media-library','Attac media library','Attac media library',NULL,'The project aims to create a website offering a common library, allowing supporters of the association ATTAC exchange their documents (books, DVDs, VHS, article',NULL,'snthdk',1,0,1,'fr'),(18,'tags/php5','PHP5','PHP5',NULL,'PHP5',NULL,'snthdk',1,0,1,'fr'),(19,'tags/mvc','MVC','MVC',NULL,'MVC',NULL,'snthdk',1,0,1,'fr'),(20,'articles/intracom-2007-ntic-meeting','Intracom 2007 - NTIC meeting','Intracom 2007 - NTIC meeting',NULL,'Site created as part of HETIC projects\r\n\r\nI take part to the project as developer, the main functions that I brought to the back office are:\r\n\r\n Managing direct',NULL,'snthdk',1,0,1,'fr'),(21,'tags/code-igniter','Code Igniter','Code Igniter',NULL,'Code Igniter',NULL,'snthdk',1,0,1,'fr'),(22,'tags/hetic','HETIC','HETIC',NULL,'HETIC',NULL,'snthdk',1,0,1,'fr'),(23,'articles/kultura','Kultura','Kultura',NULL,'Site created as part of HETIC projects\r\n\r\n\r\nThis project was my first experience as a project manager.\r\n\r\nThe project is therefore, an artist area in \"MySpace\" ',NULL,'snthdk',1,0,1,'fr'),(24,'tags/video','Vidéo','Vidéo',NULL,'Vidéo',NULL,'snthdk',1,0,1,'fr'),(25,'articles/short-film-time-is-running-out','Short film - Time Is Running Out','Short film - Time Is Running Out',NULL,'Film made within HETIC videos weeks \r\n\r\nWe have two weeks to write the script, get familiar with the equipment, shooting and editing the film.\r\n\r\nThe shooting h',NULL,'snthdk',1,0,1,'fr'),(26,'zazabe','zazabe','zazabe',NULL,NULL,NULL,'snthdk',1,0,1,'fr'),(27,'resume','resume','resume','','','','snthdk',1,0,1,'fr'),(28,'projects','projects','projects',NULL,NULL,NULL,'snthdk',1,0,1,'fr'),(29,'about','about','about',NULL,NULL,NULL,'snthdk',1,0,1,'fr'),(44,'articles/cursus','CURSUS','CURSUS',NULL,NULL,NULL,'snthdk',1,0,1,'fr'),(45,'tags/embedded-systems','embedded systems','Embedded systems',NULL,'embedded systems',NULL,'snthdk',1,0,1,'fr'),(46,'tags/studies','studies','Studies',NULL,'studies',NULL,'snthdk',1,0,1,'fr'),(47,'tags/network','network','Network',NULL,'network',NULL,'snthdk',1,0,1,'fr'),(48,'tags/unix','UNIX','UNIX',NULL,'UNIX',NULL,'snthdk',1,0,1,'fr'),(49,'tags/assembly','Assembly','Assembly',NULL,'Assembly',NULL,'snthdk',1,0,1,'fr'),(50,'tags/system-architecture','system architecture','System architecture',NULL,'system architecture',NULL,'snthdk',1,0,1,'fr'),(51,'articles/2002-2004-jean-mermoz-high-school-saint-louis-alsace-france','2002 - 2004 | Jean Mermoz High School | Saint-Louis, Alsace, France','2002 - 2004 | Jean Mermoz High School | Saint-Louis, Alsace, France',NULL,'This formation provide the basic knowledge of industrial data processing, a branch of applied computer science that covers the area of design and programming of',NULL,'snthdk',1,0,1,'fr'),(52,'tags/multimedia','multimedia','Multimedia',NULL,'multimedia',NULL,'snthdk',1,0,1,'fr'),(53,'articles/2004-2005-university-institutes-for-technology-chalon-sur-saone-bourgogne-france','2004 - 2005 | University Institutes for Technology  | Chalon-sur-Saône, Bourgogne, France','2004 - 2005 | University Institutes for Technology  | Chalon-sur-Saône, Bourgogn',NULL,'This professional bachelor\'s degree, created in the city of Niepce, the inventor of photography in 1824, aims to train professionals whose expertise in creating',NULL,'snthdk',1,0,1,'fr'),(54,'tags/web-analytics','web analytics','Web analytics',NULL,'web analytics',NULL,'snthdk',1,0,1,'fr'),(55,'tags/marketing','marketing','Marketing',NULL,'marketing',NULL,'snthdk',1,0,1,'fr'),(56,'tags/project-management','project management','Project management',NULL,'project management',NULL,'snthdk',1,0,1,'fr'),(57,'tags/communication','communication','Communication',NULL,'communication',NULL,'snthdk',1,0,1,'fr'),(58,'articles/2006-2008-hetic-advanced-studies-of-information-technologies-and-communication-montreuil-ile-de-france-france','2006 - 2008 | HETIC : Advanced Studies of Information Technologies and Communication | Montreuil, Île-de-France, France','2006 - 2008 | HETIC : Advanced Studies of Information Technologies and Communica','','Master’s Degree in Engineering and Management of Digital Communication\n<br />\n Information technology\nCovering the fundamentals of the Internet, Web static a','','snthk',1,0,1,'fr'),(59,'tags/languages-theory','languages theory','Languages theory',NULL,'languages theory',NULL,'snthdk',1,0,1,'fr'),(60,'tags/software-engineering','software engineering','Software engineering',NULL,'software engineering',NULL,'snthdk',1,0,1,'fr'),(61,'tags/network-protocols','network protocols','Network protocols',NULL,'network protocols',NULL,'snthdk',1,0,1,'fr'),(62,'print-resume','cursus - print','cursus - print','','','','snthdk',1,0,1,'fr'),(63,'cursus-download','cursus - download','cursus - download',NULL,NULL,NULL,'snthdk',1,0,1,'fr');
/*!40000 ALTER TABLE `dm_page_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_page_view`
--

DROP TABLE IF EXISTS `dm_page_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_page_view` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `dm_layout_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dmPageViewModuleAction_idx` (`module`,`action`),
  KEY `dm_layout_id_idx` (`dm_layout_id`),
  CONSTRAINT `dm_page_view_dm_layout_id_dm_layout_id` FOREIGN KEY (`dm_layout_id`) REFERENCES `dm_layout` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_page_view`
--

LOCK TABLES `dm_page_view` WRITE;
/*!40000 ALTER TABLE `dm_page_view` DISABLE KEYS */;
INSERT INTO `dm_page_view` VALUES (1,'main','root',2),(2,'main','error404',1),(3,'main','signin',1),(4,'dmTag','list',1),(5,'article','list',1),(6,'article','show',3),(7,'dmTag','show',1),(8,'main','zazabe',1),(9,'main','cursus',1),(10,'main','projects',1),(11,'main','about',1),(12,'main','cursusPrint',4),(13,'main','cursusDownload',4);
/*!40000 ALTER TABLE `dm_page_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_permission`
--

DROP TABLE IF EXISTS `dm_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_permission`
--

LOCK TABLES `dm_permission` WRITE;
/*!40000 ALTER TABLE `dm_permission` DISABLE KEYS */;
INSERT INTO `dm_permission` VALUES (1,'system','System administrator','2010-08-27 15:19:26','2010-08-27 15:19:26'),(2,'admin','Log into administration','2010-08-27 15:19:26','2010-08-27 15:19:26'),(3,'clear_cache','Clear the cache','2010-08-27 15:19:26','2010-08-27 15:19:26'),(4,'log','Manage logs','2010-08-27 15:19:26','2010-08-27 15:19:26'),(5,'code_editor','Use admin and front code editors','2010-08-27 15:19:26','2010-08-27 15:19:26'),(6,'security_user','Manage security users','2010-08-27 15:19:26','2010-08-27 15:19:26'),(7,'security_permission','Manage security permissions','2010-08-27 15:19:26','2010-08-27 15:19:26'),(8,'security_group','Manage security groups','2010-08-27 15:19:26','2010-08-27 15:19:26'),(9,'content','CRUD dynamic content in admin','2010-08-27 15:19:26','2010-08-27 15:19:26'),(10,'zone_add','Add zones','2010-08-27 15:19:26','2010-08-27 15:19:26'),(11,'zone_edit','Edit zones','2010-08-27 15:19:26','2010-08-27 15:19:26'),(12,'zone_delete','Delete zones','2010-08-27 15:19:26','2010-08-27 15:19:26'),(13,'widget_add','Add widgets','2010-08-27 15:19:26','2010-08-27 15:19:26'),(14,'widget_edit','Edit widgets','2010-08-27 15:19:26','2010-08-27 15:19:26'),(15,'widget_delete','Delete widgets','2010-08-27 15:19:26','2010-08-27 15:19:26'),(16,'widget_edit_fast','Can fast edit widgets','2010-08-27 15:19:26','2010-08-27 15:19:26'),(17,'widget_edit_fast_record','Fast edit widget record','2010-08-27 15:19:26','2010-08-27 15:19:26'),(18,'widget_edit_fast_content_title','Fast edit widget content title','2010-08-27 15:19:26','2010-08-27 15:19:26'),(19,'widget_edit_fast_content_link','Fast edit widget content link','2010-08-27 15:19:26','2010-08-27 15:19:26'),(20,'widget_edit_fast_content_image','Fast edit widget content image','2010-08-27 15:19:26','2010-08-27 15:19:26'),(21,'widget_edit_fast_content_text','Fast edit widget content text','2010-08-27 15:19:26','2010-08-27 15:19:26'),(22,'widget_edit_fast_navigation_menu','Fast edit widget navigation menu','2010-08-27 15:19:26','2010-08-27 15:19:26'),(23,'page_add','Add pages','2010-08-27 15:19:26','2010-08-27 15:19:26'),(24,'page_edit','Edit pages','2010-08-27 15:19:26','2010-08-27 15:19:26'),(25,'page_delete','Delete pages','2010-08-27 15:19:26','2010-08-27 15:19:26'),(26,'page_bar_admin','See page bar in admin','2010-08-27 15:19:26','2010-08-27 15:19:26'),(27,'media_bar_admin','See media bar in admin','2010-08-27 15:19:26','2010-08-27 15:19:26'),(28,'media_library','Use media library in admin','2010-08-27 15:19:26','2010-08-27 15:19:26'),(29,'tool_bar_admin','See toolbar in admin','2010-08-27 15:19:26','2010-08-27 15:19:26'),(30,'page_bar_front','See page bar in front','2010-08-27 15:19:26','2010-08-27 15:19:26'),(31,'media_bar_front','See media bar in front','2010-08-27 15:19:26','2010-08-27 15:19:26'),(32,'tool_bar_front','See toolbar in front','2010-08-27 15:19:26','2010-08-27 15:19:26'),(33,'site_view','See non-public website and inactive pages','2010-08-27 15:19:26','2010-08-27 15:19:26'),(34,'loremize','Create automatic random content','2010-08-27 15:19:26','2010-08-27 15:19:26'),(35,'export_table','Export table contents','2010-08-27 15:19:26','2010-08-27 15:19:26'),(36,'sitemap','Regenerate sitemap','2010-08-27 15:19:26','2010-08-27 15:19:26'),(37,'automatic_metas','Configure automatic pages metas','2010-08-27 15:19:26','2010-08-27 15:19:26'),(38,'manual_metas','Configure manually pages metas','2010-08-27 15:19:26','2010-08-27 15:19:26'),(39,'manage_pages','Move and sort pages','2010-08-27 15:19:26','2010-08-27 15:19:26'),(40,'url_redirection','Configure url redirections','2010-08-27 15:19:26','2010-08-27 15:19:26'),(41,'use_google_analytics','Use google analytics','2010-08-27 15:19:26','2010-08-27 15:19:26'),(42,'google_analytics','Configure google analytics','2010-08-27 15:19:26','2010-08-27 15:19:26'),(43,'use_google_webmaster_tools','Use google webmaster tools','2010-08-27 15:19:26','2010-08-27 15:19:26'),(44,'google_webmaster_tools','Configure google webmaster tools','2010-08-27 15:19:26','2010-08-27 15:19:26'),(45,'xiti','Configure Xiti','2010-08-27 15:19:26','2010-08-27 15:19:26'),(46,'search_engine','Manage internal search engine','2010-08-27 15:19:26','2010-08-27 15:19:26'),(47,'see_log','See the logs','2010-08-27 15:19:26','2010-08-27 15:19:26'),(48,'see_chart','See the charts','2010-08-27 15:19:26','2010-08-27 15:19:26'),(49,'see_diagrams','See the developer diagrams','2010-08-27 15:19:26','2010-08-27 15:19:26'),(50,'see_server','See the server infos','2010-08-27 15:19:26','2010-08-27 15:19:26'),(51,'config_panel','Use the configuration panel','2010-08-27 15:19:26','2010-08-27 15:19:26'),(52,'translation','Use the translation interface','2010-08-27 15:19:26','2010-08-27 15:19:26'),(53,'layout','Use the layout interface','2010-08-27 15:19:26','2010-08-27 15:19:26'),(54,'sent_mail','See mails sent by server','2010-08-27 15:19:26','2010-08-27 15:19:26'),(55,'mail_template','Configure mail templates','2010-08-27 15:19:26','2010-08-27 15:19:26'),(56,'error_log','See error log','2010-08-27 15:19:26','2010-08-27 15:19:26'),(57,'interface_settings','Manage interface settings like default image resize method','2010-08-27 15:19:26','2010-08-27 15:19:26');
/*!40000 ALTER TABLE `dm_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_redirect`
--

DROP TABLE IF EXISTS `dm_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_redirect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dest` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source` (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_redirect`
--

LOCK TABLES `dm_redirect` WRITE;
/*!40000 ALTER TABLE `dm_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_remember_key`
--

DROP TABLE IF EXISTS `dm_remember_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_remember_key` (
  `dm_user_id` bigint(20) DEFAULT NULL,
  `remember_key` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`ip_address`),
  KEY `dm_user_id_idx` (`dm_user_id`),
  CONSTRAINT `dm_remember_key_dm_user_id_dm_user_id` FOREIGN KEY (`dm_user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_remember_key`
--

LOCK TABLES `dm_remember_key` WRITE;
/*!40000 ALTER TABLE `dm_remember_key` DISABLE KEYS */;
INSERT INTO `dm_remember_key` VALUES (1,'42f4f5c4a8dab97083089e3deef76d18','127.0.0.1','2010-09-11 08:16:26');
/*!40000 ALTER TABLE `dm_remember_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_sent_mail`
--

DROP TABLE IF EXISTS `dm_sent_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_sent_mail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_mail_template_id` bigint(20) DEFAULT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `from_email` text COLLATE utf8_unicode_ci NOT NULL,
  `to_email` text COLLATE utf8_unicode_ci,
  `cc_email` text COLLATE utf8_unicode_ci,
  `bcc_email` text COLLATE utf8_unicode_ci,
  `reply_to_email` text COLLATE utf8_unicode_ci,
  `sender_email` text COLLATE utf8_unicode_ci,
  `strategy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transport` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `culture` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debug_string` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_mail_template_id_idx` (`dm_mail_template_id`),
  CONSTRAINT `dm_sent_mail_dm_mail_template_id_dm_mail_template_id` FOREIGN KEY (`dm_mail_template_id`) REFERENCES `dm_mail_template` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_sent_mail`
--

LOCK TABLES `dm_sent_mail` WRITE;
/*!40000 ALTER TABLE `dm_sent_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_sent_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_setting`
--

DROP TABLE IF EXISTS `dm_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `params` text COLLATE utf8_unicode_ci,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `credentials` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_setting`
--

LOCK TABLES `dm_setting` WRITE;
/*!40000 ALTER TABLE `dm_setting` DISABLE KEYS */;
INSERT INTO `dm_setting` VALUES (1,'site_name','text',NULL,'site',NULL),(2,'site_active','boolean',NULL,'site',NULL),(3,'site_indexable','boolean',NULL,'site',NULL),(4,'site_working_copy','boolean',NULL,'site',NULL),(5,'ga_key','text',NULL,'tracking','google_analytics'),(6,'ga_token','text',NULL,'internal','google_analytics'),(7,'gwt_key','text',NULL,'tracking','google_webmaster_tools'),(8,'xiti_code','textarea',NULL,'tracking','xiti'),(9,'search_stop_words','textarea',NULL,'search engine','search_engine'),(10,'base_urls','textarea',NULL,'internal','system'),(11,'image_resize_method','select','fit=Fit scale=Scale inflate=Inflate top=Top right=Right left=Left bottom=Bottom center=Center','interface','interface_settings'),(12,'image_resize_quality','number',NULL,'interface','interface_settings'),(13,'link_external_blank','boolean',NULL,'interface','interface_settings'),(14,'link_current_span','boolean',NULL,'interface','interface_settings'),(15,'link_use_page_title','boolean',NULL,'interface','interface_settings'),(16,'title_prefix','text',NULL,'seo','manual_metas'),(17,'title_suffix','text',NULL,'seo','manual_metas'),(18,'smart_404','boolean',NULL,'seo','url_redirection');
/*!40000 ALTER TABLE `dm_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_setting_translation`
--

DROP TABLE IF EXISTS `dm_setting_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_setting_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `default_value` text COLLATE utf8_unicode_ci,
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_setting_translation_id_dm_setting_id` FOREIGN KEY (`id`) REFERENCES `dm_setting` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_setting_translation`
--

LOCK TABLES `dm_setting_translation` WRITE;
/*!40000 ALTER TABLE `dm_setting_translation` DISABLE KEYS */;
INSERT INTO `dm_setting_translation` VALUES (1,'The site name','Zazabe','Zazabe','fr'),(2,'Is the site ready for visitors ?','1','1','fr'),(3,'Is the site ready for search engine crawlers ?','1','1','fr'),(4,'Is this site the current working copy ?','1','1','fr'),(5,'The google analytics key without javascript stuff ( e.g. UA-9876614-1 )',NULL,'','fr'),(6,'Auth token gor Google Analytics, computed from password',NULL,'','fr'),(7,'The google webmaster tools filename without google and .html ( e.g. a913b555ba9b4f13 )',NULL,'','fr'),(8,'The xiti html code',NULL,'','fr'),(9,'Words to exclude from searches (e.g. the, a, to )',NULL,'','fr'),(10,'Diem base urls for different applications/environments/cultures','{\"admin-dev\":\"http:\\/\\/zazabe.mm\\/admin_dev.php\",\"front-prod\":\"http:\\/\\/zazabe.mm\\/index.php\",\"admin-prod\":\"http:\\/\\/zazabe.mm\\/admin.php\",\"front-dev\":\"http:\\/\\/zazabe.mm\\/dev.php\"}','','fr'),(11,'Default method when an image needs to be resized','center','center','fr'),(12,'Jpeg default quality when generating thumbnails','95','95','fr'),(13,'Links to other domain get automatically a _blank target',NULL,'0','fr'),(14,'Links to current page are changed from <a> to <span>','1','1','fr'),(15,'Add an automatic title on link based on the target page title','1','1','fr'),(16,'Append something at the beginning of all pages title',NULL,'','fr'),(17,'Append something at the end of all pages title',' | Zazabe',' | Zazabe','fr'),(18,'When a page is not found, user is redirect to a similar page. The internal search index is used to find the best page for requested url.','1','1','fr');
/*!40000 ALTER TABLE `dm_setting_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_tag`
--

DROP TABLE IF EXISTS `dm_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_tag`
--

LOCK TABLES `dm_tag` WRITE;
/*!40000 ALTER TABLE `dm_tag` DISABLE KEYS */;
INSERT INTO `dm_tag` VALUES (4,'Access'),(8,'AJAX'),(19,'Assembly'),(1,'C++'),(12,'Code Igniter'),(25,'communication'),(6,'Desktop'),(15,'embedded systems'),(13,'HETIC'),(26,'languages theory'),(23,'marketing'),(21,'multimedia'),(11,'MVC'),(17,'network'),(28,'network protocols'),(10,'PHP5'),(24,'project management'),(3,'réseaux'),(27,'software engineering'),(9,'SPIP'),(16,'studies'),(20,'system architecture'),(2,'système embarqué'),(18,'UNIX'),(5,'VB6'),(14,'Vidéo'),(22,'web analytics'),(7,'XSLT');
/*!40000 ALTER TABLE `dm_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_trans_unit`
--

DROP TABLE IF EXISTS `dm_trans_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_trans_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_catalogue_id` bigint(20) NOT NULL,
  `source` text COLLATE utf8_unicode_ci NOT NULL,
  `target` text COLLATE utf8_unicode_ci NOT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_catalogue_id_idx` (`dm_catalogue_id`),
  CONSTRAINT `dm_trans_unit_dm_catalogue_id_dm_catalogue_id` FOREIGN KEY (`dm_catalogue_id`) REFERENCES `dm_catalogue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=533 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_trans_unit`
--

LOCK TABLES `dm_trans_unit` WRITE;
/*!40000 ALTER TABLE `dm_trans_unit` DISABLE KEYS */;
INSERT INTO `dm_trans_unit` VALUES (1,2,'Open','Ouvrir',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(2,2,'Delete','Supprimer',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(3,2,'Add','Ajouter',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(4,2,'Add a %1%','Ajouter un(e) %1%',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(5,2,'Cancel','Annuler',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(6,2,'Are you sure?','Confirmer cette action ?',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(7,2,'Unassociated','Non associé',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(8,2,'Associated','Associé',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(9,2,'Forgot your password?','Mot de passe perdu ?',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(10,2,'yes','oui',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(11,2,'no','non',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(12,2,'yes or no','oui ou non',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(13,2,'Next','Suivant',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(14,2,'Previous','Précédent',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(15,2,'First','Premier',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(16,2,'Last','Dernier',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(17,2,'Is active','Actif',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(18,2,'Is active:','Actif:',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(19,2,'Updated at','Mise à jour',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(20,2,'Updated at:','Mise à jour:',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(21,2,'Created at','Création',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(22,2,'Created at:','Création:',NULL,'2010-08-27 15:19:59','2010-08-27 15:19:59'),(23,2,'Created by','Créé par',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(24,2,'Updated by','Mis à jour par',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(25,2,'Query','Requête',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(26,2,'Image alt','Légende',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(27,2,'Image alt:','Légende:',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(28,2,'Your modifications have been saved','Vos modifications ont été enregistrées',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(29,2,'Required','Ce champ ne devrait pas être vide',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(30,2,'Content','Contenu',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(31,2,'Home','Accueil',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(32,2,'Tools','Outils',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(33,2,'System','Système',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(34,2,'Update project','Mettre à jour le projet',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(35,2,'Project successfully updated','Le projet a été mis à jour avec succès',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(36,2,'Search','Rechercher',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(37,2,'Search in %1%','Rechercher dans les %1%',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(38,2,'Cancel search','Annuler la recherche',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(39,2,'Active search','Recherche active',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(40,2,'is empty','vide',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(41,2,'from','de',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(42,2,'to','à',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(43,2,'[0] no result|[1] 1 result|(1,+Inf] %1% results','[0]aucun résultat|[1]1 résultat|(1,+Inf]%1% résultats',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(44,2,'Choose an action','Agir sur la sélection',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(45,2,'Edit','Modifier',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(46,2,'New','Ajouter',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(47,2,'You must at least select one item.','Aucun élément sélectionné',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(48,2,'Filter','Rechercher',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(49,2,'Reset','Annuler',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(50,2,'Add a','Ajouter un(e)',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(51,2,'The item was updated successfully.','L\'élément a été enregistré avec succès',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(52,2,'The item has not been saved due to some errors.','L\'élément n\'a pas été enregistré en raison des erreurs ci-dessous',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(53,2,'Invalid.','Le contenu de ce champ n\'est pas valide',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(54,2,'Required.','Ce champ ne devrait pas être vide',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(55,2,'The item was updated successfully. You can add another one below.','L\'élément a été enregistré avec succès, vous pouvez maintenant en ajouter un autre',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(56,2,'Translation','Traduction',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(57,2,'Sentences','Phrases',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(58,2,'Loremize','Loremiser',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(59,2,'does not match the date format','ne correspond pas au format',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(60,2,'The date must be before','La date doit être antérieure à',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(61,2,'The date must be after','La date doit être postérieure à',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(62,2,'[0]no element|[1]1 element|(1,+Inf]%1% elements','[0]aucun élément|[1]un élément|(1,+Inf]%1% éléments',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(63,2,'You must select an action to execute on the selected items.','Aucune action sélectionnée',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(64,2,'No result','Aucun résultat',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(65,2,'The selected items have been deleted successfully.','Les éléments sélectionnés ont été supprimés avec succès',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(66,2,'The selected items have been modified successfully','Les éléments sélectionnés ont été modifiés avec succès',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(67,2,'A problem occurs when modifying the selected items','Un problème est survenu pendant la modification',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(68,2,'Root','Racine',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(69,2,'Page not found','Page introuvable',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(70,2,'Media library','Bibliothèque de médias',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(71,2,'UML Model Diagram','Diagramme UML du modèle',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(72,2,'The item was deleted successfully.','L\'élément a été supprimé avec succès',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(73,2,'element','élément',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(74,2,'elements','éléments',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(75,2,'Add a folder here','Ajouter un répertoire ici',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(76,2,'Import from a zip','Importer depuis un zip',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(77,2,'Add some files here','Ajouter des fichiers ici',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(78,2,'Add a file here','Ajouter un fichier ici',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(79,2,'Clear cache','Vider le cache',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(80,2,'Clear media cache','Vider le cache média',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(81,2,'Name','Nom',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(82,2,'Rename this folder','Renommer ce répertoire',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:00'),(83,2,'Move this folder','Déplacer ce répertoire',NULL,'2010-08-27 15:20:00','2010-08-27 15:20:01'),(84,2,'Delete this folder','Supprimer ce répertoire',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(85,2,'Already exists in this folder','Existe déjà dans ce répertoire',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(86,2,'This is a bad name','Ce nom n\'est pas valide',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(87,2,'File','Fichier',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(88,2,'Thumbnails can not be created in %1%','Les miniatures ne peuvent être créées dans %1%',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(89,2,'Folder %1% is not writable','Le répertoire %1% n\'est pas accessible en écriture',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(90,2,'File %1% is not writable','Le fichier %1% n\'est pas accessible en écriture',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(91,2,'This folder is not writable','Ce répertoire n\'est pas accessible en écriture',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(92,2,'This file is not writable','Ce fichier n\'est pas accessible en écriture',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(93,2,'Size','Poids',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(94,2,'Legend','Légende',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(95,2,'Author','Auteur',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(96,2,'License','Licence',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(97,2,'Validate','Valider',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(98,2,'Save','Enregistrer',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(99,2,'Save and Add','Enregistrer et Ajouter',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(100,2,'Save and Next','Enregistrer et Suivant',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(101,2,'Save and Back to list','Enregistrer et Retourner à la liste',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(102,2,'Save modifications','Enregistrer les modifications',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(103,2,'Delete this file','Supprimer ce fichier',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(104,2,'Close','Fermer',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(105,2,'Delete this %1%','Supprimer ce(tte) %1%',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(106,2,'Delete this page','Supprimer cette page',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(107,2,'Active','Actif',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(108,2,'Referers','Dépendances',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(109,2,'Administration login','Connexion à l\'administration',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(110,2,'Login','Connexion',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(111,2,'Username','Identifiant',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(112,2,'Password','Mot de passe',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(113,2,'Password (again)','Mot de passe bis',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(114,2,'Remember','Mémoriser',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(115,2,'The username and/or password is invalid.','L\'identifiant et/ou le mot de passe est erroné',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(116,2,'Profiles','Profils',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(117,2,'Profile','Profil',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(118,2,'User','Utilisateur',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(119,2,'Users','Utilisateurs',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(120,2,'Metas','Métas',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(121,2,'Automatic Page','Page automatique',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(122,2,'Automatic Pages','Pages automatiques',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(123,2,'Site tree','Arborescence du site',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(124,2,'Some SEO improvements should be applied','Des optimisations pourraient être apportées au référencement',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(125,2,'Some page have the same url','Certaines pages ont la même url',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(126,2,'Click here to see them','Cliquez ici pour les voir',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(127,2,'Seo improvements','Optimisation du référencement',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(128,2,'Duplicated %1%','%1% dupliqué(e)s',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(129,2,'Automatic page','Page automatique',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(130,2,'Manual page','Page manuelle',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(131,2,'Modify object','Modifier l\'objet',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(132,2,'Configure automatic seo for %1% pages','Configurer le référencement automatique pour les pages %1%',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(133,2,'View page on website','Voir la page sur le site',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(134,2,'Edit image','Modifier l\'image',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(135,2,'Loading...','Chargement...',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(136,2,'Preview','Prévisualisation',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(137,2,'Back to list','Retour à la liste',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(138,2,'The form submission cannot be processed. It probably means that you have uploaded a file that is too big.','Le formulaire n\'a pas pu être traité. Cela peut être du à l\'envoi d\'un fichier trop volumineux',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(139,2,'A problem occurs when deleting the selected items.','Un problème est survenu pendant la suppression des éléments',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(140,2,'elements per page','éléments par page',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(141,2,'Sort','Trier',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(142,2,'Sort %1%','Trier les %1%',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(143,2,'Sort %1% for %2%','Trier les %1% de %2%',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(144,2,'Drag & drop elements, then','Glisser-déposer les éléments, puis',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(145,2,'A problem occured when sorting the items','Un problème est survenu pendant le tri des éléments',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(146,2,'The items have been sorted successfully','Les éléments ont été triés avec succès',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(147,2,'Add a zone','Ajouter une zone',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(148,2,'Add a widget','Ajouter un widget',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(149,2,'Go to site','Aller au site',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(150,2,'You don\'t have the required permission to access this page.','Vous n\'êtes pas autorisé à accéder à cette page',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(151,2,'Edit this zone','Modifier cette zone',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(152,2,'Delete this zone','Supprimer cette zone',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(153,2,'CSS class','Classe CSS',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(154,2,'Width','Largeur',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(155,2,'Height','Hauteur',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(156,2,'Edit this %1%','Modifier ce(tte) %1%',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(157,2,'Delete this widget','Supprimer ce widget',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(158,2,'Title','Titre',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(159,2,'Link','Lien',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(160,2,'Text','Texte',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(161,2,'Advanced','Avancé',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(162,2,'Bread crumb','Fil d\'arianne',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(163,2,'Search form','Recherche : form',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(164,2,'Search results','Recherche : résultats',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(165,2,'Go to content','Aller au contenu',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(166,2,'New widget','Nouveau widget',NULL,'2010-08-27 15:20:01','2010-08-27 15:20:01'),(167,2,'Use media','Utiliser un média',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(168,2,'Or upload a file','Ou importer un fichier',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(169,2,'Drag & drop a media here','Glisser-déposer un média ici',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(170,2,'Media','Média',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(171,2,'You must use a media or upload a file','Vous devez utiliser un média ou importer un fichier',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(172,2,'Try','Essayer',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(173,2,'Change file','Changer de fichier',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(174,2,'Method','Méthode',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(175,2,'Center','Centrer',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(176,2,'Scale','Ajuster',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(177,2,'Inflate','Etirer',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(178,2,'Fit','Remplir',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(179,2,'Save and close','Enregistrer et fermer',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(180,2,'This size is not valid.','Cette dimension n\'est pas valide',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(181,2,'This color is not valid.','Cette couleur n\'est pas valide',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(182,2,'Per page','Par page',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(183,2,'First page','Première page',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(184,2,'Previous page','Page précédente',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(185,2,'Next page','Page suivante',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(186,2,'Last page','Dernière page',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(187,2,'Top','En haut',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(188,2,'Bottom','En bas',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(189,2,'View','Vue',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(190,2,'Order by','Ordonner par',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(191,2,'Random','Aléatoire',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(192,2,'automatic','automatique',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(193,2,'Add new page','Ajouter une nouvelle page',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(194,2,'Seo','Référencement',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(195,2,'Integration','Intégration',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(196,2,'Edit page','Modifier la page',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(197,2,'Logout','Déconnexion',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(198,2,'Available','Disponible',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(199,2,'Requires authentication','Requiert une authentication',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(200,2,'Search engine crawlers','Robots des moteurs de recherche',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(201,2,'Show page structure','Afficher la structure de la page',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(202,2,'Generate sitemap','Générer le sitemap',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(203,2,'Links','Liens',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(204,2,'Act on selection','Agir sur la sélection',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(205,2,'Activate','Activer',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(206,2,'Deactivate','Désactiver',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(207,2,'Remove','Enlever',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(208,2,'Sorry, but you can not access administration with your current browser','Désolé, mais vous ne pouvez pas accéder à l\'administration avec votre navigateur actuel',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(209,2,'Select all','Sélectionner tout',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(210,2,'Unselect all','Désélectionner tout',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(211,2,'Configuration panel','Panneau de configuration',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(212,2,'This is not a valid hexadecimal color','Ce n\'est pas une couleur hexadécimale valide',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(213,2,'%1% - %2% of %3%','%1% - %2% sur %3%',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(214,2,'Display','Afficher',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(215,2,'User logged in','L\'utilisateur s\'est connecté',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(216,2,'User logged out','L\'utilisateur s\'est déconnecté',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(217,2,'Cache cleared','Cache vidé',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(218,2,'This Week','Cette Semaine',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(219,2,'This Year','Cette Année',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(220,2,'Activity','Activité',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(221,2,'Server','Serveur',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(222,2,'Browser','Navigateur',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(223,2,'Browsers','Navigateurs',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(224,2,'Location','Page',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(225,2,'Events','Evènements',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(226,2,'Requests','Requêtes',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(227,2,'Subject','Sujet',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(228,2,'Expanded view','Vue étendue',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(229,2,'Show','Afficher',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(230,2,'Gallery','Galerie',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(231,2,'Edit medias','Modifier les médias',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(232,2,'Remove this media','Enlever ce média',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(233,2,'Preferences','Préférences',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(234,2,'Mail templates','Gabarits de courriels',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(235,2,'Layouts','Layouts',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(236,2,'Zone','Zone',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(237,2,'Navigation','Navigation',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(238,2,'Configuration','Configuration',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(239,2,'Chart','Graphique',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(240,2,'Log','Journal',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(241,2,'Monitoring','Surveillance',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(242,2,'Manage index','Gérer l\'index',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(243,2,'Search engine','Moteur de recherche',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(244,2,'Google analytics','Google Analytics',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(245,2,'Google webmaster tools','Google webmaster tools',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(246,2,'Services','Services',NULL,'2010-08-27 15:20:02','2010-08-27 15:20:02'),(247,2,'Sitemap','Sitemap',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(248,2,'Url Redirections','Redirections d\'urls',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(249,2,'Redirections','Redirections',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(250,2,'Settings','Paramètres',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(251,2,'Sent mails','Courriels envoyés',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(252,2,'Errors','Erreurs',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(253,2,'Permissions','Autorisations',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(254,2,'Groups','Groupes',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(255,2,'Security','Sécurité',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(256,2,'See diagrams','Voir les schémas',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(257,2,'Code Editor','Éditeur de code',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(258,2,'Diem Console','Console Diem',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(259,2,'Dev','Dev',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(260,2,'Exception','Exception',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(261,2,'Cache','Cache',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(262,2,'This chart is not available.','Ce graphique n\'est pas disponible.',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(263,2,'Dm gallery','Dm galerie',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(264,2,'Email','Email',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(265,2,'Last login','Dernière connexion',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(266,2,'Visible','Visible',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(267,2,'External services','Services externes',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(268,2,'Interface','Interface',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(269,2,'Site','Site',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(270,2,'Tracking','Tracking',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(271,2,'Right','Droite',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(272,2,'Left','Gauche',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(273,2,'Image resize method','Méthode de redimension d\'image',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(274,2,'Default method when an image needs to be resized','Méthode par défaut lorsque l\'image doit être redimensionnée',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(275,2,'Image resize quality','Qualité de redimension d\'image',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(276,2,'Jpeg default quality when generating thumbnails','Qualité par défaut des JPG lors de la génération des vignettes',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(277,2,'Link external blank','Lien externe en nouvelle fenêtre',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(278,2,'Links to other domain get automatically a _blank target','Les liens vers d\'autres domaines obtiennent automatiquement target=_blank',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(279,2,'Link current span','Lien courrant = span',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(280,2,'Links to current page are changed from <a> to <span>','Les liens vers la page courrante sont transformé de <a> en <span>',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(281,2,'Link use page title','Liens utilisent le titre de la page',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(282,2,'Add an automatic title on link based on the target page title','Ajouter un title automatique aux liens, basé sur le titre de la page ciblée',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(283,2,'Search stop words','Mots à ne pas chercher',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(284,2,'Words to exclude from searches (e.g. the, a, to )','Les mots exclus des recherches (ex: le, un, à)',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(285,2,'Title prefix','Préfixe du titre',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(286,2,'Append something at the beginning of all pages title','Ajoute une expression au début du titre de toutes les pages',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(287,2,'Title suffix','Suffixe du titre',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(288,2,'Append something at the end of all pages title','Ajouter une expression à la fin du titre toutes les pages',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(289,2,'Smart 404','404 intelligente',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(290,2,'When a page is not found, user is redirect to a similar page. The internal search index is used to find the best page for requested url.','Quand une page est introuvable, l\'utilisateur est redirigé vers une page similaire. Le moteur de recherche interne est utilisé pour trouver la meilleure page pour l\'url demandée.',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(291,2,'Site name','Nom du site',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(292,2,'The site name','Le nom du site',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(293,2,'Site active','Site actif',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(294,2,'Is the site ready for visitors ?','Le site est-il prêt pour les visiteurs?',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(295,2,'Site indexable','Site indexable',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(296,2,'Is the site ready for search engine crawlers ?','Le site est-il prêt pour les robots des moteurs de recherche?',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(297,2,'Site working copy','Site copie de travail',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(298,2,'Is this site the current working copy ?','Ce site est-il la copie de travail en cours?',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(299,2,'Ga key','Ga key',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(300,2,'The google analytics key without javascript stuff ( e.g. UA-9876614-1 )','La clé Google Analytics sans le code javascript (Ex: UA-9876614-1)',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(301,2,'Gwt key','Gwt key',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(302,2,'The google webmaster tools filename without google and .html ( e.g. a913b555ba9b4f13 )','Le nom du fichier google webmaster tools, sans google et sans .html (Ex: a913b555ba9b4f13)',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(303,2,'Xiti code','Code Xiti',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(304,2,'The xiti html code','Le code HTML xiti',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(305,2,'Ga email','Courriel GA',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(306,2,'Required to display google analytics data into Diem','Nécessaire pour afficher les données de Google Analytics dans Diem',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(307,2,'Ga password','Mot de passe GA',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(308,2,'Diem mail support is <strong>-NOT-</strong> completed. Please use the symfony 1.4 mail service instead','Le support des mails n\'est <strong>-PAS-</strong> terminé. Merci d\'utiliser le service de mail de symfony 1.4',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(309,2,'Duplicate','Dupliquer',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(310,2,'Source','Source',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(311,2,'Target','Cible',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(312,2,'Dm catalogue','Dm catalogue',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(313,2,'Meta','Meta',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(314,2,'Menu','Menu',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(315,2,'Internal search engine','Moteur de recherche interne',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(316,2,'Reload index','Recharger l\'index',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(317,2,'Configure Google Analytics','Configurer Google Analytics',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:03'),(318,2,'Configure Google Webmaster Tools','Configurer Google Webmaster Tools',NULL,'2010-08-27 15:20:03','2010-08-27 15:20:04'),(319,2,'Position','Position',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(320,2,'Urls','Urls',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(321,2,'Old url','Ancienne URL',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(322,2,'New url','Nouvelle URL',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(323,2,'Group','Groupe',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(324,2,'Value','Valeur',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(325,2,'Credentials','Permissions',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(326,2,'Class','Classe',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(327,2,'Module','Module',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(328,2,'Action','Action',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(329,2,'Uri','Uri',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(330,2,'Env','Env',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(331,2,'Super admin','Super Admin',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(332,2,'The admin code editor is <strong>-NOT-</strong> completed yet an may not work','L\'éditeur de code admin <strong>n\'est-pas-encore</strong> achevé et peut ne pas fonctionner',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(333,2,'List','Liste',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(334,2,'Form','Form',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(335,2,'Administration','Administration',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(336,2,'text','texte',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(337,2,'Index state','Etat de l\'index',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(338,2,'Index maintenance','Maintenance de l\'index',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(339,2,'Search completed in %1% ms','Recherche effectuée en %1% ms',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(340,2,'No results','Aucun résultat',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(341,2,'Edit template code','Code de la template',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(342,2,'Edit component code','Code du component',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(343,2,'Drag & Drop a media here','Glisser-déposer un média ici',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(344,2,'Add a link to the text title','Ajouter un lien au titre du texte',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(345,2,'Add a link to the text media','Ajouter un lien au média du texte',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(346,2,'Drag & Drop a page or enter an url','Glisser-déposer une page ou saisir une url',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(347,2,'Drag & drop a page here from the PAGES panel, or write an url','Glisser-déposer une page ici depuis le panneau PAGES, ou saisir une url',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(348,2,'Title position','Position du titre',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(349,2,'Outside','A l\'extérieur',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(350,2,'Inside','A l\'intérieur',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(351,2,'JPG quality','Qualité JPG',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(352,2,'Dimensions','Dimensions',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(353,2,'Leave empty to use default quality','Laisser vide pour utiliser la qualité par défaut',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(354,2,'Separator','Séparateur',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(355,2,'Include current page','Inclure la page en cours',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(356,2,'This CSS class is applied to the body tag','Cette classe CSS est appliqué au tag body',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(357,2,'Revision history of %1%','Historique des versions de %1%',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(358,2,'Revision history','Historique des versions',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(359,2,'Field','Champ',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(360,2,'Difference','Différence',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(361,2,'No revision for %1% with culture \"%2%\"','Aucune version pour %1% dans la langue \"%2%\"',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(362,2,'Body','Corps',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(363,2,'Others','Autres',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(364,2,'Description','Description',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(365,2,'Vars','Variables',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(366,2,'From email','Courriel de l\'expéditeur',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(367,2,'To email','Courriel du destinataire',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(368,2,'Updating project','Mise à jour du projet',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(369,2,'Cache clearing','Mise à jour du cache',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(370,2,'Page synchronization','Synchronisation des pages',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(371,2,'SEO synchronization','Synchronisation SEO',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(372,2,'Interface regeneration','Régénération de l\'interface',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(373,2,'Something went wrong when updating project','Une erreur s\'est produite pendant la mise à jour du projet',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(374,2,'Send reports','Envoyer des rapports',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(375,2,'Receive reports','Recevoir des rapports',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(376,2,'Open Google Analytics page','Ouvrir la page Google Analytics',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(377,2,'Open Google Webmaster Tools page','Ouvrir la page Google Webmaster Tools',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(378,2,'Revert to revision %1%','Revenir à la version %1%',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(379,2,'%1% has been reverted to version %2%','%1% est revenu à la version %2%',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(380,2,'To enable it, provide a google analytics access','Pour l\'activer, merci de fournir un accès Google Analytics',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(381,2,'This chart is currently not available','Ce graphique n\'est pas disponible pour l\'instant',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(382,2,'Generate %1% random %2%','Générer %1% %2% aléatoires',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(383,2,'Options','Options',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(384,2,'Drag & Drop an image here','Glisser-déposer une image ici',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(385,2,'\"%value%\" is not a valid link.','\"%value%\" n\'est pas un lien valide.',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(386,2,'\"%value%\" is not a valid directory name.','\"%value%\" n\'est pas un nom de répertoire valide.',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(387,2,'History','Historique',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(388,2,'Set up a cron to update the search index','Configurer cron pour actualiser l\'index de recherche',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(389,2,'Set up a cron to update the sitemap','Configurer cron pour actualiser le sitemap',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(390,2,'Most UNIX and GNU/Linux systems allows for task planning through a mechanism known as cron. The cron checks a configuration file (a crontab) for commands to run at a certain time.','La plupart des systèmes UNIX et GNU / Linux supportent la planification de tâches à travers un mécanisme connu sous le nom de cron. Le cron vérifie un fichier de configuration (un crontab) pour les commandes à exécuter à un certain temps ou bien à une certaine période.',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(391,2,'For more information on the crontab configuration file format, type man 5 crontab in a terminal.','Pour plus d\'informations sur le format du fichier de configuration de la crontab, il suffit de taper man 5 crontab dans un terminal de commandes.',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(392,2,'Open %1% and add the line:','Ouvrez %1% et ajoutez la ligne :',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(393,2,'Cut','Couper',NULL,'2010-08-27 15:20:04','2010-08-27 15:20:04'),(394,2,'Copy','Copier',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(395,2,'Paste','Coller',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(396,2,'Drag & drop links here from the left PAGE panel','Glisser-déposer une page ici depuis le panneau PAGES',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(397,2,'Click to edit, drag to sort','Cliquer pour modifier, déplacer pour trier',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(398,2,'Code generation','Génération du code',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(399,2,'%user% is browsing this page, you should not modify it now.','%user% est déjà sur cette page, vous ne devriez pas la modifier maintenant.',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(400,2,'or create an external link','Ou créez un lien externe',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(401,2,'Back to the parent folder','Retour au répertoire parent',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(402,2,'Website','Site web',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(403,2,'Message','Message',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(404,2,'Signin','Connexion',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(405,2,'Signout','Déconnexion',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(406,2,'Back to admin','Retourner à l\'administration',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(407,2,'Back to site','Retourner au site',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(408,2,'Invalid mime type (%mime_type%).','Type de fichier non accepté (%mime_type%).',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(409,2,'Download','Télécharger',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(410,2,'Move to','Déplacer dans',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(411,2,'[1] And one more...|(1,+Inf] And %1% more...','[1] Et un autre...|(1,+Inf] Et %1% autres...',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(412,2,'Go to admin','Aller à l\'admin',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(413,2,'Search for a widget','Chercher un widget',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(414,2,'Sort by %field%','Trier par %field%',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(415,2,'contextual','contextuel',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(416,2,'Accepts pages and urls','Accepte pages et urls',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(417,2,'Accepts medias and urls','Accepte médias et urls',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(418,2,'Accepts pages, medias and urls','Accepte pages, médias et urls',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(419,2,'Drag pages around to move and sort them.','Déplacez les pages pour les réordonner.',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(420,2,'Manage metas','Gérer les métas',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(421,2,'Reorder pages','Réordonner les pages',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(422,2,'Manage pages','Gérer les pages',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(423,2,'Click to edit','Cliquer pour modifier',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(424,2,'Click any value in the table to modify it.','Cliquer sur une valeur du tableau pour la modifier',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(425,2,'Choose columns to display in the table.','Choisir les colonnes affichées dans le tableau',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(426,2,'Groups & Permissions','Groupes & autorisations',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(427,2,'File %file% does not exist','Le fichier %file% n\'existe pas',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(428,2,'File %file% can not be deleted because a record needs it','Le fichier %file% ne peut pas être supprimé, car il est utilisé',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(429,2,'Add widgets','Ajouter des widgets',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(430,2,'Back to %1%','Retourner à %1%',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(431,2,'Revision %number%','Version %number%',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(432,2,'My account','Mon compte',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(433,2,'The two passwords must be the same.','Les deux mots de passe doivent être identiques.',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(434,2,'Connected','Connecté',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(435,2,'If you set a href, a link will be inserted into the title','Si vous ajoutez un href, un lien sera inséré dans le titre',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(436,2,'Template','Template',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(437,2,'Areas','Areas',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(438,2,'Nb pages','Nb pages',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(439,2,'Manage XML sitemap','Gérer le sitemap XML',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(440,2,'Pages','Pages',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(441,2,'Automatic SEO','Référencement automatique',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(442,2,'Not connected','Non connecté',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(443,2,'Keywords','Mots clé',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(444,2,'Secure','Sécurisé',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(445,2,'Indexable','Indexable',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(446,2,'Select columns','Choisir les colonnes',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(447,2,'Successfully loremized','Loremisé avec succès',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(448,2,'This file is writable','Ce fichier est accessible en écriture',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(449,2,'Loading','Chargement',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(450,2,'Image','Image',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(451,2,'Results','Résultats',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(452,2,'Desc','Desc',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(453,2,'Publication','Publication',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(454,2,'Layout','Layout',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(455,2,'Parent','Parent',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(456,2,'Slug','Slug',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(457,2,'Controllers','Controleurs',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(458,2,'Templates','Templates',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(459,2,'Stylesheets','Feuilles de style',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(460,2,'Presentation','Présentation',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(461,2,'Send','Envoyer',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(462,2,'No module to manage.','Aucun module à gérer.',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(463,2,'Variables you can use here:','Variables utilisables ici:',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(464,2,'1. Edit meta generation rules','1. Modifier les règles de génération des metas',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(465,2,'Preview modifications without applying changes to the site','Prévisualiser les modifications sans appliquer les changements au site',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(466,2,'Save modifications and apply changes to the site','Enregistrer les modifications et appliquer les changements au site',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(467,2,'2. Preview generated metas','Prévisualiser les métas générés',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(468,2,'The page url, without domain name. Must be unique. If the slug does not start with a \'/\', the parent slug is added.','Url de la page, sans nom de domaine. Doit être unique. Si le slug ne commence pas par \'/\', le slug de la page supérieure est ajouté.',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(469,2,'The page title, without prefix nor suffix. Should be unique.','Le titre de la page, sans préfixe ni suffixe. Devrait être unique.',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(470,2,'The page name, used by links to this page. Should be unique.','Le nom de la page, utilisé par les liens vers cette page. Devrait être unique.',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(471,2,'Assign first header here or let it blank to let the designer choose it. Should be unique.','Définissez le premier titre ici, ou laissez vide pour laisser l\'intégrateur le choisir. Devrait être unique.',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(472,2,'The page description meta, frequently displayed in search engines result page.','Le méta description de la page, fréquemment affiché par les moteurs de recherche sur la page de résultats',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(473,2,'Provides additional meta informations to the page. Also used by Diem internal search engine.','Fournit des méta-informations supplémentaires à la page. Aussi utilisé par le moteur de recherche interne de Diem.',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(474,2,'Requests per minute','Requêtes par minute',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(475,2,'Errors per minute','Erreurs par minute',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(476,2,'Latency in ms','Latence en ms',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(477,2,'Memory used in %','Mémoire utilisée en %',NULL,'2010-08-27 15:20:05','2010-08-27 15:20:05'),(478,2,'Pages per month','Pages par mois',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(479,2,'Visitors per month','Visiteurs par mois',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(480,2,'Visitors','Visiteurs',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(481,2,'Bounce rate','Taux de rebond',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(482,2,'No results for \"%1%\"','Aucun résultat pour \"%1%\"',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(483,2,'Results %1% to %2% of %3%','Résultats %1% à %2% sur %3%',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(484,2,'Items','Eléments',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(485,2,'Save this %1% to access to the gallery','Enregistrez ce(tte) %1% pour accéder à la galerie',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(486,2,'UL CSS class','Classe CSS du UL',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(487,2,'LI CSS class','Classe CSS du LI',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(488,2,'Ascendant','Ascendant',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(489,2,'Descendant','Descendant',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(490,2,'Version','Version',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(491,2,'The widget can not be rendered because its type does not exist anymore.','Ce widget ne peut être affiché car son type n\'existe plus.',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(492,2,'Link to this page:','Lien vers cette page:',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(493,2,'Sentence','Phrase',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(494,2,'The item was created successfully.','L\'élément a été créé avec succès.',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(495,2,'The item was created successfully. You can add another one below.','L\'élément a été créé avec succès. Vous pouvez en ajouter une nouveau ci-dessous.',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(496,2,'Heading 2','Titre 2',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(497,2,'Heading 3','Titre 3',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(498,2,'Heading 4','Titre 4',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(499,2,'Heading 5','Titre 5',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(500,2,'Bold','Gras',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(501,2,'Italic','Italique',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(502,2,'Bulleted List','Liste à puces',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(503,2,'Numeric List','Liste numérotée',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(504,2,'Enlarge the editor','Agrandir l\'éditeur',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(505,2,'Permission','Authorisation',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(506,2,'Nb sent mails','Nb mails envoyés',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(507,2,'Advanced search','Recherche avancée',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(508,2,'Today','Aujourd\'hui',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(509,2,'Past %number% days','%number% derniers jours',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(510,2,'This month','Ce mois',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(511,2,'This year','Cette année',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(512,2,'Pages per week','Pages par semaine',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(513,2,'Visitors per week','Visiteurs par semaine',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(514,2,'Show extended options','Montrer plus d\'options',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(515,2,'Hide extended options','Montrer moins d\'options',NULL,'2010-08-27 15:20:06','2010-08-27 15:20:06'),(516,2,'Sorry, it looks like you\'re using a browser that isn\'t supported.','Désolé, il semblerait que vous utilisiez un navigateur qui n\'est pas supporté.',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(517,2,'We suggest that you use one of these browsers:','Nous vous suggérons d\'utiliser un de ces navigateurs :',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(518,2,'Or continue at your own peril','Ou continuez à vos propres périls',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(519,2,'Modify my account','Modifier mon compte',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(520,2,'Register','Créer un compte',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(521,2,'Change password','Changer de mot de passe',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(522,2,'You are authenticated as %username%','Vous êtes connecté en tant que %username%',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(523,2,'Old password','Ancien mot de passe',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(524,2,'New password','Nouveau mot de passe',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(525,2,'New password (again)','Nouveau mot de passe ( confirmation )',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(526,2,'Receive a new password','Recevoir un nouveau mot de passe',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(527,2,'A link to change your password has been sent to %email%','Un lien pour changer votre mot de passe a été envoyé à %email%',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(528,2,'Your password has been changed','Votre mot de passe a été modifié',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(529,2,'Save the new password','Enregistrer le nouveau mot de passe',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(530,2,'Your email will never be published','Votre courriel ne sera jamais publié',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(531,2,'Please enter a message','Veuillez saisir un message',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:07'),(532,2,'Thank you, your comment has been sent.','Merci, votre commentaire a été envoyé.',NULL,'2010-08-27 15:20:07','2010-08-27 15:20:08');
/*!40000 ALTER TABLE `dm_trans_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_user`
--

DROP TABLE IF EXISTS `dm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `algorithm` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sha1',
  `salt` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_super_admin` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `forgot_password_code` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `forgot_password_code` (`forgot_password_code`),
  KEY `is_active_idx_idx` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_user`
--

LOCK TABLES `dm_user` WRITE;
/*!40000 ALTER TABLE `dm_user` DISABLE KEYS */;
INSERT INTO `dm_user` VALUES (1,'admin','admin@zazabe.com','sha1','d0a6b3733f4def2c25219f8e6b00240e','64348815e4f91c5b5e775d11aafd564201e187f3',1,1,'2010-09-11 08:16:26',NULL,'2010-08-27 15:19:29','2010-08-27 15:19:29');
/*!40000 ALTER TABLE `dm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_user_group`
--

DROP TABLE IF EXISTS `dm_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_user_group` (
  `dm_user_id` bigint(20) NOT NULL DEFAULT '0',
  `dm_group_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dm_user_id`,`dm_group_id`),
  KEY `dm_user_group_dm_group_id_dm_group_id` (`dm_group_id`),
  CONSTRAINT `dm_user_group_dm_group_id_dm_group_id` FOREIGN KEY (`dm_group_id`) REFERENCES `dm_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_user_group_dm_user_id_dm_user_id` FOREIGN KEY (`dm_user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_user_group`
--

LOCK TABLES `dm_user_group` WRITE;
/*!40000 ALTER TABLE `dm_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_user_permission`
--

DROP TABLE IF EXISTS `dm_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_user_permission` (
  `dm_user_id` bigint(20) NOT NULL DEFAULT '0',
  `dm_permission_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dm_user_id`,`dm_permission_id`),
  KEY `dm_user_permission_dm_permission_id_dm_permission_id` (`dm_permission_id`),
  CONSTRAINT `dm_user_permission_dm_permission_id_dm_permission_id` FOREIGN KEY (`dm_permission_id`) REFERENCES `dm_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_user_permission_dm_user_id_dm_user_id` FOREIGN KEY (`dm_user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_user_permission`
--

LOCK TABLES `dm_user_permission` WRITE;
/*!40000 ALTER TABLE `dm_user_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_widget`
--

DROP TABLE IF EXISTS `dm_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_widget` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_zone_id` bigint(20) NOT NULL,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` bigint(20) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_zone_id_idx` (`dm_zone_id`),
  CONSTRAINT `dm_widget_dm_zone_id_dm_zone_id` FOREIGN KEY (`dm_zone_id`) REFERENCES `dm_zone` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_widget`
--

LOCK TABLES `dm_widget` WRITE;
/*!40000 ALTER TABLE `dm_widget` DISABLE KEYS */;
INSERT INTO `dm_widget` VALUES (1,1,'dmWidgetContent','title',NULL,-1,'2010-08-27 15:19:33'),(2,2,'dmUser','signin',NULL,-2,'2010-08-27 15:19:33'),(4,10,'article','list','',1,'2010-08-27 15:44:27'),(7,6,'dmTag','popular','',1,'2010-08-27 15:46:54'),(8,11,'dmWidgetContent','title','',1,'2010-08-27 15:53:56'),(9,12,'dmWidgetNavigation','menu','',-3,'2010-08-27 15:58:01'),(11,13,'main','footer','',1,'2010-08-27 16:10:55'),(13,14,'dmTag','popular','',4,'2010-08-31 15:15:49'),(16,14,'dmWidgetContent','image','',1,'2010-08-31 15:15:17'),(17,14,'dmWidgetContent','text','left-content',2,'2010-08-31 15:18:58'),(18,17,'article','listByTag','',1,'2010-08-27 17:49:28'),(20,14,'dmWidgetContent','title','',3,'2010-08-31 15:15:49'),(23,4,'article','listAsBox','',2,'2010-08-31 15:44:14'),(24,3,'dmWidgetNavigation','menu','',1,'2010-09-02 15:21:39'),(25,20,'article','show','',1,'2010-09-03 17:57:23'),(26,21,'dmWidgetNavigation','menu','',1,'2010-09-07 11:18:16'),(29,7,'article','listCursus','',2,'2010-09-11 09:31:21'),(31,23,'article','listCursus','',2,'2010-09-11 10:04:41'),(32,24,'dmWidgetContent','link','icon back',1,'2010-09-11 10:06:50'),(34,25,'dmWidgetContent','link','icon print',2,'2010-09-11 10:06:36'),(35,25,'dmWidgetContent','link','icon download',1,'2010-09-11 10:06:29'),(36,23,'dmWidgetContent','link','icon back',1,'2010-09-11 10:07:44');
/*!40000 ALTER TABLE `dm_widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_widget_translation`
--

DROP TABLE IF EXISTS `dm_widget_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_widget_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci,
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_widget_translation_id_dm_widget_id` FOREIGN KEY (`id`) REFERENCES `dm_widget` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_widget_translation`
--

LOCK TABLES `dm_widget_translation` WRITE;
/*!40000 ALTER TABLE `dm_widget_translation` DISABLE KEYS */;
INSERT INTO `dm_widget_translation` VALUES (1,'{\"text\":\"Page not found\",\"tag\":\"h1\"}','fr'),(2,'[]','fr'),(4,'{\"orderField\":\"position\",\"orderType\":\"asc\",\"maxPerPage\":4,\"navTop\":true,\"navBottom\":true}','fr'),(7,'[]','fr'),(8,'{\"text\":\"zazabe - world refactoring\",\"tag\":\"h1\",\"href\":\"\"}','fr'),(9,'{\"ulClass\":\"\",\"menuName\":\"\",\"liClass\":\"\",\"menuClass\":\"\",\"items\":[{\"link\":\"page:1\",\"text\":\"zazabe\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:27\",\"text\":\"resume\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:5\",\"text\":\"projects\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:29\",\"text\":\"about\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"}]}','fr'),(11,'[]','fr'),(13,'[]','fr'),(16,'{\"mediaId\":\"23\",\"legend\":\"\",\"width\":\"180\",\"height\":\"140\",\"method\":\"center\",\"background\":\"FFFFFF\",\"quality\":null,\"link\":\"\"}','fr'),(17,'{\"title\":\"\",\"text\":\"Hi, I\'m Michel, what\'s about me ? \\nI\'m 27, I try to make my way in this world. Many passions, many different experiences, like biking 700km from Alsace to South of France, restoring a database in production who as no dump (thanks to binaries logs !), riding a [minsk](http:\\/\\/www.google.com.vn\\/imgres?imgurl=http:\\/\\/blog.uniterre.com\\/uploads\\/f\\/fabworld\\/26650.jpg&imgrefurl=http:\\/\\/antresoie.uniterre.com\\/friends\\/&h=480&w=640&sz=269&tbnid=sThIbF-RcQHWxM:&tbnh=103&tbnw=137&prev=\\/images%3Fq%3Dminsk%2Bmoto&zoom=1&hl=fr&usg=__KCeXjRRNgMIHqWrcWlYuvNisaos=&sa=X&ei=LI93TKKeOouenweu75CeCw&ved=0CBwQ9QEwAg \\\"A great minsk in a great position !\\\") from Ha Noi to Saigon, deploy an important customer website in production, a friday at 22h...  \\n\",\"mediaId\":null,\"titleLink\":\"\",\"mediaLink\":\"\",\"titlePosition\":\"outside\",\"width\":\"\",\"height\":\"\",\"legend\":\"\",\"method\":\"center\",\"background\":\"FFFFFF\",\"quality\":null}','fr'),(18,'{\"orderField\":\"position\",\"orderType\":\"asc\",\"maxPerPage\":10,\"dmTagFilter\":null,\"navTop\":false,\"navBottom\":false}','fr'),(20,'{\"text\":\"Subjects\",\"tag\":\"h2\",\"href\":\"\"}','fr'),(23,'{\"orderField\":\"position\",\"orderType\":\"asc\",\"maxPerPage\":20,\"navTop\":false,\"navBottom\":false}','fr'),(24,'{\"ulClass\":\"\",\"menuName\":\"\",\"liClass\":\"\",\"menuClass\":\"\",\"items\":[{\"link\":\"page:1\",\"text\":\"zazabe\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:27\",\"text\":\"resume\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:5\",\"text\":\"projects\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:29\",\"text\":\"about\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"}]}','fr'),(25,'{\"recordId\":null}','fr'),(26,'{\"ulClass\":\"\",\"menuName\":\"\",\"liClass\":\"\",\"menuClass\":\"\",\"items\":[{\"link\":\"page:1\",\"text\":\"zazabe\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:27\",\"text\":\"resume\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:5\",\"text\":\"projects\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:29\",\"text\":\"about\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"}]}','fr'),(29,'{\"orderField\":\"position\",\"orderType\":\"asc\",\"maxPerPage\":5,\"navTop\":false,\"navBottom\":false}','fr'),(31,'{\"orderField\":\"position\",\"orderType\":\"asc\",\"maxPerPage\":5,\"navTop\":false,\"navBottom\":false}','fr'),(32,'{\"href\":\"page:27 cursus\",\"text\":\"back to resume page\",\"title\":\"back to cursus page\"}','fr'),(34,'{\"href\":\"page:62 cursus - print\",\"text\":\"print\",\"title\":\"print\"}','fr'),(35,'{\"href\":\"page:63 cursus - download\",\"text\":\"download\",\"title\":\"download\"}','fr'),(36,'{\"href\":\"page:27 cursus\",\"text\":\"back to resume page\",\"title\":\"back to cursus page\"}','fr');
/*!40000 ALTER TABLE `dm_widget_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_zone`
--

DROP TABLE IF EXISTS `dm_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_zone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_area_id` bigint(20) NOT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_area_id_idx` (`dm_area_id`),
  CONSTRAINT `dm_zone_dm_area_id_dm_area_id` FOREIGN KEY (`dm_area_id`) REFERENCES `dm_area` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_zone`
--

LOCK TABLES `dm_zone` WRITE;
/*!40000 ALTER TABLE `dm_zone` DISABLE KEYS */;
INSERT INTO `dm_zone` VALUES (1,1,NULL,NULL,-1),(2,2,NULL,NULL,-2),(3,3,NULL,NULL,-3),(4,4,'area-left','600',-4),(5,5,NULL,NULL,-5),(6,6,'area-left','',2),(7,7,NULL,NULL,2),(8,8,NULL,NULL,-8),(9,9,NULL,NULL,-9),(10,10,NULL,NULL,-10),(11,6,'area-right','',1),(12,11,NULL,NULL,-11),(13,12,NULL,NULL,-12),(14,13,'area-left','200',-13),(15,14,NULL,NULL,-14),(16,15,NULL,NULL,-15),(17,16,NULL,NULL,-16),(18,17,NULL,NULL,-17),(19,18,NULL,NULL,-18),(20,19,NULL,NULL,-19),(21,20,NULL,NULL,-20),(22,21,NULL,NULL,-21),(23,22,NULL,NULL,-22),(24,23,NULL,NULL,-23),(25,7,'links','',1);
/*!40000 ALTER TABLE `dm_zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-09-11 10:27:27
