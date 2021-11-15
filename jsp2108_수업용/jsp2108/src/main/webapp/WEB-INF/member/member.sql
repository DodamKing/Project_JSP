show tables;

create table member (
	idx int not null auto_increment,
	mid varchar(20) not null,
	pwd varchar(50) not null,
	pwdKey int not null,
	nickName varchar(20) not null,
	name varchar(20) not null,
	gender varchar(20) default '남자',
	birthday datetime default now(),
	tel varchar(15),
	address varchar(50),
	email varchar(50) not null,
	homePage varchar(50),
	job varchar(20),
	hobby varchar(60),
	photo varchar(100) default 'noimage.jpg',
	content text,
	userInfor char(6) default '공개',
	userDel char(2) default 'NO',
	point int default 100,
	level int default 1,
	visitCnt int default 0,
	startDate datetime default now(),
	lastDate datetime default now(),
	primary key (idx, mid)
);

desc member;

select * from member;

insert into member values (default, 'admin', '1234', 1, '관리맨', '관리자', default, default, '010-4443-5001', '청주', 'power6120@naver.com', 'blog.naver.com/power6120', 'free-job', '등산/바둑', default, '관리자 더비 데이터', default, default, default, 0, default, default, default);

create table hashTable(
	pwdKey int not null,
	pwdValue varchar(30) not null
);

insert into hashTable values (0,'12341234');
insert into hashTable values (1,'23452345');
insert into hashTable values (2,'34563456');
insert into hashTable values (3,'45674567');
insert into hashTable values (4,'56785678');
insert into hashTable values (5,'67896789');
insert into hashTable values (6,'78907890');
insert into hashTable values (7,'12121212');
insert into hashTable values (8,'23232323');
insert into hashTable values (9,'34343434');
insert into hashTable values (10,'45454545');
insert into hashTable values (11,'56565656');
insert into hashTable values (12,'67676767');
insert into hashTable values (13,'78787878');
insert into hashTable values (14,'89898989');
insert into hashTable values (15,'90909090');
insert into hashTable values (16,'21212121');
insert into hashTable values (17,'32323232');
insert into hashTable values (18,'43434343');
insert into hashTable values (19,'54545454');





alter table member add column todayCnt int default 0;

drop table member;

select * from member;

select * from hashTable;