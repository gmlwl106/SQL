--DCL(Data Control Language, 데이터 제어어)

create user webdb identified by 1234; --계정 생성

grant resource, connect to webdb; --접속 권한 부여

alter user webdb identified by webdb; --계정 비밀번호 변경

drop user webdb cascade; --계정 삭제

--------------------------------------------------------------------------------
create user webdb identified by webdb;
grant resource, connect to webdb;


--DDL(Data Definition Language, 데이터 정의어)
--table 생성
create table book(
    book_id number(5),
    title varchar2(50),
    author varchar2(10),
    pub_date date
);

--칼럼 추가
alter table book add (pubs varchar2(50));

--칼럼 수정
alter table book modify (title varchar2(100));
alter table book modify (pubs varchar2(50));
alter table book rename column title to subject;

select *
from book;

--테이블 삭제
drop table book;

--테이블 이름 변경
rename book to article;

select *
from article;