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

insert into member values (default, 'admin', '1234', 1, '관리맨', '관리자', default, default, '010-4443-5001', '청주', 'power6120@naver.com', 'blog.naver.com/power6120', 'free', '등산/바둑', default, '관리자 더비 데이터', default, default, default, default, default, default, default);
