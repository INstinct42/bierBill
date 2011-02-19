DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bills` (
  `id` mediumint(8) NOT NULL,
  `date` int(30) NOT NULL,
  `payer_id` mediumint(8) NOT NULL,
  `desc` text NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bills_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bills_users` (
  `id` int(16) NOT NULL,
  `bill_id` mediumint(8) NOT NULL,
  `user_id` mediumint(8) NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0'
);
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `confirm_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confirm_hashes` (
  `hash` varchar(40) NOT NULL,
  `for_user_id` mediumint(8) NOT NULL,
  `type` set('payment','bill','new','change') NOT NULL,
  `type_id` int(16) NOT NULL
);
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` mediumint(8) NOT NULL,
  `date` int(30) NOT NULL,
  `payer_id` mediumint(8) NOT NULL,
  `payee_id` mediumint(8) NOT NULL,
  `amount` float NOT NULL,
  `desc` text NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `user_id` mediumint(8) NOT NULL,
  `real_name` varchar(255) NOT NULL,
  `bank_account` text NOT NULL,
  `accept_per_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` mediumint(8) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `users` (`id`, `name`, `mail`, `password`) VALUES (1,'Moritz','mail@sweil.de','test');
