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
-- Table structure for table `dm_area`
--

DROP TABLE IF EXISTS `dm_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_layout_id` bigint(20) DEFAULT NULL,
  `dm_page_view_id` bigint(20) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'content',
  PRIMARY KEY (`id`),
  KEY `dm_layout_id_idx` (`dm_layout_id`),
  KEY `dm_page_view_id_idx` (`dm_page_view_id`),
  CONSTRAINT `dm_area_dm_layout_id_dm_layout_id` FOREIGN KEY (`dm_layout_id`) REFERENCES `dm_layout` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_area_dm_page_view_id_dm_page_view_id` FOREIGN KEY (`dm_page_view_id`) REFERENCES `dm_page_view` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_area`
--

LOCK TABLES `dm_area` WRITE;
/*!40000 ALTER TABLE `dm_area` DISABLE KEYS */;
INSERT INTO `dm_area` VALUES (1,NULL,2,'1'),(2,NULL,3,'1'),(3,1,NULL,'top'),(4,1,NULL,'left'),(5,NULL,1,'content'),(6,1,NULL,'right'),(7,1,NULL,'bottom'),(8,NULL,2,'content'),(9,NULL,4,'content'),(10,NULL,5,'content'),(11,NULL,6,'1'),(12,NULL,6,'content'),(13,NULL,7,'content'),(14,NULL,8,'content'),(15,NULL,9,'content');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_auto_seo`
--

LOCK TABLES `dm_auto_seo` WRITE;
/*!40000 ALTER TABLE `dm_auto_seo` DISABLE KEYS */;
INSERT INTO `dm_auto_seo` VALUES (1,'article','show','2010-05-03 22:31:24','2010-05-03 22:31:24');
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
INSERT INTO `dm_auto_seo_translation` VALUES (1,'%article.title%','%article.title%','%article.title%',NULL,'%article.body%',NULL,NULL,'fr');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_catalogue`
--

LOCK TABLES `dm_catalogue` WRITE;
/*!40000 ALTER TABLE `dm_catalogue` DISABLE KEYS */;
INSERT INTO `dm_catalogue` VALUES (1,'messages.fr','en','fr'),(2,'dm.fr','en','fr'),(3,'zazabe.fr','en','fr');
/*!40000 ALTER TABLE `dm_catalogue` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_error`
--

LOCK TABLES `dm_error` WRITE;
/*!40000 ALTER TABLE `dm_error` DISABLE KEYS */;
INSERT INTO `dm_error` VALUES (1,'Doctrine_Connection_Mysql_Exception','SQLSTATE[23000]: Integrity constraint violation: 1452 Cannot add or update a child row: a foreign key constraint fails (`zazabe`.`dm_widget`, CONSTRAINT `dm_widget_dm_zone_id_dm_zone_id` FOREIGN KEY (`dm_zone_id`) REFERENCES `dm_zone` (`id`) ON DELETE CAS','SQLSTATE[23000]: Integrity constraint violation: 1452 Cannot add or update a child row: a foreign key constraint fails (`zazabe`.`dm_widget`, CONSTRAINT `dm_widget_dm_zone_id_dm_zone_id` FOREIGN KEY (`dm_zone_id`) REFERENCES `dm_zone` (`id`) ON DELETE CASCADE)\n#0 /home/zazabe/www/zazabe/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection/Statement.php(269): Doctrine_Connection->rethrowException(Object(PDOException), Object(Doctrine_Connection_Statement))\n#1 /home/zazabe/www/zazabe/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(1042): Doctrine_Connection_Statement->execute(Array)\n#2 /home/zazabe/www/zazabe/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(687): Doctrine_Connection->exec(\'INSERT INTO dm_...\', Array)\n#3 /home/zazabe/www/zazabe/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection/UnitOfWork.php(635): Doctrine_Connection->insert(Object(DmWidgetTable), Array)\n#4 /home/zazabe/www/zazabe/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection/UnitOfWork.php(566): Doctrine_Connection_UnitOfWork->processSingleInsert(Object(DmWidget))\n#5 /home/zazabe/www/zazabe/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection/UnitOfWork.php(81): Doctrine_Connection_UnitOfWork->insert(Object(DmWidget))\n#6 /home/zazabe/www/zazabe/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Record.php(1706): Doctrine_Connection_UnitOfWork->saveGraph(Object(DmWidget))\n#7 /home/zazabe/www/zazabe/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Collection.php(910): Doctrine_Record->save(Object(Doctrine_Connection_Mysql))\n#8 /home/zazabe/www/zazabe/lib/vendor/diem/dmCorePlugin/lib/doctrine/table/dmDoctrineTable.php(511): Doctrine_Collection->save()\n#9 /home/zazabe/www/zazabe/lib/vendor/diem/dmFrontPlugin/modules/dmWidget/lib/BasedmWidgetActions.class.php(315): dmDoctrineTable->doSort(Array)\n#10 /home/zazabe/www/zazabe/lib/vendor/diem/dmFrontPlugin/modules/dmWidget/lib/BasedmWidgetActions.class.php(244): BasedmWidgetActions->sortWidgets(Array)\n#11 /home/zazabe/www/zazabe/cache/front/prod/config/config_core_compile.yml.php(459): BasedmWidgetActions->executeSort(Object(dmWebRequest))\n#12 /home/zazabe/www/zazabe/cache/front/prod/config/config_core_compile.yml.php(947): sfActions->execute(Object(dmWebRequest))\n#13 /home/zazabe/www/zazabe/cache/front/prod/config/config_core_compile.yml.php(942): sfExecutionFilter->executeAction(Object(dmWidgetActions))\n#14 /home/zazabe/www/zazabe/cache/front/prod/config/config_core_compile.yml.php(928): sfExecutionFilter->handleAction(Object(sfFilterChain), Object(dmWidgetActions))\n#15 /home/zazabe/www/zazabe/cache/front/prod/config/config_core_compile.yml.php(1023): sfExecutionFilter->execute(Object(sfFilterChain))\n#16 /home/zazabe/www/zazabe/lib/vendor/diem/symfony/lib/filter/sfCacheFilter.class.php(65): sfFilterChain->execute()\n#17 /home/zazabe/www/zazabe/cache/front/prod/config/config_core_compile.yml.php(1023): sfCacheFilter->execute(Object(sfFilterChain))\n#18 /home/zazabe/www/zazabe/lib/vendor/diem/dmFrontPlugin/lib/filter/dmFrontInitFilter.php(34): sfFilterChain->execute()\n#19 /home/zazabe/www/zazabe/cache/front/prod/config/config_core_compile.yml.php(1023): dmFrontInitFilter->execute(Object(sfFilterChain))\n#20 /home/zazabe/www/zazabe/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#21 /home/zazabe/www/zazabe/cache/front/prod/config/config_core_compile.yml.php(1023): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#22 /home/zazabe/www/zazabe/lib/vendor/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#23 /home/zazabe/www/zazabe/cache/front/prod/config/config_core_compile.yml.php(1023): dmRememberMeFilter->execute(Object(sfFilterChain))\n#24 /home/zazabe/www/zazabe/cache/front/prod/config/config_core_compile.yml.php(990): sfFilterChain->execute()\n#25 /home/zazabe/www/zazabe/cache/front/prod/config/config_core_compile.yml.php(1023): sfRenderingFilter->execute(Object(sfFilterChain))\n#26 /home/zazabe/www/zazabe/cache/front/prod/config/config_core_compile.yml.php(660): sfFilterChain->execute()\n#27 /home/zazabe/www/zazabe/cache/front/prod/config/config_core_compile.yml.php(2339): sfController->forward(\'dmWidget\', \'sort\')\n#28 /home/zazabe/www/zazabe/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#29 /home/zazabe/www/zazabe/web/index.php(7): dmContext->dispatch()\n#30 {main}','dmWidget','sort','http://zazabe.mm/index.php/+/dmWidget/sort?dm_zone=9&dm_widget[]=9&dm_widget[]=11&dm_widget[]=10&_=1272879315953&dm_cpi=4&dm_xhr=1','prod','2010-05-03 16:35:16'),(2,'dmException','image_form is not a valid form field','image_form is not a valid form field\n#0 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPHPView.class.php(75): require()\n#1 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPartialView.class.php(110): sfPHPView->renderFile(\'/home/zazabe/ww...\')\n#2 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/helper/PartialHelper.php(218): sfPartialView->render()\n#3 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/helper/PartialHelper.php(180): get_partial(\'article/form_fi...\', Array)\n#4 /home/zazabe/www/zazabe/cache/admin/dev/modules/autoArticle/templates/_form_fieldset.php(24): include_partial(\'article/form_fi...\', Array)\n#5 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPHPView.class.php(75): require(\'/home/zazabe/ww...\')\n#6 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPartialView.class.php(110): sfPHPView->renderFile(\'/home/zazabe/ww...\')\n#7 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/helper/PartialHelper.php(218): sfPartialView->render()\n#8 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/helper/PartialHelper.php(180): get_partial(\'article/form_fi...\', Array)\n#9 /home/zazabe/www/zazabe/cache/admin/dev/modules/autoArticle/templates/_form.php(29): include_partial(\'article/form_fi...\', Array)\n#10 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPHPView.class.php(75): require(\'/home/zazabe/ww...\')\n#11 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPartialView.class.php(110): sfPHPView->renderFile(\'/home/zazabe/ww...\')\n#12 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/helper/PartialHelper.php(218): sfPartialView->render()\n#13 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/helper/PartialHelper.php(180): get_partial(\'article/form\', Array)\n#14 /home/zazabe/www/zazabe/cache/admin/dev/modules/autoArticle/templates/editSuccess.php(33): include_partial(\'article/form\', Array)\n#15 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPHPView.class.php(75): require(\'/home/zazabe/ww...\')\n#16 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPHPView.class.php(185): sfPHPView->renderFile(\'/home/zazabe/ww...\')\n#17 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(155): sfPHPView->render()\n#18 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(116): sfExecutionFilter->executeView(\'article\', \'edit\', \'Success\', Array)\n#19 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(47): sfExecutionFilter->handleView(Object(sfFilterChain), Object(articleActions), \'Success\')\n#20 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfExecutionFilter->execute(Object(sfFilterChain))\n#21 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#22 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmAdminInitFilter->execute(Object(sfFilterChain))\n#23 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#24 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#25 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#26 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmRememberMeFilter->execute(Object(sfFilterChain))\n#27 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfRenderingFilter.class.php(33): sfFilterChain->execute()\n#28 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfRenderingFilter->execute(Object(sfFilterChain))\n#29 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfController.class.php(233): sfFilterChain->execute()\n#30 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfFrontWebController.class.php(48): sfController->forward(\'article\', \'edit\')\n#31 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#32 /home/zazabe/www/zazabe/web/admin_dev.php(7): dmContext->dispatch()\n#33 {main}','article','edit','http://zazabe.mm/admin_dev.php/content/blog/articles/edit/pk/1','dev','2010-08-26 01:14:38'),(3,'Doctrine_Connection_Mysql_Exception','SQLSTATE[42S22]: Column not found: 1054 Unknown column \'a.gallery_id\' in \'field list\'','SQLSTATE[42S22]: Column not found: 1054 Unknown column \'a.gallery_id\' in \'field list\'\n#0 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection/Statement.php(269): Doctrine_Connection->rethrowException(Object(PDOException), Object(Doctrine_Connection_Statement))\n#1 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(1006): Doctrine_Connection_Statement->execute(Array)\n#2 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(976): Doctrine_Connection->execute(\'SELECT a.id AS ...\', Array)\n#3 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(1026): Doctrine_Query_Abstract->_execute(Array)\n#4 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/pager/sfDoctrinePager.class.php(188): Doctrine_Query_Abstract->execute(Array, NULL)\n#5 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/doctrine/pager/dmDoctrinePager.php(59): sfDoctrinePager->getResults(NULL)\n#6 /home/zazabe/www/zazabe/cache/admin/dev/modules/autoArticle/templates/_list.php(19): dmDoctrinePager->getResults()\n#7 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPHPView.class.php(75): require(\'/home/zazabe/ww...\')\n#8 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPartialView.class.php(110): sfPHPView->renderFile(\'/home/zazabe/ww...\')\n#9 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/helper/PartialHelper.php(218): sfPartialView->render()\n#10 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/helper/PartialHelper.php(180): get_partial(\'article/list\', Array)\n#11 /home/zazabe/www/zazabe/cache/admin/dev/modules/autoArticle/templates/indexSuccess.php(26): include_partial(\'article/list\', Array)\n#12 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPHPView.class.php(75): require(\'/home/zazabe/ww...\')\n#13 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/view/sfPHPView.class.php(185): sfPHPView->renderFile(\'/home/zazabe/ww...\')\n#14 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(155): sfPHPView->render()\n#15 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(116): sfExecutionFilter->executeView(\'article\', \'index\', \'Success\', Array)\n#16 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(47): sfExecutionFilter->handleView(Object(sfFilterChain), Object(articleActions), \'Success\')\n#17 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfExecutionFilter->execute(Object(sfFilterChain))\n#18 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#19 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmAdminInitFilter->execute(Object(sfFilterChain))\n#20 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#21 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#22 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#23 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmRememberMeFilter->execute(Object(sfFilterChain))\n#24 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfRenderingFilter.class.php(33): sfFilterChain->execute()\n#25 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfRenderingFilter->execute(Object(sfFilterChain))\n#26 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfController.class.php(233): sfFilterChain->execute()\n#27 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfFrontWebController.class.php(48): sfController->forward(\'article\', \'index\')\n#28 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#29 /home/zazabe/www/zazabe/web/admin_dev.php(7): dmContext->dispatch()\n#30 {main}','article','index','http://zazabe.mm/admin_dev.php/content/blog/articles/index','dev','2010-08-26 02:12:43'),(4,'Doctrine_Connection_Mysql_Exception','SQLSTATE[42S02]: Base table or view not found: 1146 Table \'zazabe.article\' doesn\'t exist. Failing Query: \"SELECT COUNT(*) AS num_results FROM article a\"','SQLSTATE[42S02]: Base table or view not found: 1146 Table \'zazabe.article\' doesn\'t exist. Failing Query: \"SELECT COUNT(*) AS num_results FROM article a\"\n#0 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(1025): Doctrine_Connection->rethrowException(Object(PDOException), Object(Doctrine_Connection_Mysql), \'SELECT COUNT(*)...\')\n#1 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(800): Doctrine_Connection->execute(\'SELECT COUNT(*)...\', Array)\n#2 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query.php(2131): Doctrine_Connection->fetchAll(\'SELECT COUNT(*)...\', Array)\n#3 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/pager/sfDoctrinePager.class.php(101): Doctrine_Query->count()\n#4 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/doctrine/pager/dmDoctrinePager.php(43): sfDoctrinePager->init()\n#5 /home/zazabe/www/zazabe/cache/admin/dev/modules/autoArticle/actions/actions.class.php(253): dmDoctrinePager->init()\n#6 /home/zazabe/www/zazabe/cache/admin/dev/modules/autoArticle/actions/actions.class.php(78): autoArticleActions->getPager()\n#7 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/action/sfActions.class.php(60): autoArticleActions->executeIndex(Object(dmWebRequest))\n#8 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(92): sfActions->execute(Object(dmWebRequest))\n#9 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(78): sfExecutionFilter->executeAction(Object(articleActions))\n#10 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(42): sfExecutionFilter->handleAction(Object(sfFilterChain), Object(articleActions))\n#11 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfExecutionFilter->execute(Object(sfFilterChain))\n#12 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#13 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmAdminInitFilter->execute(Object(sfFilterChain))\n#14 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#15 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#16 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#17 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmRememberMeFilter->execute(Object(sfFilterChain))\n#18 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfRenderingFilter.class.php(33): sfFilterChain->execute()\n#19 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfRenderingFilter->execute(Object(sfFilterChain))\n#20 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfController.class.php(233): sfFilterChain->execute()\n#21 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfFrontWebController.class.php(48): sfController->forward(\'article\', \'index\')\n#22 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#23 /home/zazabe/www/zazabe/web/admin_dev.php(7): dmContext->dispatch()\n#24 {main}','article','index','http://zazabe.mm/admin_dev.php/content/blog/articles/index','dev','2010-08-26 02:34:23'),(5,'Doctrine_Connection_Mysql_Exception','SQLSTATE[42S22]: Column not found: 1054 Unknown column \'a.gallery\' in \'field list\'','SQLSTATE[42S22]: Column not found: 1054 Unknown column \'a.gallery\' in \'field list\'\n#0 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection/Statement.php(269): Doctrine_Connection->rethrowException(Object(PDOException), Object(Doctrine_Connection_Statement))\n#1 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(1006): Doctrine_Connection_Statement->execute(Array)\n#2 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(976): Doctrine_Connection->execute(\'SELECT a.id AS ...\', Array)\n#3 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(1026): Doctrine_Query_Abstract->_execute(Array)\n#4 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/doctrine/query/dmDoctrineQuery.php(273): Doctrine_Query_Abstract->execute(Array, 2)\n#5 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/seo/dmSeoSynchronizer.php(114): dmDoctrineQuery->fetchRecords()\n#6 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/seo/dmSeoSynchronizer.php(46): dmSeoSynchronizer->updateRecursive(Object(dmProjectModule))\n#7 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/page/dmPageTreeWatcher.php(227): dmSeoSynchronizer->execute(Array, \'fr\')\n#8 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/page/dmPageTreeWatcher.php(118): dmPageTreeWatcher->synchronizeSeo(Array)\n#9 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/page/dmPageTreeWatcher.php(99): dmPageTreeWatcher->update()\n#10 [internal function]: dmPageTreeWatcher->listenToControllerRedirectionEvent(Object(sfEvent))\n#11 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/event_dispatcher/sfEventDispatcher.php(79): call_user_func(Array, Object(sfEvent))\n#12 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/controller/dmFrontWebController.php(10): sfEventDispatcher->notify(Object(sfEvent))\n#13 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/action/sfAction.class.php(202): dmFrontWebController->redirect(\'http://zazabe.m...\', 0, 302)\n#14 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/action/dmBaseActions.php(101): sfAction->redirect(\'http://zazabe.m...\')\n#15 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/action/base/dmAdminBaseGeneratedModuleActions.php(56): dmBaseActions->redirectBack()\n#16 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/action/sfActions.class.php(60): dmAdminBaseGeneratedModuleActions->executeLoremize(Object(dmWebRequest))\n#17 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(92): sfActions->execute(Object(dmWebRequest))\n#18 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(78): sfExecutionFilter->executeAction(Object(articleActions))\n#19 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(42): sfExecutionFilter->handleAction(Object(sfFilterChain), Object(articleActions))\n#20 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfExecutionFilter->execute(Object(sfFilterChain))\n#21 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#22 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmAdminInitFilter->execute(Object(sfFilterChain))\n#23 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#24 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#25 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#26 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmRememberMeFilter->execute(Object(sfFilterChain))\n#27 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfRenderingFilter.class.php(33): sfFilterChain->execute()\n#28 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfRenderingFilter->execute(Object(sfFilterChain))\n#29 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfController.class.php(233): sfFilterChain->execute()\n#30 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfFrontWebController.class.php(48): sfController->forward(\'article\', \'loremize\')\n#31 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#32 /home/zazabe/www/zazabe/web/admin_dev.php(7): dmContext->dispatch()\n#33 {main}','article','loremize','http://zazabe.mm/admin_dev.php/content/blog/articles/loremize/nb/5','dev','2010-08-26 02:40:56'),(6,'Doctrine_Connection_Mysql_Exception','SQLSTATE[42S22]: Column not found: 1054 Unknown column \'a.gallery\' in \'field list\'','SQLSTATE[42S22]: Column not found: 1054 Unknown column \'a.gallery\' in \'field list\'\n#0 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection/Statement.php(269): Doctrine_Connection->rethrowException(Object(PDOException), Object(Doctrine_Connection_Statement))\n#1 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(1006): Doctrine_Connection_Statement->execute(Array)\n#2 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(976): Doctrine_Connection->execute(\'SELECT a.id AS ...\', Array)\n#3 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(1026): Doctrine_Query_Abstract->_execute(Array)\n#4 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/doctrine/query/dmDoctrineQuery.php(273): Doctrine_Query_Abstract->execute(Array, 2)\n#5 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/seo/dmSeoSynchronizer.php(114): dmDoctrineQuery->fetchRecords()\n#6 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/seo/dmSeoSynchronizer.php(46): dmSeoSynchronizer->updateRecursive(Object(dmProjectModule))\n#7 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/page/dmPageTreeWatcher.php(227): dmSeoSynchronizer->execute(Array, \'fr\')\n#8 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/page/dmPageTreeWatcher.php(118): dmPageTreeWatcher->synchronizeSeo(Array)\n#9 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/page/dmPageTreeWatcher.php(99): dmPageTreeWatcher->update()\n#10 [internal function]: dmPageTreeWatcher->listenToControllerRedirectionEvent(Object(sfEvent))\n#11 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/event_dispatcher/sfEventDispatcher.php(79): call_user_func(Array, Object(sfEvent))\n#12 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/controller/dmFrontWebController.php(10): sfEventDispatcher->notify(Object(sfEvent))\n#13 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/action/sfAction.class.php(202): dmFrontWebController->redirect(\'http://zazabe.m...\', 0, 302)\n#14 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/action/dmBaseActions.php(101): sfAction->redirect(\'http://zazabe.m...\')\n#15 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/action/base/dmAdminBaseGeneratedModuleActions.php(56): dmBaseActions->redirectBack()\n#16 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/action/sfActions.class.php(60): dmAdminBaseGeneratedModuleActions->executeLoremize(Object(dmWebRequest))\n#17 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(92): sfActions->execute(Object(dmWebRequest))\n#18 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(78): sfExecutionFilter->executeAction(Object(articleActions))\n#19 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfExecutionFilter.class.php(42): sfExecutionFilter->handleAction(Object(sfFilterChain), Object(articleActions))\n#20 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfExecutionFilter->execute(Object(sfFilterChain))\n#21 /home/zazabe/www/dm-sources/lib/vendor/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#22 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmAdminInitFilter->execute(Object(sfFilterChain))\n#23 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#24 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#25 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#26 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmRememberMeFilter->execute(Object(sfFilterChain))\n#27 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfRenderingFilter.class.php(33): sfFilterChain->execute()\n#28 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfRenderingFilter->execute(Object(sfFilterChain))\n#29 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfController.class.php(233): sfFilterChain->execute()\n#30 /home/zazabe/www/dm-sources/lib/vendor/diem/symfony/lib/controller/sfFrontWebController.class.php(48): sfController->forward(\'article\', \'loremize\')\n#31 /home/zazabe/www/dm-sources/lib/vendor/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#32 /home/zazabe/www/zazabe/web/admin_dev.php(7): dmContext->dispatch()\n#33 {main}','article','loremize','http://zazabe.mm/admin_dev.php/content/blog/articles/loremize/nb/5','dev','2010-08-26 02:41:37');
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
INSERT INTO `dm_group` VALUES (1,'developer','Able to read and update source code','2010-05-03 15:54:41','2010-05-03 15:54:41'),(2,'seo','Seo knowledge','2010-05-03 15:54:41','2010-05-03 15:54:41'),(3,'integrator','Integrator','2010-05-03 15:54:42','2010-05-03 15:54:42'),(4,'webmaster 1','Webmaster level 1','2010-05-03 15:54:42','2010-05-03 15:54:42'),(5,'writer','Writer','2010-05-03 15:54:42','2010-05-03 15:54:42'),(6,'front_editor','Can fast edit front widgets','2010-05-03 15:54:42','2010-05-03 15:54:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_layout`
--

LOCK TABLES `dm_layout` WRITE;
/*!40000 ALTER TABLE `dm_layout` DISABLE KEYS */;
INSERT INTO `dm_layout` VALUES (1,'Global','page',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_lock`
--

LOCK TABLES `dm_lock` WRITE;
/*!40000 ALTER TABLE `dm_lock` DISABLE KEYS */;
INSERT INTO `dm_lock` VALUES (50,1,'admin','article','edit',3,1282762011,'admin','/admin.php/content/blog/articles/edit/pk/3','fr');
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
INSERT INTO `dm_mail_template` VALUES (1,'dm_user_forgot_password','username, email, step2_url','2010-05-03 15:55:18','2010-05-03 15:55:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_media`
--

LOCK TABLES `dm_media` WRITE;
/*!40000 ALTER TABLE `dm_media` DISABLE KEYS */;
INSERT INTO `dm_media` VALUES (1,1,'sample1.jpg',NULL,NULL,NULL,'image/jpeg',94315,'500x333','2010-05-03 16:35:22','2010-05-03 16:35:22'),(2,1,'sample2.jpg',NULL,NULL,NULL,'image/jpeg',173713,'333x500','2010-05-03 16:35:22','2010-05-03 16:35:23'),(3,1,'sample3.jpg',NULL,NULL,NULL,'image/jpeg',170512,'333x500','2010-05-03 16:35:22','2010-05-03 16:35:23'),(4,3,'IMGP0019 - Copie -640x480-.JPG','pascale','','','image/jpeg',98230,'480x640','2010-05-03 22:35:34','2010-05-03 22:36:26'),(5,3,'moi.jpg','moi moi moi','','','image/jpeg',33087,'512x341','2010-08-26 02:01:03','2010-08-26 02:01:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_media_folder`
--

LOCK TABLES `dm_media_folder` WRITE;
/*!40000 ALTER TABLE `dm_media_folder` DISABLE KEYS */;
INSERT INTO `dm_media_folder` VALUES (1,'',1,6,0),(2,'assets',2,3,1),(3,'article',4,5,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_page`
--

LOCK TABLES `dm_page` WRITE;
/*!40000 ALTER TABLE `dm_page` DISABLE KEYS */;
INSERT INTO `dm_page` VALUES (1,'main','root',0,NULL,1,26,0),(2,'main','error404',0,NULL,22,23,1),(3,'main','signin',0,NULL,18,19,1),(4,'main','aPropos',0,NULL,4,5,1),(5,'main','cv',0,NULL,2,3,1),(6,'main','search',0,NULL,20,21,1),(7,'article','list',0,NULL,6,17,1),(13,'main','projets',0,NULL,24,25,1),(15,'article','show',1,NULL,7,8,2),(16,'article','show',2,NULL,9,10,2),(17,'article','show',3,NULL,11,12,2),(18,'article','show',4,NULL,13,14,2),(19,'article','show',5,NULL,15,16,2);
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
INSERT INTO `dm_page_translation` VALUES (1,'','Home','Home',NULL,NULL,NULL,'snthdk',1,0,1,'fr'),(2,'error404','Page not found','Page non trouvée',NULL,NULL,NULL,'snthdk',1,0,1,'fr'),(3,'security/signin','Signin','Signin',NULL,NULL,NULL,'snthdk',0,0,1,'fr'),(4,'a-propos','A Propos','A Propos',NULL,NULL,NULL,'snthdk',1,0,1,'fr'),(5,'cursus-professionnel','Cursus','Cursus Professionnel',NULL,NULL,NULL,'snthdk',1,0,1,'fr'),(6,'search','Recherche : résultats','Recherche : résultats',NULL,NULL,NULL,'snthdk',0,0,1,'fr'),(7,'articles','Articles','Articles',NULL,'Articles',NULL,'snthdk',0,0,1,'fr'),(13,'projets','Projets','Projets',NULL,NULL,NULL,'snthdk',1,0,1,'fr'),(15,'articles/praesen','Praesen','Praesen',NULL,'Morbi fringilla commodo ipsum. Suspendisse volutpat congue massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ultricies euismod nisi. Gravida ',NULL,'snthdk',1,0,1,'fr'),(16,'articles/phasellus-sagittis-magna-sed-nisi-su','. Phasellus sagittis magna sed nisi. Su','. Phasellus sagittis magna sed nisi. Su',NULL,'Morbi fringilla commodo ipsum. Suspendisse volutpat congue massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ultricies euismod nisi. Gravida ',NULL,'snthdk',1,0,1,'fr'),(17,'articles/orci-sit-amet-diam-cur','orci sit amet diam. Cur','Orci sit amet diam. Cur',NULL,NULL,NULL,'snthdk',0,0,1,'fr'),(18,'articles/varius-metus-etiam-tristique','varius metus. Etiam tristique','Varius metus. Etiam tristique',NULL,'Morbi fringilla commodo ipsum. Suspendisse volutpat congue massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ultricies euismod nisi. Gravida ',NULL,'snthdk',0,0,1,'fr'),(19,'articles/nec-imperdiet-ac-jus','nec, imperdiet ac, jus','Nec, imperdiet ac, jus',NULL,'Morbi fringilla commodo ipsum. Suspendisse volutpat congue massa. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ultricies euismod nisi. Gravida ',NULL,'snthdk',0,0,1,'fr');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_page_view`
--

LOCK TABLES `dm_page_view` WRITE;
/*!40000 ALTER TABLE `dm_page_view` DISABLE KEYS */;
INSERT INTO `dm_page_view` VALUES (1,'main','root',1),(2,'main','error404',1),(3,'main','signin',1),(4,'main','aPropos',1),(5,'main','cv',1),(6,'main','search',1),(7,'article','list',1),(8,'article','show',1),(9,'main','projets',1);
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
INSERT INTO `dm_permission` VALUES (1,'system','System administrator','2010-05-03 15:54:40','2010-05-03 15:54:40'),(2,'admin','Log into administration','2010-05-03 15:54:40','2010-05-03 15:54:40'),(3,'clear_cache','Clear the cache','2010-05-03 15:54:40','2010-05-03 15:54:40'),(4,'log','Manage logs','2010-05-03 15:54:40','2010-05-03 15:54:40'),(5,'code_editor','Use admin and front code editors','2010-05-03 15:54:40','2010-05-03 15:54:40'),(6,'security_user','Manage security users','2010-05-03 15:54:40','2010-05-03 15:54:40'),(7,'security_permission','Manage security permissions','2010-05-03 15:54:40','2010-05-03 15:54:40'),(8,'security_group','Manage security groups','2010-05-03 15:54:40','2010-05-03 15:54:40'),(9,'content','CRUD dynamic content in admin','2010-05-03 15:54:40','2010-05-03 15:54:40'),(10,'zone_add','Add zones','2010-05-03 15:54:40','2010-05-03 15:54:40'),(11,'zone_edit','Edit zones','2010-05-03 15:54:40','2010-05-03 15:54:40'),(12,'zone_delete','Delete zones','2010-05-03 15:54:40','2010-05-03 15:54:40'),(13,'widget_add','Add widgets','2010-05-03 15:54:40','2010-05-03 15:54:40'),(14,'widget_edit','Edit widgets','2010-05-03 15:54:40','2010-05-03 15:54:40'),(15,'widget_delete','Delete widgets','2010-05-03 15:54:40','2010-05-03 15:54:40'),(16,'widget_edit_fast','Can fast edit widgets','2010-05-03 15:54:40','2010-05-03 15:54:40'),(17,'widget_edit_fast_record','Fast edit widget record','2010-05-03 15:54:40','2010-05-03 15:54:40'),(18,'widget_edit_fast_content_title','Fast edit widget content title','2010-05-03 15:54:40','2010-05-03 15:54:40'),(19,'widget_edit_fast_content_link','Fast edit widget content link','2010-05-03 15:54:40','2010-05-03 15:54:40'),(20,'widget_edit_fast_content_image','Fast edit widget content image','2010-05-03 15:54:41','2010-05-03 15:54:41'),(21,'widget_edit_fast_content_text','Fast edit widget content text','2010-05-03 15:54:41','2010-05-03 15:54:41'),(22,'widget_edit_fast_navigation_menu','Fast edit widget navigation menu','2010-05-03 15:54:41','2010-05-03 15:54:41'),(23,'page_add','Add pages','2010-05-03 15:54:41','2010-05-03 15:54:41'),(24,'page_edit','Edit pages','2010-05-03 15:54:41','2010-05-03 15:54:41'),(25,'page_delete','Delete pages','2010-05-03 15:54:41','2010-05-03 15:54:41'),(26,'page_bar_admin','See page bar in admin','2010-05-03 15:54:41','2010-05-03 15:54:41'),(27,'media_bar_admin','See media bar in admin','2010-05-03 15:54:41','2010-05-03 15:54:41'),(28,'media_library','Use media library in admin','2010-05-03 15:54:41','2010-05-03 15:54:41'),(29,'tool_bar_admin','See toolbar in admin','2010-05-03 15:54:41','2010-05-03 15:54:41'),(30,'page_bar_front','See page bar in front','2010-05-03 15:54:41','2010-05-03 15:54:41'),(31,'media_bar_front','See media bar in front','2010-05-03 15:54:41','2010-05-03 15:54:41'),(32,'tool_bar_front','See toolbar in front','2010-05-03 15:54:41','2010-05-03 15:54:41'),(33,'site_view','See non-public website and inactive pages','2010-05-03 15:54:41','2010-05-03 15:54:41'),(34,'loremize','Create automatic random content','2010-05-03 15:54:41','2010-05-03 15:54:41'),(35,'export_table','Export table contents','2010-05-03 15:54:41','2010-05-03 15:54:41'),(36,'sitemap','Regenerate sitemap','2010-05-03 15:54:41','2010-05-03 15:54:41'),(37,'automatic_metas','Configure automatic pages metas','2010-05-03 15:54:41','2010-05-03 15:54:41'),(38,'manual_metas','Configure manually pages metas','2010-05-03 15:54:41','2010-05-03 15:54:41'),(39,'manage_pages','Move and sort pages','2010-05-03 15:54:41','2010-05-03 15:54:41'),(40,'url_redirection','Configure url redirections','2010-05-03 15:54:41','2010-05-03 15:54:41'),(41,'use_google_analytics','Use google analytics','2010-05-03 15:54:41','2010-05-03 15:54:41'),(42,'google_analytics','Configure google analytics','2010-05-03 15:54:41','2010-05-03 15:54:41'),(43,'use_google_webmaster_tools','Use google webmaster tools','2010-05-03 15:54:41','2010-05-03 15:54:41'),(44,'google_webmaster_tools','Configure google webmaster tools','2010-05-03 15:54:41','2010-05-03 15:54:41'),(45,'xiti','Configure Xiti','2010-05-03 15:54:41','2010-05-03 15:54:41'),(46,'search_engine','Manage internal search engine','2010-05-03 15:54:41','2010-05-03 15:54:41'),(47,'see_log','See the logs','2010-05-03 15:54:41','2010-05-03 15:54:41'),(48,'see_chart','See the charts','2010-05-03 15:54:41','2010-05-03 15:54:41'),(49,'see_diagrams','See the developer diagrams','2010-05-03 15:54:41','2010-05-03 15:54:41'),(50,'see_server','See the server infos','2010-05-03 15:54:41','2010-05-03 15:54:41'),(51,'config_panel','Use the configuration panel','2010-05-03 15:54:41','2010-05-03 15:54:41'),(52,'translation','Use the translation interface','2010-05-03 15:54:41','2010-05-03 15:54:41'),(53,'layout','Use the layout interface','2010-05-03 15:54:41','2010-05-03 15:54:41'),(54,'sent_mail','See mails sent by server','2010-05-03 15:54:41','2010-05-03 15:54:41'),(55,'mail_template','Configure mail templates','2010-05-03 15:54:41','2010-05-03 15:54:41'),(56,'error_log','See error log','2010-05-03 15:54:41','2010-05-03 15:54:41'),(57,'interface_settings','Manage interface settings like default image resize method','2010-05-03 15:54:41','2010-05-03 15:54:41');
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
INSERT INTO `dm_remember_key` VALUES (1,'efdb1e79ef0458515e02943884a29074','127.0.0.1','2010-08-26 01:37:01');
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
INSERT INTO `dm_setting_translation` VALUES (1,'The site name','Zazabe','Zazabe','fr'),(2,'Is the site ready for visitors ?','1','1','fr'),(3,'Is the site ready for search engine crawlers ?',NULL,'0','fr'),(4,'Is this site the current working copy ?','1','1','fr'),(5,'The google analytics key without javascript stuff ( e.g. UA-9876614-1 )',NULL,'','fr'),(6,'Auth token gor Google Analytics, computed from password',NULL,'','fr'),(7,'The google webmaster tools filename without google and .html ( e.g. a913b555ba9b4f13 )',NULL,'','fr'),(8,'The xiti html code',NULL,'','fr'),(9,'Words to exclude from searches (e.g. the, a, to )',NULL,'','fr'),(10,'Diem base urls for different applications/environments/cultures','{\"front-prod\":\"http:\\/\\/zazabe.mm\\/index.php\",\"admin-prod\":\"http:\\/\\/zazabe.mm\\/admin.php\",\"front-dev\":\"http:\\/\\/zazabe.mm\\/dev.php\",\"admin-dev\":\"http:\\/\\/zazabe.mm\\/admin_dev.php\"}','','fr'),(11,'Default method when an image needs to be resized','center','center','fr'),(12,'Jpeg default quality when generating thumbnails','95','95','fr'),(13,'Links to other domain get automatically a _blank target',NULL,'0','fr'),(14,'Links to current page are changed from <a> to <span>','1','1','fr'),(15,'Add an automatic title on link based on the target page title','1','1','fr'),(16,'Append something at the beginning of all pages title',NULL,'','fr'),(17,'Append something at the end of all pages title',' | Zazabe',' | Zazabe','fr'),(18,'When a page is not found, user is redirect to a similar page. The internal search index is used to find the best page for requested url.','1','1','fr');
/*!40000 ALTER TABLE `dm_setting_translation` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=531 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_trans_unit`
--

LOCK TABLES `dm_trans_unit` WRITE;
/*!40000 ALTER TABLE `dm_trans_unit` DISABLE KEYS */;
INSERT INTO `dm_trans_unit` VALUES (1,2,'Open','Ouvrir',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(2,2,'Delete','Supprimer',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(3,2,'Add','Ajouter',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(4,2,'Add a %1%','Ajouter un(e) %1%',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(5,2,'Cancel','Annuler',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(6,2,'Are you sure?','Confirmer cette action ?',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(7,2,'Unassociated','Non associé',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(8,2,'Associated','Associé',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(9,2,'Forgot your password?','Mot de passe perdu ?',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(10,2,'yes','oui',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(11,2,'no','non',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(12,2,'yes or no','oui ou non',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(13,2,'Next','Suivant',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(14,2,'Previous','Précédent',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(15,2,'First','Premier',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(16,2,'Last','Dernier',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(17,2,'Is active','Actif',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(18,2,'Is active:','Actif:',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(19,2,'Updated at','Mise à jour',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(20,2,'Updated at:','Mise à jour:',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(21,2,'Created at','Création',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(22,2,'Created at:','Création:',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(23,2,'Created by','Créé par',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(24,2,'Updated by','Mis à jour par',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(25,2,'Query','Requête',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(26,2,'Image alt','Légende',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(27,2,'Image alt:','Légende:',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(28,2,'Your modifications have been saved','Vos modifications ont été enregistrées',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(29,2,'Required','Ce champ ne devrait pas être vide',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(30,2,'Content','Contenu',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(31,2,'Home','Accueil',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(32,2,'Tools','Outils',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(33,2,'System','Système',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(34,2,'Update project','Mettre à jour le projet',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(35,2,'Project successfully updated','Le projet a été mis à jour avec succès',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(36,2,'Search','Rechercher',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(37,2,'Search in %1%','Rechercher dans les %1%',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(38,2,'Cancel search','Annuler la recherche',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(39,2,'Active search','Recherche active',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(40,2,'is empty','vide',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(41,2,'from','de',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(42,2,'to','à',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(43,2,'[0] no result|[1] 1 result|(1,+Inf] %1% results','[0]aucun résultat|[1]1 résultat|(1,+Inf]%1% résultats',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(44,2,'Choose an action','Agir sur la sélection',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(45,2,'Edit','Modifier',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(46,2,'New','Ajouter',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(47,2,'You must at least select one item.','Aucun élément sélectionné',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(48,2,'Filter','Rechercher',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(49,2,'Reset','Annuler',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(50,2,'Add a','Ajouter un(e)',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(51,2,'The item was updated successfully.','L\'élément a été enregistré avec succès',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(52,2,'The item has not been saved due to some errors.','L\'élément n\'a pas été enregistré en raison des erreurs ci-dessous',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(53,2,'Invalid.','Le contenu de ce champ n\'est pas valide',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(54,2,'Required.','Ce champ ne devrait pas être vide',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(55,2,'The item was updated successfully. You can add another one below.','L\'élément a été enregistré avec succès, vous pouvez maintenant en ajouter un autre',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(56,2,'Translation','Traduction',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(57,2,'Sentences','Phrases',NULL,'2010-05-03 15:55:10','2010-05-03 15:55:10'),(58,2,'Loremize','Loremiser',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(59,2,'does not match the date format','ne correspond pas au format',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(60,2,'The date must be before','La date doit être antérieure à',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(61,2,'The date must be after','La date doit être postérieure à',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(62,2,'[0]no element|[1]1 element|(1,+Inf]%1% elements','[0]aucun élément|[1]un élément|(1,+Inf]%1% éléments',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(63,2,'You must select an action to execute on the selected items.','Aucune action sélectionnée',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(64,2,'No result','Aucun résultat',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(65,2,'The selected items have been deleted successfully.','Les éléments sélectionnés ont été supprimés avec succès',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(66,2,'The selected items have been modified successfully','Les éléments sélectionnés ont été modifiés avec succès',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(67,2,'A problem occurs when modifying the selected items','Un problème est survenu pendant la modification',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(68,2,'Root','Racine',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(69,2,'Page not found','Page introuvable',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(70,2,'Media library','Bibliothèque de médias',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(71,2,'UML Model Diagram','Diagramme UML du modèle',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(72,2,'The item was deleted successfully.','L\'élément a été supprimé avec succès',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(73,2,'element','élément',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(74,2,'elements','éléments',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(75,2,'Add a folder here','Ajouter un répertoire ici',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(76,2,'Import from a zip','Importer depuis un zip',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(77,2,'Add some files here','Ajouter des fichiers ici',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(78,2,'Add a file here','Ajouter un fichier ici',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(79,2,'Clear cache','Vider le cache',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(80,2,'Clear media cache','Vider le cache média',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(81,2,'Name','Nom',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(82,2,'Rename this folder','Renommer ce répertoire',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(83,2,'Move this folder','Déplacer ce répertoire',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(84,2,'Delete this folder','Supprimer ce répertoire',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(85,2,'Already exists in this folder','Existe déjà dans ce répertoire',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(86,2,'This is a bad name','Ce nom n\'est pas valide',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(87,2,'File','Fichier',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(88,2,'Thumbnails can not be created in %1%','Les miniatures ne peuvent être créées dans %1%',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(89,2,'Folder %1% is not writable','Le répertoire %1% n\'est pas accessible en écriture',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(90,2,'File %1% is not writable','Le fichier %1% n\'est pas accessible en écriture',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(91,2,'This folder is not writable','Ce répertoire n\'est pas accessible en écriture',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(92,2,'This file is not writable','Ce fichier n\'est pas accessible en écriture',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(93,2,'Size','Poids',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(94,2,'Legend','Légende',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(95,2,'Author','Auteur',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(96,2,'License','Licence',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(97,2,'Validate','Valider',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(98,2,'Save','Enregistrer',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(99,2,'Save and Add','Enregistrer et Ajouter',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(100,2,'Save and Next','Enregistrer et Suivant',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(101,2,'Save and Back to list','Enregistrer et Retourner à la liste',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(102,2,'Save modifications','Enregistrer les modifications',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(103,2,'Delete this file','Supprimer ce fichier',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(104,2,'Close','Fermer',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(105,2,'Delete this %1%','Supprimer ce(tte) %1%',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(106,2,'Delete this page','Supprimer cette page',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(107,2,'Active','Actif',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(108,2,'Referers','Dépendances',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(109,2,'Administration login','Connexion à l\'administration',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(110,2,'Login','Connexion',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(111,2,'Username','Identifiant',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(112,2,'Password','Mot de passe',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(113,2,'Password (again)','Mot de passe bis',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(114,2,'Remember','Mémoriser',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(115,2,'The username and/or password is invalid.','L\'identifiant et/ou le mot de passe est erroné',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(116,2,'Profiles','Profils',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(117,2,'Profile','Profil',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(118,2,'User','Utilisateur',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(119,2,'Users','Utilisateurs',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(120,2,'Metas','Métas',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(121,2,'Automatic Page','Page automatique',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(122,2,'Automatic Pages','Pages automatiques',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(123,2,'Site tree','Arborescence du site',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(124,2,'Some SEO improvements should be applied','Des optimisations pourraient être apportées au référencement',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(125,2,'Some page have the same url','Certaines pages ont la même url',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(126,2,'Click here to see them','Cliquez ici pour les voir',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(127,2,'Seo improvements','Optimisation du référencement',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(128,2,'Duplicated %1%','%1% dupliqué(e)s',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(129,2,'Automatic page','Page automatique',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(130,2,'Manual page','Page manuelle',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(131,2,'Modify object','Modifier l\'objet',NULL,'2010-05-03 15:55:11','2010-05-03 15:55:11'),(132,2,'Configure automatic seo for %1% pages','Configurer le référencement automatique pour les pages %1%',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(133,2,'View page on website','Voir la page sur le site',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(134,2,'Edit image','Modifier l\'image',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(135,2,'Loading...','Chargement...',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(136,2,'Preview','Prévisualisation',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(137,2,'Back to list','Retour à la liste',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(138,2,'The form submission cannot be processed. It probably means that you have uploaded a file that is too big.','Le formulaire n\'a pas pu être traité. Cela peut être du à l\'envoi d\'un fichier trop volumineux',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(139,2,'A problem occurs when deleting the selected items.','Un problème est survenu pendant la suppression des éléments',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(140,2,'elements per page','éléments par page',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(141,2,'Sort','Trier',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(142,2,'Sort %1%','Trier les %1%',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(143,2,'Sort %1% for %2%','Trier les %1% de %2%',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(144,2,'Drag & drop elements, then','Glisser-déposer les éléments, puis',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(145,2,'A problem occured when sorting the items','Un problème est survenu pendant le tri des éléments',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(146,2,'The items have been sorted successfully','Les éléments ont été triés avec succès',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(147,2,'Add a zone','Ajouter une zone',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(148,2,'Add a widget','Ajouter un widget',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(149,2,'Go to site','Aller au site',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(150,2,'You don\'t have the required permission to access this page.','Vous n\'êtes pas autorisé à accéder à cette page',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(151,2,'Edit this zone','Modifier cette zone',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(152,2,'Delete this zone','Supprimer cette zone',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(153,2,'CSS class','Classe CSS',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(154,2,'Width','Largeur',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(155,2,'Height','Hauteur',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(156,2,'Edit this %1%','Modifier ce(tte) %1%',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(157,2,'Delete this widget','Supprimer ce widget',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(158,2,'Title','Titre',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(159,2,'Link','Lien',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(160,2,'Text','Texte',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(161,2,'Advanced','Avancé',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(162,2,'Bread crumb','Fil d\'arianne',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(163,2,'Search form','Recherche : form',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(164,2,'Search results','Recherche : résultats',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(165,2,'Go to content','Aller au contenu',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(166,2,'New widget','Nouveau widget',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(167,2,'Use media','Utiliser un média',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(168,2,'Or upload a file','Ou importer un fichier',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(169,2,'Drag & drop a media here','Glisser-déposer un média ici',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(170,2,'Media','Média',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(171,2,'You must use a media or upload a file','Vous devez utiliser un média ou importer un fichier',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(172,2,'Try','Essayer',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(173,2,'Change file','Changer de fichier',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(174,2,'Method','Méthode',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(175,2,'Center','Centrer',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(176,2,'Scale','Ajuster',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(177,2,'Inflate','Etirer',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(178,2,'Fit','Remplir',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(179,2,'Save and close','Enregistrer et fermer',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(180,2,'This size is not valid.','Cette dimension n\'est pas valide',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(181,2,'This color is not valid.','Cette couleur n\'est pas valide',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(182,2,'Per page','Par page',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(183,2,'First page','Première page',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(184,2,'Previous page','Page précédente',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(185,2,'Next page','Page suivante',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(186,2,'Last page','Dernière page',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(187,2,'Top','En haut',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(188,2,'Bottom','En bas',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(189,2,'View','Vue',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(190,2,'Order by','Ordonner par',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(191,2,'Random','Aléatoire',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(192,2,'automatic','automatique',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(193,2,'Add new page','Ajouter une nouvelle page',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(194,2,'Seo','Référencement',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(195,2,'Integration','Intégration',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(196,2,'Edit page','Modifier la page',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(197,2,'Logout','Déconnexion',NULL,'2010-05-03 15:55:12','2010-05-03 15:55:12'),(198,2,'Available','Disponible',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(199,2,'Requires authentication','Requiert une authentication',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(200,2,'Search engine crawlers','Robots des moteurs de recherche',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(201,2,'Show page structure','Afficher la structure de la page',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(202,2,'Generate sitemap','Générer le sitemap',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(203,2,'Links','Liens',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(204,2,'Act on selection','Agir sur la sélection',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(205,2,'Activate','Activer',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(206,2,'Deactivate','Désactiver',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(207,2,'Remove','Enlever',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(208,2,'Sorry, but you can not access administration with your current browser','Désolé, mais vous ne pouvez pas accéder à l\'administration avec votre navigateur actuel',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(209,2,'Select all','Sélectionner tout',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(210,2,'Unselect all','Désélectionner tout',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(211,2,'Configuration panel','Panneau de configuration',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(212,2,'This is not a valid hexadecimal color','Ce n\'est pas une couleur hexadécimale valide',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(213,2,'%1% - %2% of %3%','%1% - %2% sur %3%',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(214,2,'Display','Afficher',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(215,2,'User logged in','L\'utilisateur s\'est connecté',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(216,2,'User logged out','L\'utilisateur s\'est déconnecté',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(217,2,'Cache cleared','Cache vidé',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(218,2,'This Week','Cette Semaine',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(219,2,'This Year','Cette Année',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(220,2,'Activity','Activité',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(221,2,'Server','Serveur',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(222,2,'Browser','Navigateur',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(223,2,'Browsers','Navigateurs',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(224,2,'Location','Page',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(225,2,'Events','Evènements',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(226,2,'Requests','Requêtes',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(227,2,'Subject','Sujet',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(228,2,'Expanded view','Vue étendue',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(229,2,'Show','Afficher',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(230,2,'Gallery','Galerie',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(231,2,'Edit medias','Modifier les médias',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(232,2,'Remove this media','Enlever ce média',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(233,2,'Preferences','Préférences',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(234,2,'Mail templates','Gabarits de courriels',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(235,2,'Layouts','Layouts',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(236,2,'Zone','Zone',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(237,2,'Navigation','Navigation',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(238,2,'Configuration','Configuration',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(239,2,'Chart','Graphique',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(240,2,'Log','Journal',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(241,2,'Monitoring','Surveillance',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(242,2,'Manage index','Gérer l\'index',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(243,2,'Search engine','Moteur de recherche',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(244,2,'Google analytics','Google Analytics',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(245,2,'Google webmaster tools','Google webmaster tools',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(246,2,'Services','Services',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(247,2,'Sitemap','Sitemap',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(248,2,'Url Redirections','Redirections d\'urls',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(249,2,'Redirections','Redirections',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(250,2,'Settings','Paramètres',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(251,2,'Sent mails','Courriels envoyés',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(252,2,'Errors','Erreurs',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(253,2,'Permissions','Autorisations',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(254,2,'Groups','Groupes',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(255,2,'Security','Sécurité',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(256,2,'See diagrams','Voir les schémas',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(257,2,'Code Editor','Éditeur de code',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(258,2,'Diem Console','Console Diem',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(259,2,'Dev','Dev',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(260,2,'Exception','Exception',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(261,2,'Cache','Cache',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(262,2,'This chart is not available.','Ce graphique n\'est pas disponible.',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(263,2,'Dm gallery','Dm galerie',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(264,2,'Email','Email',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(265,2,'Last login','Dernière connexion',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(266,2,'Visible','Visible',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(267,2,'External services','Services externes',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(268,2,'Interface','Interface',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(269,2,'Site','Site',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(270,2,'Tracking','Tracking',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(271,2,'Right','Droite',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(272,2,'Left','Gauche',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(273,2,'Image resize method','Méthode de redimension d\'image',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(274,2,'Default method when an image needs to be resized','Méthode par défaut lorsque l\'image doit être redimensionnée',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(275,2,'Image resize quality','Qualité de redimension d\'image',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(276,2,'Jpeg default quality when generating thumbnails','Qualité par défaut des JPG lors de la génération des vignettes',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(277,2,'Link external blank','Lien externe en nouvelle fenêtre',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(278,2,'Links to other domain get automatically a _blank target','Les liens vers d\'autres domaines obtiennent automatiquement target=_blank',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(279,2,'Link current span','Lien courrant = span',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(280,2,'Links to current page are changed from <a> to <span>','Les liens vers la page courrante sont transformé de <a> en <span>',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(281,2,'Link use page title','Liens utilisent le titre de la page',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(282,2,'Add an automatic title on link based on the target page title','Ajouter un title automatique aux liens, basé sur le titre de la page ciblée',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(283,2,'Search stop words','Mots à ne pas chercher',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(284,2,'Words to exclude from searches (e.g. the, a, to )','Les mots exclus des recherches (ex: le, un, à)',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(285,2,'Title prefix','Préfixe du titre',NULL,'2010-05-03 15:55:13','2010-05-03 15:55:13'),(286,2,'Append something at the beginning of all pages title','Ajoute une expression au début du titre de toutes les pages',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(287,2,'Title suffix','Suffixe du titre',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(288,2,'Append something at the end of all pages title','Ajouter une expression à la fin du titre toutes les pages',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(289,2,'Smart 404','404 intelligente',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(290,2,'When a page is not found, user is redirect to a similar page. The internal search index is used to find the best page for requested url.','Quand une page est introuvable, l\'utilisateur est redirigé vers une page similaire. Le moteur de recherche interne est utilisé pour trouver la meilleure page pour l\'url demandée.',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(291,2,'Site name','Nom du site',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(292,2,'The site name','Le nom du site',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(293,2,'Site active','Site actif',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(294,2,'Is the site ready for visitors ?','Le site est-il prêt pour les visiteurs?',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(295,2,'Site indexable','Site indexable',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(296,2,'Is the site ready for search engine crawlers ?','Le site est-il prêt pour les robots des moteurs de recherche?',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(297,2,'Site working copy','Site copie de travail',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(298,2,'Is this site the current working copy ?','Ce site est-il la copie de travail en cours?',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(299,2,'Ga key','Ga key',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(300,2,'The google analytics key without javascript stuff ( e.g. UA-9876614-1 )','La clé Google Analytics sans le code javascript (Ex: UA-9876614-1)',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(301,2,'Gwt key','Gwt key',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(302,2,'The google webmaster tools filename without google and .html ( e.g. a913b555ba9b4f13 )','Le nom du fichier google webmaster tools, sans google et sans .html (Ex: a913b555ba9b4f13)',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(303,2,'Xiti code','Code Xiti',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(304,2,'The xiti html code','Le code HTML xiti',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(305,2,'Ga email','Courriel GA',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(306,2,'Required to display google analytics data into Diem','Nécessaire pour afficher les données de Google Analytics dans Diem',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(307,2,'Ga password','Mot de passe GA',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(308,2,'Diem mail support is <strong>-NOT-</strong> completed. Please use the symfony 1.4 mail service instead','Le support des mails n\'est <strong>-PAS-</strong> terminé. Merci d\'utiliser le service de mail de symfony 1.4',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(309,2,'Duplicate','Dupliquer',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(310,2,'Source','Source',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(311,2,'Target','Cible',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(312,2,'Dm catalogue','Dm catalogue',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(313,2,'Meta','Meta',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(314,2,'Menu','Menu',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(315,2,'Internal search engine','Moteur de recherche interne',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(316,2,'Reload index','Recharger l\'index',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(317,2,'Configure Google Analytics','Configurer Google Analytics',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(318,2,'Configure Google Webmaster Tools','Configurer Google Webmaster Tools',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(319,2,'Position','Position',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(320,2,'Urls','Urls',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(321,2,'Old url','Ancienne URL',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(322,2,'New url','Nouvelle URL',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(323,2,'Group','Groupe',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(324,2,'Value','Valeur',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(325,2,'Credentials','Permissions',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(326,2,'Class','Classe',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(327,2,'Module','Module',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(328,2,'Action','Action',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(329,2,'Uri','Uri',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(330,2,'Env','Env',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(331,2,'Super admin','Super Admin',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(332,2,'The admin code editor is <strong>-NOT-</strong> completed yet an may not work','L\'éditeur de code admin <strong>n\'est-pas-encore</strong> achevé et peut ne pas fonctionner',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(333,2,'List','Liste',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(334,2,'Form','Form',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(335,2,'Administration','Administration',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(336,2,'text','texte',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(337,2,'Index state','Etat de l\'index',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(338,2,'Index maintenance','Maintenance de l\'index',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(339,2,'Search completed in %1% ms','Recherche effectuée en %1% ms',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(340,2,'No results','Aucun résultat',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(341,2,'Edit template code','Code de la template',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(342,2,'Edit component code','Code du component',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(343,2,'Drag & Drop a media here','Glisser-déposer un média ici',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(344,2,'Add a link to the text title','Ajouter un lien au titre du texte',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(345,2,'Add a link to the text media','Ajouter un lien au média du texte',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(346,2,'Drag & Drop a page or enter an url','Glisser-déposer une page ou saisir une url',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(347,2,'Drag & drop a page here from the PAGES panel, or write an url','Glisser-déposer une page ici depuis le panneau PAGES, ou saisir une url',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(348,2,'Title position','Position du titre',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(349,2,'Outside','A l\'extérieur',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(350,2,'Inside','A l\'intérieur',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(351,2,'JPG quality','Qualité JPG',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(352,2,'Dimensions','Dimensions',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(353,2,'Leave empty to use default quality','Laisser vide pour utiliser la qualité par défaut',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(354,2,'Separator','Séparateur',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(355,2,'Include current page','Inclure la page en cours',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(356,2,'This CSS class is applied to the body tag','Cette classe CSS est appliqué au tag body',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(357,2,'Revision history of %1%','Historique des versions de %1%',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(358,2,'Revision history','Historique des versions',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(359,2,'Field','Champ',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(360,2,'Difference','Différence',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(361,2,'No revision for %1% with culture \"%2%\"','Aucune version pour %1% dans la langue \"%2%\"',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(362,2,'Body','Corps',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(363,2,'Others','Autres',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(364,2,'Description','Description',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(365,2,'Vars','Variables',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(366,2,'From email','Courriel de l\'expéditeur',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(367,2,'To email','Courriel du destinataire',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(368,2,'Updating project','Mise à jour du projet',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(369,2,'Cache clearing','Mise à jour du cache',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(370,2,'Page synchronization','Synchronisation des pages',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(371,2,'SEO synchronization','Synchronisation SEO',NULL,'2010-05-03 15:55:14','2010-05-03 15:55:14'),(372,2,'Interface regeneration','Régénération de l\'interface',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(373,2,'Something went wrong when updating project','Une erreur s\'est produite pendant la mise à jour du projet',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(374,2,'Send reports','Envoyer des rapports',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(375,2,'Receive reports','Recevoir des rapports',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(376,2,'Open Google Analytics page','Ouvrir la page Google Analytics',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(377,2,'Open Google Webmaster Tools page','Ouvrir la page Google Webmaster Tools',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(378,2,'Revert to revision %1%','Revenir à la version %1%',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(379,2,'%1% has been reverted to version %2%','%1% est revenu à la version %2%',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(380,2,'To enable it, provide a google analytics access','Pour l\'activer, merci de fournir un accès Google Analytics',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(381,2,'This chart is currently not available','Ce graphique n\'est pas disponible pour l\'instant',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(382,2,'Generate %1% random %2%','Générer %1% %2% aléatoires',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(383,2,'Options','Options',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(384,2,'Drag & Drop an image here','Glisser-déposer une image ici',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(385,2,'\"%value%\" is not a valid link.','\"%value%\" n\'est pas un lien valide.',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(386,2,'\"%value%\" is not a valid directory name.','\"%value%\" n\'est pas un nom de répertoire valide.',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(387,2,'History','Historique',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(388,2,'Set up a cron to update the search index','Configurer cron pour actualiser l\'index de recherche',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(389,2,'Set up a cron to update the sitemap','Configurer cron pour actualiser le sitemap',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(390,2,'Most UNIX and GNU/Linux systems allows for task planning through a mechanism known as cron. The cron checks a configuration file (a crontab) for commands to run at a certain time.','La plupart des systèmes UNIX et GNU / Linux supportent la planification de tâches à travers un mécanisme connu sous le nom de cron. Le cron vérifie un fichier de configuration (un crontab) pour les commandes à exécuter à un certain temps ou bien à une certaine période.',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(391,2,'For more information on the crontab configuration file format, type man 5 crontab in a terminal.','Pour plus d\'informations sur le format du fichier de configuration de la crontab, il suffit de taper man 5 crontab dans un terminal de commandes.',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(392,2,'Open %1% and add the line:','Ouvrez %1% et ajoutez la ligne :',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(393,2,'Cut','Couper',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(394,2,'Copy','Copier',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(395,2,'Paste','Coller',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(396,2,'Drag & drop links here from the left PAGE panel','Glisser-déposer une page ici depuis le panneau PAGES',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(397,2,'Click to edit, drag to sort','Cliquer pour modifier, déplacer pour trier',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(398,2,'Code generation','Génération du code',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(399,2,'%user% is browsing this page, you should not modify it now.','%user% est déjà sur cette page, vous ne devriez pas la modifier maintenant.',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(400,2,'or create an external link','Ou créez un lien externe',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(401,2,'Back to the parent folder','Retour au répertoire parent',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(402,2,'Website','Site web',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(403,2,'Message','Message',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(404,2,'Signin','Connexion',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(405,2,'Signout','Déconnexion',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(406,2,'Back to admin','Retourner à l\'administration',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(407,2,'Back to site','Retourner au site',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(408,2,'Invalid mime type (%mime_type%).','Type de fichier non accepté (%mime_type%).',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(409,2,'Download','Télécharger',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(410,2,'Move to','Déplacer dans',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(411,2,'[1] And one more...|(1,+Inf] And %1% more...','[1] Et un autre...|(1,+Inf] Et %1% autres...',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(412,2,'Go to admin','Aller à l\'admin',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(413,2,'Search for a widget','Chercher un widget',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(414,2,'Sort by %field%','Trier par %field%',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(415,2,'contextual','contextuel',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(416,2,'Accepts pages and urls','Accepte pages et urls',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(417,2,'Accepts medias and urls','Accepte médias et urls',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(418,2,'Accepts pages, medias and urls','Accepte pages, médias et urls',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(419,2,'Drag pages around to move and sort them.','Déplacez les pages pour les réordonner.',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(420,2,'Manage metas','Gérer les métas',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(421,2,'Reorder pages','Réordonner les pages',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(422,2,'Manage pages','Gérer les pages',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(423,2,'Click to edit','Cliquer pour modifier',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(424,2,'Click any value in the table to modify it.','Cliquer sur une valeur du tableau pour la modifier',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(425,2,'Choose columns to display in the table.','Choisir les colonnes affichées dans le tableau',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(426,2,'Groups & Permissions','Groupes & autorisations',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(427,2,'File %file% does not exist','Le fichier %file% n\'existe pas',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(428,2,'File %file% can not be deleted because a record needs it','Le fichier %file% ne peut pas être supprimé, car il est utilisé',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(429,2,'Add widgets','Ajouter des widgets',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(430,2,'Back to %1%','Retourner à %1%',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(431,2,'Revision %number%','Version %number%',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(432,2,'My account','Mon compte',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(433,2,'The two passwords must be the same.','Les deux mots de passe doivent être identiques.',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(434,2,'Connected','Connecté',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(435,2,'If you set a href, a link will be inserted into the title','Si vous ajoutez un href, un lien sera inséré dans le titre',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(436,2,'Template','Template',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(437,2,'Areas','Areas',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(438,2,'Nb pages','Nb pages',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(439,2,'Manage XML sitemap','Gérer le sitemap XML',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(440,2,'Pages','Pages',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(441,2,'Automatic SEO','Référencement automatique',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(442,2,'Not connected','Non connecté',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(443,2,'Keywords','Mots clé',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(444,2,'Secure','Sécurisé',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(445,2,'Indexable','Indexable',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(446,2,'Select columns','Choisir les colonnes',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(447,2,'Successfully loremized','Loremisé avec succès',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(448,2,'This file is writable','Ce fichier est accessible en écriture',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(449,2,'Loading','Chargement',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(450,2,'Image','Image',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(451,2,'Results','Résultats',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(452,2,'Desc','Desc',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(453,2,'Publication','Publication',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(454,2,'Layout','Layout',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(455,2,'Parent','Parent',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(456,2,'Slug','Slug',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(457,2,'Controllers','Controleurs',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(458,2,'Templates','Templates',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(459,2,'Stylesheets','Feuilles de style',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(460,2,'Presentation','Présentation',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(461,2,'Send','Envoyer',NULL,'2010-05-03 15:55:15','2010-05-03 15:55:15'),(462,2,'No module to manage.','Aucun module à gérer.',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(463,2,'Variables you can use here:','Variables utilisables ici:',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(464,2,'1. Edit meta generation rules','1. Modifier les règles de génération des metas',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(465,2,'Preview modifications without applying changes to the site','Prévisualiser les modifications sans appliquer les changements au site',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(466,2,'Save modifications and apply changes to the site','Enregistrer les modifications et appliquer les changements au site',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(467,2,'2. Preview generated metas','Prévisualiser les métas générés',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(468,2,'The page url, without domain name. Must be unique. If the slug does not start with a \'/\', the parent slug is added.','Url de la page, sans nom de domaine. Doit être unique. Si le slug ne commence pas par \'/\', le slug de la page supérieure est ajouté.',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(469,2,'The page title, without prefix nor suffix. Should be unique.','Le titre de la page, sans préfixe ni suffixe. Devrait être unique.',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(470,2,'The page name, used by links to this page. Should be unique.','Le nom de la page, utilisé par les liens vers cette page. Devrait être unique.',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(471,2,'Assign first header here or let it blank to let the designer choose it. Should be unique.','Définissez le premier titre ici, ou laissez vide pour laisser l\'intégrateur le choisir. Devrait être unique.',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(472,2,'The page description meta, frequently displayed in search engines result page.','Le méta description de la page, fréquemment affiché par les moteurs de recherche sur la page de résultats',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(473,2,'Provides additional meta informations to the page. Also used by Diem internal search engine.','Fournit des méta-informations supplémentaires à la page. Aussi utilisé par le moteur de recherche interne de Diem.',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(474,2,'Requests per minute','Requêtes par minute',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(475,2,'Errors per minute','Erreurs par minute',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(476,2,'Latency in ms','Latence en ms',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(477,2,'Memory used in %','Mémoire utilisée en %',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(478,2,'Pages per month','Pages par mois',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(479,2,'Visitors per month','Visiteurs par mois',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(480,2,'Visitors','Visiteurs',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(481,2,'Bounce rate','Taux de rebond',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(482,2,'No results for \"%1%\"','Aucun résultat pour \"%1%\"',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(483,2,'Results %1% to %2% of %3%','Résultats %1% à %2% sur %3%',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(484,2,'Items','Eléments',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(485,2,'Save this %1% to access to the gallery','Enregistrez ce(tte) %1% pour accéder à la galerie',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(486,2,'UL CSS class','Classe CSS du UL',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(487,2,'LI CSS class','Classe CSS du LI',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(488,2,'Ascendant','Ascendant',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(489,2,'Descendant','Descendant',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(490,2,'Version','Version',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(491,2,'The widget can not be rendered because its type does not exist anymore.','Ce widget ne peut être affiché car son type n\'existe plus.',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(492,2,'Link to this page:','Lien vers cette page:',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(493,2,'Sentence','Phrase',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(494,2,'The item was created successfully.','L\'élément a été créé avec succès.',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(495,2,'The item was created successfully. You can add another one below.','L\'élément a été créé avec succès. Vous pouvez en ajouter une nouveau ci-dessous.',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(496,2,'Heading 2','Titre 2',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(497,2,'Heading 3','Titre 3',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(498,2,'Heading 4','Titre 4',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(499,2,'Heading 5','Titre 5',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(500,2,'Bold','Gras',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(501,2,'Italic','Italique',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(502,2,'Bulleted List','Liste à puces',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(503,2,'Numeric List','Liste numérotée',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(504,2,'Enlarge the editor','Agrandir l\'éditeur',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(505,2,'Permission','Authorisation',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(506,2,'Nb sent mails','Nb mails envoyés',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(507,2,'Advanced search','Recherche avancée',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(508,2,'Today','Aujourd\'hui',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(509,2,'Past %number% days','%number% derniers jours',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(510,2,'This month','Ce mois',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(511,2,'This year','Cette année',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(512,2,'Pages per week','Pages par semaine',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(513,2,'Visitors per week','Visiteurs par semaine',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(514,2,'Show extended options','Montrer plus d\'options',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(515,2,'Hide extended options','Montrer moins d\'options',NULL,'2010-05-03 15:55:16','2010-05-03 15:55:16'),(516,2,'Sorry, it looks like you\'re using a browser that isn\'t supported.','Désolé, il semblerait que vous utilisiez un navigateur qui n\'est pas supporté.',NULL,'2010-05-03 15:55:17','2010-05-03 15:55:17'),(517,2,'We suggest that you use one of these browsers:','Nous vous suggérons d\'utiliser un de ces navigateurs :',NULL,'2010-05-03 15:55:17','2010-05-03 15:55:17'),(518,2,'Or continue at your own peril','Ou continuez à vos propres périls',NULL,'2010-05-03 15:55:17','2010-05-03 15:55:17'),(519,2,'Modify my account','Modifier mon compte',NULL,'2010-05-03 15:55:17','2010-05-03 15:55:17'),(520,2,'Register','Créer un compte',NULL,'2010-05-03 15:55:17','2010-05-03 15:55:17'),(521,2,'Change password','Changer de mot de passe',NULL,'2010-05-03 15:55:17','2010-05-03 15:55:17'),(522,2,'You are authenticated as %username%','Vous êtes connecté en tant que %username%',NULL,'2010-05-03 15:55:17','2010-05-03 15:55:17'),(523,2,'Old password','Ancien mot de passe',NULL,'2010-05-03 15:55:17','2010-05-03 15:55:17'),(524,2,'New password','Nouveau mot de passe',NULL,'2010-05-03 15:55:17','2010-05-03 15:55:17'),(525,2,'New password (again)','Nouveau mot de passe ( confirmation )',NULL,'2010-05-03 15:55:17','2010-05-03 15:55:17'),(526,2,'Receive a new password','Recevoir un nouveau mot de passe',NULL,'2010-05-03 15:55:17','2010-05-03 15:55:17'),(527,2,'A link to change your password has been sent to %email%','Un lien pour changer votre mot de passe a été envoyé à %email%',NULL,'2010-05-03 15:55:17','2010-05-03 15:55:17'),(528,2,'Your password has been changed','Votre mot de passe a été modifié',NULL,'2010-05-03 15:55:17','2010-05-03 15:55:17'),(529,2,'Save the new password','Enregistrer le nouveau mot de passe',NULL,'2010-05-03 15:55:17','2010-05-03 15:55:17'),(530,3,'Areas','Zones','','2010-08-25 16:44:57','2010-08-25 16:44:57');
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
INSERT INTO `dm_user` VALUES (1,'admin','admin@zazabe.com','sha1','650336b59b79b446b18ffc4417774c44','d66c5160ae70e3724b3a0c34b9feed0723db176b',1,1,'2010-08-26 01:37:00',NULL,'2010-05-03 15:54:44','2010-05-03 15:54:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_widget`
--

LOCK TABLES `dm_widget` WRITE;
/*!40000 ALTER TABLE `dm_widget` DISABLE KEYS */;
INSERT INTO `dm_widget` VALUES (1,1,'dmWidgetContent','title',NULL,-1,'2010-05-03 15:54:48'),(2,2,'dmUser','signin',NULL,-2,'2010-05-03 15:54:48'),(3,3,'dmWidgetNavigation','menu','main_menu',1,'2010-05-03 22:11:16'),(6,11,'dmWidgetSearch','results',NULL,-3,'2010-05-03 16:32:39'),(9,9,'dmWidgetContent','title','',1,'2010-05-03 16:34:13'),(11,9,'dmWidgetContent','image','',2,'2010-05-03 16:36:47'),(13,9,'dmWidgetContent','text','',3,'2010-05-03 16:37:18'),(14,6,'dmWidgetTwitter','timeline','',2,'2010-05-03 22:18:28'),(15,6,'dmWidgetTwitter','search','',3,'2010-05-03 22:18:28'),(16,6,'dmWidgetContent','title','t_side',1,'2010-05-03 22:18:28'),(17,13,'article','list','',1,'2010-05-03 22:46:50'),(18,14,'article','show','',1,'2010-05-03 23:23:57'),(19,4,'dmWidgetNavigation','menu','',1,'2010-05-08 15:08:56'),(20,10,'dmWidgetContent','title','',1,'2010-05-08 16:03:06'),(21,15,'article','list','',1,'2010-08-25 19:20:08'),(22,16,'main','footer','',1,'2010-08-25 19:54:09');
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
INSERT INTO `dm_widget_translation` VALUES (1,'{\"text\":\"Page not found\",\"tag\":\"h1\"}','fr'),(2,'[]','fr'),(3,'{\"ulClass\":\"\",\"liClass\":\"\",\"menuClass\":\"\",\"items\":[{\"link\":\"page:1\",\"text\":\"Home\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:7\",\"text\":\"Articles\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:4\",\"text\":\"A Propos\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:5\",\"text\":\"Cv\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"}]}','fr'),(6,'[]','fr'),(9,'{\"text\":\"A Propos\",\"tag\":\"h1\",\"href\":\"\"}','fr'),(11,'{\"mediaId\":\"1\",\"legend\":\"\",\"width\":\"200\",\"height\":\"300\",\"method\":\"scale\",\"background\":\"FFFFFF\",\"quality\":null,\"link\":\"\"}','fr'),(13,'{\"title\":\"\",\"text\":\"youou ca marche ! il d\\u00e9chire ce cms\",\"mediaId\":null,\"titleLink\":\"\",\"mediaLink\":\"\",\"titlePosition\":\"outside\",\"width\":\"\",\"height\":\"\",\"legend\":\"\",\"method\":\"center\",\"background\":\"FFFFFF\",\"quality\":null}','fr'),(14,'{\"user\":\"Rue89\",\"nb_tweets\":10,\"life_time\":3600}','fr'),(15,'{\"query\":\"symfony\",\"nb_tweets\":10,\"life_time\":3600}','fr'),(16,'{\"text\":\"Twitter\",\"tag\":\"h2\",\"href\":\"\"}','fr'),(17,'{\"orderField\":\"position\",\"orderType\":\"asc\",\"maxPerPage\":5,\"navBottom\":true,\"navTop\":false}','fr'),(18,'{\"recordId\":null}','fr'),(19,'{\"ulClass\":\"\",\"liClass\":\"\",\"menuClass\":\"\",\"items\":[{\"link\":\"page:13\",\"text\":\"zazabe\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:5\",\"text\":\"cursus\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:7\",\"text\":\"projects\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"},{\"link\":\"page:4\",\"text\":\"about\",\"secure\":0,\"nofollow\":0,\"depth\":\"0\"}]}','fr'),(20,'{\"text\":\"Cursus professionnel\",\"tag\":\"h1\",\"href\":\"\"}','fr'),(21,'{\"orderField\":\"position\",\"orderType\":\"asc\",\"maxPerPage\":5,\"navBottom\":true,\"navTop\":false}','fr'),(22,'[]','fr');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_zone`
--

LOCK TABLES `dm_zone` WRITE;
/*!40000 ALTER TABLE `dm_zone` DISABLE KEYS */;
INSERT INTO `dm_zone` VALUES (1,1,NULL,NULL,-1),(2,2,NULL,NULL,-2),(3,3,NULL,NULL,-3),(4,4,NULL,NULL,-4),(5,5,NULL,NULL,-5),(6,6,NULL,NULL,-6),(7,7,NULL,NULL,-7),(8,8,NULL,NULL,-8),(9,9,NULL,NULL,-9),(10,10,NULL,NULL,-10),(11,11,NULL,NULL,-11),(12,12,NULL,NULL,-12),(13,13,NULL,NULL,-13),(14,14,NULL,NULL,-14),(15,15,NULL,NULL,1),(16,15,NULL,NULL,2);
/*!40000 ALTER TABLE `dm_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_version`
--

DROP TABLE IF EXISTS `migration_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_version` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_version`
--

LOCK TABLES `migration_version` WRITE;
/*!40000 ALTER TABLE `migration_version` DISABLE KEYS */;
INSERT INTO `migration_version` VALUES (2);
/*!40000 ALTER TABLE `migration_version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-08-26 11:19:13
