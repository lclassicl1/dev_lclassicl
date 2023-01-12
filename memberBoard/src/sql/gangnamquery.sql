DROP TABLE IF EXISTS member;


CREATE TABLE member (
	memberno	int	NOT NULL auto_increment,
	memberid	varchar(50)	NOT NULL,
	memberpwd	varchar(50)	NOT NULL,
	membername	varchar(50)	NOT NULL,
	email	varchar(50)	NOT NULL,
	regdate	datetime	NOT NULL,
	grade	int	NOT NULL	DEFAULT 1,
    primary key (memberno)
) engine=innoDB default character set = utf8;

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`memberno`
);

-- unique 제약조건 추가 --
alter table member add constraint member_memberid_uk 
unique(memberid);

-- check 제약조건 추가 --
alter table member add constraint member_grade_ck check(grade in(1,2,3,4,999));

-- 컬럼에 주석문 추가 --
alter table member modify grade int comment '회원등급(기본1) 1(정상),2(강퇴),3(탈퇴),4(휴면),999(관리자)';




-- sample date 입력 --

insert into member(memberid, memberpwd, membername, email, regdate, grade)
values('adminid','1234','관리자','admin@test.com','2022-01-01 00:00:00','999');

insert into member(memberid, memberpwd, membername, email, regdate, grade)
values('faker','1234','이상혁','faker@naver.com','2022-07-01 00:00:00','1');

insert into member(memberid, memberpwd, membername, email, regdate, grade)
values('deft','1234','김혁규','deft@daum.net','2022-01-11 00:00:00','1');

insert into member(memberid, memberpwd, membername, email, regdate, grade)
values('keria','1234','류민석','keria@gmail.com','2022-11-11 00:00:00','1');

insert into member(memberid, memberpwd, membername, email)
values(?,?,?,?);


-- test select --
select *
from member;

-- 로그인
select *
from member
where memberid = 'faker' and memberpwd = 1234;

update member
set memberpwd = '1324'
where memberid = 'faker';

commit;


-- article drop
﻿DROP TABLE IF EXISTS article;

CREATE TABLE article (
	article_no	int	NOT NULL auto_increment primary key,
	writer_id	varchar(50)	NOT NULL,
	writer_name	varchar(50)	NOT NULL,
	title	varchar(255)	NOT NULL,
	regdate	datetime,
	moddate	datetime,
	read_cnt	int	NULL	DEFAULT 0,
	isshow	varchar(1)	NULL default 'Y'
) engine=InnoDB default character set=utf8;

-- check 제약조건 추가
ALTER TABLE article ADD CONSTRAINT  article_isshow_ck     	
check (isshow in ('Y','N'));

DROP TABLE IF EXISTS article_content;

CREATE TABLE article_content (
	article_no	int	NOT NULL primary key,
	content	text	not NULL
) engine=InnoDB default character set=utf8;


-- dummy data 입력
insert into article(writer_id, writer_name, title, regdate, moddate)
values('faker','이상혁','제곧내3','2022-07-03 00:00:00','2022-07-03 00:00:00');
insert into article(writer_id, writer_name, title, regdate, moddate)
values('keria','류민석','제곧내4','2022-07-04 00:00:00','2022-07-04 00:00:00');
insert into article(writer_id, writer_name, title, regdate, moddate)
values('deft','김혁규','제곧내5','2022-07-05 00:00:00','2022-07-05 00:00:00');
insert into article(writer_id, writer_name, title, regdate, moddate)
values('pyosik','홍창현','제곧내6','2022-07-06 00:00:00','2022-07-06 00:00:00');
insert into article(writer_id, writer_name, title, regdate, moddate)
values('faker','이상혁','제곧내7','2022-07-07 00:00:00','2022-07-07 00:00:00');
insert into article(writer_id, writer_name, title, regdate, moddate)
values('faker','이상혁','제곧내8','2022-07-08 00:00:00','2022-07-08 00:00:00');
insert into article(writer_id, writer_name, title, regdate, moddate)
values('keria','류민석','제곧내9','2022-07-09 00:00:00','2022-07-09 00:00:00');
insert into article(writer_id, writer_name, title, regdate, moddate)
values('pyosik','홍창현','제곧내10','2022-07-10 00:00:00','2022-07-10 00:00:00');



insert into article_content(article_no, content)
values(3,'제곧내');
insert into article_content(article_no, content)
values(4,'제곧내');
insert into article_content(article_no, content)
values(5,'제곧내');
insert into article_content(article_no, content)
values(6,'제곧내');
insert into article_content(article_no, content)
values(7,'제곧내');
insert into article_content(article_no, content)
values(8,'제곧내');
insert into article_content(article_no, content)
values(9,'제곧내');
insert into article_content(article_no, content)
values(10,'제곧내');




select article_no, writer_id, writer_name, title, regdate, moddate, read_cnt, isshow
from article;

select article_no, content
from article_content;

commit;

-- 전체 글 조회
select article_no, writer_id, writer_name, title, regdate, moddate, read_cnt, isshow
from article
where writer_name='이상혁'
order by regdate desc limit 0,3; -- 1페이지(게시글 3개씩 1페이지 기준)

select article_no, writer_id, writer_name, title, regdate, moddate, read_cnt, isshow
from article
order by regdate desc limit 3,3; -- 2페이지

select article_no, writer_id, writer_name, title, regdate, moddate, read_cnt, isshow
from article
order by regdate desc limit 6,3;

select article_no, writer_id, writer_name, title, regdate, moddate, read_cnt, isshow
from article
order by regdate desc limit 9,3;



