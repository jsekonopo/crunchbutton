CREATE TABLE `pexcard_action` (
  `id_pexcard_action` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_admin_pexcard` int(10) unsigned DEFAULT NULL,
  `id_driver` int(10) unsigned DEFAULT NULL,
  `id_admin_shift_assign` int(10) unsigned DEFAULT NULL,
  `id_order` int(10) unsigned DEFAULT NULL,
  `id_admin` int(10) unsigned DEFAULT NULL,
  `date` DATETIME DEFAULT NULL,
  `amount` FLOAT DEFAULT NULL,
  `action` ENUM( 'shift-started', 'shift-finished', 'order-accepted', 'order-cancelled', 'arbritary' ) DEFAULT NULL,
  `type` ENUM( 'credit','debit' ) DEFAULT NULL,
  `note` text,
  `response` text,
  PRIMARY KEY (`id_pexcard_action`),
  KEY `id_order` (`id_order`),
  KEY `id_driver` (`id_driver`),
  KEY `id_admin` (`id_admin`),
  KEY `id_admin_pexcard` (`id_admin_pexcard`),
  CONSTRAINT `pexcard_action_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pexcard_action_ibfk_2` FOREIGN KEY (`id_driver`) REFERENCES `admin` (`id_admin`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pexcard_action_ibfk_3` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pexcard_action_ibfk_4` FOREIGN KEY (`id_admin_pexcard`) REFERENCES `admin_pexcard` (`id_admin_pexcard`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pexcard_action_ibfk_5` FOREIGN KEY (`id_admin_shift_assign`) REFERENCES `admin_shift_assign` (`id_admin_shift_assign`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `config` (`id_site`, `key`, `value`) VALUES (NULL,'pex-amount-shift-start','10.00');
INSERT INTO `config` (`id_site`, `key`, `value`) VALUES (NULL,'pex-card-funds-shift-enable','0');
INSERT INTO `config` (`id_site`, `key`, `value`) VALUES (NULL,'pex-card-funds-order-enable','0');
INSERT INTO `config` (`id_site`, `key`, `value`) VALUES (NULL,'pex-card-funds-order-enable-for-cash','0');