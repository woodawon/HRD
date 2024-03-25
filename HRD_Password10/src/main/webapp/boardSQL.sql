create table board_tbl (
	idx number(6) not null primary key,
	writer varchar2(20),
	subject varchar2(255),
	content clob,
	date1 timestamp,
	crystal_date date
);

insert into board_tbl values (1, '김상일', '정보처리산업기사 쉽다', 'JSP 쉽네용', sysdate, '');
insert into board_tbl values (2, '김상일', '웹 디자인 기능사 어렵다', '제이쿼리 어렵다', sysdate, '');
insert into board_tbl values (3, '이도제', '정보처리산업기사 어렵다', 'JSP 어렵다', sysdate, '');
insert into board_tbl values (4, '이도제', '정보처리기사 쉽다.', '제이쿼리 쉽다', sysdate, '');
insert into board_tbl values (5, '박상일', '최신 머신러닝', '머신러닝어렵다', sysdate, '');
insert into board_tbl values (6, '박상일', '텐서플로우 배우자', '텐서플로우 쉽다', sysdate, '');
insert into board_tbl values (7, '강도제', '하드코딩하는 사람들', '가입하면 좋다', sysdate, '');
insert into board_tbl values (8, '나도제', '깃허브를 사용하자', '신세계', sysdate, '');
insert into board_tbl values (9, '문도제', '노는게 제일좋아', '모두모두 모여라', sysdate, '');
insert into board_tbl values (10, '지도제', '가을아', '부탁해', sysdate, '');

create table comment_tbl(
	idx number(6) not null primary key,
	writer varchar2(20),
	content clob,
	date1 timestamp,
	b_idx number(6),
	constraint fx_idx foreign key(b_idx) references board_tbl(idx)
);

insert into comment_tbl values (1, '김상일', 'Lorem ipsum dolor sit amet', sysdate, 1);
insert into comment_tbl values (2, '김상일', 'Lorem ipsum dolor sit amet', sysdate, 3);
insert into comment_tbl values (3, '이도제', 'Lorem ipsum dolor sit amet', sysdate, 5);
insert into comment_tbl values (4, '이도제', 'Lorem ipsum dolor sit amet', sysdate, 7);
insert into comment_tbl values (5, '박상일', 'Lorem ipsum dolor sit amet', sysdate, 9);
insert into comment_tbl values (6, '박상일', 'Lorem ipsum dolor sit amet', sysdate, 2);
insert into comment_tbl values (7, '강도제', 'Lorem ipsum dolor sit amet', sysdate, 3);
insert into comment_tbl values (8, '나도제', 'Lorem ipsum dolor sit amet', sysdate, 5);
insert into comment_tbl values (9, '문도제', 'Lorem ipsum dolor sit amet', sysdate, 7);
insert into comment_tbl values (10, '지도제', 'Lorem ipsum dolor sit amet', sysdate, 2);


create sequence seq_board_tbl increment by 1 start with 10 nomaxvalue nocycle nocache;
SELECT seq_board_tbl.NEXTVAL FROM DUAL; 

create sequence seq_comment_tbl increment by 1 start with 10 nomaxvalue nocycle nocache;
SELECT seq_comment_tbl.NEXTVAL FROM DUAL; 

select * from comment_tbl left join board_tbl on board_tbl.idx = comment_tbl.b_idx;

