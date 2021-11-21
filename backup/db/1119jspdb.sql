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


-- java02_kdd 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `java02_kdd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `java02_kdd`;

-- 테이블 java02_kdd.hashtable_jsp 구조 내보내기
CREATE TABLE IF NOT EXISTS `hashtable_jsp` (
  `pwdKey` int(11) NOT NULL,
  `pwdValue` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 java02_kdd.hashtable_jsp:~20 rows (대략적) 내보내기
DELETE FROM `hashtable_jsp`;
/*!40000 ALTER TABLE `hashtable_jsp` DISABLE KEYS */;
INSERT INTO `hashtable_jsp` (`pwdKey`, `pwdValue`) VALUES
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
/*!40000 ALTER TABLE `hashtable_jsp` ENABLE KEYS */;

-- 테이블 java02_kdd.song 구조 내보내기
CREATE TABLE IF NOT EXISTS `song` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `img` text NOT NULL,
  `title` varchar(1000) NOT NULL,
  `artist` varchar(1000) NOT NULL,
  `album` varchar(1000) DEFAULT '',
  `release` date DEFAULT NULL COMMENT '발매',
  `genre` varchar(100) DEFAULT '',
  `music` varchar(100) DEFAULT '' COMMENT '작곡',
  `words` varchar(100) DEFAULT '' COMMENT '작사',
  `arranger` varchar(100) DEFAULT '' COMMENT '편곡',
  `lyrics` text COMMENT '가사',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8;

-- 테이블 데이터 java02_kdd.song:~127 rows (대략적) 내보내기
DELETE FROM `song`;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` (`idx`, `img`, `title`, `artist`, `album`, `release`, `genre`, `music`, `words`, `arranger`, `lyrics`) VALUES
	(1, 'https://image.bugsm.co.kr/album/images/50/40672/4067276.jpg?version=20211111180723.0', '어제 너는 나를 버렸어', '10CM', 'The 3rd EP', '2021-11-11', '발라드(국내)', '10CM', '10CM', '10CM, 이요한, 성수용, 방인재, 이윤혁', '어제 너는 나를 버렸어\r\n나는 아무 변명하지 못하고\r\n얌전하게 집에 돌아와\r\n너무 피곤해 잠이 들었어\r\n눈이 떠지자마자 정신이 없지\r\n지각은 말이 안 돼 출근해야지\r\n시간이 모자라 널 생각하고 아파하기엔\r\n내가 너무 바빠\r\n눈물이 맺혔을지도\r\n아닌가 졸린건지도\r\n어쩌면 널 좋아하지 않았었나봐\r\n연락을 기다릴지도\r\n아닌가 귀찮을지도\r\n어쩌면 널 사랑하진 않았었나봐\r\n이제 나는 너를 잊었어\r\n생각해 보니 오늘 하루 종일\r\n네 생각이 나질 않았고\r\n왠지 웃으며 잠이 들었어\r\n이별이 항상 지독할 필요는 없지\r\n우리도 각자 가던 길을 가야지\r\n못다 한 마음도 전하지 못한 말도 많았지만\r\n내가 너무 바빠\r\n눈물이 맺혔을지도\r\n아닌가 졸린건지도\r\n어쩌면 널 좋아하지 않았었나봐\r\n연락을 기다릴지도\r\n아닌가 귀찮을지도\r\n어쩌면 널 사랑하진 않았었나봐\r\n아냐 그랬을 리가 없지\r\n너 없인 살 수 없었던\r\n꿈같은 날들이 있었지\r\n나를 안아주던 숨결도\r\n빛이 나던 그 입술도\r\n시간을 되돌려 갈 수 있다 해도\r\n이젠 너무 바빠\r\n눈물은 말랐을지도\r\n이대로 괜찮을지도\r\n어쩌면 널 기다리지 않을건가봐\r\n마음이 죽은걸지도\r\n차갑게 굳어질지도\r\n어쩌면 널 사랑하지 않을건가봐\r\n이제 나는 너를 잊었어\r\n아쉬울게 하나도 없어'),
	(260, 'https://image.bugsm.co.kr/album/images/50/204320/20432089.jpg?version=20211113120023.0', '회전목마 (Feat. Zion.T, 원슈타인) (Prod. Slom)', 'sokodomo', '', NULL, '', '', '', '', NULL),
	(261, 'https://image.bugsm.co.kr/album/images/50/204321/20432142.jpg?version=20211113003124.0', 'SCIENTIST', 'TWICE (트와이스)', '', NULL, '', '', '', '', NULL),
	(262, 'https://image.bugsm.co.kr/album/images/50/204305/20430595.jpg?version=20211109004233.0', '쉬어 (Feat. MINO) (Prod. GRAY)', 'MINO(송민호)', '', NULL, '', '', '', '', NULL),
	(263, 'https://image.bugsm.co.kr/album/images/50/40662/4066238.jpg?version=20211020063535.0', 'strawberry moon', '아이유(IU)', '', NULL, '', '', '', '', NULL),
	(264, 'https://image.bugsm.co.kr/album/images/50/204305/20430595.jpg?version=20211109004233.0', 'Wake Up (Prod. 코드 쿤스트)', '개코', '', NULL, '', '', '', '', NULL),
	(265, 'https://image.bugsm.co.kr/album/images/50/204320/20432089.jpg?version=20211113120023.0', '가시 (Prod. 코드 쿤스트)', '조광일', '', NULL, '', '', '', '', NULL),
	(266, 'https://image.bugsm.co.kr/album/images/50/201238/20123812.jpg?version=20210421044405.0', '그리워하다', '비투비', '', NULL, '', '', '', '', NULL),
	(267, 'https://image.bugsm.co.kr/album/images/50/40666/4066688.jpg?version=20211030065545.0', '낮 밤 (feat. 박재범)', '이영지', '', NULL, '', '', '', '', NULL),
	(268, 'https://image.bugsm.co.kr/album/images/50/204243/20424398.jpg?version=20211015010640.0', 'Savage', 'aespa', '', NULL, '', '', '', '', NULL),
	(269, 'https://image.bugsm.co.kr/album/images/50/40671/4067172.jpg?version=20211111003803.0', '널 그리워하고 있어', '양다일', '', NULL, '', '', '', '', NULL),
	(270, 'https://image.bugsm.co.kr/album/images/50/203943/20394389.jpg?version=20210502180032.0', '문득', 'BE\'O (비오)', '', NULL, '', '', '', '', NULL),
	(271, 'https://image.bugsm.co.kr/album/images/50/40448/4044879.jpg?version=20210515065000.0', '신호등', '이무진', '', NULL, '', '', '', '', NULL),
	(272, 'https://image.bugsm.co.kr/album/images/50/204305/20430595.jpg?version=20211109004233.0', 'TROUBLE (Prod. Slom)', 'Zion.T', '', NULL, '', '', '', '', NULL),
	(273, 'https://image.bugsm.co.kr/album/images/50/40658/4065831.jpg?version=20211106011825.0', '사랑은 늘 도망가', '임영웅', '', NULL, '', '', '', '', NULL),
	(274, 'https://image.bugsm.co.kr/album/images/50/40665/4066507.jpg?version=20211027003705.0', '나비효과', '볼빨간사춘기', '', NULL, '', '', '', '', NULL),
	(275, 'https://image.bugsm.co.kr/album/images/50/204293/20429395.jpg?version=20211103005536.0', '가까이 있어서 몰랐어', '2am', '', NULL, '', '', '', '', NULL),
	(276, 'https://image.bugsm.co.kr/album/images/50/40672/4067276.jpg?version=20211113004225.0', '가진다는 말은 좀 그렇지?', '10CM', '', NULL, '', '', '', '', NULL),
	(277, 'https://image.bugsm.co.kr/album/images/50/158177/15817728.jpg?version=20210921113538.0', 'STAY', 'The Kid LAROI', '', NULL, '', '', '', '', NULL),
	(278, 'https://image.bugsm.co.kr/album/images/50/40665/4066507.jpg?version=20211027003705.0', '너는 내 세상이었어', '볼빨간사춘기', '', NULL, '', '', '', '', NULL),
	(279, 'https://image.bugsm.co.kr/album/images/50/203973/20397321.jpg?version=20210518110655.0', 'Next Level', 'aespa', '', NULL, '', '', '', '', NULL),
	(280, 'https://image.bugsm.co.kr/album/images/50/40667/4066711.jpg?version=20211103004833.0', 'XOXO', '전소미', '', NULL, '', '', '', '', NULL),
	(281, 'https://image.bugsm.co.kr/album/images/50/161839/16183960.jpg?version=20211104004058.0', 'My Universe', 'Coldplay(콜드플레이)', '', NULL, '', '', '', '', NULL),
	(282, 'https://image.bugsm.co.kr/album/images/50/40452/4045282.jpg?version=20210927154638.0', '다정히 내 이름을 부르면', '경서예지', '', NULL, '', '', '', '', NULL),
	(283, 'https://image.bugsm.co.kr/album/images/50/40665/4066596.jpg?version=20211029063820.0', '나 그댈위해 시 한편을 쓰겠어', '케이시', '', NULL, '', '', '', '', NULL),
	(284, 'https://image.bugsm.co.kr/album/images/50/204305/20430595.jpg?version=20211109004233.0', '너와 나의 Memories', '염따', '', NULL, '', '', '', '', NULL),
	(285, 'https://image.bugsm.co.kr/album/images/50/202024/20202481.jpg?version=20210421044944.0', 'Friend', '비투비', '', NULL, '', '', '', '', NULL),
	(286, 'https://image.bugsm.co.kr/album/images/50/40586/4058623.jpg?version=20210820004709.0', '낙하 (with 아이유)', 'AKMU(악뮤)', '', NULL, '', '', '', '', NULL),
	(287, 'https://image.bugsm.co.kr/album/images/50/4652/465282.jpg?version=20211016002943.0', 'Hey Mama (feat. Nicki Minaj, Bebe Rexha & Afrojack)', 'David Guetta(데이빗 게타)', '', NULL, '', '', '', '', NULL),
	(288, 'https://image.bugsm.co.kr/album/images/50/204289/20428971.jpg?version=20211102002238.0', '별거 없던 그 하루로', '임창정', '', NULL, '', '', '', '', NULL),
	(289, 'https://image.bugsm.co.kr/album/images/50/40660/4066062.jpg?version=20211016064316.0', 'Easy On Me', 'Adele(아델)', '', NULL, '', '', '', '', NULL),
	(290, 'https://image.bugsm.co.kr/album/images/50/40553/4055320.jpg?version=20210710065248.0', 'Permission to Dance', '방탄소년단', '', NULL, '', '', '', '', NULL),
	(291, 'https://image.bugsm.co.kr/album/images/50/157963/15796389.jpg?version=20211112052031.0', 'Bad Habits', 'Ed Sheeran(에드 시런)', '', NULL, '', '', '', '', NULL),
	(292, 'https://image.bugsm.co.kr/album/images/50/204264/20426481.jpg?version=20211019004724.0', '나의 첫사랑', '다비치', '', NULL, '', '', '', '', NULL),
	(293, 'https://image.bugsm.co.kr/album/images/50/40658/4065800.jpg?version=20211009004847.0', '찬란한 계절', '폴킴(Paul Kim)', '', NULL, '', '', '', '', NULL),
	(294, 'https://image.bugsm.co.kr/album/images/50/204282/20428261.jpg?version=20211027010045.0', 'Favorite (Vampire)', 'NCT 127', '', NULL, '', '', '', '', NULL),
	(295, 'https://image.bugsm.co.kr/album/images/50/203980/20398006.jpg?version=20210605002338.0', 'Butter', '방탄소년단', '', NULL, '', '', '', '', NULL),
	(296, 'https://image.bugsm.co.kr/album/images/50/157963/15796389.jpg?version=20211112052031.0', 'Shivers', 'Ed Sheeran(에드 시런)', '', NULL, '', '', '', '', NULL),
	(297, 'https://image.bugsm.co.kr/album/images/50/203326/20332694.jpg?version=20210910142734.0', 'OHAYO MY NIGHT', '디핵(D-Hack)', '', NULL, '', '', '', '', NULL),
	(298, 'https://image.bugsm.co.kr/album/images/50/40650/4065044.jpg?version=20211001120007.0', '너를 생각해', '주시크 (Joosiq)', '', NULL, '', '', '', '', NULL),
	(299, 'https://image.bugsm.co.kr/album/images/50/204253/20425389.jpg?version=20211013004223.0', 'Cold Blooded', '제시(Jessi)', '', NULL, '', '', '', '', NULL),
	(300, 'https://image.bugsm.co.kr/album/images/50/204054/20405430.jpg?version=20210710002350.0', '바라만 본다', 'MSG워너비(M.O.M)', '', NULL, '', '', '', '', NULL),
	(301, 'https://image.bugsm.co.kr/album/images/50/204073/20407398.jpg?version=20210708002235.0', 'Weekend', '태연 (TAEYEON)', '', NULL, '', '', '', '', NULL),
	(302, 'https://image.bugsm.co.kr/album/images/50/40662/4066259.jpg?version=20211021153516.0', '그래도 사랑이었잖아', '거미', '', NULL, '', '', '', '', NULL),
	(303, 'https://image.bugsm.co.kr/album/images/50/40643/4064302.jpg?version=20210830063547.0', '고백', '멜로망스(MeloMance)', '', NULL, '', '', '', '', NULL),
	(304, 'https://image.bugsm.co.kr/album/images/50/203449/20344912.jpg?version=20210911004741.0', 'Dynamite', '방탄소년단', '', NULL, '', '', '', '', NULL),
	(305, 'https://image.bugsm.co.kr/album/images/50/40664/4066410.jpg?version=20211023065513.0', 'Rock with you', '세븐틴(SEVENTEEN)', '', NULL, '', '', '', '', NULL),
	(306, 'https://image.bugsm.co.kr/album/images/50/204261/20426191.jpg?version=20211016003108.0', '우리의 이야기', '멜로망스(MeloMance)', '', NULL, '', '', '', '', NULL),
	(307, 'https://image.bugsm.co.kr/album/images/50/204225/20422533.jpg?version=20211002011645.0', 'LOCO', 'ITZY (있지)', '', NULL, '', '', '', '', NULL),
	(308, 'https://image.bugsm.co.kr/album/images/50/204152/20415229.jpg?version=20210818004552.0', 'Queendom', 'Red Velvet (레드벨벳)', '', NULL, '', '', '', '', NULL),
	(309, 'https://image.bugsm.co.kr/album/images/50/40604/4060427.jpg?version=20210803063653.0', 'DUMB DUMB', '전소미', '', NULL, '', '', '', '', NULL),
	(310, 'https://image.bugsm.co.kr/album/images/50/40646/4064631.jpg?version=20210907063607.0', '색안경 (STEREOTYPE)', 'STAYC(스테이씨)', '', NULL, '', '', '', '', NULL),
	(311, 'https://image.bugsm.co.kr/album/images/50/40673/4067309.jpg?version=20211113003201.0', '너라는 계절', '스무살', '', NULL, '', '', '', '', NULL),
	(312, 'https://image.bugsm.co.kr/album/images/50/151758/15175845.jpg?version=20210831004404.0', 'Peaches (feat. Daniel Caesar, Giveon)', 'Justin Bieber(저스틴 비버)', '', NULL, '', '', '', '', NULL),
	(313, 'https://image.bugsm.co.kr/album/images/50/204207/20420797.jpg?version=20210915003411.0', '가을 타나 봐', '이무진', '', NULL, '', '', '', '', NULL),
	(314, 'https://image.bugsm.co.kr/album/images/50/203977/20397734.jpg?version=20210521002943.0', '헤픈 우연', '헤이즈(Heize)', '', NULL, '', '', '', '', NULL),
	(315, 'https://image.bugsm.co.kr/album/images/50/40644/4064420.jpg?version=20211109010253.0', '시간을 거슬러 (낮에 뜨는 달 X 케이윌)', '케이윌', '', NULL, '', '', '', '', NULL),
	(316, 'https://image.bugsm.co.kr/album/images/50/40271/4027185.jpg?version=20210421042904.0', '라일락', '아이유(IU)', '', NULL, '', '', '', '', NULL),
	(317, 'https://image.bugsm.co.kr/album/images/50/40271/4027185.jpg?version=20210421042904.0', 'Celebrity', '아이유(IU)', '', NULL, '', '', '', '', NULL),
	(318, 'https://image.bugsm.co.kr/album/images/50/203643/20364322.jpg?version=20201228134731.0', 'Better', '보아 (BoA)', '', NULL, '', '', '', '', NULL),
	(319, 'https://image.bugsm.co.kr/album/images/50/204128/20412824.jpg?version=20210903012806.0', '비가 오는 날엔 (2021)', '헤이즈(Heize)', '', NULL, '', '', '', '', NULL),
	(320, 'https://image.bugsm.co.kr/album/images/50/203611/20361192.jpg?version=20201126173950.0', 'Black Mamba', 'aespa', '', NULL, '', '', '', '', NULL),
	(321, 'https://image.bugsm.co.kr/album/images/50/204200/20420099.jpg?version=20210917004524.0', '산책', '백예린 (Yerin Baek)', '', NULL, '', '', '', '', NULL),
	(322, 'https://image.bugsm.co.kr/album/images/50/40668/4066817.jpg?version=20211103004105.0', '밤하늘의 별을(Original)', '임한별', '', NULL, '', '', '', '', NULL),
	(323, 'https://image.bugsm.co.kr/album/images/50/204286/20428606.jpg?version=20211029014913.0', '가르치지마', '에일리(Ailee)', '', NULL, '', '', '', '', NULL),
	(324, 'https://image.bugsm.co.kr/album/images/50/154325/15432584.jpg?version=20210818002433.0', 'Dun Dun Dance', '오마이걸(OH MY GIRL)', '', NULL, '', '', '', '', NULL),
	(325, 'https://image.bugsm.co.kr/album/images/50/151758/15175845.jpg?version=20210831004404.0', 'Off My Face', 'Justin Bieber(저스틴 비버)', '', NULL, '', '', '', '', NULL),
	(326, 'https://image.bugsm.co.kr/album/images/50/40650/4065043.jpg?version=20210919180017.0', '찰나가 영원이 될 때 (The Eternal Moment)', '마크툽(MAKTUB)', '', NULL, '', '', '', '', NULL),
	(327, 'https://image.bugsm.co.kr/album/images/50/204032/20403298.jpg?version=20210625004304.0', '비와 당신', '이무진', '', NULL, '', '', '', '', NULL),
	(328, 'https://image.bugsm.co.kr/album/images/50/202788/20278851.jpg?version=20210727012601.0', '어떻게 이별까지 사랑하겠어, 널 사랑하는 거지', 'AKMU(악뮤)', '', NULL, '', '', '', '', NULL),
	(329, 'https://image.bugsm.co.kr/album/images/50/204293/20429395.jpg?version=20211103005536.0', '잘 가라니', '2am', '', NULL, '', '', '', '', NULL),
	(330, 'https://image.bugsm.co.kr/album/images/50/40400/4040011.jpg?version=20210421043058.0', 'ASAP', 'STAYC(스테이씨)', '', NULL, '', '', '', '', NULL),
	(331, 'https://image.bugsm.co.kr/album/images/50/40654/4065427.jpg?version=20211015004305.0', '사랑은 언제나 목마르다 (N번째 연애 X 이해리 (다비치))', '이해리', '', NULL, '', '', '', '', NULL),
	(332, 'https://image.bugsm.co.kr/album/images/50/204175/20417524.jpg?version=20210916004927.0', '빨간 립스틱 (Feat. 윤미래)', '이하이', '', NULL, '', '', '', '', NULL),
	(333, 'https://image.bugsm.co.kr/album/images/50/204239/20423915.jpg?version=20211021003942.0', 'The Feels', 'TWICE (트와이스)', '', NULL, '', '', '', '', NULL),
	(334, 'https://image.bugsm.co.kr/album/images/50/2867/286714.jpg?version=20210421040843.0', '내 손을 잡아', '아이유(IU)', '', NULL, '', '', '', '', NULL),
	(335, 'https://image.bugsm.co.kr/album/images/50/40641/4064174.jpg?version=20210827010641.0', '가까운 듯 먼 그대여', '카더가든', '', NULL, '', '', '', '', NULL),
	(336, 'https://image.bugsm.co.kr/album/images/50/203521/20352127.jpg?version=20210428040910.0', 'Lovesick Girls', 'BLACKPINK', '', NULL, '', '', '', '', NULL),
	(337, 'https://image.bugsm.co.kr/album/images/50/40672/4067276.jpg?version=20211113004225.0', '열심히 할게', '10CM', '', NULL, '', '', '', '', NULL),
	(338, 'https://image.bugsm.co.kr/album/images/50/201547/20154722.jpg?version=20190515010725.0', '모든 날, 모든 순간 (Every day, Every Moment)', '폴킴(Paul Kim)', '', NULL, '', '', '', '', NULL),
	(339, 'https://image.bugsm.co.kr/album/images/50/200852/20085261.jpg?version=20210501000142.0', '롤린 (Rollin\')', '브레이브걸스(Brave Girls)', '', NULL, '', '', '', '', NULL),
	(340, 'https://image.bugsm.co.kr/album/images/50/203228/20322838.jpg?version=20210421045829.0', '에잇(Prod.&Feat. SUGA of BTS)', '아이유(IU)', '', NULL, '', '', '', '', NULL),
	(341, 'https://image.bugsm.co.kr/album/images/50/204091/20409151.jpg?version=20210723013036.0', '좋아좋아', '조정석', '', NULL, '', '', '', '', NULL),
	(342, 'https://image.bugsm.co.kr/album/images/50/202860/20286013.jpg?version=20210421045534.0', 'Blueming', '아이유(IU)', '', NULL, '', '', '', '', NULL),
	(343, 'https://image.bugsm.co.kr/album/images/50/40658/4065853.jpg?version=20211111222009.0', '밤새 니가 내려', '케이시', '', NULL, '', '', '', '', NULL),
	(344, 'https://image.bugsm.co.kr/album/images/50/204238/20423867.jpg?version=20211020003028.0', '내 기억 속에 남아 있는 그대 모습은', '산들', '', NULL, '', '', '', '', NULL),
	(345, 'https://image.bugsm.co.kr/album/images/50/204047/20404733.jpg?version=20210702002556.0', '가을 우체국 앞에서', '김대명', '', NULL, '', '', '', '', NULL),
	(346, 'https://image.bugsm.co.kr/album/images/50/40571/4057104.jpg?version=20210721003412.0', '고백', '장범준', '', NULL, '', '', '', '', NULL),
	(347, 'https://image.bugsm.co.kr/album/images/50/40665/4066529.jpg?version=20211027063649.0', '그리워 그리워', '이예준', '', NULL, '', '', '', '', NULL),
	(348, 'https://image.bugsm.co.kr/album/images/50/204317/20431783.jpg?version=20211112005821.0', 'Hyperstar', '창모(CHANGMO)', '', NULL, '', '', '', '', NULL),
	(349, 'https://image.bugsm.co.kr/album/images/50/204246/20424634.jpg?version=20211008003509.0', 'GLASSY', '조유리', '', NULL, '', '', '', '', NULL),
	(350, 'https://image.bugsm.co.kr/album/images/50/204314/20431479.jpg?version=20211113004305.0', '말하자면 Remix', 'pH-1', '', NULL, '', '', '', '', NULL),
	(351, 'https://image.bugsm.co.kr/album/images/50/40673/4067382.jpg?version=20211114063119.0', '슬픔활용법', '이영현', '', NULL, '', '', '', '', NULL),
	(352, 'https://image.bugsm.co.kr/album/images/50/200837/20083789.jpg?version=20210421044040.0', '언젠가 (SOMEDAY)', '비투비', '', NULL, '', '', '', '', NULL),
	(353, 'https://image.bugsm.co.kr/album/images/50/40665/4066556.jpg?version=20211104003613.0', '미워지지가 않아 (Unhateable)', '노을', '', NULL, '', '', '', '', NULL),
	(354, 'https://image.bugsm.co.kr/album/images/50/204200/20420099.jpg?version=20210917004524.0', 'Antifreeze', '백예린 (Yerin Baek)', '', NULL, '', '', '', '', NULL),
	(355, 'https://image.bugsm.co.kr/album/images/50/154178/15417837.jpg?version=20210921113556.0', 'Loving You Girl (feat. Hkeem)', 'Peder Elias', '', NULL, '', '', '', '', NULL),
	(356, 'https://image.bugsm.co.kr/album/images/50/40672/4067276.jpg?version=20211113004225.0', 'Condition', '10CM', '', NULL, '', '', '', '', NULL),
	(357, 'https://image.bugsm.co.kr/album/images/50/40141/4014150.jpg?version=20210421042713.0', '밤하늘의 별을(2020)', '경서', '', NULL, '', '', '', '', NULL),
	(358, 'https://image.bugsm.co.kr/album/images/50/40271/4027185.jpg?version=20210421042904.0', '어푸 (Ah puh)', '아이유(IU)', '', NULL, '', '', '', '', NULL),
	(359, 'https://image.bugsm.co.kr/album/images/50/40673/4067355.jpg?version=20211115101622.0', '손을 잡아줘요', '이하이', '', NULL, '', '', '', '', NULL),
	(360, 'https://image.bugsm.co.kr/album/images/50/200648/20064873.jpg?version=20210421043908.0', '예지앞사', '비투비', '', NULL, '', '', '', '', NULL),
	(361, 'https://image.bugsm.co.kr/album/images/50/40673/4067389.jpg?version=20211115063043.0', '산책', '오반 (OVAN)', '', NULL, '', '', '', '', NULL),
	(362, 'https://image.bugsm.co.kr/album/images/50/204323/20432372.jpg?version=20211114180018.0', '물들인다', '이소라', '', NULL, '', '', '', '', NULL),
	(363, 'https://image.bugsm.co.kr/album/images/50/9969/996909.jpg?version=20201007204337.0', 'Savage Love (Laxed - Siren Beat) (BTS Remix)', 'Jawsh 685', '', NULL, '', '', '', '', NULL),
	(364, 'https://image.bugsm.co.kr/album/images/50/152867/15286790.jpg?version=20210820004838.0', 'Kiss Me More (feat. SZA)', 'Doja Cat(도자 캣)', '', NULL, '', '', '', '', NULL),
	(365, 'https://image.bugsm.co.kr/album/images/50/204326/20432647.jpg?version=20211116003811.0', 'ALL KILL', '티아라(T-ara)', '', NULL, '', '', '', '', NULL),
	(366, 'https://image.bugsm.co.kr/album/images/50/204326/20432647.jpg?version=20211116003811.0', 'TIKI TAKA', '티아라(T-ara)', '', NULL, '', '', '', '', NULL),
	(367, 'https://image.bugsm.co.kr/album/images/50/40673/4067362.jpg?version=20211116004412.0', '작은 온기', '허각', '', NULL, '', '', '', '', NULL),
	(368, 'https://image.bugsm.co.kr/album/images/50/40674/4067468.jpg?version=20211116063231.0', '다행이야', '장덕철', '', NULL, '', '', '', '', NULL),
	(369, 'https://image.bugsm.co.kr/album/images/50/40382/4038290.jpg?version=20211002003917.0', 'Tiny Riot', 'Sam Ryder', '', NULL, '', '', '', '', NULL),
	(370, 'https://image.bugsm.co.kr/album/images/50/40668/4066827.jpg?version=20211102063252.0', 'MAVERICK', '더보이즈(THE BOYZ)', '', NULL, '', '', '', '', NULL),
	(383, 'https://image.bugsm.co.kr/album/images/50/40675/4067509.jpg?version=20211118010846.0', '별의 조각', '윤하(Younha/ユンナ)', '', NULL, '', '', '', '', NULL),
	(384, 'https://image.bugsm.co.kr/album/images/50/40675/4067509.jpg?version=20211118010846.0', 'P.R.R.W.', '윤하(Younha/ユンナ)', '', NULL, '', '', '', '', NULL),
	(385, 'https://image.bugsm.co.kr/album/images/50/40675/4067509.jpg?version=20211118010846.0', '물의 여행', '윤하(Younha/ユンナ)', '', NULL, '', '', '', '', NULL),
	(386, 'https://image.bugsm.co.kr/album/images/50/40675/4067509.jpg?version=20211118010846.0', '오르트구름', '윤하(Younha/ユンナ)', '', NULL, '', '', '', '', NULL),
	(387, 'https://image.bugsm.co.kr/album/images/50/40675/4067509.jpg?version=20211118010846.0', '나는 계획이 있다', '윤하(Younha/ユンナ)', '', NULL, '', '', '', '', NULL),
	(388, 'https://image.bugsm.co.kr/album/images/50/40675/4067509.jpg?version=20211118010846.0', '잘 지내', '윤하(Younha/ユンナ)', '', NULL, '', '', '', '', NULL),
	(389, 'https://image.bugsm.co.kr/album/images/50/40675/4067509.jpg?version=20211118010846.0', '반짝, 빛을 내', '윤하(Younha/ユンナ)', '', NULL, '', '', '', '', NULL),
	(390, 'https://image.bugsm.co.kr/album/images/50/40675/4067509.jpg?version=20211118010846.0', 'Truly', '윤하(Younha/ユンナ)', '', NULL, '', '', '', '', NULL),
	(391, 'https://image.bugsm.co.kr/album/images/50/40675/4067509.jpg?version=20211118010846.0', 'Savior', '윤하(Younha/ユンナ)', '', NULL, '', '', '', '', NULL),
	(392, 'https://image.bugsm.co.kr/album/images/50/40675/4067509.jpg?version=20211118010846.0', '6년 230일', '윤하(Younha/ユンナ)', '', NULL, '', '', '', '', NULL),
	(393, 'https://image.bugsm.co.kr/album/images/50/40675/4067509.jpg?version=20211118010846.0', '하나의 달', '윤하(Younha/ユンナ)', '', NULL, '', '', '', '', NULL),
	(394, 'https://image.bugsm.co.kr/album/images/50/204328/20432855.jpg?version=20211117005211.0', 'Fly', '강다니엘(KANG DANIEL)', '', NULL, '', '', '', '', NULL),
	(395, 'https://image.bugsm.co.kr/album/images/50/5139/513953.jpg?version=20210421042131.0', 'Everything\'s Good - 일훈 Solo (Outro)', '비투비', '', NULL, '', '', '', '', NULL),
	(396, 'https://image.bugsm.co.kr/album/images/50/40675/4067525.jpg?version=20211118011254.0', '이 나이 먹고 뭐했길래 (Feat. 정슬기, 칸토)', '미스에스(Miss $)', '', NULL, '', '', '', '', NULL),
	(397, 'https://image.bugsm.co.kr/album/images/50/40676/4067602.jpg?version=20211118063841.0', '잘가요 내사랑', '정동원', '', NULL, '', '', '', '', NULL);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;

-- 테이블 java02_kdd.user_jsp 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_jsp` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(50) NOT NULL,
  `pwdKeyNo` int(11) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telecom` varchar(50) NOT NULL,
  `phoneNb` varchar(50) NOT NULL,
  `userNm` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `nickNm` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `visible` int(11) DEFAULT '1',
  PRIMARY KEY (`idx`,`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 테이블 데이터 java02_kdd.user_jsp:~6 rows (대략적) 내보내기
DELETE FROM `user_jsp`;
/*!40000 ALTER TABLE `user_jsp` DISABLE KEYS */;
INSERT INTO `user_jsp` (`idx`, `userId`, `pwdKeyNo`, `pwd`, `email`, `telecom`, `phoneNb`, `userNm`, `nickNm`, `visible`) VALUES
	(1, 'admin', 12, '117164511', 'name@naver.com', 'LGU+', '010-4443-5001', '관리자', '디디', 1),
	(2, 'hkd1234', 12, '117164511', 'hkd1234@naver.com', 'SKT', '', 'íê¸¸ë', 'íì¥êµ°', 1),
	(3, 'kms1234', 12, '818837171796', 'kms123@daun.net', 'KT', '01054546878', 'ê¹ë§ì', '', 1),
	(4, 'kms1212', 8, '81876960144629', 'kms1212@daun.net', 'KT', '01054546878', '', 'ë§ì ', 1),
	(5, 'lkj1234', 9, '818736205313', 'lkj1234@hanmail.com', 'LGU+', '01035798456', '이기자', '', 1),
	(6, 'tttqqq', 17, '818788577963', 'qwq@dfds.vds', '알뜰폰', '01034534565', '', 'asdf', 1);
/*!40000 ALTER TABLE `user_jsp` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
