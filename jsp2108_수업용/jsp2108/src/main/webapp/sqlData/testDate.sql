select sysdate(), sysdate() + 60;

select localtime(), localtime() + 60;

select now() + 60, now();

select curdate() as '오늘 날짜';

select year(now()), month(now()), day(now());

select concat(year(now()), '년 ', month(now()), '월 ' , day(now()), '일');

select nickName, concat(year(wDate), '년 ', month(wDate), '월 ' , day(wDate), '일') from board order by idx desc; 

select nickName, concat(year(wDate), '년 ', month(wDate), '월 ' , day(wDate), '일') from board where day(now()) - 2 = day(wDate) order by idx desc; 

select nickName, concat(year(wDate), '년 ', month(wDate), '월 ' , day(wDate), '일') from board where curdate() - 2 = concat(year(wDate), month(wDate) , day(wDate)) order by idx desc;

--요일 숫자로 나옴
select dayofweek(now());

--영문 요일
select dayname(now());

select last_day("2021-02-01");

select last_day(now());

select nickName, last_day(wDate) from board;

select date_format(now(), "%Y, %y, %a, %b");

select date_format("2021-02-01", "%c, %m, %M, %d, %e");

select timestampdiff(day, '2021-12-31', now());

select timestampdiff(day, now(), '2021-12-31');

select datediff(now(), '2021-12-31');

select date_add(now(), interval 1 month);

select date_add(now(), interval 2 month);

select nickName, wDate from board where wDate < date_add(now(), interval -48 hour);

select nickName, wDate from board where wDate < date_add(now(), interval -2 day);

select date_sub(now(), interval 1 hour);

select * from board where idx < 20 order by idx desc limit 1;
