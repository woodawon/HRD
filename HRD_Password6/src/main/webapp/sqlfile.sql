create table TBL_TEACHER_202201 (
	TEACHER_CODE char(3) not null primary key,
	TEACHER_NAME varchar2(15),
	CLASS_NAME varchar2(20),
	CLASS_PRICE number(8),
	TEACHER_REGISTER_DATE varchar2(8)
);

insert into TBL_TEACHER_202201(TEACHER_CODE, TEACHER_NAME, CLASS_NAME, CLASS_PRICE, TEACHER_REGISTER_DATE) values ('100', '이초급', '초급반', 100000, '20220101');
insert into TBL_TEACHER_202201(TEACHER_CODE, TEACHER_NAME, CLASS_NAME, CLASS_PRICE, TEACHER_REGISTER_DATE) values ('200', '김중급', '중급반', 200000, '20220102');
insert into TBL_TEACHER_202201(TEACHER_CODE, TEACHER_NAME, CLASS_NAME, CLASS_PRICE, TEACHER_REGISTER_DATE) values ('300', '박고급', '고급반', 300000, '20220103');
insert into TBL_TEACHER_202201(TEACHER_CODE, TEACHER_NAME, CLASS_NAME, CLASS_PRICE, TEACHER_REGISTER_DATE) values ('400', '정심화', '심화반', 400000, '20220104');

create table TBL_MEMBER_202201 (
	C_NO char(5) not null primary key,
	C_NAME varchar2(15),
	PHONE varchar2(11),
	ADDRESS varchar2(50),
	GRADE varchar2(6)
);

insert into TBL_MEMBER_202201(C_NO, C_NAME, PHONE, ADDRESS, GRADE) values ('10001', '홍길동', '01011112222', '서울시 강남구', '일반');
insert into TBL_MEMBER_202201(C_NO, C_NAME, PHONE, ADDRESS, GRADE) values ('10002', '장발장', '01022223333', '성남시 분당구', '일반');
insert into TBL_MEMBER_202201(C_NO, C_NAME, PHONE, ADDRESS, GRADE) values ('10003', '임꺽정', '01033334444', '대전시 유성구', '일반');
insert into TBL_MEMBER_202201(C_NO, C_NAME, PHONE, ADDRESS, GRADE) values ('20001', '성춘향', '01044445555', '부산시 서구', 'VIP');
insert into TBL_MEMBER_202201(C_NO, C_NAME, PHONE, ADDRESS, GRADE) values ('20002', '이몽룡', '01055556666', '대구시 북구', 'VIP');

create table TBL_CLASS_202201 (
	REGISTER_MONTH varchar2(6) not null,
	C_NO char(5) not null,
	CLASS_AREA varchar2(15),
	TUITION number(8),
	TEACHER_CODE char(3),
	constraints TBL_CLASS_202201_pk primary key (REGISTER_MONTH, C_NO)
);

insert into TBL_CLASS_202201(REGISTER_MONTH, C_NO, CLASS_AREA, TUITION, TEACHER_CODE) values ('202203', '10001', '서울본원', 100000, '100');
insert into TBL_CLASS_202201(REGISTER_MONTH, C_NO, CLASS_AREA, TUITION, TEACHER_CODE) values ('202203', '10002', '성남분원', 100000, '100');
insert into TBL_CLASS_202201(REGISTER_MONTH, C_NO, CLASS_AREA, TUITION, TEACHER_CODE) values ('202203', '10003', '대전본원', 200000, '200');
insert into TBL_CLASS_202201(REGISTER_MONTH, C_NO, CLASS_AREA, TUITION, TEACHER_CODE) values ('202203', '20001', '부산분원', 150000, '300');
insert into TBL_CLASS_202201(REGISTER_MONTH, C_NO, CLASS_AREA, TUITION, TEACHER_CODE) values ('202203', '20002', '대구분원', 200000, '400');

select TBL_CLASS_202201.REGISTER_MONTH, TBL_MEMBER_202201.C_NO, TBL_MEMBER_202201.C_NAME, TBL_TEACHER_202201.CLASS_NAME, TBL_CLASS_202201.CLASS_AREA, TBL_TEACHER_202201.CLASS_PRICE, TBL_MEMBER_202201.GRADE from TBL_CLASS_202201 left join TBL_MEMBER_202201 on TBL_CLASS_202201.C_NO = TBL_MEMBER_202201.C_NO left join TBL_TEACHER_202201 on TBL_CLASS_202201.TEACHER_CODE = TBL_TEACHER_202201.TEACHER_CODE;
select sum(TUITION) from TBL_CLASS_202201, TBL_TEACHER_202201  where TBL_TEACHER_202201.TEACHER_CODE = TBL_CLASS_202201.TEACHER_CODE group by TBL_CLASS_202201.TEACHER_CODE, TBL_CLASS_202201.TUITION;
select TEACHER_CODE, CLASS_NAME, TEACHER_NAME from TBL_TEACHER_202201;