create table TBL_REGISTER (
	NO char(1) not null primary key,
	Name varchar2(20) not null,
	Code char(2),
	School char(1),
	Jumin char(13),
	Major varchar2(20)
);

insert into TBL_REGISTER (NO, Name, Code, School, Jumin, Major) values ('1', '강감찬', 'P1', '1', '0403153111111', '전기3-1');
insert into TBL_REGISTER (NO, Name, Code, School, Jumin, Major) values ('2', '유관순', 'P2', '3', '0405084222222', '디자인3-4');
insert into TBL_REGISTER (NO, Name, Code, School, Jumin, Major) values ('3', '이율곡', 'P3', '2', '0408243333333', '전자3-6');
insert into TBL_REGISTER (NO, Name, Code, School, Jumin, Major) values ('4', '이순신', 'P4', '4', '0410023444444', '자동차3-7');
insert into TBL_REGISTER (NO, Name, Code, School, Jumin, Major) values ('5', '김연아', 'P5', '4', '0411054555555', '건축3-9');

create table TBL_PARTNER (
	P_CODE char(2) not null primary key,
	P_CLASS varchar2(10),
	P_RDATE date,
	P_PARTNER varchar2(20) not null,
	P_TEL1 char(3),
	P_TEL2 char(4),
	P_TEL3 char(4)
);

insert into TBL_PARTNER (P_CODE, P_CLASS, P_RDATE, P_PARTNER, P_TEL1, P_TEL2, P_TEL3) values ('P1', '1반', '2021-06-01', '김명희', '010', '1111', '1111');
insert into TBL_PARTNER (P_CODE, P_CLASS, P_RDATE, P_PARTNER, P_TEL1, P_TEL2, P_TEL3) values ('P2', '4반', '2021-06-01', '김선희', '010', '2222', '2222');
insert into TBL_PARTNER (P_CODE, P_CLASS, P_RDATE, P_PARTNER, P_TEL1, P_TEL2, P_TEL3) values ('P3', '6반', '2021-06-02', '이명석', '010', '3333', '3333');
insert into TBL_PARTNER (P_CODE, P_CLASS, P_RDATE, P_PARTNER, P_TEL1, P_TEL2, P_TEL3) values ('P4', '7반', '2021-06-02', '서한솔', '010', '4444', '4444');
insert into TBL_PARTNER (P_CODE, P_CLASS, P_RDATE, P_PARTNER, P_TEL1, P_TEL2, P_TEL3) values ('P5', '9반', '2021-06-02', '정미경', '010', '5555', '5555');

create table TBL_VOTE (
	v_jumin char(13) not null primary key,
	v_name varchar2(20) not null,
	choice_no char(1),
	v_time char(4),
	v_area varchar2(30),
	v_confirm char(1)
);

insert into tbl_vote values('0301013000001', '김길동', '2', '0930', '제1투표소', 'N');
insert into tbl_vote values('0301014000002', '이미희', '2', '0930', '제1투표소', 'N');
insert into tbl_vote values('0401013000003', '박한길', '2', '0940', '제1투표소', 'Y');
insert into tbl_vote values('0401014000004', '홍미화', '2', '0940', '제1투표소', 'Y');
insert into tbl_vote values('0301013000005', '조민규', '2', '0950', '제1투표소', 'Y');
insert into tbl_vote values('0403014000006', '최미자', '2', '1000', '제1투표소', 'Y');
insert into tbl_vote values('0504013000007', '지창호', '4', '1000', '제1투표소', 'Y');
insert into tbl_vote values('0501014000008', '장미라', '4', '1030', '제1투표소', 'Y');
insert into tbl_vote values('0401014000010', '정문호', '4', '1030', '제1투표소', 'Y');
insert into tbl_vote values('0301013000011', '강찬희', '4', '1100', '제1투표소', 'Y');
insert into tbl_vote values('0401014000012', '신진규', '4', '1100', '제2투표소', 'Y');
insert into tbl_vote values('0401013000013', '오원희', '3', '1130', '제2투표소', 'Y');
insert into tbl_vote values('0301013000015', '현명석', '3', '1130', '제2투표소', 'Y');
insert into tbl_vote values('0401014000016', '왕진희', '3', '1200', '제2투표소', 'Y');
insert into tbl_vote values('0501013000017', '유명환', '3', '1200', '제2투표소', 'Y');
insert into tbl_vote values('0301014000018', '한국인', '3', '1230', '제2투표소', 'Y');
insert into tbl_vote values('0301014000019', '문무생', '1', '1230', '제2투표소', 'Y');
insert into tbl_vote values('0401014000021', '양귀비', '1', '1330', '제2투표소', 'Y');
insert into tbl_vote values('0401054000022', '구본길', '1', '1330', '제2투표소', 'Y');
insert into tbl_vote values('0301013001001', '진보라', '1', '1430', '제2투표소', 'Y');
insert into tbl_vote values('0301013023001', '한유진', '5', '1430', '제2투표소', 'Y');
insert into tbl_vote values('0301013022002', '조조조', '5', '1530', '제3투표소', 'Y');

