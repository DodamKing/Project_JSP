show tables

alter database javacourse default character set utf8 collate utf8_general_ci;

create table books (
	bookId int not null auto_increment primary key,
	bookName varchar(20) not null,
	publisher varchar(20) not null,
	price int 
);

drop table books;

insert into books values (1,'축구의 역사','굿스포츠',7000);
insert into books values (2,'축구아는 여자','나무수',13000);
insert into books values (3,'축구의 이해','대한미디어',22000);
insert into books values (4,'골프 바이블','대한미디어',35000);
insert into books values (5,'피겨 교본','굿스포츠',8000);
insert into books values (6,'역도 단계별기술','굿스포츠',6000);
insert into books values (7,'야구의 추억','이상미디어',20000);
insert into books values (8,'야구를 부탁해','이상미디어',13000);
insert into books values (9,'올림픽 이야기','삼성당',7500);
insert into books values (10,'Olympic Champions','Pearson',13000);
insert into books values (11,'자바의 정석','도우출판사',30000);
insert into books values (12,'포토샵 CS6','제우미디어',25000);
insert into books values (13,'노인과 바다','이상미디어',13000);
insert into books values (14,'C#','삼성당',22000);
insert into books values (15,'전산세무2급','제우미디어',15000);
insert into books values (16,'반응형웹','ICOX',28000);
insert into books values (17,'파이썬따라잡기','이상미디어',22000);
insert into books values (18,'이젠나도자바','삼성당',19000);
insert into books values (19,'구기종목 정복','굿스포츠',9900);
insert into books values (20,'컬러리스트길잡이','나무수',31000);

select * from books;

select count(*) as 책권수 from books;

select count(*) from books where publisher = '삼성당';

select format(sum(price), 0) 총가격 from books; /*숫자 자릿수 표시*/

select format(avg(price), 1) 삼성당책평균가격 from books where publisher = '삼성당';

select format(sum(price), 0) from books where price >= 20000;

select max(price) as '가장 비싼', min(price) as '가장 싼' from books;

select bookName from books where publisher = '굿스포츠' or publisher = '대한미디어';

select bookName from books where publisher in ('굿스포츠', '대한미디어');

select * from books where publisher not in ('굿스포츠', '대한미디어'); 

select bookName, publisher from books where bookName like '%축구%';

select * from books where bookName like '_구%';

select * from books where price >= 20000 and bookName like '%축구%';

select * from books order by price, bookName desc;

select distinct publisher from books; /*중복제거*/

select publisher from books group by publisher; /*group by 로 중복제거 정렬되서 나옴*/

select publisher, count(bookName) from books group by publisher;

select publisher, sum(price), avg(price) from books group by publisher;

select publisher, format(max(price), 0), format(min(price), 0) from books group by publisher;

select publisher, price from books where price >= 20000 group by publisher;

select publisher, count(*) from books group by publisher having count(*) >= 2;

select publisher, max(price) from books group by publisher having count(*) >= 2;

select * from books limit 10;

select * from books limit 2, 5;

create table customer (
	custId int not null auto_increment primary key,
	name varchar(20) not null,
	address varchar(30) not null,
	phone varchar(15)
);

select * from customer;

INSERT INTO customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO customer VALUES (3, '김말숙', '대한민국 강원도', '000-7000-0001');
INSERT INTO customer VALUES (4, '손흥민', '영국 토트넘', '000-8000-0001');
INSERT INTO customer VALUES (5, '박세리', '대한민국 대전',  null);
INSERT INTO customer VALUES (6, '이순신', '대한민국 아산',  '');

select * from orders;

create table orders  (
	orderId int not null auto_increment, 
	custId int not null,
	bookId int not null,
	salePrice int not null,
	orderDate timestamp, 
	primary key(orderId), 
	foreign key(custId) references customer (custId) on update cascade on delete restrict,
	foreign key(bookId) references books (bookId) on update cascade on delete restrict
);


INSERT INTO orders VALUES (1, 1, 1, 6000, '2009-07-01'); 
INSERT INTO orders VALUES (2, 1, 3, 21000, '2018-02-03');
INSERT INTO orders VALUES (3, 2, 5, 8000, '2021-05-03'); 
INSERT INTO orders VALUES (4, 3, 6, 6000, '2020-06-04'); 
INSERT INTO orders VALUES (5, 4, 7, 20000, '2019-11-05');
INSERT INTO orders VALUES (6, 1, 2, 12000, '2021-09-07');
INSERT INTO orders VALUES (7, 4, 8, 13000, '2019-03-07');
INSERT INTO orders VALUES (8, 3, 10, 12000, '2018-07-08'); 
INSERT INTO orders VALUES (9, 2, 10, 9000, '2019-05-09'); 
INSERT INTO orders VALUES (10, 3, 11, 27000, '2020-06-15');
INSERT INTO orders VALUES (11, 2, 13, 11000, '2021-06-18');
INSERT INTO orders VALUES (12, 3, 15, 13000, '2021-08-20');
INSERT INTO orders VALUES (13, 6, 18, 19000, '2021-10-10');
INSERT INTO orders VALUES (14, 6, 16, 27000, '2021-11-20');
INSERT INTO orders VALUES (15, 3, 20, 30000, '2021-11-20');
INSERT INTO orders VALUES (16, 4, 16, 26000, '2021-11-25');
INSERT INTO orders VALUES (17, 4, 8, 13000, '2021-06-10');
INSERT INTO orders VALUES (18, 6, 8, 12000, '2021-06-10');
INSERT INTO orders VALUES (19, 2, 15, 13000, '2021-07-12');
INSERT INTO orders VALUES (20, 2, 17, 22000, '2021-10-15');

select * from customer where phone is null;

select * from customer where phone = '';

select custId, count(*), sum(salePrice) from orders group by custId;

select custId, count(*) from orders where salePrice >= 8000 group by custId having count(*) >= 4;

select custId, count(*) from orders where bookId = 2 group by custId having count(*) >= 2;

select * from customer cc, orders oo;

select cc.custId, cc.name from customer cc, orders oo group by custId;

select * from customer cc, orders oo where cc.custId = oo.custId;

select name, bookName, price from customer cc, orders oo, books bb where cc.custId = oo.custId and oo.bookId = bb.bookId;

select name, bookName, price from customer cc, orders oo, books bb where cc.custId = oo.custId and oo.bookId = bb.bookId and salePrice >= 20000;

select name, sum(price) from customer cc, orders oo, books bb where cc.custId = oo.custId and oo.bookId = bb.bookId group by cc.custId order by name;

select name, bookId from customer cc left join orders oo on cc.custId = oo.custId; 

select bookId, cc.* from customer cc right join orders oo on cc.custId = oo.custId order by bookId; 

select name, salePrice from customer cc left outer join orders oo on cc.custId = oo.custId;

select bookName, price from books where price = (select max(price) from books);

select name from customer where custId in (select custId from orders);

select name from customer where custid in (select custId from orders where bookId in (select bookId from books where publisher = '대한미디어'));

select name from customer cc, orders oo, books bb where cc.custId = oo.custId and oo.bookId = bb.bookId and publisher = '대한미디어';

select name from customer where custId not in (select custId from orders);



select count(*) from orders where custId = 1;

select bookId from orders where orderDate < '20190704' and orderDate > '2020005';

select name from customer where name like '김%아';

select custId, count(*), sum(salePrice) from orders group by custId;

select custId, count(*) from orders where salePrice >= 8000 group by custId; 

select name, bookName, price - salePrice from customer cc, orders oo, books bb where cc.custId = oo.custId and oo.bookId = bb.bookId and  name = '박지성';

select name, sum(salePrice) from customer cc, orders oo, books bb where cc.custId = oo.custId and oo.bookId = bb.bookId group by name;

select max(price - salePrice) from orders oo, books bb where oo.bookId = bb.bookId;

select name, format(avg(salePrice), 0) from customer cc, orders oo, books bb where cc.custId = oo.custId and oo.bookId = bb.bookId group by name;

select cc.custId, count(*) from customer cc, orders oo where cc.custId = oo.custId and salePrice >= 8000 group by cc.custId having count(*) >= 4;

select bookId from orders where orderDate < '2019-07-04' or orderDate > '2020-6-5';

select bookId from orders where orderDate not between '2019-07-04' and '2020-6-5';

