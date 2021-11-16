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

-- 테이블 javacourse.bbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `bbs` (
  `bbsID` int(11) NOT NULL,
  `bbsTitle` varchar(50) DEFAULT NULL,
  `userID` varchar(20) DEFAULT NULL,
  `bbsDate` datetime DEFAULT NULL,
  `bbsContent` varchar(2048) CHARACTER SET utf8 DEFAULT NULL,
  `bbsAvailable` int(11) DEFAULT NULL,
  PRIMARY KEY (`bbsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 javacourse.bbs:~129 rows (대략적) 내보내기
DELETE FROM `bbs`;
/*!40000 ALTER TABLE `bbs` DISABLE KEYS */;
INSERT INTO `bbs` (`bbsID`, `bbsTitle`, `userID`, `bbsDate`, `bbsContent`, `bbsAvailable`) VALUES
	(1, '안녕하세요', 'hkd1234', '2021-09-21 22:40:16', '홍길동 입니다.', 1),
	(2, '안녕하세용~', 'kms1234', '2021-09-21 22:42:15', '김말숙 이에요~', 1),
	(3, '이순신 인사드립니다.', 'lss1234', '2021-09-22 00:32:49', '안녕하십니까!!', 1),
	(4, '안녕하세요', 'hkd1234', '2021-09-22 02:04:11', '홍길동 이름으로 글쓰는 중...', 1),
	(5, 'ㅇㅇ', 'hkd1234', '2021-09-22 03:31:01', 'ddddddd', 0),
	(6, '안녕하세요 이기잡니다', 'ljk1234', '2021-09-22 12:08:06', '오늘 처음 가입 했어요', 1),
	(7, '홍길동입니다.', 'hkd1234', '2021-09-22 13:57:33', 'JSP를 이용해서 웹 페이지를 만들어 보고 있습니다.', 1),
	(8, '김태연이에요', 'kty1234', '2021-09-22 17:49:50', '특수문자도 잘 들어 가요\r\n$%$^4\r\n<<\r\n>>\r\n\r\n122%$^":":":"\r\n\r\n즐거운 추석 보내세요>>', 1),
	(9, '제목에도 ^&^*<<>> 잘 들어가죠', 'sja1234', '2021-09-22 17:51:09', '악성 스크립트를 방지 할 수 있어요', 1),
	(10, NULL, NULL, NULL, NULL, 0),
	(11, '김자바 인사드려요', 'kjv1234', '2021-09-22 18:15:19', '자바를 잘하고 싶은 김자바입니다.', 1),
	(12, NULL, NULL, NULL, NULL, 0),
	(13, '강감찬입니다', 'kkc1234', '2021-09-22 21:28:21', '글 쓰기 수정 합니다.\r\n\r\n특수 문자도 잘 들억 가구요\r\n\r\n^&^*;;\r\n\r\n삭제 ㄱㄱ', 0),
	(14, '강감찬이요', 'kkc1234', '2021-09-22 21:53:19', '마지막 시험 테스트 중임니돠\r\n\r\n^^\r\n<><>\r\n\r\n잘 되는 듯 하네요>\r\n\r\n메시지 확인', 1),
	(15, '가입 인사 드려요', 'jyp1234', '2021-09-22 23:07:01', '안녕하세요 \r\n\r\n이번엔 게시글을 수정해 볼꺼에요\r\n\r\n^^\r\n\r\n%^^*\r\n\r\n제와피\r\n>\r\n\r\n내용 잘 들어와 있어요', 0),
	(16, '테스트1', 'admin', '2021-09-23 14:34:45', '게시글 내용1\n\n내용내용내용1', 1),
	(17, '테스트2', 'admin', '2021-09-23 14:34:45', '게시글 내용2\n\n내용내용내용2', 1),
	(18, '테스트3', 'admin', '2021-09-23 14:34:45', '게시글 내용3\n\n내용내용내용3', 1),
	(19, '테스트4', 'admin', '2021-09-23 14:34:45', '게시글 내용4\n\n내용내용내용4', 1),
	(20, '테스트5', 'admin', '2021-09-23 14:34:45', '게시글 내용5\n\n내용내용내용5', 1),
	(21, '테스트6', 'admin', '2021-09-23 14:34:45', '게시글 내용6\n\n내용내용내용6', 1),
	(22, '테스트7', 'admin', '2021-09-23 14:34:45', '게시글 내용7\n\n내용내용내용7', 1),
	(23, '테스트8', 'admin', '2021-09-23 14:34:45', '게시글 내용8\n\n내용내용내용8', 1),
	(24, '테스트9', 'admin', '2021-09-23 14:34:45', '게시글 내용9\n\n내용내용내용9', 1),
	(25, '테스트10', 'admin', '2021-09-23 14:34:45', '게시글 내용10\n\n내용내용내용10', 1),
	(26, '테스트11', 'admin', '2021-09-23 14:34:45', '게시글 내용11\n\n내용내용내용11', 1),
	(27, '테스트12', 'admin', '2021-09-23 14:34:45', '게시글 내용12\n\n내용내용내용12', 1),
	(28, '테스트13', 'admin', '2021-09-23 14:34:45', '게시글 내용13\n\n내용내용내용13', 1),
	(29, '테스트14', 'admin', '2021-09-23 14:34:45', '게시글 내용14\n\n내용내용내용14', 1),
	(30, '테스트15', 'admin', '2021-09-23 14:34:45', '게시글 내용15\n\n내용내용내용15', 1),
	(31, '테스트16', 'admin', '2021-09-23 14:34:45', '게시글 내용16\n\n내용내용내용16', 1),
	(32, '테스트17', 'admin', '2021-09-23 14:34:45', '게시글 내용17\n\n내용내용내용17', 1),
	(33, '테스트18', 'admin', '2021-09-23 14:34:45', '게시글 내용18\n\n내용내용내용18', 1),
	(34, '테스트19', 'admin', '2021-09-23 14:34:45', '게시글 내용19\n\n내용내용내용19', 1),
	(35, '테스트20', 'admin', '2021-09-23 14:34:45', '게시글 내용20\n\n내용내용내용20', 1),
	(36, '테스트21', 'admin', '2021-09-23 14:34:45', '게시글 내용21\n\n내용내용내용21', 1),
	(37, '테스트22', 'admin', '2021-09-23 14:34:45', '게시글 내용22\n\n내용내용내용22', 1),
	(38, '테스트23', 'admin', '2021-09-23 14:34:45', '게시글 내용23\n\n내용내용내용23', 1),
	(39, '테스트24', 'admin', '2021-09-23 14:34:45', '게시글 내용24\n\n내용내용내용24', 1),
	(40, '테스트25', 'admin', '2021-09-23 14:34:45', '게시글 내용25\n\n내용내용내용25', 1),
	(41, '테스트26', 'admin', '2021-09-23 14:34:45', '게시글 내용26\n\n내용내용내용26', 1),
	(42, '테스트27', 'admin', '2021-09-23 14:34:45', '게시글 내용27\n\n내용내용내용27', 1),
	(43, '테스트28', 'admin', '2021-09-23 14:34:45', '게시글 내용28\n\n내용내용내용28', 1),
	(44, '테스트29', 'admin', '2021-09-23 14:34:45', '게시글 내용29\n\n내용내용내용29', 1),
	(45, '테스트30', 'admin', '2021-09-23 14:34:45', '게시글 내용30\n\n내용내용내용30', 1),
	(46, '테스트31', 'admin', '2021-09-23 14:34:45', '게시글 내용31\n\n내용내용내용31', 1),
	(47, '테스트32', 'admin', '2021-09-23 14:34:45', '게시글 내용32\n\n내용내용내용32', 1),
	(48, '테스트33', 'admin', '2021-09-23 14:34:45', '게시글 내용33\n\n내용내용내용33', 1),
	(49, '테스트34', 'admin', '2021-09-23 14:34:45', '게시글 내용34\n\n내용내용내용34', 1),
	(50, '테스트35', 'admin', '2021-09-23 14:34:45', '게시글 내용35\n\n내용내용내용35', 1),
	(51, '테스트36', 'admin', '2021-09-23 14:34:45', '게시글 내용36\n\n내용내용내용36', 1),
	(52, '테스트37', 'admin', '2021-09-23 14:34:45', '게시글 내용37\n\n내용내용내용37', 1),
	(53, '테스트38', 'admin', '2021-09-23 14:34:45', '게시글 내용38\n\n내용내용내용38', 1),
	(54, '테스트39', 'admin', '2021-09-23 14:34:45', '게시글 내용39\n\n내용내용내용39', 1),
	(55, '테스트40', 'admin', '2021-09-23 14:34:45', '게시글 내용40\n\n내용내용내용40', 1),
	(56, '테스트41', 'admin', '2021-09-23 14:34:45', '게시글 내용41\n\n내용내용내용41', 1),
	(57, '테스트42', 'admin', '2021-09-23 14:34:45', '게시글 내용42\n\n내용내용내용42', 1),
	(58, '테스트43', 'admin', '2021-09-23 14:34:45', '게시글 내용43\n\n내용내용내용43', 1),
	(59, '테스트44', 'admin', '2021-09-23 14:34:45', '게시글 내용44\n\n내용내용내용44', 1),
	(60, '테스트45', 'admin', '2021-09-23 14:34:45', '게시글 내용45\n\n내용내용내용45', 1),
	(61, '테스트46', 'admin', '2021-09-23 14:34:45', '게시글 내용46\n\n내용내용내용46', 1),
	(62, '테스트47', 'admin', '2021-09-23 14:34:45', '게시글 내용47\n\n내용내용내용47', 1),
	(63, '테스트48', 'admin', '2021-09-23 14:34:45', '게시글 내용48\n\n내용내용내용48', 1),
	(64, '테스트49', 'admin', '2021-09-23 14:34:45', '게시글 내용49\n\n내용내용내용49', 1),
	(65, '테스트50', 'admin', '2021-09-23 14:34:45', '게시글 내용50\n\n내용내용내용50', 1),
	(66, '테스트51', 'admin', '2021-09-23 14:34:45', '게시글 내용51\n\n내용내용내용51', 1),
	(67, '테스트52', 'admin', '2021-09-23 14:34:45', '게시글 내용52\n\n내용내용내용52', 1),
	(68, '테스트53', 'admin', '2021-09-23 14:34:45', '게시글 내용53\n\n내용내용내용53', 1),
	(69, '테스트54', 'admin', '2021-09-23 14:34:45', '게시글 내용54\n\n내용내용내용54', 1),
	(70, '테스트55', 'admin', '2021-09-23 14:34:45', '게시글 내용55\n\n내용내용내용55', 1),
	(71, '테스트56', 'admin', '2021-09-23 14:34:45', '게시글 내용56\n\n내용내용내용56', 1),
	(72, '테스트57', 'admin', '2021-09-23 14:34:45', '게시글 내용57\n\n내용내용내용57', 1),
	(73, '테스트58', 'admin', '2021-09-23 14:34:45', '게시글 내용58\n\n내용내용내용58', 1),
	(74, '테스트59', 'admin', '2021-09-23 14:34:45', '게시글 내용59\n\n내용내용내용59', 1),
	(75, '테스트60', 'admin', '2021-09-23 14:34:45', '게시글 내용60\n\n내용내용내용60', 1),
	(76, '테스트61', 'admin', '2021-09-23 14:34:45', '게시글 내용61\n\n내용내용내용61', 1),
	(77, '테스트62', 'admin', '2021-09-23 14:34:45', '게시글 내용62\n\n내용내용내용62', 1),
	(78, '테스트63', 'admin', '2021-09-23 14:34:45', '게시글 내용63\n\n내용내용내용63', 1),
	(79, '테스트64', 'admin', '2021-09-23 14:34:45', '게시글 내용64\n\n내용내용내용64', 1),
	(80, '테스트65', 'admin', '2021-09-23 14:34:45', '게시글 내용65\n\n내용내용내용65', 1),
	(81, '테스트66', 'admin', '2021-09-23 14:34:45', '게시글 내용66\n\n내용내용내용66', 1),
	(82, '테스트67', 'admin', '2021-09-23 14:34:45', '게시글 내용67\n\n내용내용내용67', 1),
	(83, '테스트68', 'admin', '2021-09-23 14:34:45', '게시글 내용68\n\n내용내용내용68', 1),
	(84, '테스트69', 'admin', '2021-09-23 14:34:45', '게시글 내용69\n\n내용내용내용69', 1),
	(85, '테스트70', 'admin', '2021-09-23 14:34:45', '게시글 내용70\n\n내용내용내용70', 1),
	(86, '테스트71', 'admin', '2021-09-23 14:34:45', '게시글 내용71\n\n내용내용내용71', 1),
	(87, '테스트72', 'admin', '2021-09-23 14:34:45', '게시글 내용72\n\n내용내용내용72', 1),
	(88, '테스트73', 'admin', '2021-09-23 14:34:45', '게시글 내용73\n\n내용내용내용73', 1),
	(89, '테스트74', 'admin', '2021-09-23 14:34:45', '게시글 내용74\n\n내용내용내용74', 1),
	(90, '테스트75', 'admin', '2021-09-23 14:34:45', '게시글 내용75\n\n내용내용내용75', 1),
	(91, '테스트76', 'admin', '2021-09-23 14:34:45', '게시글 내용76\n\n내용내용내용76', 1),
	(92, '테스트77', 'admin', '2021-09-23 14:34:45', '게시글 내용77\n\n내용내용내용77', 1),
	(93, '테스트78', 'admin', '2021-09-23 14:34:45', '게시글 내용78\n\n내용내용내용78', 1),
	(94, '테스트79', 'admin', '2021-09-23 14:34:45', '게시글 내용79\n\n내용내용내용79', 1),
	(95, '테스트80', 'admin', '2021-09-23 14:34:45', '게시글 내용80\n\n내용내용내용80', 1),
	(96, '테스트81', 'admin', '2021-09-23 14:34:45', '게시글 내용81\n\n내용내용내용81', 1),
	(97, '테스트82', 'admin', '2021-09-23 14:34:45', '게시글 내용82\n\n내용내용내용82', 1),
	(98, '테스트83', 'admin', '2021-09-23 14:34:45', '게시글 내용83\n\n내용내용내용83', 1),
	(99, '테스트84', 'admin', '2021-09-23 14:34:45', '게시글 내용84\n\n내용내용내용84', 1),
	(100, '테스트85', 'admin', '2021-09-23 14:34:45', '게시글 내용85\n\n내용내용내용85', 1),
	(101, '테스트86', 'admin', '2021-09-23 14:34:45', '게시글 내용86\n\n내용내용내용86', 1),
	(102, '테스트87', 'admin', '2021-09-23 14:34:45', '게시글 내용87\n\n내용내용내용87', 1),
	(103, '테스트88', 'admin', '2021-09-23 14:34:45', '게시글 내용88\n\n내용내용내용88', 1),
	(104, '테스트89', 'admin', '2021-09-23 14:34:45', '게시글 내용89\n\n내용내용내용89', 1),
	(105, '테스트90', 'admin', '2021-09-23 14:34:45', '게시글 내용90\n\n내용내용내용90', 1),
	(106, '테스트91', 'admin', '2021-09-23 14:34:45', '게시글 내용91\n\n내용내용내용91', 0),
	(107, '테스트92', 'admin', '2021-09-23 14:34:45', '게시글 내용92\n\n내용내용내용92', 1),
	(108, '테스트93', 'admin', '2021-09-23 14:34:45', '게시글 내용93\n\n내용내용내용93', 0),
	(109, '테스트94', 'admin', '2021-09-23 14:34:45', '게시글 내용94\n\n내용내용내용94', 1),
	(110, '테스트95', 'admin', '2021-09-23 14:34:45', '게시글 내용95\n\n내용내용내용95', 1),
	(111, '테스트96', 'admin', '2021-09-23 14:34:45', '게시글 내용96\n\n내용내용내용96', 0),
	(112, '테스트97', 'admin', '2021-09-23 14:34:45', '게시글 내용97\n\n내용내용내용97', 0),
	(113, '테스트98', 'admin', '2021-09-23 14:34:45', '게시글 내용98\n\n내용내용내용98', 1),
	(114, '테스트99', 'admin', '2021-09-23 14:34:45', '게시글 내용99\n\n내용내용내용99', 0),
	(115, '테스트100', 'admin', '2021-09-23 14:34:45', '게시글 내용100\n\n내용내용내용100', 1),
	(116, '내글보기 확인용', 'tktk1212', '2021-09-23 21:26:54', '내글에도 잘 나와라 얍!!\r\n\r\n1!!\r\n\r\n$%^$%^~~~\r\n\r\n추석 끝났다 ㅠㅠ', 1),
	(117, '기능추가', 'iu1234', '2021-09-23 23:13:46', '내글보기 추가\r\n\r\n작성자별 글 보기 추가', 1),
	(118, 'Hello World!!', 'jyp1234', '2021-09-24 16:58:48', 'jyp', 1),
	(119, 'Hello World!!', 'jyp1234', '2021-09-24 16:59:02', 'jyp2', 1),
	(120, 'Hello World!!', 'jyp1234', '2021-09-24 16:59:12', 'jyp3', 1),
	(121, 'Hello World!!', 'jyp1234', '2021-09-24 16:59:22', 'jyp4', 1),
	(122, 'Hello World!!', 'jyp1234', '2021-09-24 16:59:46', 'jyp hoem\r\n', 1),
	(123, 'Hello World!!', 'jyp1234', '2021-09-24 17:00:03', 'test', 1),
	(124, 'Hello World!!', 'jyp1234', '2021-09-24 17:00:15', 'test2', 1),
	(125, 'Hello World!!', 'jyp1234', '2021-09-24 17:00:22', 'test3', 1),
	(126, 'Hello World!!', 'jyp1234', '2021-09-24 17:00:40', 'testteset', 1),
	(127, 'Hello World!!', 'jyp1234', '2021-09-24 17:00:59', 'engengeneg\r\n\r\n한글 검색 안되여', 1),
	(128, 'Hello World!!', 'jyp1234', '2021-09-24 17:01:18', 'test\r\neng \r\nkor\r\n 한글\r\n\r\n검색\r\n앙대', 1),
	(129, 'hello 여러분', 'hkd1234', '2021-09-24 23:14:08', '검색 시 오류가 계속 나서\r\n\r\n이것 저것 찾아보다가 하루가 다 지났어\r\n\r\n처음에는 한글이 문제 인줄 모르고 하다가\r\n\r\n보니까 한글이 문제였던 거지\r\n\r\n영어로 하니까 잘 되더라고  \r\n\r\n그래서 한글 오류를 잡으려고 열심히 공부 하다 보니\r\n\r\nget 방식과 post 방식에 대해 알게 되었지\r\n\r\n그런데 post 방식으로는 잘 해결을 해서 검색 기능을 구현 할 수 있었지\r\n\r\n그런데 get 방식으로 주소에 보이게 넘어가는 것은 해결이 안되고 계속 한글이 깨지더라고\r\n\r\n그래서 인코딩 디코딩 다 해 봤는데 안되고\r\n\r\n서버 설정을 건드리기 시작했지 하면 안 될 꺼였나봐\r\n\r\n그러더니 아예 서버가 안 열려서 결국 다 갈아 엎고 다 새로 깔았지^^\r\n\r\n그래서 서버 살리고 코드 백없해뒀던거 살려서 영어 검색 잘 되나 보려고 시도 하다가\r\n\r\n구글에서 주소 치고 들어 가서 해봤더니 되네!!\r\n\r\n이클립스에서 설정이 잘못 되었나 크롬에선 잘 되더라고 이렇게 개발은 못하고 하루종일 오류 잡다 끝남', 1),
	(130, '방가방가 hello 하이하이', 'kty1234', '2021-09-24 23:15:34', '검색 가능 하지롱', 1),
	(131, '검색 가능', 'kms1234', '2021-09-24 23:16:34', '처음엔 한글 문제 인줄 알았지\r\n\r\n영어는 잘 되더라고\r\n\r\n근데 지금서 보니\r\n\r\n크롬에서는 한글도 검색이 되더라고\r\n\r\n뭐가 문제 였던 걸까', 1);
/*!40000 ALTER TABLE `bbs` ENABLE KEYS */;

-- 테이블 javacourse.books 구조 내보내기
CREATE TABLE IF NOT EXISTS `books` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(20) NOT NULL,
  `publisher` varchar(20) NOT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- 테이블 데이터 javacourse.books:~20 rows (대략적) 내보내기
DELETE FROM `books`;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`bookId`, `bookName`, `publisher`, `price`) VALUES
	(1, '축구의 역사', '굿스포츠', 7000),
	(2, '축구아는 여자', '나무수', 13000),
	(3, '축구의 이해', '대한미디어', 22000),
	(4, '골프 바이블', '대한미디어', 35000),
	(5, '피겨 교본', '굿스포츠', 8000),
	(6, '역도 단계별기술', '굿스포츠', 6000),
	(7, '야구의 추억', '이상미디어', 20000),
	(8, '야구를 부탁해', '이상미디어', 13000),
	(9, '올림픽 이야기', '삼성당', 7500),
	(10, 'Olympic Champions', 'Pearson', 13000),
	(11, '자바의 정석', '도우출판사', 30000),
	(12, '포토샵 CS6', '제우미디어', 25000),
	(13, '노인과 바다', '이상미디어', 13000),
	(14, 'C#', '삼성당', 22000),
	(15, '전산세무2급', '제우미디어', 15000),
	(16, '반응형웹', 'ICOX', 28000),
	(17, '파이썬따라잡기', '이상미디어', 22000),
	(18, '이젠나도자바', '삼성당', 19000),
	(19, '구기종목 정복', '굿스포츠', 9900),
	(20, '컬러리스트길잡이', '나무수', 31000);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;

-- 테이블 javacourse.customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer` (
  `custId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `address` varchar(30) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`custId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 테이블 데이터 javacourse.customer:~6 rows (대략적) 내보내기
DELETE FROM `customer`;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`custId`, `name`, `address`, `phone`) VALUES
	(1, '박지성', '영국 맨체스타', '000-5000-0001'),
	(2, '김연아', '대한민국 서울', '000-6000-0001'),
	(3, '김말숙', '대한민국 강원도', '000-7000-0001'),
	(4, '손흥민', '영국 토트넘', '000-8000-0001'),
	(5, '박세리', '대한민국 대전', NULL),
	(6, '이순신', '대한민국 아산', '');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

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
	(36, 'super', 'admin@naver.com', 'http://218.236.203.156:9090/jsp2108/', '2021-11-09 15:36:08', '218.236.203.156', 'gogogo'),
	(37, '&lt;꺽세&gt;', 'admin@naver.com', 'http://218.236.203.156:9090/jsp2108/', '2021-11-11 09:41:59', '218.236.203.156', 'dkanrjsk'),
	(38, '김말숙', 'http://asjkdfl@naver.com', 'http://blog.daum.net', '2021-11-11 09:42:31', '218.236.203.156', 'fdgsfdhgdfhh'),
	(39, '강아지', '', '', '2021-11-11 09:44:02', NULL, '장난');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;

-- 테이블 javacourse.hashtable 구조 내보내기
CREATE TABLE IF NOT EXISTS `hashtable` (
  `pwdKey` int(11) NOT NULL,
  `pwdValue` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 javacourse.hashtable:~20 rows (대략적) 내보내기
DELETE FROM `hashtable`;
/*!40000 ALTER TABLE `hashtable` DISABLE KEYS */;
INSERT INTO `hashtable` (`pwdKey`, `pwdValue`) VALUES
	(0, '12341234'),
	(1, '23452345'),
	(2, '34563456'),
	(3, '45674567'),
	(4, '56785678'),
	(5, '67896789'),
	(6, '78907890'),
	(7, '12121212'),
	(8, '23232323'),
	(9, '34343434'),
	(10, '45454545'),
	(11, '56565656'),
	(12, '67676767'),
	(13, '78787878'),
	(14, '89898989'),
	(15, '90909090'),
	(16, '21212121'),
	(17, '32323232'),
	(18, '43434343'),
	(19, '54545454');
/*!40000 ALTER TABLE `hashtable` ENABLE KEYS */;

-- 테이블 javacourse.login 구조 내보내기
CREATE TABLE IF NOT EXISTS `login` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `point` int(11) DEFAULT '100',
  `lastDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `Vcount` int(11) DEFAULT '0',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 테이블 데이터 javacourse.login:~6 rows (대략적) 내보내기
DELETE FROM `login`;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`idx`, `mid`, `pwd`, `name`, `point`, `lastDate`, `Vcount`) VALUES
	(1, 'admin', '1234', '관리자', 100, '2021-11-05 12:07:40', 13),
	(2, 'hkd1234', '1234', '홍길동', 100, '2021-11-05 12:07:41', 1),
	(3, 'kms1234', '1234', '김말숙', 100, '2021-11-05 16:44:26', 1),
	(4, 'kms1234', '1234', '김말숙', 100, '2021-11-05 16:50:00', 1),
	(5, '', '', '', 100, '2021-11-05 16:57:40', 0),
	(6, 'kms1234', '1234', '김말숙', 100, '2021-11-05 16:58:07', 1),
	(7, 'kkc1234', '1234', '강감찬', 100, '2021-11-05 17:08:49', 1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;

-- 테이블 javacourse.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `pwdKey` int(11) NOT NULL,
  `nickName` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` varchar(20) DEFAULT '남자',
  `birthday` datetime DEFAULT CURRENT_TIMESTAMP,
  `tel` varchar(15) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `homePage` varchar(50) DEFAULT NULL,
  `job` varchar(20) DEFAULT NULL,
  `hobby` varchar(60) DEFAULT NULL,
  `photo` varchar(100) DEFAULT 'music.png',
  `content` text,
  `userInfor` char(6) DEFAULT '공개',
  `userDel` char(2) DEFAULT 'NO',
  `point` int(11) DEFAULT '100',
  `level` int(11) DEFAULT '1',
  `visitCnt` int(11) DEFAULT '0',
  `startDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `todayCnt` int(11) DEFAULT '0',
  PRIMARY KEY (`idx`,`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 테이블 데이터 javacourse.member:~5 rows (대략적) 내보내기
DELETE FROM `member`;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`idx`, `mid`, `pwd`, `pwdKey`, `nickName`, `name`, `gender`, `birthday`, `tel`, `address`, `email`, `homePage`, `job`, `hobby`, `photo`, `content`, `userInfor`, `userDel`, `point`, `level`, `visitCnt`, `startDate`, `lastDate`, `todayCnt`) VALUES
	(1, 'admin', '117401173', 5, '관리맨', '관리자', '남자', '2021-11-15 14:14:22', '010-4443-5001', '청주', 'power6120@naver.com', 'blog.naver.com/power6120', 'free-job', '등산/바둑', 'music.png', '관리자 더비 데이터', '공개', 'NO', 110, 0, 1, '2021-11-15 14:14:22', '2021-11-15 17:10:55', 0),
	(2, 'hkd1234', '38743154', 0, '홍장군', '홍길동', '여자', '2026-11-18 00:00:00', '010-1111-', '06302/서울 강남구 양재천로 163// (도곡동)', 'hkd1234@naver.com', 'http://blog.naver.com', '학생', '낚시/수영/독서/기타/', 'music.png', '홍길동 더미 데이터 추가', '비공개', 'NO', 140, 1, 4, '2021-11-15 14:15:35', '2021-11-15 17:45:21', 0),
	(3, 'kms1234', '117401173', 5, '말술', '김말숙', '남자', '2021-11-15 00:00:00', '010-2323-4444', '06027/서울 강남구 압구정로 102// (신사동)', 'kms1234@naver.com', 'http://blog.naver.com', '학생', '낚시/수영/독서/기타', 'music.png', '말숙 더미 데이터 삽입', '공개', 'NO', 100, 1, 0, '2021-11-15 14:23:01', '2021-11-15 14:23:01', 0),
	(4, 'kkc1234', '38743154', 0, '강장군', '강감찬', '남자', '2021-11-15 00:00:00', '010-3434-2234', '///', 'kkc1234@naver.com', 'http://blog.naver.com', '세무인', '영화감상/축구/기타', 'music.png', '강감찬 추가 직업 확인', '공개', 'NO', 100, 1, 0, '2021-11-15 14:24:48', '2021-11-15 14:24:48', 0),
	(5, 'lkj1234', '61917273', 16, '이겨라', '이기자', '여자', '2012-07-12 00:00:00', '010-3432-3543', '05408/서울 강동구 양재대로 1299// (성내동)', 'ljk1234@naver.com', 'http://blog.naver.com', '공무원', '낚시/기타', 'music.png', '이기자', '공개', 'NO', 110, 1, 1, '2021-11-15 16:13:05', '2021-11-15 16:16:45', 0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 javacourse.orders 구조 내보내기
CREATE TABLE IF NOT EXISTS `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `custId` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  `salePrice` int(11) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderId`),
  KEY `custId` (`custId`),
  KEY `bookId` (`bookId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`custId`) REFERENCES `customer` (`custId`) ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- 테이블 데이터 javacourse.orders:~20 rows (대략적) 내보내기
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`orderId`, `custId`, `bookId`, `salePrice`, `orderDate`) VALUES
	(1, 1, 1, 6000, '2009-07-01 00:00:00'),
	(2, 1, 3, 21000, '2018-02-03 00:00:00'),
	(3, 2, 5, 8000, '2021-05-03 00:00:00'),
	(4, 3, 6, 6000, '2020-06-04 00:00:00'),
	(5, 4, 7, 20000, '2019-11-05 00:00:00'),
	(6, 1, 2, 12000, '2021-09-07 00:00:00'),
	(7, 4, 8, 13000, '2019-03-07 00:00:00'),
	(8, 3, 10, 12000, '2018-07-08 00:00:00'),
	(9, 2, 10, 9000, '2019-05-09 00:00:00'),
	(10, 3, 11, 27000, '2020-06-15 00:00:00'),
	(11, 2, 13, 11000, '2021-06-18 00:00:00'),
	(12, 3, 15, 13000, '2021-08-20 00:00:00'),
	(13, 6, 18, 19000, '2021-10-10 00:00:00'),
	(14, 6, 16, 27000, '2021-11-20 00:00:00'),
	(15, 3, 20, 30000, '2021-11-20 00:00:00'),
	(16, 4, 16, 26000, '2021-11-25 00:00:00'),
	(17, 4, 8, 13000, '2021-06-10 00:00:00'),
	(18, 6, 8, 12000, '2021-06-10 00:00:00'),
	(19, 2, 15, 13000, '2021-07-12 00:00:00'),
	(20, 2, 17, 22000, '2021-10-15 00:00:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- 테이블 javacourse.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(11) DEFAULT '20',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- 테이블 데이터 javacourse.user:~8 rows (대략적) 내보내기
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`idx`, `name`, `age`) VALUES
	(17, '관리자', 45),
	(18, '홍길동', 25),
	(19, '김말숙', 20),
	(20, '관리맨', 45),
	(21, '홍길자', 25),
	(23, '소나무', 99),
	(24, '꼬북이', 44),
	(25, '꺽세', 22);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
