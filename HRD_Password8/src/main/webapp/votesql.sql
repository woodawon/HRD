create table tbl_vote202005 (
	V_JUMIN char(13) not null primary key,
	V_NAME varchar2(20),
	M_NO char(1),
	V_TIME char(4),
	V_AREA char(20),
	V_CONFIRM char(1)
);

insert into tbl_vote202005 values('99010110001', '김유권', '1', '0930', '제1투표장', 'N');
insert into tbl_vote202005 values('89010110002', '이유권', '2', '0930', '제1투표장', 'N');
insert into tbl_vote202005 values('69010110003', '박유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote202005 values('59010110004', '홍유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote202005 values('79010110005', '초유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote202005 values('89010110006', '최유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote202005 values('59010110007', '지유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote202005 values('49010110008', '장유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote202005 values('79010110009', '정유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote202005 values('89010110010', '강유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote202005 values('99010110011', '신유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote202005 values('79010110012', '오유권', '1', '1330', '제1투표장', 'Y');
insert into tbl_vote202005 values('69010110013', '현유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote202005 values('89010110014', '황유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote202005 values('99010110015', '유유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote202005 values('79010110016', '한유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote202005 values('89010110017', '운유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote202005 values('99010110018', '말유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote202005 values('99010110019', '구구권', '5', '1330', '제2투표장', 'Y');
insert into tbl_vote202005 values('79010110020', '황유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote202005 values('69010110021', '배유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote202005 values('79010110022', '지유권', '1', '1330', '제2투표장', 'Y');
insert into tbl_vote202005 values('99010110023', '고유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote202005 values('59010110024', '권유권', '1', '1330', '제2투표장', 'Y');

create table tbl_member_202005 (
	M_NO char(1) not null primary key,
	M_NAME varchar2(20),
	P_CODE char(2),
	P_SCHOOL char(1),
	M_JUMIN char(13),
	M_CITY varchar2(20)
);

insert into tbl_member_202005 values ('1', '김후보', 'P1', '1', '6603011999991', '수선화동');
insert into tbl_member_202005 values ('2', '이후보', 'P2', '3', '5503011999992', '민들레동');
insert into tbl_member_202005 values ('3', '박후보', 'P3', '2', '7703011999993', '나팔꽃동');
insert into tbl_member_202005 values ('4', '조후보', 'P4', '2', '8803011999994', '진달래동');
insert into tbl_member_202005 values ('5', '최후보', 'P5', '3', '9903011999995', '개나리동');


create table tbl_party_202005 (
	P_CODE char(2) not null primary key,
	P_NAME varchar2(20),
	P_INDATE date,
	P_READER varchar2(20),
	P_TEL1 char(3),
	P_TEL2 char(4),
	P_TEL3 char(4)
);

insert into tbl_party_202005 values ('P1', 'A정당', '20100101', '위대표', '02', '1111', '0001');
insert into tbl_party_202005 values ('P2', 'B정당', '20100201', '명대표', '02', '1111', '0002');
insert into tbl_party_202005 values ('P3', 'C정당', '20100301', '기대표', '02', '1111', '0003');
insert into tbl_party_202005 values ('P4', 'D정당', '20100401', '옥대표', '02', '1111', '0004');
insert into tbl_party_202005 values ('P5', 'E정당', '20100501', '임대표', '02', '1111', '0005');

select tbl_member_202005.M_NO as mno, tbl_member_202005.M_NAME as mname, tbl_party_202005.P_NAME as pname, tbl_member_202005.P_SCHOOL as pschool, tbl_member_202005.M_JUMIN as mjumin, tbl_member_202005.M_CITY as mcity, tbl_party_202005.P_TEL1 as tel1, tbl_party_202005.P_TEL2 as tel2, tbl_party_202005.P_TEL3 as tel3  from tbl_member_202005 left join tbl_party_202005 on tbl_member_202005.P_CODE = tbl_party_202005.P_CODE;

select tbl_member_202005.M_NO as mno, tbl_member_202005.M_NAME as mname, count(*) as c from tbl_vote202005 left join tbl_member_202005 on tbl_vote202005.M_NO = tbl_member_202005.M_NO  group by tbl_member_202005.M_NO, tbl_member_202005.M_NAME order by c desc;

