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

--제약조건
create table author (
    author_id   number(10),
    author_name varchar2(100)   not null, --null 입력불가
    author_desc varchar2(500), --중복값 입력불가
    primary key(author_id) --PK설정
);

select *
from author;---------------------------------------------------------------------author


--DML(Data Manipulation Language, 데이터 조작어)
--레코드 추가
insert into author
values(1, '박경리', '토지 작가');

insert into author (author_id, author_name)
values(2, '이문열');

insert into author (author_id, author_name)
values(3, '기안84');

insert into author(author_id)
values(4); --author_name은 null 입력불가


create table book (
    book_id     number(10),
    title       varchar2(100)   not null,
    pubs        varchar2(100),
    pub_date    date,
    author_id   number(10),
    primary key(book_id), --pk 설정
    constraint book_fk foreign key (author_id) --fk 설정
    references author(author_id)
);

select *
from book;-----------------------------------------------------------------------book

--1, 토지, 마로니에북스, 2012-08-15, 1
insert into book
values(1, '토지', '마로니에북스', '2012-08-15', 1);

--2, 삼국지, 민음사, 2002-03-01, 2
insert into book
values(2, '삼국지', '민음사', '2002-03-01', 2);

--레코드 수정
update author
set author_desc = '삼국지 작가' 
where author_id = 2; --*where을 작성하지 않으면 전체 author.desc가 '삼국지 작가'로 수정됨*

update author
set author_desc = '웹툰 작가'
where author_id = 3;

update author
set author_name = '김경리'
    ,author_desc = '토지 작가'
where author_id = 1;

--레코드 삭제
delete from author
where author_id = 3; --*조건이 없으면 모든 데이터 삭제*
--fk키가 있을때는 연결된 것부터 먼저 삭제해야함(ex: book에서 토지를 먼저 지워야 author 1번을 지울수 있음)

delete from book;
