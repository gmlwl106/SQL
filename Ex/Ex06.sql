create table author (
    author_id   number(10),
    author_name varchar2(100)   not null,
    author_desc varchar2(500),
    primary key (author_id)
);

--author 시퀀스 만들기
create sequence seq_author_id
increment by 1
start with 1
nocache;

insert into author
values (seq_author_id.nextval, '박경리', '토지 작가');

insert into author
values (seq_author_id.nextval, '이문열', '삼국지 작가');

insert into author
values (seq_author_id.nextval, '기안84', '웹툰 작가');

select *
from author;

--시퀀스 조회
select *
from user_sequences;

--현재 시퀀스 조회
select seq_author_id.currval
from dual;

--다음 시퀀스 조회
select seq_author_id.nextval --nextval이 실행되면 다음 시퀀스로 넘어가진다
from dual;


drop table author;

--시퀀스 삭제
drop sequence seq_author_id;

