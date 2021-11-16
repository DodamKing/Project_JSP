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
CREATE DATABASE IF NOT EXISTS `javacourse` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `javacourse`;

-- 테이블 javacourse.guest 구조 내보내기
CREATE TABLE IF NOT EXISTS `guest` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `homepage` varchar(60) DEFAULT ' ',
  `vDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `hostIp` varchar(50) DEFAULT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- 테이블 데이터 javacourse.guest:~32 rows (대략적) 내보내기
DELETE FROM `guest`;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` (`idx`, `name`, `email`, `homepage`, `vDate`, `hostIp`, `content`) VALUES
	(1, '관리자', 'ddd@naver.com', 'blog.daun.net/ddd', '2021-11-08 14:55:21', '218.236.203.153', '방명록 서비스를 시작합니다.'),
	(2, '홍길동', 'hkd1234@hanmail.net', NULL, '2021-11-08 14:56:09', '192.168.0.9', '잠시 방문해 봅니다.'),
	(3, '홍길동', 'hkd1234@naver.com', 'http://blog.daum.net', '2021-11-08 17:30:35', '0:0:0:0:0:0:0:1', '안녕하세요 \r\n\r\n홍길동 입니다.\r\n\r\n\r\n제발 되라 !@#$#@$%'),
	(4, '김말숙', 'hkd1234@naver.com', 'http://blog.daum.net', '2021-11-08 17:37:49', '218.236.203.156', '아이피 변경함'),
	(5, '관리자', 'admin@naver.com', 'admin.blog', '2021-11-08 17:43:11', '218.236.203.156', '엔 \r\n터\r\n처\r\n리 \r\n함 @#$'),
	(7, 'ㄷㄷ', 'http://asjkdfl@naver.com', 'http://blog.daum.net', '2021-11-09 11:13:45', '0:0:0:0:0:0:0:1', 'dsgafdh'),
	(8, 'ㄴㅇㄹㄴ', 'http://', 'asdfsd', '2021-11-09 11:27:48', '0:0:0:0:0:0:0:1', 'asdgsf'),
	(9, 'asdf', 'http://', 'asdfasd', '2021-11-09 11:28:26', '0:0:0:0:0:0:0:1', 'asdfsad'),
	(11, 'ㄷㄷ', 'http://', 'http://218.236.203.156:9090/jsp2108', '2021-11-09 11:30:06', '218.236.203.156', 'sds'),
	(12, '박흥순', 'qgt0310@naver.com', 'http://cjhs.kro.kr:9090/jsp2108', '2021-11-09 11:30:31', '218.236.203.165', '쌀쌀한 날씨 좋은하루 되세요. 발도장 찍습니다.'),
	(15, 'sadf', 'http://', 'sadf', '2021-11-09 12:47:43', '127.0.0.1', 'asdf'),
	(16, 'sadf', 'http://', 'sdfgsd', '2021-11-09 12:51:20', '218.236.203.156', 'asdfsa'),
	(17, 'asdgsafda', 'http://', 'fdgdsgasdfsd', '2021-11-09 12:51:33', '218.236.203.156', 'dsagdsafsdafsadf\r\ndasfasdf\r\nsdfasdㄴㅇ러ㅏㅣㄴㅇ럼ㄴㅇ\r\nㄹ'),
	(18, 'ㄴㅁㅇㄹ', 'http://', 'ddasfsdaf', '2021-11-09 12:53:43', '218.236.203.156', 'ㄴㅁㅇㄻㄴㅇ'),
	(19, 'asdfsad', 'http://', 'sdfsad', '2021-11-09 12:53:52', '218.236.203.156', 'asdfasdf'),
	(20, 'asdfasd', 'http://', 'asdfasd', '2021-11-09 12:53:59', '218.236.203.156', 'asdfasdf'),
	(21, 'sadfas', 'http://', 'asdfassadf', '2021-11-09 12:54:05', '218.236.203.156', 'asgfadsgasd'),
	(22, 'dsfg', 'http://', 'dsfgsdf', '2021-11-09 12:54:10', '218.236.203.156', 'dsfgdfg'),
	(23, 'dfsgsdfgdsfg', 'http://', 'dfgdsfgdfg', '2021-11-09 12:54:16', '218.236.203.156', 'dsfgsdfgdfsgfdsgfds'),
	(24, '324532', '324523', '234523', '2021-11-09 13:09:23', NULL, '32453245'),
	(25, '324321', '4325324', '234523', '2021-11-09 13:10:57', NULL, '3245342'),
	(26, 'sdf', 'dsfg', 'dsfg', '2021-11-09 13:11:07', NULL, 'dfhfdghfgdhfdg'),
	(27, '456yutry', 'hjhgfh', 'hfdhdfgh', '2021-11-09 13:11:15', NULL, 'fdgjdfhsgfd'),
	(28, 'sdfasdf', 'sdfgfsd', 'sdfgsfd', '2021-11-09 14:15:46', '218.236.203.156', 'sadfasdf'),
	(29, 'dfgsd', 'sdfgdsfg', 'sdfgdsf', '2021-11-09 15:33:24', '218.236.203.156', 'sdfgsdfg'),
	(30, 'sdghdfg', 'dsghgd', 'sdfhfdg', '2021-11-09 15:33:34', '218.236.203.156', 'dsfhdfg'),
	(31, 'dsfgfdh', '', '', '2021-11-09 15:33:41', '218.236.203.156', 'dsgfdsh'),
	(32, 'dfgdfgsdf', '', '', '2021-11-09 15:33:46', '218.236.203.156', 'dshfdgdfg'),
	(33, 'jfkjffghkghj', '', '', '2021-11-09 15:33:55', '218.236.203.156', 'gfhkgfhjfghj'),
	(34, 'qwerwerwqe', '', '', '2021-11-09 15:34:00', '218.236.203.156', 'qwreewrwqet'),
	(35, 'rewteryttr', '', '', '2021-11-09 15:34:21', '218.236.203.156', 'rtehtrhreth'),
	(36, 'super', 'admin@naver.com', 'http://218.236.203.156:9090/jsp2108/', '2021-11-09 15:36:08', '218.236.203.156', 'gogogo');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
