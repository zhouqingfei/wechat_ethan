-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.17-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 wechat_ethan 的数据库结构
CREATE DATABASE IF NOT EXISTS `wechat_ethan` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wechat_ethan`;

-- 导出  表 wechat_ethan.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- 正在导出表  wechat_ethan.user 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `age`) VALUES
	(1, '测试', '345', 24),
	(2, 'javen', '123', 10),
	(36, '123', '131', 4143),
	(37, '123', '131', 4143),
	(38, '12', '31', 321),
	(39, '23', '43', 53),
	(40, '12', '31', 42),
	(41, '12', '34', 34),
	(42, '45', '88', 3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- 导出  表 wechat_ethan.youai_appointment 结构
CREATE TABLE IF NOT EXISTS `youai_appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taocan` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `telephone` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `fromDes` varchar(500) DEFAULT NULL,
  `toDes` varchar(500) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- 正在导出表  wechat_ethan.youai_appointment 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `youai_appointment` DISABLE KEYS */;
INSERT INTO `youai_appointment` (`id`, `taocan`, `username`, `telephone`, `date`, `time`, `fromDes`, `toDes`, `note`) VALUES
	(1, '小零碎套餐', '周庆飞', '6666666666', '2018-02-09', '08:00', '北京', '上海', '无'),
	(2, '小零碎套餐', '周庆飞', '6666666666', '2018-02-09', '08:00', '北京', '上海', '无'),
	(3, '小零碎套餐', '周庆飞', '6666666666', '2018-02-09', '08:00', '北京', '上海', '无'),
	(4, '小零碎套餐', '周庆飞', '6666666666', '2018-02-09', '08:00', '北京', '上海', '无'),
	(5, '小零碎套餐', '周庆飞', '6666666666', '2018-02-09', '08:00', '北京', '上海', '无'),
	(6, '小零碎套餐', '周庆飞', '6666666666', '2018-02-09', '08:00', '北京', '上海', '无'),
	(7, '小零碎套餐', '周庆飞', '6666666666', '2018-02-09', '08:00', '北京', '上海', '无'),
	(8, '小零碎套餐', '周庆飞', '6666666666', '2018-02-09', '08:00', '北京', '上海', '无'),
	(9, '小零碎套餐', '周庆飞', '6666666666', '2018-02-09', '08:00', '北京', '上海', '无'),
	(10, '小零碎套餐', '周庆飞', '6666666666', '2018-02-09', '08:00', '北京', '上海', '无'),
	(11, '小零碎套餐', '周庆飞', '6666666666', '2018-02-09', '08:00', '北京', '上海', '无'),
	(12, '小零碎套餐', '周庆飞', '6666666666', '2018-02-09', '08:00', '北京', '上海', '无'),
	(13, '小零碎套餐', '周庆飞', '6666666666', '2018-02-09', '08:00', '北京', '上海', '无'),
	(14, '大家庭套餐', '周庆飞', '88888888', '2018-02-09', '03:00', '北京', '深圳', '无');
/*!40000 ALTER TABLE `youai_appointment` ENABLE KEYS */;

-- 导出  表 wechat_ethan.youai_tree 结构
CREATE TABLE IF NOT EXISTS `youai_tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `checked` int(11) DEFAULT '0',
  `url` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `other` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

-- 正在导出表  wechat_ethan.youai_tree 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `youai_tree` DISABLE KEYS */;
INSERT INTO `youai_tree` (`id`, `parent_id`, `name`, `type`, `checked`, `url`, `icon`, `other`) VALUES
	(1, '0', '菜单', '1', 0, '/appointment.do/getAppointmentList', '1', '0'),
	(2, '1', '订单管理', '1', 0, '/appointment.do/testTable.view', '1', '0'),
	(3, '1', '员工管理', '1', 0, '/appointment.do/userAdmin.view', '1', '0');
/*!40000 ALTER TABLE `youai_tree` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
