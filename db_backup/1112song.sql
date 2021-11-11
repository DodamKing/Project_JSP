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
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- 테이블 데이터 java02_kdd.song:~102 rows (대략적) 내보내기
DELETE FROM `song`;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` (`idx`, `img`, `title`, `artist`, `album`, `release`, `genre`, `music`, `words`, `arranger`, `lyrics`) VALUES
	(1, 'https://image.bugsm.co.kr/album/images/50/40672/4067276.jpg?version=20211111180723.0', '어제 너는 나를 버렸어', '10CM', 'The 3rd EP', '2021-11-11', '발라드(국내)', '10CM', '10CM', '10CM, 이요한, 성수용, 방인재, 이윤혁', '어제 너는 나를 버렸어\r\n나는 아무 변명하지 못하고\r\n얌전하게 집에 돌아와\r\n너무 피곤해 잠이 들었어\r\n눈이 떠지자마자 정신이 없지\r\n지각은 말이 안 돼 출근해야지\r\n시간이 모자라 널 생각하고 아파하기엔\r\n내가 너무 바빠\r\n눈물이 맺혔을지도\r\n아닌가 졸린건지도\r\n어쩌면 널 좋아하지 않았었나봐\r\n연락을 기다릴지도\r\n아닌가 귀찮을지도\r\n어쩌면 널 사랑하진 않았었나봐\r\n이제 나는 너를 잊었어\r\n생각해 보니 오늘 하루 종일\r\n네 생각이 나질 않았고\r\n왠지 웃으며 잠이 들었어\r\n이별이 항상 지독할 필요는 없지\r\n우리도 각자 가던 길을 가야지\r\n못다 한 마음도 전하지 못한 말도 많았지만\r\n내가 너무 바빠\r\n눈물이 맺혔을지도\r\n아닌가 졸린건지도\r\n어쩌면 널 좋아하지 않았었나봐\r\n연락을 기다릴지도\r\n아닌가 귀찮을지도\r\n어쩌면 널 사랑하진 않았었나봐\r\n아냐 그랬을 리가 없지\r\n너 없인 살 수 없었던\r\n꿈같은 날들이 있었지\r\n나를 안아주던 숨결도\r\n빛이 나던 그 입술도\r\n시간을 되돌려 갈 수 있다 해도\r\n이젠 너무 바빠\r\n눈물은 말랐을지도\r\n이대로 괜찮을지도\r\n어쩌면 널 기다리지 않을건가봐\r\n마음이 죽은걸지도\r\n차갑게 굳어질지도\r\n어쩌면 널 사랑하지 않을건가봐\r\n이제 나는 너를 잊었어\r\n아쉬울게 하나도 없어'),
	(36, 'https://image.bugsm.co.kr/album/images/50/40672/4067276.jpg?version=20211112010700.0', '가진다는 말은 좀 그렇지?', '10CM', '', NULL, '', '', '', '', NULL),
	(37, 'https://image.bugsm.co.kr/album/images/50/204305/20430595.jpg?version=20211109004233.0', '쉬어 (Feat. MINO) (Prod. GRAY)', 'MINO(송민호)', '', NULL, '', '', '', '', NULL),
	(38, 'https://image.bugsm.co.kr/album/images/50/40671/4067172.jpg?version=20211111003803.0', '널 그리워하고 있어', '양다일', '', NULL, '', '', '', '', NULL),
	(39, 'https://image.bugsm.co.kr/album/images/50/204305/20430595.jpg?version=20211109004233.0', 'Wake Up (Prod. 코드 쿤스트)', '개코', '', NULL, '', '', '', '', NULL),
	(40, 'https://image.bugsm.co.kr/album/images/50/40662/4066238.jpg?version=20211020063535.0', 'strawberry moon', '아이유(IU)', '', NULL, '', '', '', '', NULL),
	(41, 'https://image.bugsm.co.kr/album/images/50/40666/4066688.jpg?version=20211030065545.0', '낮 밤 (feat. 박재범)', '이영지', '', NULL, '', '', '', '', NULL),
	(42, 'https://image.bugsm.co.kr/album/images/50/204243/20424398.jpg?version=20211015010640.0', 'Savage', 'aespa', '', NULL, '', '', '', '', NULL),
	(43, 'https://image.bugsm.co.kr/album/images/50/204305/20430595.jpg?version=20211109004233.0', 'TROUBLE (Prod. Slom)', 'Zion.T', '', NULL, '', '', '', '', NULL),
	(44, 'https://image.bugsm.co.kr/album/images/50/204305/20430595.jpg?version=20211109004233.0', '너와 나의 Memories', '염따', '', NULL, '', '', '', '', NULL),
	(45, 'https://image.bugsm.co.kr/album/images/50/203943/20394389.jpg?version=20210502180032.0', '문득', 'BE\'O (비오)', '', NULL, '', '', '', '', NULL),
	(46, 'https://image.bugsm.co.kr/album/images/50/40667/4066711.jpg?version=20211103004833.0', 'XOXO', '전소미', '', NULL, '', '', '', '', NULL),
	(47, 'https://image.bugsm.co.kr/album/images/50/204293/20429395.jpg?version=20211103005536.0', '가까이 있어서 몰랐어', '2am', '', NULL, '', '', '', '', NULL),
	(48, 'https://image.bugsm.co.kr/album/images/50/40672/4067276.jpg?version=20211112010700.0', '열심히 할게', '10CM', '', NULL, '', '', '', '', NULL),
	(49, 'https://image.bugsm.co.kr/album/images/50/204317/20431783.jpg?version=20211112005821.0', 'Hyperstar', '창모(CHANGMO)', '', NULL, '', '', '', '', NULL),
	(50, 'https://image.bugsm.co.kr/album/images/50/40665/4066507.jpg?version=20211027003705.0', '나비효과', '볼빨간사춘기', '', NULL, '', '', '', '', NULL),
	(51, 'https://image.bugsm.co.kr/album/images/50/40665/4066507.jpg?version=20211027003705.0', '너는 내 세상이었어', '볼빨간사춘기', '', NULL, '', '', '', '', NULL),
	(52, 'https://image.bugsm.co.kr/album/images/50/161839/16183960.jpg?version=20211104004058.0', 'My Universe', 'Coldplay(콜드플레이)', '', NULL, '', '', '', '', NULL),
	(53, 'https://image.bugsm.co.kr/album/images/50/204317/20431783.jpg?version=20211112005821.0', '태지', '창모(CHANGMO)', '', NULL, '', '', '', '', NULL),
	(54, 'https://image.bugsm.co.kr/album/images/50/203973/20397321.jpg?version=20210518110655.0', 'Next Level', 'aespa', '', NULL, '', '', '', '', NULL),
	(55, 'https://image.bugsm.co.kr/album/images/50/204253/20425389.jpg?version=20211013004223.0', 'Cold Blooded', '제시(Jessi)', '', NULL, '', '', '', '', NULL),
	(56, 'https://image.bugsm.co.kr/album/images/50/40658/4065831.jpg?version=20211106011825.0', '사랑은 늘 도망가', '임영웅', '', NULL, '', '', '', '', NULL),
	(57, 'https://image.bugsm.co.kr/album/images/50/40448/4044879.jpg?version=20210515065000.0', '신호등', '이무진', '', NULL, '', '', '', '', NULL),
	(58, 'https://image.bugsm.co.kr/album/images/50/158177/15817728.jpg?version=20210921113538.0', 'STAY', 'The Kid LAROI', '', NULL, '', '', '', '', NULL),
	(59, 'https://image.bugsm.co.kr/album/images/50/40672/4067276.jpg?version=20211112010700.0', 'Condition', '10CM', '', NULL, '', '', '', '', NULL),
	(60, 'https://image.bugsm.co.kr/album/images/50/204317/20431783.jpg?version=20211112005821.0', '모래시계', '창모(CHANGMO)', '', NULL, '', '', '', '', NULL),
	(61, 'https://image.bugsm.co.kr/album/images/50/40665/4066596.jpg?version=20211029063820.0', '나 그댈위해 시 한편을 쓰겠어', '케이시', '', NULL, '', '', '', '', NULL),
	(62, 'https://image.bugsm.co.kr/album/images/50/40452/4045282.jpg?version=20210927154638.0', '다정히 내 이름을 부르면', '경서예지', '', NULL, '', '', '', '', NULL),
	(63, 'https://image.bugsm.co.kr/album/images/50/40586/4058623.jpg?version=20210820004709.0', '낙하 (with 아이유)', 'AKMU(악뮤)', '', NULL, '', '', '', '', NULL),
	(64, 'https://image.bugsm.co.kr/album/images/50/40672/4067276.jpg?version=20211112010700.0', 'Please Don\'t Stop Your Singing', '10CM', '', NULL, '', '', '', '', NULL),
	(65, 'https://image.bugsm.co.kr/album/images/50/40660/4066062.jpg?version=20211016064316.0', 'Easy On Me', 'Adele(아델)', '', NULL, '', '', '', '', NULL),
	(66, 'https://image.bugsm.co.kr/album/images/50/40553/4055320.jpg?version=20210710065248.0', 'Permission to Dance', '방탄소년단', '', NULL, '', '', '', '', NULL),
	(67, 'https://image.bugsm.co.kr/album/images/50/4652/465282.jpg?version=20211016002943.0', 'Hey Mama (feat. Nicki Minaj, Bebe Rexha & Afrojack)', 'David Guetta(데이빗 게타)', '', NULL, '', '', '', '', NULL),
	(68, 'https://image.bugsm.co.kr/album/images/50/40650/4065044.jpg?version=20211001120007.0', '너를 생각해', '주시크 (Joosiq)', '', NULL, '', '', '', '', NULL),
	(69, 'https://image.bugsm.co.kr/album/images/50/204261/20426191.jpg?version=20211016003108.0', '우리의 이야기', '멜로망스(MeloMance)', '', NULL, '', '', '', '', NULL),
	(70, 'https://image.bugsm.co.kr/album/images/50/40664/4066410.jpg?version=20211023065513.0', 'Rock with you', '세븐틴(SEVENTEEN)', '', NULL, '', '', '', '', NULL),
	(71, 'https://image.bugsm.co.kr/album/images/50/204282/20428261.jpg?version=20211027010045.0', 'Favorite (Vampire)', 'NCT 127', '', NULL, '', '', '', '', NULL),
	(72, 'https://image.bugsm.co.kr/album/images/50/204264/20426481.jpg?version=20211019004724.0', '나의 첫사랑', '다비치', '', NULL, '', '', '', '', NULL),
	(73, 'https://image.bugsm.co.kr/album/images/50/203326/20332694.jpg?version=20210910142734.0', 'OHAYO MY NIGHT', '디핵(D-Hack)', '', NULL, '', '', '', '', NULL),
	(74, 'https://image.bugsm.co.kr/album/images/50/40662/4066259.jpg?version=20211021153516.0', '그래도 사랑이었잖아', '거미', '', NULL, '', '', '', '', NULL),
	(75, 'https://image.bugsm.co.kr/album/images/50/204225/20422533.jpg?version=20211002011645.0', 'LOCO', 'ITZY (있지)', '', NULL, '', '', '', '', NULL),
	(76, 'https://image.bugsm.co.kr/album/images/50/204289/20428971.jpg?version=20211102002238.0', '별거 없던 그 하루로', '임창정', '', NULL, '', '', '', '', NULL),
	(77, 'https://image.bugsm.co.kr/album/images/50/40658/4065800.jpg?version=20211009004847.0', '찬란한 계절', '폴킴(Paul Kim)', '', NULL, '', '', '', '', NULL),
	(78, 'https://image.bugsm.co.kr/album/images/50/204054/20405430.jpg?version=20210710002350.0', '바라만 본다', 'MSG워너비(M.O.M)', '', NULL, '', '', '', '', NULL),
	(79, 'https://image.bugsm.co.kr/album/images/50/157963/15796389.jpg?version=20211029023249.0', 'Bad Habits', 'Ed Sheeran(에드 시런)', '', NULL, '', '', '', '', NULL),
	(80, 'https://image.bugsm.co.kr/album/images/50/203980/20398006.jpg?version=20210605002338.0', 'Butter', '방탄소년단', '', NULL, '', '', '', '', NULL),
	(81, 'https://image.bugsm.co.kr/album/images/50/204152/20415229.jpg?version=20210818004552.0', 'Queendom', 'Red Velvet (레드벨벳)', '', NULL, '', '', '', '', NULL),
	(82, 'https://image.bugsm.co.kr/album/images/50/203643/20364322.jpg?version=20201228134731.0', 'Better', '보아 (BoA)', '', NULL, '', '', '', '', NULL),
	(83, 'https://image.bugsm.co.kr/album/images/50/40650/4065043.jpg?version=20210919180017.0', '찰나가 영원이 될 때 (The Eternal Moment)', '마크툽(MAKTUB)', '', NULL, '', '', '', '', NULL),
	(84, 'https://image.bugsm.co.kr/album/images/50/157963/15796389.jpg?version=20211029023249.0', 'Shivers', 'Ed Sheeran(에드 시런)', '', NULL, '', '', '', '', NULL),
	(85, 'https://image.bugsm.co.kr/album/images/50/40604/4060427.jpg?version=20210803063653.0', 'DUMB DUMB', '전소미', '', NULL, '', '', '', '', NULL),
	(86, 'https://image.bugsm.co.kr/album/images/50/204317/20431774.jpg?version=20211112004624.0', 'COSMOS', 'B.I(비아이)', '', NULL, '', '', '', '', NULL),
	(87, 'https://image.bugsm.co.kr/album/images/50/40644/4064420.jpg?version=20211109010253.0', '시간을 거슬러 (낮에 뜨는 달 X 케이윌)', '케이윌', '', NULL, '', '', '', '', NULL),
	(88, 'https://image.bugsm.co.kr/album/images/50/204073/20407398.jpg?version=20210708002235.0', 'Weekend', '태연 (TAEYEON)', '', NULL, '', '', '', '', NULL),
	(89, 'https://image.bugsm.co.kr/album/images/50/40643/4064302.jpg?version=20210830063547.0', '고백', '멜로망스(MeloMance)', '', NULL, '', '', '', '', NULL),
	(90, 'https://image.bugsm.co.kr/album/images/50/40271/4027185.jpg?version=20210421042904.0', 'Celebrity', '아이유(IU)', '', NULL, '', '', '', '', NULL),
	(91, 'https://image.bugsm.co.kr/album/images/50/40271/4027185.jpg?version=20210421042904.0', '라일락', '아이유(IU)', '', NULL, '', '', '', '', NULL),
	(92, 'https://image.bugsm.co.kr/album/images/50/203449/20344912.jpg?version=20210911004741.0', 'Dynamite', '방탄소년단', '', NULL, '', '', '', '', NULL),
	(93, 'https://image.bugsm.co.kr/album/images/50/204207/20420797.jpg?version=20210915003411.0', '가을 타나 봐', '이무진', '', NULL, '', '', '', '', NULL),
	(94, 'https://image.bugsm.co.kr/album/images/50/40646/4064631.jpg?version=20210907063607.0', '색안경 (STEREOTYPE)', 'STAYC(스테이씨)', '', NULL, '', '', '', '', NULL),
	(95, 'https://image.bugsm.co.kr/album/images/50/200249/20024926.jpg?version=20210428040248.0', '한숨', '이하이', '', NULL, '', '', '', '', NULL),
	(96, 'https://image.bugsm.co.kr/album/images/50/204128/20412824.jpg?version=20210903012806.0', '비가 오는 날엔 (2021)', '헤이즈(Heize)', '', NULL, '', '', '', '', NULL),
	(97, 'https://image.bugsm.co.kr/album/images/50/40668/4066817.jpg?version=20211103004105.0', '밤하늘의 별을(Original)', '임한별', '', NULL, '', '', '', '', NULL),
	(98, 'https://image.bugsm.co.kr/album/images/50/204286/20428606.jpg?version=20211029014913.0', '가르치지마', '에일리(Ailee)', '', NULL, '', '', '', '', NULL),
	(99, 'https://image.bugsm.co.kr/album/images/50/203611/20361192.jpg?version=20201126173950.0', 'Black Mamba', 'aespa', '', NULL, '', '', '', '', NULL),
	(100, 'https://image.bugsm.co.kr/album/images/50/204293/20429395.jpg?version=20211103005536.0', '잘 가라니', '2am', '', NULL, '', '', '', '', NULL),
	(101, 'https://image.bugsm.co.kr/album/images/50/151758/15175845.jpg?version=20210831004404.0', 'Peaches (feat. Daniel Caesar, Giveon)', 'Justin Bieber(저스틴 비버)', '', NULL, '', '', '', '', NULL),
	(102, 'https://image.bugsm.co.kr/album/images/50/203977/20397734.jpg?version=20210521002943.0', '헤픈 우연', '헤이즈(Heize)', '', NULL, '', '', '', '', NULL),
	(103, 'https://image.bugsm.co.kr/album/images/50/203228/20322838.jpg?version=20210421045829.0', '에잇(Prod.&Feat. SUGA of BTS)', '아이유(IU)', '', NULL, '', '', '', '', NULL),
	(104, 'https://image.bugsm.co.kr/album/images/50/154325/15432584.jpg?version=20210818002433.0', 'Dun Dun Dance', '오마이걸(OH MY GIRL)', '', NULL, '', '', '', '', NULL),
	(105, 'https://image.bugsm.co.kr/album/images/50/204238/20423867.jpg?version=20211020003028.0', '내 기억 속에 남아 있는 그대 모습은', '산들', '', NULL, '', '', '', '', NULL),
	(106, 'https://image.bugsm.co.kr/album/images/50/201547/20154722.jpg?version=20190515010725.0', '모든 날, 모든 순간 (Every day, Every Moment)', '폴킴(Paul Kim)', '', NULL, '', '', '', '', NULL),
	(107, 'https://image.bugsm.co.kr/album/images/50/203521/20352127.jpg?version=20210428040910.0', 'Lovesick Girls', 'BLACKPINK', '', NULL, '', '', '', '', NULL),
	(108, 'https://image.bugsm.co.kr/album/images/50/204310/20431044.jpg?version=20211109004620.0', '다음생이 있다면 당신을 만나서 다시 사랑할래요', '임재현', '', NULL, '', '', '', '', NULL),
	(109, 'https://image.bugsm.co.kr/album/images/50/204239/20423915.jpg?version=20211021003942.0', 'The Feels', 'TWICE (트와이스)', '', NULL, '', '', '', '', NULL),
	(110, 'https://image.bugsm.co.kr/album/images/50/40641/4064174.jpg?version=20210827010641.0', '가까운 듯 먼 그대여', '카더가든', '', NULL, '', '', '', '', NULL),
	(111, 'https://image.bugsm.co.kr/album/images/50/204047/20404733.jpg?version=20210702002556.0', '가을 우체국 앞에서', '김대명', '', NULL, '', '', '', '', NULL),
	(112, 'https://image.bugsm.co.kr/album/images/50/204091/20409151.jpg?version=20210723013036.0', '좋아좋아', '조정석', '', NULL, '', '', '', '', NULL),
	(113, 'https://image.bugsm.co.kr/album/images/50/204200/20420099.jpg?version=20210917004524.0', '산책', '백예린 (Yerin Baek)', '', NULL, '', '', '', '', NULL),
	(114, 'https://image.bugsm.co.kr/album/images/50/200852/20085261.jpg?version=20210501000142.0', '롤린 (Rollin\')', '브레이브걸스(Brave Girls)', '', NULL, '', '', '', '', NULL),
	(115, 'https://image.bugsm.co.kr/album/images/50/163726/16372619.jpg?version=20211110004601.0', 'One Right Now', 'Post Malone(포스트 말론)', '', NULL, '', '', '', '', NULL),
	(116, 'https://image.bugsm.co.kr/album/images/50/204032/20403298.jpg?version=20210625004304.0', '비와 당신', '이무진', '', NULL, '', '', '', '', NULL),
	(117, 'https://image.bugsm.co.kr/album/images/50/40400/4040011.jpg?version=20210421043058.0', 'ASAP', 'STAYC(스테이씨)', '', NULL, '', '', '', '', NULL),
	(118, 'https://image.bugsm.co.kr/album/images/50/151758/15175845.jpg?version=20210831004404.0', 'Off My Face', 'Justin Bieber(저스틴 비버)', '', NULL, '', '', '', '', NULL),
	(119, 'https://image.bugsm.co.kr/album/images/50/40571/4057104.jpg?version=20210721003412.0', '고백', '장범준', '', NULL, '', '', '', '', NULL),
	(120, 'https://image.bugsm.co.kr/album/images/50/202788/20278851.jpg?version=20210727012601.0', '어떻게 이별까지 사랑하겠어, 널 사랑하는 거지', 'AKMU(악뮤)', '', NULL, '', '', '', '', NULL),
	(121, 'https://image.bugsm.co.kr/album/images/50/204317/20431783.jpg?version=20211112005821.0', 'Supernova (Feat. Dut2)', '창모(CHANGMO)', '', NULL, '', '', '', '', NULL),
	(122, 'https://image.bugsm.co.kr/album/images/50/204246/20424634.jpg?version=20211008003509.0', 'GLASSY', '조유리', '', NULL, '', '', '', '', NULL),
	(123, 'https://image.bugsm.co.kr/album/images/50/40271/4027185.jpg?version=20210421042904.0', '어푸 (Ah puh)', '아이유(IU)', '', NULL, '', '', '', '', NULL),
	(124, 'https://image.bugsm.co.kr/album/images/50/204317/20431783.jpg?version=20211112005821.0', 'Rockstar Lifestyle (Feat. 365LIT & 파사딕)', '창모(CHANGMO)', '', NULL, '', '', '', '', NULL),
	(125, 'https://image.bugsm.co.kr/album/images/50/204200/20420099.jpg?version=20210917004524.0', 'Antifreeze', '백예린 (Yerin Baek)', '', NULL, '', '', '', '', NULL),
	(126, 'https://image.bugsm.co.kr/album/images/50/40658/4065853.jpg?version=20211111222009.0', '밤새 니가 내려', '케이시', '', NULL, '', '', '', '', NULL),
	(127, 'https://image.bugsm.co.kr/album/images/50/202860/20286013.jpg?version=20210421045534.0', 'Blueming', '아이유(IU)', '', NULL, '', '', '', '', NULL),
	(128, 'https://image.bugsm.co.kr/album/images/50/200944/20094414.jpg?version=20190515013231.0', 'TOMBOY', '혁오 (HYUKOH)', '', NULL, '', '', '', '', NULL),
	(129, 'https://image.bugsm.co.kr/album/images/50/204307/20430735.jpg?version=20211112005527.0', 'Yours', '진(Jin)', '', NULL, '', '', '', '', NULL),
	(130, 'https://image.bugsm.co.kr/album/images/50/40665/4066529.jpg?version=20211027063649.0', '그리워 그리워', '이예준', '', NULL, '', '', '', '', NULL),
	(131, 'https://image.bugsm.co.kr/album/images/50/40654/4065427.jpg?version=20211015004305.0', '사랑은 언제나 목마르다 (N번째 연애 X 이해리 (다비치))', '이해리', '', NULL, '', '', '', '', NULL),
	(132, 'https://image.bugsm.co.kr/album/images/50/204175/20417524.jpg?version=20210916004927.0', '빨간 립스틱 (Feat. 윤미래)', '이하이', '', NULL, '', '', '', '', NULL),
	(133, 'https://image.bugsm.co.kr/album/images/50/2867/286714.jpg?version=20210421040843.0', '내 손을 잡아', '아이유(IU)', '', NULL, '', '', '', '', NULL),
	(134, 'https://image.bugsm.co.kr/album/images/50/40662/4066234.jpg?version=20211020063640.0', '알아요', '린(LYn)', '', NULL, '', '', '', '', NULL);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
