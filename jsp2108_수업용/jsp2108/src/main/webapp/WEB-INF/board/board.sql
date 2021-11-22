show tables;

create table board (
	idx int auto_increment,
	nickName varchar(20) not null,
	title varchar(100) not null,
	email varchar (50),
	homePage varchar (50),
	content text not null,
	wDate datetime not null default now(),
	readNum int default 0,
	hostIp varchar (50) not null, 
	goods int default 0,
	mid varchar(20) null,
	primary key (idx)
);

select * from board;

insert into board values (default, '관리맨', '게시판 서비스를 시작합니다.', 'admin@naver.com', 'blog.daun.net/admin', '이곳은 게시판 입니다. /n 좋은 글 부탁 드려요.', default, default, '218.236.203.156', default, 'admin');