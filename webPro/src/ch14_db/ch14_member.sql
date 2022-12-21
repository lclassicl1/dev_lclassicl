-- mysql database 생성 --
create database chap14 default character set utf8;

-- mysql user 생성 및 권한부여 --
-- localhost인 경우 localhost에서 해당계정으로 접근 --
create user 'jspexam'@'localhost' identified by 'jsppw';
GRANT ALL privileges on chap14.* to 'jspexam'@'localhost';

-- 호스트가 %인경우 localhost 포함 모든 host에서 접근 가능하다 --
/*mysql에서는 localhost와 다른호스트틀 구분하므로 사용자 계정을 생성할때는 localhost용 계정과 외부에서 접근할때
사용할 계정을 각각 생성해주어야한다*/
create user 'jspexam'@'%' identified by 'jsppw';
GRANT ALL privileges on chap14.* to 'jspexam'@'%';

