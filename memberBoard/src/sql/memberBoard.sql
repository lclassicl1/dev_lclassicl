-- 데이터베이스 생성
-- create database 데이터베이스명 default character set utf8;
create database board default character set utf8;

-- 계정 삭제
drop user gangnam;

-- 계정 생성 및 권한부여
create user 'gangnam'@'localhost' identified by 'asdf111';
grant all privileges on board.* to 'gangnam'@'localhost';

create user 'gangnam'@'%' identified by 'asdf111';
grant all privileges on board.* to 'gangnam'@'%';

-- 테이블 삭제
DROP TABLE IF EXISTS member;

CREATE TABLE member (
	memberno	int	NOT NULL auto_increment,
	memberid	varchar(50)	NOT NULL unique,
	password	varchar(50)	NOT NULL,
	name	varchar(50)	NOT NULL,
	email	varchar(50)	NOT NULL,
	regdate	datetime	NOT NULL,
	grade	int	NOT NULL	DEFAULT 1
) engine=innoDB default character set = utf8 ;

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`memberno`
);

alter table member add constraint member_memberid_uk 
unique(memberid);

alter table member add constraint member_grade_ck check(grade in(1,2,3,4,999);