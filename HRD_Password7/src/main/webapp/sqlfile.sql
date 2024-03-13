create table menu_tbl_007 (
	menu_cd varchar2(5) not null primary key,
	menu_nm varchar2(30),
	price number(8),
	menu_fg char(1)
);

insert into menu_tbl_007(menu_cd, menu_nm, price, menu_fg) values ('10001', '아메리카노', 3600, '0');
insert into menu_tbl_007(menu_cd, menu_nm, price, menu_fg) values ('10002', '카페 라떼', 4100, '0');
insert into menu_tbl_007(menu_cd, menu_nm, price, menu_fg) values ('10003', '카페 모카', 4600, '0');
insert into menu_tbl_007(menu_cd, menu_nm, price, menu_fg) values ('10004', '카라멜 마키아또', 5100, '0');
insert into menu_tbl_007(menu_cd, menu_nm, price, menu_fg) values ('10005', '호지 티 라떼', 5400, '1');
insert into menu_tbl_007(menu_cd, menu_nm, price, menu_fg) values ('10006', '그린 티 라떼', 5400, '1');
insert into menu_tbl_007(menu_cd, menu_nm, price, menu_fg) values ('10007', '차이 티 라떼', 4600, '1');

create table size_tbl_007 (
	size_cd varchar2(2) not null primary key,
	size_nm varchar2(20),
	plus_price number(4)
);

insert into size_tbl_007(size_cd, size_nm, plus_price) values ('S1', 'short', 0);
insert into size_tbl_007(size_cd, size_nm, plus_price) values ('T1', 'tall', 500);
insert into size_tbl_007(size_cd, size_nm, plus_price) values ('G1', 'grande', 1000);
insert into size_tbl_007(size_cd, size_nm, plus_price) values ('V1', 'venti', 1500);

create table store_tbl_007 (
	store_cd varchar2(4) not null primary key,
	store_nm varchar2(20),
	store_loc varchar2(2),
	open_date date
);

insert into store_tbl_007(store_cd, store_nm, store_loc, open_date) values ('A001', '동부이촌동점', '0', '20181001');
insert into store_tbl_007(store_cd, store_nm, store_loc, open_date) values ('A002', '이태원점', '0', '20181101');
insert into store_tbl_007(store_cd, store_nm, store_loc, open_date) values ('A003', '서울타워점', '0', '20181201');
insert into store_tbl_007(store_cd, store_nm, store_loc, open_date) values ('B004', '소공동점', '1', '20180101');
insert into store_tbl_007(store_cd, store_nm, store_loc, open_date) values ('B005', '명동길점', '1', '20180201');
insert into store_tbl_007(store_cd, store_nm, store_loc, open_date) values ('B006', '충무로역점', '1', '20180301');

create table sale_tbl_003 (
	sale_ymd varchar2(8) not null,
	sale_no varchar2(4) not null,
	store_cd varchar2(4),
	menu_cd varchar2(5),
	size_cd varchar2(2),
	sale_cnt number(3),
	pay_type varchar2(2),
	sale_fg varchar2(2),
	constraints sale_tbl_003_pk primary key (sale_ymd, sale_no),
	constraints sales_tbl_003_fk1 foreign key(store_cd) references store_tbl_007(store_cd),
	constraints sales_tbl_003_fk2 foreign key(menu_cd) references menu_tbl_007(menu_cd),
	constraints sales_tbl_003_fk3 foreign key(size_cd) references size_tbl_007(size_cd)
);

insert into sale_tbl_003(sale_ymd, sale_no, store_cd, menu_cd, size_cd, sale_cnt, pay_type, sale_fg) values ('20190429', '0001', 'A001', '10001', 'T1', 4, '02', '1');
insert into sale_tbl_003(sale_ymd, sale_no, store_cd, menu_cd, size_cd, sale_cnt, pay_type, sale_fg) values ('20190429', '0002', 'B004', '10002', 'S1', 1, '02', '1');
insert into sale_tbl_003(sale_ymd, sale_no, store_cd, menu_cd, size_cd, sale_cnt, pay_type, sale_fg) values ('20190429', '0003', 'B004', '10006', 'S1', 1, '02', '1');
insert into sale_tbl_003(sale_ymd, sale_no, store_cd, menu_cd, size_cd, sale_cnt, pay_type, sale_fg) values ('20190429', '0004', 'A002', '10006', 'T1', 1, '01', '1');
insert into sale_tbl_003(sale_ymd, sale_no, store_cd, menu_cd, size_cd, sale_cnt, pay_type, sale_fg) values ('20190429', '0005', 'B005', '10001', 'G1', 1, '01', '1');
insert into sale_tbl_003(sale_ymd, sale_no, store_cd, menu_cd, size_cd, sale_cnt, pay_type, sale_fg) values ('20190429', '0006', 'B005', '10003', 'S1', 2, '02', '1');
insert into sale_tbl_003(sale_ymd, sale_no, store_cd, menu_cd, size_cd, sale_cnt, pay_type, sale_fg) values ('20190429', '0007', 'A003', '10002', 'T1', 3, '02', '1');
insert into sale_tbl_003(sale_ymd, sale_no, store_cd, menu_cd, size_cd, sale_cnt, pay_type, sale_fg) values ('20190429', '0008', 'B006', '10001', 'T1', 4, '02', '1');

select sale_tbl_003.sale_ymd as one, sale_tbl_003.sale_no as two, store_tbl_007.store_nm as three, menu_tbl_007.menu_nm as four, size_tbl_007.size_nm as five, sale_tbl_003.sale_cnt as six, sale_tbl_003.pay_type as seven, sale_tbl_003.sale_fg as eight, menu_tbl_007.price as nine, size_tbl_007.plus_price as ten  from sale_tbl_003 left join store_tbl_007 on sale_tbl_003.store_cd = store_tbl_007.store_cd left join menu_tbl_007  on menu_tbl_007.menu_cd = sale_tbl_003.menu_cd left join size_tbl_007 on size_tbl_007.size_cd = sale_tbl_003.size_cd;
