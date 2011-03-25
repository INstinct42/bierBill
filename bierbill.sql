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
  `id` int(11) NOT NULL,
  `hash` varchar(40) NOT NULL,
  `for_user_id` mediumint(8) NOT NULL,
  `type` set('payment','bill','new','change') NOT NULL,
  `type_id` int(16) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `confirm_hashes` (`id`, `hash`, `for_user_id`, `type`, `type_id`) VALUES (1,'m=g8jBD$a-M?eZlrZ(2L[bB{6Lr}O)TT:6i@S2l',2,'payment',1),(2,'?6qlg6Qa%j:rEvLFu3M3hZvX-Ug=s}wYo(Uz$}=F',2,'payment',2),(3,'}[?c(vj5kNZBq62AY}e7FqZC?,OSmMsku[9k-O@p',2,'payment',3),(4,'Z9)N(0k%[}jOkS0!aYxq3!8CpVUqJ$r$:saAM=',2,'payment',4),(5,'{]tM-QQL=!35D}c.,k0K$uA{QAwY0!,f8wtaJ6q',2,'payment',5),(6,'h5m5]Xe(RkN:)T%wo4uG1T-JpZHSgOOLf@3ZYdy=',2,'payment',6),(7,'Us12an0_Zwei_Qlnid0$RNH%,4AH4LG3vokBsElq',2,'payment',7),(8,'xSG6}GJL\r!Z?9yf50T6z5nlX)y-pcG9sy@Qh@FZ',2,'payment',8),(9,',UT)rzTFl8ngIh3DAoqQQGJ:EPja:Ett-s5]6W,X',2,'payment',9),(10,'!fwRHRz@n75HvV?TwT@$[MSFoMi({,-{9%VBB4i',2,'payment',10),(11,'US4J:tsklxdnfvkuPbyF4xVn@cO}i6Ph$Lw-oUY',2,'payment',11),(12,'Z(@bcoZTH9]KHs.WCx[aS3J7mL}.YY{G[%:{d6Lr',2,'payment',12),(13,'P:{oS[=5t6RcxYxzDsk.Jo-nlpvnF$]H.2,uqbmD',2,'payment',13),(14,'x$dTUjH@yk3]ceubb3ymnVwd8M6A.GtN:Xx.%M:',2,'payment',14),(15,'Rf@}Ry7rFdEBcS$Y37y4N22:mb$Ozeef7IJKOeYu',2,'payment',15),(16,'4jJ90SFJVgiE8R0g{NSX671:gV15VTz?U=GW1?JM',2,'payment',16),(17,').irUxX{9Av6kQB,znxwY!vhBE0[-6EIIFjHhTi',2,'payment',17),(18,'0:d5r=V{e4T-@Y2gQL_VH(JOzp[WN2RapaEG87gN',2,'payment',18),(19,'AptUJCAcOL]V=Y%GQ4pmZ,hb}JvQb]5a:3Y0%[uz',2,'payment',19),(20,'qyQbs=v4j}nn4-e$(X8N,5$(%qQ5w2pXIqw:9qf2',2,'payment',20),(21,'{-ni]heD1roAzk7NVEwgau8{A.4IG_aZXCZ5M8Hf',2,'payment',21),(22,',Y-32C@YSGe)rEpV@lp9?8h]kog0[8!WGwvD2Civ',2,'payment',22),(23,'!XNP=H}PY!z)J!,5R}4)6!i!](da8Sy]R}=cP(_(',2,'payment',23),(24,'hROQ$:xdh!mKt8qK]X2buuduWmYa8-PDQG]oO{vM',2,'payment',24),(25,'Dfmj61S$CBsFIo2R(!bkmnaeDlPbCwqv8Q9O]\\@',2,'payment',25),(26,'tuVzFh[HC8)tC0D}_CS?)Zige)mS_)tXmdHxxx0x',2,'payment',26);
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
INSERT INTO `payments` (`id`, `date`, `payer_id`, `payee_id`, `amount`, `desc`, `confirmed`) VALUES (1,1300968847,1,2,13.33,'test',0),(2,1300970654,1,2,13.33,'Hallo Thomas, bis gleich!',0),(3,1300982018,1,2,13.33,'Hallo Thomas, bis gleich!',0),(4,1300982026,1,2,13.33,'Hallo Thomas, bis gleich!',0),(5,1300982041,1,2,13.33,'Hallo Thomas, bis gleich!',0),(6,1300982158,1,2,13.33,'Hallo Thomas, bis gleich!',0),(7,1300982184,1,2,13.33,'Hallo Thomas, bis gleich!',0),(8,1300982210,1,2,13.33,'Hallo Thomas, bis gleich!',0),(9,1300982219,1,2,13.33,'Hallo Thomas, bis gleich!',0),(10,1300982279,1,2,13.33,'Hallo Thomas, bis gleich!',0),(11,1300982294,1,2,13.33,'Hallo Thomas, bis gleich!',0),(12,1300982392,1,2,13.33,'Hallo Thomas, bis gleich!',0),(13,1300982402,1,2,13.33,'Hallo Thomas, bis gleich!',0),(14,1300982411,1,2,13.33,'Hallo Thomas, bis gleich!',0),(15,1300982778,1,2,13.33,'Hallo Thomas, bis gleich!',0),(16,1300982831,1,2,13.33,'Hallo Thomas, bis gleich!',0),(17,1300982920,1,2,13.33,'Hallo Thomas, bis gleich!',0),(18,1300982941,1,2,13.33,'Hallo Thomas, bis gleich!',0),(19,1300984392,1,2,13.33,'Hallo du!',0),(20,1300984468,1,2,13.33,'Hallo du!',0),(21,1300984560,1,2,13.33,'Hallo du!',0),(22,1300988733,1,2,13.33,'sdfgsdfgsdf',0),(23,1300989150,1,2,13.33,'sdfgsdfgsdf',0),(24,1300999634,1,2,13.33,'Hallo!',0),(25,1300999781,1,2,13.33,'sdfsdf',0),(26,1301000206,1,2,13.33,'sdfsdf',0);
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
INSERT INTO `user_info` (`user_id`, `real_name`, `bank_account`, `accept_per_default`) VALUES (1,'Moritz Kornher','Test',0),(2,'Thomas Pentenrieder','nichts gehts euch an!',0);
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
INSERT INTO `users` (`id`, `name`, `mail`, `password`) VALUES (1,'Moritz','mail@sweil.de','098f6bcd4621d373cade4e832627b4f6'),(2,'Thomas','thomas.pentenrieder@gmail.com','098f6bcd4621d373cade4e832627b4f6');
