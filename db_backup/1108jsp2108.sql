-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.7.32-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- javacourse 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `javacourse` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `javacourse`;

-- 테이블 javacourse.guest 구조 내보내기
CREATE TABLE IF NOT EXISTS `guest` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `email` varchar(60) DEFAULT '',
  `homepage` varchar(60) DEFAULT ' ',
  `vDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `hostIp` varchar(50) DEFAULT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- 테이블 데이터 javacourse.guest:~5 rows (대략적) 내보내기
DELETE FROM `guest`;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` (`idx`, `name`, `email`, `homepage`, `vDate`, `hostIp`, `content`) VALUES
	(1, '관리자', 'ddd@naver.com', 'blog.daun.net/ddd', '2021-11-08 14:55:21', '218.236.203.153', '방명록 서비스를 시작합니다.'),
	(2, '홍길동', 'hkd1234@hanmail.net', NULL, '2021-11-08 14:56:09', '192.168.0.9', '잠시 방문해 봅니다.'),
	(3, '홍길동', 'hkd1234@naver.com', 'http://blog.daum.net', '2021-11-08 17:30:35', '0:0:0:0:0:0:0:1', '안녕하세요 \r\n\r\n홍길동 입니다.\r\n\r\n\r\n제발 되라 !@#$#@$%'),
	(4, '김말숙', 'hkd1234@naver.com', 'http://blog.daum.net', '2021-11-08 17:37:49', '218.236.203.156', '아이피 변경함'),
	(5, '관리자', 'admin@naver.com', 'admin.blog', '2021-11-08 17:43:11', '218.236.203.156', '엔 \r\n터\r\n처\r\n리 \r\n함 @#$');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
