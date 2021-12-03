show tables;

create table webMassage (
	idx int not null auto_increment primary key,
	title varchar(100) not null, 
	content text not null,
	sendId varchar(20) not null,
	sendSw char(1) not null,
	sendDate datetime default now(),
	receiveId varchar(20) not null,
	receiveSw char(1) not null,
	receiveDate datetime default now()
);

desc webMassage;

insert into webMassage values (default, '가입 안내', '홈페이지에 가입하신 것을 환영합니다.', 'admin', 's', default, 'kkc1234', 'n', default);
insert into webMassage values (default, '답장을 보냄', '감사합니다.', 'kkc1234', 's', default, 'admin', 'n', default);

select * from webMassage;
