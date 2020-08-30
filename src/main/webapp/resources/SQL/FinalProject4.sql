SELECT  'DROP TABLE ' || object_name || ' CASCADE CONSTRAINTS;'
FROM    user_objects
WHERE   object_type = 'TABLE';

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------- sys 에서 작업 ---------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
---- *** FinalProject *** ----
create user finalproject4 identified by eclass
default tablespace users;

grant connect, resource, unlimited tablespace to finalproject4;
grant create view to finalproject4;

-- 현재 오라클 서버에 존재하는 모든 오라클 계정을 조회해본다.
select *
from dba_users;


-- 계정 삭제 drop user finalproject cascade;

alter user finalorauser4 IDENTIFIED by eclass;

CREATE USER finalorauser4 IDENTIFIED BY eclass 
DEFAULT TABLESPACE USERS;
--계정명, 암호, 저장공간 부여
GRANT CONNECT, RESOURCE TO finalorauser4;
--ROLE부여
GRANT UNLIMITED TABLESPACE TO finalorauser4;
--TABLESPACE 부여

grant create session to finalproject4;
grant create table to finalproject4;
--------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------

----------------------------------- 공연 테이블 - Show -----------------------------------
-- 카테고리 테이블
drop table yes_show_category cascade constraints purge;
create table yes_show_category
(category_id    number(10)      not null    -- 카테고리 코드
,category_name  varchar2(20)    not null    -- 카테고리 명
,constraint PK_category_id primary key (category_id)
);

select category_name
from yes_show_category
where category_id = 1;

drop sequence seq_show_category;
create sequence seq_show_category
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into yes_show_category(category_id, category_name)
values(1,'클래식');
insert into yes_show_category(category_id, category_name)
values(2,'콘서트');
insert into yes_show_category(category_id, category_name)
values(3,'뮤지컬');
insert into yes_show_category(category_id, category_name)
values(4,'연극');
insert into yes_show_category(category_id, category_name)
values(5,'전시');
insert into yes_show_category(category_id, category_name)
values(6,'아동');
commit;

-- 세부 카테고리 테이블
drop table yes_show_category_detail cascade constraints purge;
create table yes_show_category_detail
(category_detail_id     number(10)  not null    -- 세부 카테고리 코드
,category_id            number(10)  not null    -- 카테고리 코드(FK)
,category_detail_name   varchar2(30)  not null    -- 세부카테고리명
,constraint PK_category_detail_id primary key (category_detail_id)
,constraint FK_category_id foreign key(category_id) references yes_show_category(category_id) on delete cascade
);

--alter table yes_show_category_detail modify(category_detail_name varchar2(30)); 

drop sequence seq_show_category_detail;
create sequence seq_show_category_detail
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *from yes_show_category_detail order by category_detail_id;  

insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 1, '전체보기');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 1, '클래식');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 1, '발레/무용');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 1, '국악');

insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 2, '전체보기');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 2, '국내뮤지션');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 2, '해외뮤지션');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 2, '페스티벌');

insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 3, '전체보기');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 3, '라이선스');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 3, '오리지널');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 3, '창작');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 3, '넌버벌퍼포먼스');

insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 4, '전체보기');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 4, '대학로');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 4, '기타지역');

insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 5, '전체보기');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 5, '전시');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 5, '체험/행사');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 5, '워터파크/스파');

insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 6, '전체보기');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 6, '뮤지컬');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 6, '연극');
insert into yes_show_category_detail(category_detail_id, category_id, category_detail_name)
values(seq_show_category_detail.nextval, 6, '기타');

commit;







---테이블 드롭
drop table prod cascade constraints purge;

create table prod
(prod_id number                     --공연정보코드
,fk_category_id number              --카테고리코드
,fk_category_detail_id number       --세부카테고리코드
,prod_title varchar2(300)           --공연명
,prod_img varchar2(300)             --대표이미지
,prod_detail_img varchar2(300)      --상세이미지
,date_start     date             -- 공연시작날짜
,date_end       date             -- 공연종료날짜
,info_open_date date                --티켓오픈일시
,info_close_date date               --티켓마감일시
,info_rev_status number             --예매가능상태
,info_grade varchar2(50)            --관람등급
,info_run_time varchar2(20)         --관람시간
,info_qnty number default 0         --판매량
,map_id number               --맵 코드 
,constraint PK_prod_id primary key (prod_id)
,constraint FK_category_id_prod foreign key(fk_category_id) references yes_show_category(category_id)
,constraint FK_category_detail_id foreign key(fk_category_detail_id) references yes_show_category_detail(category_detail_id)
--,constraint FK_map_id foreign key(map_id) references by yes_show_map(map_id)
);

--ALTER TABLE prod DROP COLUMN map_id;
--ALTER TABLE prod ADD(prod_discount number);

alter table prod ADD PROD_DISCOUNT varchar2(3) default '0';
update prod set prod_discount = '30' where prod_id = 5;
alter table prod drop column prod_discount;

---prod 테이블 셀렉트
select *
from prod 
order by fk_category_detail_id;

update prod set date_start = info_open_date + 7, date_end = info_close_date + 7;


insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(1,1,2,'썸머클래식 Summer Classics','classic_01m.jpg','classic_01L.jpg',to_date('2020/06/01','yyyy/mm/dd'),to_date('2020/09/01','yyyy/mm/dd'),1,'12세 이상','100분',default);
--세종문화회관 M씨어터
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(2,1,2,'피들스 스트링 앙상블','classic_02m.jpg','classic_02L.jpg',to_date('2020/08/01','yyyy/mm/dd'),to_date('2020/08/01','yyyy/mm/dd'),1,'7세 이상','75분',default);
--광림아트센터 장천홀
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(3,1,2,'2020 교향악축제','classic_03m.jpg','classic_03L.jpg',to_date('2020/08/09','yyyy/mm/dd'),to_date('2020/08/09','yyyy/mm/dd'),1,'8세 이상','120분',default);
--예술의전당 콘서트홀
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(4,1,2,'어니스트 필하모닉 오케스트라 제1회 정기연주회','classic_04m.jpg','classic_04L.jpg',to_date('2020/08/08','yyyy/mm/dd'),to_date('2020/08/08','yyyy/mm/dd'),1,'8세 이상','95분',default);
--광림아트센터 장천홀
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(5,1,2,'오르간 오딧세이','classic_05m.jpg','classic_05L.jpg',to_date('2020/07/28','yyyy/mm/dd'),to_date('2020/12/22','yyyy/mm/dd'),1,'6세 이상','70분',default);
--롯데 콘서트홀
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(6,1,2,'57회 정기공연 <토스카>','classic_06m.jpg','classic_06L.jpg',to_date('2020/11/11','yyyy/mm/dd'),to_date('2020/11/15','yyyy/mm/dd'),1,'7세 이상','70분',default);
--세종문화회관 대극장
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(7,1,3,'레드 슈즈','classic_07m.jpg','classic_07L.jpg',to_date('2020/09/04','yyyy/mm/dd'),to_date('2020/09/05','yyyy/mm/dd'),1,'8세 이상','120분',default);
--예술의전당 CJ토월극장
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(8,1,2,'서울시오페라단 2020 <세비야의 이발사>','classic_08m.jpg','classic_08L.jpg',to_date('2020/08/18','yyyy/mm/dd'),to_date('2020/08/22','yyyy/mm/dd'),1,'5세 이상','150분',default);
--세종문화회관 M씨어터
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(9,1,2,'토요일 오후의 클래식','classic_09m.jpg','classic_09L.jpg',to_date('2020/01/04','yyyy/mm/dd'),to_date('2020/12/19','yyyy/mm/dd'),1,'성인','120분',default);
--kt chamberhall
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(10,1,2,'파이낸셜뉴스 창간 20주년 기념 음악회','classic_10m.jpg','classic_10L.jpg',to_date('2020/07/31','yyyy/mm/dd'),to_date('2020/07/31','yyyy/mm/dd'),1,'7세 이상','120분',default);
--롯데 콘서트홀

commit;


insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(11,2,6,'가을방학 정규 4집 발매 기념 공연[세상은 한 장의 손수건]','concert_01m.jpg','concert_01L.jpg',to_date('2020/06/01','yyyy/mm/dd'),to_date('2020/09/01','yyyy/mm/dd'),1,'12세 이상','100분',default);
--노들섬 라이브 하우스
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(12,2,6,'2020 WILD KARD IN SEOUL','concert_02m.jpg','concert_02L.jpg',to_date('2020/08/01','yyyy/mm/dd'),to_date('2020/08/01','yyyy/mm/dd'),1,'7세 이상','75분',default);
--노들섬 라이브 하우스
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(13,2,6,'2020 DMZPOP DRIVE IN CONECERT in CHOELWON','concert_03m.jpg','concert_03L.jpg',to_date('2020/08/09','yyyy/mm/dd'),to_date('2020/08/09','yyyy/mm/dd'),1,'8세 이상','120분',default);
--김화생활체육공원 특설무대
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(14,2,6,'SURL concert <Ah, ah, What can I do?>','concert_04m.jpg','concert_04L.jpg',to_date('2020/08/08','yyyy/mm/dd'),to_date('2020/08/08','yyyy/mm/dd'),1,'8세 이상','95분',default);
--노들섬 라이브 하우스
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(15,2,6,'팬텀싱어3 콘서트','concert_05m.jpg','concert_05L.jpg',to_date('2020/07/28','yyyy/mm/dd'),to_date('2020/12/22','yyyy/mm/dd'),1,'6세 이상','70분',default);
--부산 벡스코 제1전시장 1홀
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(16,2,8,'그랜드 민트 페스티벌2020<공식티켓>','concert_06m.jpg','concert_06L.jpg',to_date('2020/11/11','yyyy/mm/dd'),to_date('2020/11/15','yyyy/mm/dd'),1,'7세 이상','70분',default);
--세종문화회관 대극장
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(17,2,6,'팬타스틱 팬미팅 콘서트','concert_07m.jpg','concert_07L.jpg',to_date('2020/09/04','yyyy/mm/dd'),to_date('2020/09/05','yyyy/mm/dd'),1,'8세 이상','120분',default);
--노들섬 라이브 하우스
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(18,2,6,'포레스텔라 콘서트 <넬라판타지아>','concert_08m.jpg','concert_08L.jpg',to_date('2020/08/18','yyyy/mm/dd'),to_date('2020/08/22','yyyy/mm/dd'),1,'5세 이상','150분',default);
--세종문화회관 M씨어터
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(19,2,7,'엔니오 모리꼬네 시네콘서트','concert_09m.jpg','concert_09L.jpg',to_date('2020/01/04','yyyy/mm/dd'),to_date('2020/12/19','yyyy/mm/dd'),1,'성인','120분',default);
--예술의전당 오페라극장
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(20,2,8,'그린플러그드 경주 2020','concert_10m.jpg','concert_10L.jpg',to_date('2020/07/31','yyyy/mm/dd'),to_date('2020/07/31','yyyy/mm/dd'),1,'7세 이상','120분',default);
--롯데 콘서트홀

commit;





insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(21,3,10,'뮤지컬 [라 루미에르]','musical_01m.jpg','musical_01L.jpg',to_date('2020/06/01','yyyy/mm/dd'),to_date('2020/09/01','yyyy/mm/dd'),1,'12세 이상','100분',default);
--대학로 유니플렉스 2관
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(22,3,12,'뮤지컬 <머더발라드>','musical_02m.jpg','musical_02L.jpg',to_date('2020/08/01','yyyy/mm/dd'),to_date('2020/08/01','yyyy/mm/dd'),1,'7세 이상','75분',default);
--세종문화회관 S씨어터
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(23,3,12,'뮤지컬<더 모먼트>','musical_03m.jpg','musical_03L.jpg',to_date('2020/08/09','yyyy/mm/dd'),to_date('2020/08/09','yyyy/mm/dd'),1,'8세 이상','120분',default);
--대학로 유니플렉스 2관
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(24,3,10,'뮤지컬<베르테르>','musical_04m.jpg','musical_04L.jpg',to_date('2020/08/08','yyyy/mm/dd'),to_date('2020/08/08','yyyy/mm/dd'),1,'8세 이상','95분',default);
--광림아트센터 BBCH홀
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(25,3,11,'뮤지컬<캣츠> 40주년 내한공연 - 서울','musical_05m.jpg','musical_05L.jpg',to_date('2020/07/28','yyyy/mm/dd'),to_date('2020/12/22','yyyy/mm/dd'),1,'6세 이상','70분',default);
--샤롯데 씨어터
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(26,3,11,'뮤지컬 <오페라의 유령> 월드투어','musical_06m.jpg','musical_06L.jpg',to_date('2020/11/11','yyyy/mm/dd'),to_date('2020/11/15','yyyy/mm/dd'),1,'7세 이상','70분',default);
--블루스퀘어 인터파크홀
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(27,3,10,'뮤지컬 <어쩌면 해피엔딩> 2020','musical_07m.jpg','musical_07L.jpg',to_date('2020/09/04','yyyy/mm/dd'),to_date('2020/09/05','yyyy/mm/dd'),1,'8세 이상','120분',default);
--예스24스테이지 1관
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(28,3,10,'뮤지컬 펀홈(FUN HOME)','musical_08m.jpg','musical_08L.jpg',to_date('2020/08/18','yyyy/mm/dd'),to_date('2020/08/22','yyyy/mm/dd'),1,'5세 이상','150분',default);
--동국대학교 이해랑 예술극장
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(29,3,12,'Musical 유앤잇','musical_09m.jpg','musical_09L.jpg',to_date('2020/01/04','yyyy/mm/dd'),to_date('2020/12/19','yyyy/mm/dd'),1,'성인','120분',default);
--대학로 드림아트센터 2관
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(30,3,10,'뮤지컬 <브로드웨이42번가>','musical_10m.jpg','musical_10L.jpg',to_date('2020/07/31','yyyy/mm/dd'),to_date('2020/07/31','yyyy/mm/dd'),1,'7세 이상','120분',default);
--부산 소향씨어터 신한카드홀

commit;







insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(31,4,14,'연극 [라스트 세션] Last Session','theater_01m.jpg','theater_01L.jpg',to_date('2020/06/01','yyyy/mm/dd'),to_date('2020/09/01','yyyy/mm/dd'),1,'12세 이상','100분',default);
--예스24스테이지 3관
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(32,4,15,'2020 밀양공연예술축제 [한 여름 밤의 꿈]','theater_02m.jpg','theater_02L.jpg',to_date('2020/08/01','yyyy/mm/dd'),to_date('2020/08/01','yyyy/mm/dd'),1,'7세 이상','75분',default);
--밀양아리랑아트센터 대극장
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(33,4,15,'연극 [연애하기좋은날]','theater_03m.jpg','theater_03L.jpg',to_date('2020/08/09','yyyy/mm/dd'),to_date('2020/08/09','yyyy/mm/dd'),1,'8세 이상','120분',default);
--BNK부산은행 조은극장 1관
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(34,4,15,'레미제라블','theater_04m.jpg','theater_04L.jpg',to_date('2020/08/08','yyyy/mm/dd'),to_date('2020/08/08','yyyy/mm/dd'),1,'8세 이상','95분',default);
--예술의전당 CJ 토월극장
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(35,4,15,'세종시문화재단 2020 공연장상주 단체 페스티벌','theater_05m.jpg','theater_05L.jpg',to_date('2020/07/28','yyyy/mm/dd'),to_date('2020/12/22','yyyy/mm/dd'),1,'6세 이상','70분',default);
--세종시문화예술회관
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(36,4,14,'2020 대한민국소극장 열전연극[인간의 무늬]','theater_06m.jpg','theater_06L.jpg',to_date('2020/11/11','yyyy/mm/dd'),to_date('2020/11/15','yyyy/mm/dd'),1,'7세 이상','70분',default);
--구미 소극장[공터_다]
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(37,4,14,'연극 [미래의 여름]','theater_07m.jpg','theater_07L.jpg',to_date('2020/09/04','yyyy/mm/dd'),to_date('2020/09/05','yyyy/mm/dd'),1,'8세 이상','120분',default);
--대학로 나온씨어터
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(38,4,14,'연극 [미스터얼간이]','theater_08m.jpg','theater_08L.jpg',to_date('2020/08/18','yyyy/mm/dd'),to_date('2020/08/22','yyyy/mm/dd'),1,'5세 이상','150분',default);
--BNK부산은행조은극장 2관
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(39,4,15,'나의 PS 파트너','theater_09m.jpg','theater_09L.jpg',to_date('2020/01/04','yyyy/mm/dd'),to_date('2020/12/19','yyyy/mm/dd'),1,'성인','120분',default);
--대구 여우별아트홀
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(40,4,14,'코믹추리극 행오버 - 해피씨어터','theater_10m.jpg','theater_10L.jpg',to_date('2020/07/31','yyyy/mm/dd'),to_date('2020/07/31','yyyy/mm/dd'),1,'7세 이상','120분',default);
--대학로 해피씨어터

commit;






insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(41,5,17,'완전한세상','exhibition_01m.jpg','exhibition_01L.jpg',to_date('2020/06/01','yyyy/mm/dd'),to_date('2020/09/01','yyyy/mm/dd'),1,'12세 이상','100분',default);
--뮤지엄 다
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(42,5,17,'[세종/전시] 브릭라이브 전시 체험','exhibition_02m.jpg','exhibition_02L.jpg',to_date('2020/08/01','yyyy/mm/dd'),to_date('2020/08/01','yyyy/mm/dd'),1,'7세 이상','75분',default);
--밀양아리랑아트센터 대극장
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(43,5,17,'암흑카페 1인 이용권','exhibition_03m.jpg','exhibition_03L.jpg',to_date('2020/08/09','yyyy/mm/dd'),to_date('2020/08/09','yyyy/mm/dd'),1,'8세 이상','120분',default);
--신촌 암흑카페
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(44,5,19,'양양 쏠비치 서핑스쿨 이용권','exhibition_04m.jpg','exhibition_04L.jpg',to_date('2020/08/08','yyyy/mm/dd'),to_date('2020/08/08','yyyy/mm/dd'),1,'8세 이상','95분',default);
--양양 쏠비치 아쿠아월드
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(45,5,18,'더에천 두번째 에피소드 삼강명탐정:죽은자들의 원혼','exhibition_05m.jpg','exhibition_05L.jpg',to_date('2020/07/28','yyyy/mm/dd'),to_date('2020/12/22','yyyy/mm/dd'),1,'6세 이상','70분',default);
--예천 삼강문화단지 내
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(46,5,18,'2020 경기전 왕과의 산책','exhibition_06m.jpg','exhibition_06L.jpg',to_date('2020/11/11','yyyy/mm/dd'),to_date('2020/11/15','yyyy/mm/dd'),1,'7세 이상','70분',default);
--전주학옥마을 경기전
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(47,5,19,'거제오션어드벤처','exhibition_07m.jpg','exhibition_07L.jpg',to_date('2020/09/04','yyyy/mm/dd'),to_date('2020/09/05','yyyy/mm/dd'),1,'8세 이상','120분',default);
--거제오션어드벤처
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(48,5,18,'경복궁의 인문학산책','exhibition_08m.jpg','exhibition_08L.jpg',to_date('2020/08/18','yyyy/mm/dd'),to_date('2020/08/22','yyyy/mm/dd'),1,'5세 이상','150분',default);
--경복궁
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(49,5,19,'경주대명아쿠아월드','exhibition_09m.jpg','exhibition_09L.jpg',to_date('2020/01/04','yyyy/mm/dd'),to_date('2020/12/19','yyyy/mm/dd'),1,'8세 이상','120분',default);
--경주대명아쿠아월드
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(50,5,18,'국가대표궁궐,경복궁','exhibition_10m.jpg','exhibition_10L.jpg',to_date('2020/07/31','yyyy/mm/dd'),to_date('2020/07/31','yyyy/mm/dd'),1,'7세 이상','120분',default);
--경복궁

commit;




insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(51,6,21,'가족뮤지컬 [인어공주]','infant_01m.jpg','infant_01L.jpg',to_date('2020/06/01','yyyy/mm/dd'),to_date('2020/09/01','yyyy/mm/dd'),1,'12세 이상','100분',default);
--대백프라임홀
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(52,6,22,'2020 예술의전당 어린이 가족 페스티벌 [에스메의 여름]','infant_02m.jpg','infant_02L.jpg',to_date('2020/08/01','yyyy/mm/dd'),to_date('2020/08/01','yyyy/mm/dd'),1,'7세 이상','75분',default);
--예술의전당 자유소극장
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(53,6,23,'2020 예술의전당 어린이 가족 페스티벌 <네 네 네>','infant_03m.jpg','infant_03L.jpg',to_date('2020/08/09','yyyy/mm/dd'),to_date('2020/08/09','yyyy/mm/dd'),1,'8세 이상','120분',default);
--예술의전당 자유소극장
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(54,6,22,'[2020 롯데백화점 대구점]아기돼지삼형제','infant_04m.jpg','infant_04L.jpg',to_date('2020/08/08','yyyy/mm/dd'),to_date('2020/08/08','yyyy/mm/dd'),1,'8세 이상','95분',default);
--롯데백화점 대구점 7층 문화홀
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(55,6,21,'어린이 가족뮤지컬 [피터팬]','infant_05m.jpg','infant_05L.jpg',to_date('2020/07/28','yyyy/mm/dd'),to_date('2020/12/22','yyyy/mm/dd'),1,'6세 이상','70분',default);
--명작극장
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(56,6,21,'어린이성교육뮤지컬[엄마는 안가르쳐 줘]','infant_06m.jpg','infant_06L.jpg',to_date('2020/11/11','yyyy/mm/dd'),to_date('2020/11/15','yyyy/mm/dd'),1,'7세 이상','70분',default);
--대학로 시온아트홀
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(57,6,23,'2020 밀양공연예술축제 [우산 도둑]','infant_07m.jpg','infant_07L.jpg',to_date('2020/09/04','yyyy/mm/dd'),to_date('2020/09/05','yyyy/mm/dd'),1,'8세 이상','120분',default);
--밀양아리랑아트센터 소극장
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(58,6,23,'용인 곤충파충류체험전','infant_08m.jpg','infant_08L.jpg',to_date('2020/08/18','yyyy/mm/dd'),to_date('2020/08/22','yyyy/mm/dd'),1,'5세 이상','150분',default);
--용인 리빙파워센터 2층 전시관
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(59,6,21,'얼간이 뮤지컬 [미녀와 야수]','infant_09m.jpg','infant_09L.jpg',to_date('2020/01/04','yyyy/mm/dd'),to_date('2020/12/19','yyyy/mm/dd'),1,'8세 이상','120분',default);
--국립공주박물관 강당
insert into prod(prod_id, fk_category_id, fk_category_detail_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(60,6,21,'오리지널 가족뮤지컬[넌 특별하단다]','infant_10m.jpg','infant_10L.jpg',to_date('2020/07/31','yyyy/mm/dd'),to_date('2020/07/31','yyyy/mm/dd'),1,'7세 이상','120분',default);
--제주 한라아트홀 대극장

commit;

--------------------------------------------인서트 전에 info_run_time 컬럼크기 변경해 줄것----------------------

---alter table prod modify(info_run_time varchar2(20));
------------------------------------------------------------------------------


insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(61,1,3,'오케스트라 앙상블 서울 OES의 베토벤 시리즈 IV','classic_11m.jpg','classic_11L.jpg',to_date('2020/08/18','yyyy/mm/dd'),to_date('2020/08/18','yyyy/mm/dd'),1,'12세 이상','100분',default);
--예술의전당 콘서트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(62,1,47,'드밑트리 시쉬킨 피아노 리사이틀','classic_12m.jpg','classic_12L.jpg',to_date('2020/08/12','yyyy/mm/dd'),to_date('2020/08/12','yyyy/mm/dd'),1,'8세 이상','80분',default);
--예술의전당 IBK 챔버홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(63,1,3,'코리안심포니오케스트라 <넥스트 스테이지>','classic_13m.jpg','classic_13L.jpg',to_date('2020/08/19','yyyy/mm/dd'),to_date('2020/08/19','yyyy/mm/dd'),1,'8세 이상','90분',default);
--예술의전당 콘서트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(64,1,48,'제 20주년 기념 대전국제음악제 <최재혁, 김유빈 and 앙상블 블랭크>','classic_14m.jpg','classic_14L.jpg',to_date('2020/08/06','yyyy/mm/dd'),to_date('2020/08/06','yyyy/mm/dd'),1,'8세 이상','80분',default);
--예술의전당 앙상블홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(65,1,49,'제 20주년 기념 대전 국제음악제 <베토벤 탄생 250주년 기념콘서트>','classic_15m.jpg','classic_15L.jpg',to_date('2020/08/03','yyyy/mm/dd'),to_date('2020/08/03','yyyy/mm/dd'),1,'8세 이상','90분',default);
--예술의전당 아트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(66,1,3,'김선욱 피아노 리사이틀','classic_16m.jpg','classic_16L.jpg',to_date('2020/09/13','yyyy/mm/dd'),to_date('2020/09/13','yyyy/mm/dd'),1,'8세 이상','80분',default);
--예술의전당 콘서트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(67,1,47,'피아졸라 바흐를 만나다','classic_17m.jpg','classic_17L.jpg',to_date('2020/08/22','yyyy/mm/dd'),to_date('2020/08/22','yyyy/mm/dd'),1,'8세 이상','100분',default);
--예술의전당 IBK 챔버홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(68,1,4,'2020 엘 토요 콘서트 : 토요 클래식 산책','classic_18m.jpg','classic_18L.jpg',to_date('2020/07/18','yyyy/mm/dd'),to_date('2020/11/21','yyyy/mm/dd'),1,'7세 이상','80분',default);
--롯데콘서트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(69,1,47,'트리오 씰(C.Y.L) 창단연주회','classic_19m.jpg','classic_19L.jpg',to_date('2020/08/08','yyyy/mm/dd'),to_date('2020/08/08','yyyy/mm/dd'),1,'8세 이상','110분',default);
--예술의전당 IBK 챔버홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(70,1,50,'이정선 귀국 피아노 독주회','classic_20m.jpg','classic_20L.jpg',to_date('2020/08/22','yyyy/mm/dd'),to_date('2020/08/22','yyyy/mm/dd'),1,'8세 이상','110분',default);
--예술의전당 리사이틀홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(71,1,47,'2020 해설이 있는 청소년음악회[이럴때 이런음악]','classic_21m.jpg','classic_21L.jpg',to_date('2020/08/22','yyyy/mm/dd'),to_date('2020/08/22','yyyy/mm/dd'),1,'8세 이상','100분',default);
--예술의전당 IBK 챔버홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(72,1,3,'한화생명과 함께하는 예술의 전당 11시 콘서트','classic_22m.jpg','classic_22L.jpg',to_date('2020/09/10','yyyy/mm/dd'),to_date('2020/09/10','yyyy/mm/dd'),1,'8세 이상','100분',default);
--예술의전당 콘서트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(73,1,51,'김아름 피아노 리사이틀','classic_23m.jpg','classic_23L.jpg',to_date('2020/08/22','yyyy/mm/dd'),to_date('2020/08/22','yyyy/mm/dd'),1,'7세 이상','80분',default);
--영산아트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(74,1,3,'마르크 앙드레 아믈랭 피아노 리사이틀','classic_24m.jpg','classic_24L.jpg',to_date('2020/09/12','yyyy/mm/dd'),to_date('2020/09/12','yyyy/mm/dd'),1,'8세 이상','100분',default);
--예술의전당 콘서트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(75,1,48,'2020 아침을 여는 클래식','classic_25m.jpg','classic_25L.jpg',to_date('2020/12/08','yyyy/mm/dd'),to_date('2020/12/08','yyyy/mm/dd'),1,'8세 이상','80분',default);
--예술의전당 앙상블홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(76,1,52,'김유빈 플루트 독주회[French Night]','classic_26m.jpg','classic_26L.jpg',to_date('2020/12/08','yyyy/mm/dd'),to_date('2020/12/08','yyyy/mm/dd'),1,'8세 이상','80분',default);
--티엘아이 아트센터

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(77,1,4,'썸머프리즈 : 김광민','classic_27m.jpg','classic_27L.jpg',to_date('2020/08/15','yyyy/mm/dd'),to_date('2020/08/15','yyyy/mm/dd'),1,'7세 이상','110분',default);
--롯데 콘서트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(78,1,4,'Music in the Dark : Momentum','classic_28m.jpg','classic_28L.jpg',to_date('2020/08/11','yyyy/mm/dd'),to_date('2020/08/11','yyyy/mm/dd'),1,'7세 이상','90분',default);
--롯데 콘서트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(79,1,6,'국립발레단(History of KNB Movement Series)','classic_29m.jpg','classic_29L.jpg',to_date('2020/08/01','yyyy/mm/dd'),to_date('2020/08/02','yyyy/mm/dd'),1,'8세 이상','90분',default);
--예술의전당 CJ토월극장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(80,1,6,'[2020 대한민국 오페라페스티벌] 김선국제오페라단 세빌리아의 이발사','classic_30m.jpg','classic_30L.jpg',to_date('2020/08/14','yyyy/mm/dd'),to_date('2020/08/16','yyyy/mm/dd'),1,'8세 이상','150분',default);
--예술의전당 오페라극장

commit;

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(81,2,53,'내일은 미스트롯 전국투어 콘서트','concert_11m.jpg','concert_11L.jpg',to_date('2020/10/09','yyyy/mm/dd'),to_date('2020/10/09','yyyy/mm/dd'),1,'7세 이상','120분',default);
--한국소리문화의전당 야외공연장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(82,2,54,'재즈 명반을 만나다 - Getz/Gitberto','concert_12m.jpg','concert_12L.jpg',to_date('2020/08/23','yyyy/mm/dd'),to_date('2020/08/23','yyyy/mm/dd'),1,'8세 이상','120분',default);
--JCC아트센터 콘서트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(83,2,55,'뻔하지않은듯 펀한 페스티벌','concert_13m.jpg','concert_13L.jpg',to_date('2020/08/22','yyyy/mm/dd'),to_date('2020/08/22','yyyy/mm/dd'),1,'12세 이상','-미정-',default);
--연세대학교 노천극장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(84,2,56,'서울숲재즈페스티벌 2020공식티켓','concert_14m.jpg','concert_14L.jpg',to_date('2020/10/09','yyyy/mm/dd'),to_date('2020/10/11','yyyy/mm/dd'),1,'12세 이상','-미정-',default);
--서울숲공원 일대

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(85,2,57,'2020 장윤정 라이브 콘서트','concert_15m.jpg','concert_15L.jpg',to_date('2020/12/09','yyyy/mm/dd'),to_date('2020/12/19','yyyy/mm/dd'),1,'7세 이상','120분',default);
--KBS부산홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(86,2,58,'크리스토퍼 내한공연(CHRISTOPHER LIVE IN SEOUL)','concert_16m.jpg','concert_16L.jpg',to_date('2020/10/09','yyyy/mm/dd'),to_date('2020/10/11','yyyy/mm/dd'),1,'15세 이상','70분',default);
--yes24 라이브홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(87,2,59,'KB RAPBEAT FESTIVAL 2020','concert_17m.jpg','concert_17L.jpg',to_date('2021/05/07','yyyy/mm/dd'),to_date('2021/05/09','yyyy/mm/dd'),1,'15세 이상','70분',default);
--서울랜드

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(88,2,60,'[2020 울산서머페스벌]','concert_18m.jpg','concert_18L.jpg',to_date('2020/08/20','yyyy/mm/dd'),to_date('2020/08/23','yyyy/mm/dd'),1,'7세 이상','70분',default);
--울산 태화강 국가정원 야외공연장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(89,2,60,'박상민 니가 그리운 날엔','concert_19m.jpg','concert_19L.jpg',to_date('2020/07/22','yyyy/mm/dd'),to_date('2020/08/16','yyyy/mm/dd'),1,'6세 이상','120분',default);
--대학로 아티스탄홀


insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(90,2,48,'2020 인문학콘서트 (빅데이터 전문가 송길영의 진정성의 시대)','concert_20m.jpg','concert_20L.jpg',to_date('2020/11/12','yyyy/mm/dd'),to_date('2020/11/12','yyyy/mm/dd'),1,'8세 이상','80분',default);
--예술의전당 앙상블홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(91,2,61,'라움으로 헤쳐모여![세대공방]','concert_21m.jpg','concert_21L.jpg',to_date('2020/06/24','yyyy/mm/dd'),to_date('2020/08/19','yyyy/mm/dd'),1,'7세 이상','60분',default);
--소셜베뉴 라움

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(92,2,62,'사람 : 너와 나 사이의 거리 -9월의 랑데북-','concert_22m.jpg','concert_22L.jpg',to_date('2020/09/24','yyyy/mm/dd'),to_date('2020/09/24','yyyy/mm/dd'),1,'7세 이상','100분',default);
--경기아트센터 소극장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(93,2,24,'세종시공연장상주단체 이모션콘텐츠','concert_23m.jpg','concert_23L.jpg',to_date('2020/09/24','yyyy/mm/dd'),to_date('2020/09/24','yyyy/mm/dd'),1,'7세 이상','120분',default);
--세종시문화예술관

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(94,2,24,'세종시문화재단 2020','concert_24m.jpg','concert_24L.jpg',to_date('2020/08/14','yyyy/mm/dd'),to_date('2020/08/14','yyyy/mm/dd'),1,'8세 이상','110분',default);
--세종시문화예술회관
commit;


insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(95,3,62,'뮤지컬 빨래','musical_11m.jpg','musical_11L.jpg',to_date('2020/08/14','yyyy/mm/dd'),to_date('2020/08/14','yyyy/mm/dd'),1,'8세 이상','110분',default);
--경기아트센터 소극장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(96,3,24,'세종시문화재단 기획공연 창작음악극[더 클라운]','musical_12m.jpg','musical_12L.jpg',to_date('2020/08/13','yyyy/mm/dd'),to_date('2020/08/13','yyyy/mm/dd'),1,'5세 이상','75분',default);
--세종시문화예술회관

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(97,3,63,'뮤지컬 [무인도 탈출기]','musical_13m.jpg','musical_13L.jpg',to_date('2020/08/28','yyyy/mm/dd'),to_date('2020/09/27','yyyy/mm/dd'),1,'8세 이상','110분',default);
--대학로 동양예술극장 2관

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(98,3,38,'가족뮤지컬 [인어공주]','musical_14m.jpg','musical_14L.jpg',to_date('2020/07/25','yyyy/mm/dd'),to_date('2020/08/09','yyyy/mm/dd'),1,'전체연령가','50분',default);
--대백프라임홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(99,3,38,'뮤지컬 써니텐','musical_15m.jpg','musical_15L.jpg',to_date('2020/07/12','yyyy/mm/dd'),to_date('2020/08/31','yyyy/mm/dd'),1,'10세 이상','100분',default);
--JOB SQURE

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(100,3,42,'어린이성교육뮤지컬 [엄마는 안가르쳐 줘]','musical_16m.jpg','musical_16L.jpg',to_date('2020/06/25','yyyy/mm/dd'),to_date('2020/08/15','yyyy/mm/dd'),1,'10세 이상','100분',default);
--대학로 시온아트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(101,3,64,'뮤지컬<김종욱찾기>','musical_17m.jpg','musical_17L.jpg',to_date('2019/01/26','yyyy/mm/dd'),to_date('2020/08/31','yyyy/mm/dd'),1,'8세 이상','100분',default);
--대학로컬쳐스페이스 엔유

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(102,3,1,'뮤지컬<작은 아씨들>','musical_18m.jpg','musical_18L.jpg',to_date('2020/11/24','yyyy/mm/dd'),to_date('2020/12/30','yyyy/mm/dd'),1,'7세 이상','110분',default);
--세종문화회관 M씨어터

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(103,3,65,'가족뮤지컬[도서관에 간 사자]','musical_19m.jpg','musical_19L.jpg',to_date('2020/03/28','yyyy/mm/dd'),to_date('2020/08/29','yyyy/mm/dd'),1,'3세 이상','60분',default);
--북촌아트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(104,3,46,'오리지널 가족뮤지컬[넌 특별하단다]','musical_20m.jpg','musical_20L.jpg',to_date('2020/02/29','yyyy/mm/dd'),to_date('2020/03/31','yyyy/mm/dd'),1,'3세 이상','60분',default);
--제주 한라아트홀 대극장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(105,3,10,'뮤지컬 아모르파티','musical_21m.jpg','musical_21L.jpg',to_date('2020/08/29','yyyy/mm/dd'),to_date('2020/08/30','yyyy/mm/dd'),1,'7세 이상','150분',default);
--부산 벡스코 제1전시장 1홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(106,3,66,'동춘 서커스','musical_22m.jpg','musical_22L.jpg',to_date('2019/05/30','yyyy/mm/dd'),to_date('2020/08/31','yyyy/mm/dd'),1,'전체연령가','90분',default);
--안산 대부도 동춘서커스 빅탑극장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(107,3,14,'알앤디웍스 콘서트','musical_23m.jpg','musical_23L.jpg',to_date('2020/08/14','yyyy/mm/dd'),to_date('2020/08/16','yyyy/mm/dd'),1,'8세 이상','120분',default);
--광림아트센터 BBCH홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(108,3,40,'아기돼지삼형제','musical_24m.jpg','musical_24L.jpg',to_date('2020/08/29','yyyy/mm/dd'),to_date('2020/08/30','yyyy/mm/dd'),1,'전체연령가','55분',default);
--롯데백화점 대구점 7층 문화홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(109,3,67,'어린이마술쇼 신비한 놀이터','musical_25m.jpg','musical_25L.jpg',to_date('2020/10/16','yyyy/mm/dd'),to_date('2020/10/17','yyyy/mm/dd'),1,'4세 이상','60분',default);
--가평문화예술회관

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(110,3,68,'겨울왕국뮤지컬[겨울이야기]','musical_26m.jpg','musical_26L.jpg',to_date('2020/08/29','yyyy/mm/dd'),to_date('2020/08/29','yyyy/mm/dd'),1,'3세 이상','60분',default);
--청주아트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(111,3,65,'2020 뮤지컬 천로역정','musical_27m.jpg','musical_27L.jpg',to_date('2019/07/13','yyyy/mm/dd'),to_date('2020/08/29','yyyy/mm/dd'),1,'10세 이상','100분',default);
--북촌아트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(112,3,69,'2020 세종 이도의 꿈','musical_28m.jpg','musical_28L.jpg',to_date('2020/10/02','yyyy/mm/dd'),to_date('2020/11/29','yyyy/mm/dd'),1,'3세 이상','60분',default);
--경복궁아트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(113,3,70,'꽃보다 슈퍼스타(꽃슈스)','musical_29m.jpg','musical_29L.jpg',to_date('2014/05/01','yyyy/mm/dd'),to_date('2020/08/31','yyyy/mm/dd'),1,'7세 이상','90분',default);
--대학로 마로니에극장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(114,3,71,'난타(NANTA)','musical_30m.jpg','musical_30L.jpg',to_date('2012/04/01','yyyy/mm/dd'),to_date('2020/12/31','yyyy/mm/dd'),1,'2세 이상','100분',default);
--제주 난타 theater

commit;

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(115,4,72,'코믹빙의 뮤지컬[오 나의 귀신님]','theater_11m.jpg','theater_11L.jpg',to_date('2020/08/27','yyyy/mm/dd'),to_date('2020/10/25','yyyy/mm/dd'),1,'14세 이상','100분',default);
--상무지구 기분좋은극장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(116,4,39,'2020 예술의전당 어린이 가족 페스티벌 <에스메의 여름>','theater_12m.jpg','theater_12L.jpg',to_date('2020/08/01','yyyy/mm/dd'),to_date('2020/08/14','yyyy/mm/dd'),1,'4세 이상','60분',default);
--예술의전당 자유소극장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(117,4,73,'공포연극 조각','theater_13m.jpg','theater_13L.jpg',to_date('2020/07/03','yyyy/mm/dd'),to_date('2020/08/30','yyyy/mm/dd'),1,'13세 이상','100분',default);
--전주 한해랑아트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(118,4,74,'연극 [옥탑방 고양이]','theater_14m.jpg','theater_14L.jpg',to_date('2018/03/01','yyyy/mm/dd'),to_date('2020/08/31','yyyy/mm/dd'),1,'13세 이상','100분',default);
--대학로 틴틴홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(119,4,75,'코믹추리극 <셜록홈즈>','theater_15m.jpg','theater_15L.jpg',to_date('2020/01/06','yyyy/mm/dd'),to_date('2020/09/30','yyyy/mm/dd'),1,'5세 이상','90분',default);
--대학로 연극 M씨어터

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(120,4,39,'2020 예술의전당 어린이 가족 페스티벌(네네네)','theater_16m.jpg','theater_16L.jpg',to_date('2020/08/19','yyyy/mm/dd'),to_date('2020/08/23','yyyy/mm/dd'),1,'4세 이상','50분',default);
--예술의전당 자유소극장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(121,4,76,'연극 [뷰티풀라이프]','theater_17m.jpg','theater_17L.jpg',to_date('2018/02/20','yyyy/mm/dd'),to_date('2020/08/31','yyyy/mm/dd'),1,'8세 이상','90분',default);
--대학로 JTN아트홀 4관

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(122,4,77,'레트로코믹극 연극 라면','theater_18m.jpg','theater_18L.jpg',to_date('2020/04/04','yyyy/mm/dd'),to_date('2020/09/30','yyyy/mm/dd'),1,'12세 이상','100분',default);
--대학로 컬쳐씨어터

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(123,4,78,'코믹연극 달동네','theater_19m.jpg','theater_19L.jpg',to_date('2020/12/11','yyyy/mm/dd'),to_date('2020/12/13','yyyy/mm/dd'),1,'8세 이상','100분',default);
--광주 국립아시아문화전당 예술극장 극장2

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(124,4,79,'2020 심리스릴러 연극 새빨간 거짓말','theater_20m.jpg','theater_20L.jpg',to_date('2020/07/03','yyyy/mm/dd'),to_date('2020/08/16','yyyy/mm/dd'),1,'14세 이상','100분',default);
--부산 메트로홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(125,4,78,'러브액츄얼리 오리지날 크리스마스 특별공연','theater_21m.jpg','theater_21L.jpg',to_date('2020/12/24','yyyy/mm/dd'),to_date('2020/12/26','yyyy/mm/dd'),1,'11세 이상','100분',default);
--광주 국립아시아문화전당 예술극장 극장2

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(126,4,67,'어린이마술쇼 신비한 놀이터','theater_22m.jpg','theater_22L.jpg',to_date('2020/10/16','yyyy/mm/dd'),to_date('2020/10/17','yyyy/mm/dd'),1,'8세 이상','100분',default);
--가평문화예술회관

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(127,4,80,'연극 [친정엄마와 2박3일]','theater_23m.jpg','theater_23L.jpg',to_date('2020/10/10','yyyy/mm/dd'),to_date('2020/10/11','yyyy/mm/dd'),1,'7세 이상','100분',default);
--엑스코 오디토리움

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(128,4,81,'연극 [신비한 요리집]','theater_24m.jpg','theater_24L.jpg',to_date('2020/10/10','yyyy/mm/dd'),to_date('2020/10/11','yyyy/mm/dd'),1,'14세 이상','90분',default);
--대전 아신극장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(129,4,82,'연극 [죽여주는 이야기]','theater_25m.jpg','theater_25L.jpg',to_date('2018/02/21','yyyy/mm/dd'),to_date('2020/08/31','yyyy/mm/dd'),1,'7세 이상','100분',default);
--대학로 삼형제극장 죽여주는 이야기 전용관

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(130,4,83,'리얼생존휴먼판타지-연극 2호선세입자','theater_26m.jpg','theater_26L.jpg',to_date('2019/03/15','yyyy/mm/dd'),to_date('2020/08/31','yyyy/mm/dd'),1,'13세 이상','90분',default);
--대학로 바탕골 소극장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(131,4,84,'연극 [안나라수마나라]','theater_27m.jpg','theater_27L.jpg',to_date('2019/09/23','yyyy/mm/dd'),to_date('2020/08/31','yyyy/mm/dd'),1,'10세 이상','90분',default);
--업스테이지

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(132,4,85,'연극 [오싹한연애]','theater_28m.jpg','theater_28L.jpg',to_date('2020/05/23','yyyy/mm/dd'),to_date('2020/09/06','yyyy/mm/dd'),1,'13세 이상','100분',default);
--대학로 열린극장

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(133,4,86,'공포연극 자취','theater_29m.jpg','theater_29L.jpg',to_date('2020/02/28','yyyy/mm/dd'),to_date('2020/09/30','yyyy/mm/dd'),1,'10세 이상','90분',default);
--대학로 댕로홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(134,4,87,'(리얼타임)코믹연극 택시안에서','theater_30m.jpg','theater_30L.jpg',to_date('2019/03/15','yyyy/mm/dd'),to_date('2020/08/31','yyyy/mm/dd'),1,'12세 이상','100분',default);
--해바라기 소극장
commit;

--alter table prod modify(info_run_time varchar2(20));

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(135,5,88,'낙산,이화마을 여행','exhibition_11m.jpg','exhibition_11L.jpg',to_date('2019/03/15','yyyy/mm/dd'),to_date('2020/08/31','yyyy/mm/dd'),1,'12세 이상','100분',default);
--1호선 동대문역 6번 출구

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(136,5,89,'다시 꿈을 꾸는 북촌','exhibition_12m.jpg','exhibition_12L.jpg',to_date('2013/09/26','yyyy/mm/dd'),to_date('2020/08/30','yyyy/mm/dd'),1,'전체연령가','사이트참조',default);
--3호선 안국역 4번출구

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(137,5,90,'단양 오션플레이','exhibition_13m.jpg','exhibition_13L.jpg',to_date('2013/09/27','yyyy/mm/dd'),to_date('2020/08/16','yyyy/mm/dd'),1,'전체연령가','사이트참조',default);
--단양 오션플레이

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(138,5,91,'덕수궁 궁궐야행','exhibition_14m.jpg','exhibition_14L.jpg',to_date('2018/07/10','yyyy/mm/dd'),to_date('2020/10/31','yyyy/mm/dd'),1,'7세 이상','120분',default);
--덕수궁

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(139,5,91,'덕수궁 돌담길투어','exhibition_15m.jpg','exhibition_15L.jpg',to_date('2018/07/14','yyyy/mm/dd'),to_date('2020/12/31','yyyy/mm/dd'),1,'7세 이상','120분',default);
--덕수궁

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(140,5,91,'덕수궁 인문학산책','exhibition_16m.jpg','exhibition_16L.jpg',to_date('2018/10/01','yyyy/mm/dd'),to_date('2020/12/31','yyyy/mm/dd'),1,'7세 이상','120분',default);
--덕수궁

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(141,5,92,'델피노 오션플레이','exhibition_17m.jpg','exhibition_17L.jpg',to_date('2018/09/01','yyyy/mm/dd'),to_date('2020/12/31','yyyy/mm/dd'),1,'8세 이상','사이트참조',default);
--델피노 오션플레이

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(142,5,93,'변산 오션플레이','exhibition_18m.jpg','exhibition_18L.jpg',to_date('2013/09/27','yyyy/mm/dd'),to_date('2020/08/30','yyyy/mm/dd'),1,'전체연령가','사이트참조',default);
--변산 오션플레이

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(143,5,94,'선릉 인문학산책','exhibition_19m.jpg','exhibition_19L.jpg',to_date('2019/01/01','yyyy/mm/dd'),to_date('2020/12/31','yyyy/mm/dd'),1,'10세 이상','120분',default);
--선릉

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(144,5,95,'스릴과 짜릿한 재미가 넘치는 [내린천 래프팅 레포츠]','exhibition_20m.jpg','exhibition_20L.jpg',to_date('2019/07/01','yyyy/mm/dd'),to_date('2020/09/30','yyyy/mm/dd'),1,'6세 이상','120분',default);
--내린천

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(145,5,32,'쏠비치 아쿠아월드','exhibition_21m.jpg','exhibition_21L.jpg',to_date('2013/09/26','yyyy/mm/dd'),to_date('2020/08/30','yyyy/mm/dd'),1,'전체연령가','사이트참조',default);
--양양쏠비치아쿠아월드

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(146,5,96,'예술인의 마을, 서촌','exhibition_22m.jpg','exhibition_22L.jpg',to_date('2018/07/14','yyyy/mm/dd'),to_date('2020/12/31','yyyy/mm/dd'),1,'11세 이상','120분',default);
--3호선 경복궁역 4번출구

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(147,5,44,'곤충파충류 체험전','exhibition_23m.jpg','exhibition_23L.jpg',to_date('2020/04/30','yyyy/mm/dd'),to_date('2020/08/16','yyyy/mm/dd'),1,'전체연령가','120분',default);
--용인 리빙파워센터 2층 전시관

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(148,5,97,'전세계 외국인과 온라인 언어교환','exhibition_24m.jpg','exhibition_24L.jpg',to_date('2020/07/24','yyyy/mm/dd'),to_date('2020/12/31','yyyy/mm/dd'),1,'성인','60분',default);
--온라인 모임

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(149,5,98,'정동진독립영화제','exhibition_25m.jpg','exhibition_25L.jpg',to_date('2020/08/07','yyyy/mm/dd'),to_date('2020/08/09','yyyy/mm/dd'),1,'전체연령가','200분',default);
--강릉시 정동초등학교

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(150,5,99,'창경궁 궁궐야행','exhibition_26m.jpg','exhibition_26L.jpg',to_date('2019/01/25','yyyy/mm/dd'),to_date('2020/10/31','yyyy/mm/dd'),1,'8세 이상','120분',default);
--창경궁

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(151,5,99,'창경궁의 인문학산책','exhibition_27m.jpg','exhibition_27L.jpg',to_date('2018/11/13','yyyy/mm/dd'),to_date('2020/12/31','yyyy/mm/dd'),1,'10세 이상','120분',default);
--창경궁

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(152,5,99,'창경궁의 인문학산책 - 야간개장','exhibition_28m.jpg','exhibition_28L.jpg',to_date('2019/01/01','yyyy/mm/dd'),to_date('2020/12/31','yyyy/mm/dd'),1,'10세 이상','120분',default);
--창경궁

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(153,5,100,'창덕궁의 인문학산책','exhibition_29m.jpg','exhibition_29L.jpg',to_date('2018/10/01','yyyy/mm/dd'),to_date('2020/12/31','yyyy/mm/dd'),1,'10세 이상','120분',default);
--창덕궁

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(154,5,101,'천안오션파크','exhibition_30m.jpg','exhibition_30L.jpg',to_date('2018/04/28','yyyy/mm/dd'),to_date('2020/08/23','yyyy/mm/dd'),1,'10세 이상','120분',default);
--천안오션파크

commit;

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(155,6,102,'브릭라이브','infant_11m.jpg','infant_11L.jpg',to_date('2020/05/25','yyyy/mm/dd'),to_date('2020/08/31','yyyy/mm/dd'),1,'3세 이상','미정',default);
--세종 마크원에비뉴 5층

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(156,6,67,'어린이마술쇼 신비한 놀이터','infant_12m.jpg','infant_12L.jpg',to_date('2020/10/16','yyyy/mm/dd'),to_date('2020/10/17','yyyy/mm/dd'),1,'4세 이상','60분',default);
--가평문화예술회관

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(157,6,68,'겨울왕국 뮤지컬 [겨울이야기]','infant_13m.jpg','infant_13L.jpg',to_date('2020/08/29','yyyy/mm/dd'),to_date('2020/08/30','yyyy/mm/dd'),1,'3세 이상','60분',default);
--청주아트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(158,6,69,'2020 세종 이도의 꿈','infant_14m.jpg','infant_14L.jpg',to_date('2020/10/02','yyyy/mm/dd'),to_date('2020/11/29','yyyy/mm/dd'),1,'3세 이상','60분',default);
--경복궁아트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(159,6,65,'가족뮤지컬[도서관에 간 사자]','infant_15m.jpg','infant_15L.jpg',to_date('2020/03/28','yyyy/mm/dd'),to_date('2020/08/29','yyyy/mm/dd'),1,'3세 이상','60분',default);
--북촌아트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(160,6,1,'가족음악극(한여름 밤의 꿈)','infant_16m.jpg','infant_16L.jpg',to_date('2021/01/08','yyyy/mm/dd'),to_date('2021/01/31','yyyy/mm/dd'),1,'5세 이상','70분',default);
--세종문화회관 M씨어터

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(161,6,69,'독도 아리랑','infant_17m.jpg','infant_17L.jpg',to_date('2020/08/01','yyyy/mm/dd'),to_date('2020/09/27','yyyy/mm/dd'),1,'3세 이상','60분',default);
--경복궁아트홀

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(162,6,103,'뮤지컬<봄날의 곰>','infant_18m.jpg','infant_18L.jpg',to_date('2020/04/25','yyyy/mm/dd'),to_date('2020/10/31','yyyy/mm/dd'),1,'4세 이상 ','60분',default);
--대학로 세우아트센터 1관

insert into prod(prod_id, fk_category_id, map_id, prod_title,prod_img, prod_detail_img,info_open_date,
info_close_date,info_rev_status,info_grade,info_run_time,info_qnty)
values(163,6,104,'연극 시간을 파는 상점','infant_19m.jpg','infant_19L.jpg',to_date('2017/10/01','yyyy/mm/dd'),to_date('2020/09/30','yyyy/mm/dd'),1,'8세 이상 ','80분',default);
--파랑씨어터

commit;

-----------------------------------------------------------------------------------------------------------------------------------

update prod set map_id = 1  where prod_id = 1;

update prod set map_id = 2  where prod_id = 2;

update prod set map_id = 3  where prod_id = 3;

update prod set map_id = 2  where prod_id = 4;

update prod set map_id = 4 where prod_id = 5;

update prod set map_id = 5  where prod_id = 6;

update prod set map_id = 6  where prod_id = 7;

update prod set map_id = 1  where prod_id = 8;

update prod set map_id = 7  where prod_id = 9;

update prod set map_id = 4  where prod_id = 10;

commit;


update prod set map_id = 8  where prod_id = 11;

update prod set map_id = 8  where prod_id = 12;

update prod set map_id = 9  where prod_id = 13;

update prod set map_id = 8  where prod_id = 14;

update prod set map_id = 10 where prod_id = 15;

update prod set map_id = 5  where prod_id = 16;

update prod set map_id = 8  where prod_id = 17;

update prod set map_id = 1  where prod_id = 18;

update prod set map_id = 11  where prod_id = 19;

update prod set map_id = 4  where prod_id = 20;

commit;


update prod set map_id = 12  where prod_id = 21;

update prod set map_id = 13  where prod_id = 22;

update prod set map_id = 12  where prod_id = 23;

update prod set map_id = 14  where prod_id = 24;

update prod set map_id = 15  where prod_id = 25;

update prod set map_id = 16  where prod_id = 26;

update prod set map_id = 17  where prod_id = 27;

update prod set map_id = 18  where prod_id = 28;

update prod set map_id = 19  where prod_id = 29;

update prod set map_id = 20  where prod_id = 30;

commit;



update prod set map_id = 21  where prod_id = 31;

update prod set map_id = 22  where prod_id = 32;

update prod set map_id = 23  where prod_id = 33;

update prod set map_id = 6  where prod_id = 34;

update prod set map_id = 24  where prod_id = 35;

update prod set map_id = 25  where prod_id = 36;

update prod set map_id = 26  where prod_id = 37;

update prod set map_id = 27  where prod_id = 38;

update prod set map_id = 28  where prod_id = 39;

update prod set map_id = 29  where prod_id = 40;

commit;


update prod set map_id = 30  where prod_id = 41;

update prod set map_id = 22  where prod_id = 42;

update prod set map_id = 31  where prod_id = 43;

update prod set map_id = 32  where prod_id = 44;

update prod set map_id = 33  where prod_id = 45;

update prod set map_id = 34  where prod_id = 46;

update prod set map_id = 35  where prod_id = 47;

update prod set map_id = 36 where prod_id = 48;

update prod set map_id = 37 where prod_id = 49;

update prod set map_id = 36 where prod_id = 50;

commit;


update prod set map_id = 38  where prod_id = 51;

update prod set map_id = 39  where prod_id = 52;

update prod set map_id = 39  where prod_id = 53;

update prod set map_id = 40  where prod_id = 54;

update prod set map_id = 41  where prod_id = 55;

update prod set map_id = 42  where prod_id = 56;

update prod set map_id = 43  where prod_id = 57;

update prod set map_id = 44  where prod_id = 58;

update prod set map_id = 45  where prod_id = 59;

update prod set map_id = 46  where prod_id = 60;

commit;

---------------------------------------------------------------------------------------------------------------------------------

update prod set fk_category_detail_id = 2 where prod_id = 61;

update prod set fk_category_detail_id = 2 where prod_id = 62;

update prod set fk_category_detail_id = 2 where prod_id = 63;

update prod set fk_category_detail_id = 2 where prod_id = 64;

update prod set fk_category_detail_id = 2 where prod_id = 65;

update prod set fk_category_detail_id = 2 where prod_id = 66;

update prod set fk_category_detail_id = 2 where prod_id = 67;

update prod set fk_category_detail_id = 2 where prod_id = 68;

update prod set fk_category_detail_id = 2 where prod_id = 69;

update prod set fk_category_detail_id = 2 where prod_id = 70;

commit;

update prod set fk_category_detail_id = 2 where prod_id = 71;

update prod set fk_category_detail_id = 2 where prod_id = 72;

update prod set fk_category_detail_id = 2 where prod_id = 73;

update prod set fk_category_detail_id = 2 where prod_id = 74;

update prod set fk_category_detail_id = 2 where prod_id = 75;

update prod set fk_category_detail_id = 2 where prod_id = 76;

update prod set fk_category_detail_id = 2 where prod_id = 77;

update prod set fk_category_detail_id = 2 where prod_id = 78;

update prod set fk_category_detail_id = 3 where prod_id = 79;

update prod set fk_category_detail_id = 2 where prod_id = 80;

commit;

update prod set fk_category_detail_id = 6 where prod_id = 81;

update prod set fk_category_detail_id = 7 where prod_id = 82;

update prod set fk_category_detail_id = 8 where prod_id = 83;

update prod set fk_category_detail_id = 8 where prod_id = 84;

update prod set fk_category_detail_id = 6 where prod_id = 85;

update prod set fk_category_detail_id = 7 where prod_id = 86;

update prod set fk_category_detail_id = 8 where prod_id = 87;

update prod set fk_category_detail_id = 8 where prod_id = 88;

update prod set fk_category_detail_id = 6 where prod_id = 89;

update prod set fk_category_detail_id = 6 where prod_id = 90;

commit;

update prod set fk_category_detail_id = 6 where prod_id = 91;

update prod set fk_category_detail_id = 6 where prod_id = 92;

update prod set fk_category_detail_id = 8 where prod_id = 93;

update prod set fk_category_detail_id = 8 where prod_id = 94;

update prod set fk_category_detail_id = 12 where prod_id = 95;

update prod set fk_category_detail_id = 12 where prod_id = 96;

update prod set fk_category_detail_id = 12 where prod_id = 97;

update prod set fk_category_detail_id = 11 where prod_id = 98;

update prod set fk_category_detail_id = 10 where prod_id = 99;

update prod set fk_category_detail_id = 12 where prod_id = 100;

commit;

update prod set fk_category_detail_id = 12 where prod_id = 101;

update prod set fk_category_detail_id = 10 where prod_id = 102;

update prod set fk_category_detail_id = 10 where prod_id = 103;

update prod set fk_category_detail_id = 12 where prod_id = 104;

update prod set fk_category_detail_id = 12 where prod_id = 105;

update prod set fk_category_detail_id = 10 where prod_id = 106;

update prod set fk_category_detail_id = 11 where prod_id = 107;

update prod set fk_category_detail_id = 11 where prod_id = 108;

update prod set fk_category_detail_id = 10 where prod_id = 109;

update prod set fk_category_detail_id = 11 where prod_id = 110;

commit;

update prod set fk_category_detail_id = 12 where prod_id = 111;

update prod set fk_category_detail_id = 10 where prod_id = 112;

update prod set fk_category_detail_id = 10 where prod_id = 113;

update prod set fk_category_detail_id = 12 where prod_id = 114;

update prod set fk_category_detail_id = 15 where prod_id = 115;

update prod set fk_category_detail_id = 16 where prod_id = 116;

update prod set fk_category_detail_id = 16 where prod_id = 117;

update prod set fk_category_detail_id = 15 where prod_id = 118;

update prod set fk_category_detail_id = 16 where prod_id = 119;

update prod set fk_category_detail_id = 16 where prod_id = 120;

commit;

update prod set fk_category_detail_id = 15 where prod_id = 121;

update prod set fk_category_detail_id = 16 where prod_id = 122;

update prod set fk_category_detail_id = 16 where prod_id = 123;

update prod set fk_category_detail_id = 15 where prod_id = 124;

update prod set fk_category_detail_id = 16 where prod_id = 125;

update prod set fk_category_detail_id = 16 where prod_id = 126;

update prod set fk_category_detail_id = 15 where prod_id = 127;

update prod set fk_category_detail_id = 15 where prod_id = 128;

update prod set fk_category_detail_id = 15 where prod_id = 129;

update prod set fk_category_detail_id = 15 where prod_id = 130;

commit;

update prod set fk_category_detail_id = 15 where prod_id = 131;

update prod set fk_category_detail_id = 15 where prod_id = 132;

update prod set fk_category_detail_id = 16 where prod_id = 133;

update prod set fk_category_detail_id = 15 where prod_id = 134;

update prod set fk_category_detail_id = 19 where prod_id = 135;

update prod set fk_category_detail_id = 19 where prod_id = 136;

update prod set fk_category_detail_id = 20 where prod_id = 137;

update prod set fk_category_detail_id = 19 where prod_id = 138;

update prod set fk_category_detail_id = 19 where prod_id = 139;

update prod set fk_category_detail_id = 19 where prod_id = 140;

commit;

update prod set fk_category_detail_id = 20 where prod_id = 141;

update prod set fk_category_detail_id = 20 where prod_id = 142;

update prod set fk_category_detail_id = 19 where prod_id = 143;

update prod set fk_category_detail_id = 19 where prod_id = 144;

update prod set fk_category_detail_id = 20 where prod_id = 145;

update prod set fk_category_detail_id = 18 where prod_id = 146;

update prod set fk_category_detail_id = 18 where prod_id = 147;

update prod set fk_category_detail_id = 19 where prod_id = 148;

update prod set fk_category_detail_id = 18 where prod_id = 149;

update prod set fk_category_detail_id = 19 where prod_id = 150;

commit;

update prod set fk_category_detail_id = 19 where prod_id = 151;

update prod set fk_category_detail_id = 19 where prod_id = 152;

update prod set fk_category_detail_id = 19 where prod_id = 153;

update prod set fk_category_detail_id = 19 where prod_id = 154;

update prod set fk_category_detail_id = 23 where prod_id = 155;

update prod set fk_category_detail_id = 22 where prod_id = 156;

update prod set fk_category_detail_id = 22 where prod_id = 157;

update prod set fk_category_detail_id = 22 where prod_id = 158;

update prod set fk_category_detail_id = 21 where prod_id = 159;

update prod set fk_category_detail_id = 22 where prod_id = 160;

commit;


update prod set fk_category_detail_id = 22 where prod_id = 161;

update prod set fk_category_detail_id = 21 where prod_id = 162;

update prod set fk_category_detail_id = 22 where prod_id = 163;

commit;
-------------------------------------------------------------
select *
from prod
order by prod_id;


select prod_id, fk_category_id, fk_category_detail_id
     , prod_title,prod_img, prod_detail_img,info_open_date
     , info_close_date,info_rev_status,info_grade
     ,info_run_time,info_qnty
from prod order by fk_category_detail_id;






------------------------------------------------------------------
-- 공연장소 테이블
drop table yes_show_map;
create table yes_show_map
(map_id         number(10)      -- 장소코드
,prod_id        number          -- 공연코드(FK)
,map_lng        number          -- 경도
,map_lat        number          -- 위도
,map_name       varchar2(300)    -- 장소이름
,map_address    varchar2(300)    -- 장소주소
,map_url        varchar2(50)    -- 홈페이지url
,map_img        varchar2(300)    -- 장소이미지
,constraint PK_map_id primary key(map_id)
,constraint FK_prod_id_map foreign key(prod_id) references prod(prod_id) on delete cascade
);

drop sequence seq_show_map;
create sequence seq_show_map
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

------------------------------------------------------------------

--'1' '세종문화회관 M씨어터'
--'2' '광림아트센터 장천홀'
--'3' '예술의전당 콘서트홀'
--'4' '롯데 콘서트홀'
--'5' '세종문화회관 대극장'
--'6' '예술의전당 CJ토월극장'
--'7' 'kt chamberhall'
--'8' '노들섬 라이브 하우스'
--'9' '김화생활체육공원 특설무대'
--'10' '부산 벡스코 제1전시장 1홀'
--'11' '예술의전당 오페라극장'
--'12' '대학로 유니플렉스 2관'
--'13' '세종문화회관 S씨어터' 
--'14' '광림아트센터 BBCH홀'
--'15' '샤롯데 씨어터'
--'16' '블루스퀘어 인터파크홀'
--'17' '예스24스테이지 1관'
--'18' '동국대학교 이해랑 예술극장'
--'19' '대학로 드림아트센터 2관'
--'20' '부산 소향씨어터 신한카드홀'
--'21' '예스24스테이지 3관'
--'22' '밀양아리랑아트센터 대극장'
--'23' 'BNK부산은행 조은극장 1관'
--'24' '세종시문화예술회관'
--'25' '구미 소극장[공터_다]'
--'26' '대학로 나온씨어터'
--'27' 'BNK부산은행조은극장 2관'
--'28' '대구 여우별아트홀'
--'29' '대학로 해피씨어터'
--'30' '뮤지엄 다'
--'31' '신촌 암흑카페'
--'32' '양양 쏠비치 아쿠아월드'
--'33' '예천 삼강문화단지 내'
--'34' '전주학옥마을 경기전'
--'35' '거제오션어드벤처'
--'36' '경복궁'
--'37' '경주대명아쿠아월드'
--'38' '대백프라임홀'
--'39' '예술의전당 자유소극장'
--'40' '롯데백화점 대구점 7층 문화홀'
--'41' '명작극장'
--'42' '대학로 시온아트홀'
--'43' '밀양아리랑아트센터 소극장'
--'44' '용인 리빙파워센터 2층 전시관'
--'45' '국립공주박물관 강당'
--'46' '제주 한라아트홀 대극장'
--47 예술의전당 IBK 챔버홀
--48 예술의전당 앙상블홀
--49 예술의전당 아트홀
--50 예술의전당 리사이틀홀
--51 영산아트홀
--52 티엘아이 아트센터
--53 한국소리문화의전당 야외공연장
--54 JCC아트센터 콘서트홀
--55 연세대학교 노천극장
--56 서울숲공원 일대
--57 KBS부산홀
--58 예스24 라이브홀
--59 서울랜드
--60 울산 태화강 국가정원 야외공연장
--61 소설베뉴 라움
--62 경기아트센터 소극장
--63 JOB SQURE
--64 대학로컬쳐스페이스 엔유
--65 북촌아트홀
--66 안산 대부도 동춘서커스 빅탑극장
--67 가평문화예술회관
--68 청주아트홀
--69 경복궁아트홀
--70 대학로 마로니에극장
--71 제주 난타 theater
--72 상무지구 기분좋은극장
--73 전주 한해랑아트홀
--74 대학로 틴틴홀
--75 대학로 연극 M씨어터
--76 대학로 JTN아트홀 4관
--77 대학로 컬쳐씨어터
--78 광주 국립아시아문화전당 예술극장 극장2
--79 부산 메트로홀
--80 엑스코 오디토리움
--81 대전 아신극장
--82 대학로 삼형제극장 죽여주는 이야기 전용관
--83 대학로 바탕골 소극장
--84 업스테이지
--85 대학로 열린극장
--86 대학로 댕로홀
--87 해바라기 소극장
--88 1호선 동대문역 6번 출구
--89 3호선 안국역 4번출구
--90 단양 오션플레이
--91 덕수궁
--92 델피노 오션플레이
--93 변산 오션플레이
--94 선릉
--95 내린천
--96 3호선 경복궁역 4번출구
--97 온라인 모임
--98 강릉시 정동초등학교
--99 창경궁
--100 창덕궁
--101 천안오션파크
--102 세종 마크원에비뉴 5층
--103 대학로 세우아트센터 1관
--104 파랑씨어터

-----------------------------------------------------------------------------------------
select map_name
from yes_show_map M
join prod P
on P.map_id = M.map_id
where P.prod_id = 1;

insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.572755, 126.975555, '세종문화회관 M씨어터', '서울 종로구 세종로 세종대로 175', 'www.yes24.com');
--1
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.524446, 127.026549, '광림아트센터 장천홀', '서울 강남구 신사동 논현로163길 33', 'www.yes24.com');
--2
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.479590, 127.011682, '예술의전당 콘서트홀', '서울 서초구 신사동 서초3동 산120-18', 'www.yes24.com');
--3
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.514426, 127.103855, '롯데 콘서트홀', '서울 송파구 신천동 27', 'www.yes24.com');
--4
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.573035, 126.976072, '세종문화회관 대극장', '서울 종로구 세종로 세종대로 189', 'www.yes24.com');
--5
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.479674, 127.011665, '예술의전당 CJ토월극장', '서울 서초구 서초동 남부순환로2406', 'www.yes24.com');
--6
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.529994, 126.871057, 'kt chamberhall', '서울 양천구 목1동 목동서로 201 kt정보전산센터 1층', 'www.yes24.com');
--7
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.521025, 126.959323, '노들섬 라이브 하우스', '서울특별시 이촌1동', 'www.yes24.com');
--8
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 38.250347, 127.412442, '김화생활체육공원 특설무대', '강원도 철원군 김화읍 청양리 1-33', 'www.yes24.com');
--9
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.169748, 129.135955, '부산 벡스코 제1전시장 1홀', '부산광역시 해운대구 우동APEC로 55', 'www.yes24.com');
--10
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.479447, 127.013934, '예술의전당 오페라극장', '서울특별시 서초구 서초3동 남부순환로 2406', 'www.yes24.com');
--11
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.581132, 127.003694, '대학로 유니플렉스 2관', '서울특별시 종로구 이화동 대학로12길 64', 'www.yes24.com');
--12
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.572627, 126.975686, '세종문화회관 S씨어터', '서울특별시 종로구 세종로 세종대로 175', 'www.yes24.com');
--13
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.524214, 127.026605, '광림아트센터 BBCH홀', '서울특별시 강남구 신사동 568-13', 'www.yes24.com');
--14
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.510699, 127.099871, '샤롯데 씨어터', '서울특별시 송파구 올림픽로 240', 'www.yes24.com');
--15
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.540864, 127.002457, '블루스퀘어 인터파크홀', '서울특별시 용산구 한남동 이태원로 294', 'www.yes24.com');
--16
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.582750, 127.003243, '예스24스테이지 1관', '서울특별시 종로구 동숭동 대학로12길 21', 'www.yes24.com');
--17
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.558212, 127.003232, '동국대학교 이해랑 예술극장', '서울특별시 중구 장충동 장충단로', 'www.yes24.com');
--18
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.583255, 127.003270, '대학로 드림아트센터 2관', '서울특별시 종로구 동숭동 1-42', 'www.yes24.com');
--19
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.172916, 129.127700, '부산 소향씨어터 신한카드홀', '서울특별시 해운대구 우동 센텀중앙로 55', 'www.yes24.com');
--20
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.582708, 127.003248, '예스24스테이지 3관', '서울특별시 종로구 동숭동 대학로12길 21', 'www.yes24.com');
--21
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.504280, 128.758133, '밀양아리랑아트센터 대극장', '경상남도 밀양시 교동 487', 'www.yes24.com');
--22
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.098280, 129.032307, 'BNK부산은행 조은극장 1관', '부산광역시 중구 남포동2가 25-10', 'www.yes24.com');
--23
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 36.599734, 127.287425, '세종시문화예술회관', '세종특별자치시 조치원읍 침산리 226-1', 'www.yes24.com');
--24
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 36.125349, 128.340578, '구미 소극장[공터_다]', '경상북도 구미시 원평동 1032-60', 'www.yes24.com');
--25
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.587665, 126.999356, '대학로 나온씨어터', '서울 종로구 명륜1가 36-4', 'www.yes24.com');
--26
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.098300, 129.032318, 'BNK부산은행조은극장 2관', '부산 중구 남포동 구덕로34번길 4 뉴남포빌딩 3층', 'www.yes24.com');
--27
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.865899, 128.597643, '대구 여우별아트홀', '대구광역시 중구 삼덕동 1가 동성로3길 35 4층', 'www.yes24.com');
--28
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.098300, 129.032318, '대학로 해피씨어터', '대구광역시 중구 삼덕동 1가 동성로3길 35 4층', 'www.yes24.com');
--29
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.171254, 129.128762, '뮤지엄 다', '부산광역시 해운대구 우동 센텀서로 20', 'www.yes24.com');
--30
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.556538, 126.935426, '신촌 암흑카페', '서울 서대문구 창천동 62-1', 'www.yes24.com');
--31
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 38.088314, 128.665969, '쏠비치아쿠아월드', '강원도 양양군 손양면 오산리 23-4', 'www.yes24.com');
--32
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 36.563285, 128.298137, '예천 삼강문화단지 내', '경상북도 예천군 풍양면 삼강리 166-1', 'www.yes24.com');
--33
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.815297, 127.149796, '전주한옥마을 경기전', '전라북도 전주시 완산구 풍남동 태조로 44', 'www.yes24.com');
--34
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 34.843127, 128.703605, '거제오션어드벤처', '경상남도 거제시 일운면 소동리 115', 'www.yes24.com');
--35
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.579600, 126.977052, '경복궁', '서울 종로구 세종로 사직로 161', 'www.yes24.com');
--36
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.846222, 129.282222, '경주대명아쿠아월드', '경상북도 경주시 보덕동 651-1', 'www.yes24.com');
--37
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.855946, 128.606332, '대백프라임홀', '경상북도 경주시 보덕동 651-1', 'www.yes24.com');
--38
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.479134, 127.013919, '예술의전당 자유소극장', '서울 서초구 서초동 700', 'www.yes24.com');
--39
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.875988, 128.596166, '롯데백화점 대구점 7층 문화홀', '대구광여기 북구 태평로 161', 'www.yes24.com');
--40
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.582323, 127.002344, '명작극장', '서울 종로구 동숭동 대학로12길', 'www.yes24.com');
--41
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.582957, 127.002618, '대학로 시온아트홀','서울 종로구 대학로 8길 52', 'www.yes24.com');
--42
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.504285, 128.758153, '밀양아리랑아트센터 소극장', '경상남도 밀양시 교동 487', 'www.yes24.com');
--43
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.223571, 127.114500, '용인 리빙파워센터 2층 전시관', '경기도 용인시 기흥구 고매동 271', 'www.yes24.com');
--44
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 36.465506, 127.112187, '국립공주박물관 강당', '충청남도 공주시 웅진동 관광단지길 34', 'www.yes24.com');
--45
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 33.476296, 126.474891, '제주 한라아트홀 대극장', '제주특별자치도 노형동 1534번지 KR 제주한라대학교 한라아트홀', 'www.yes24.com');
--46

commit;

insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.479074, 127.011622, '예술의전당 IBK챔버홀', '서울 서초구 서초동 700', 'www.yes24.com');
--47
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.479003, 127.011630, '예술의전당 앙상블홀', '서울 서초구 남부순환로 2406', 'www.yes24.com');
--48
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.478984, 127.011611, '예술의전당 아트홀', '서울 서초구 남부순환로 2406', 'www.yes24.com');
--49
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.479129, 127.011691, '예술의전당 리사이트홀', '서울 서초구 서초동700', 'www.yes24.com');
--50
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.529017, 126.924282, '영산아트홀', '서울 영등포구 여의도동 여의공원로 101', 'www.yes24.com');
--51
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.417868, 127.127573, '티엘아이 아트센터', '경기도 성남시 중원구 양현로405번길 12', 'www.yes24.com');
--52
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.856108, 127.138253, '한국소리문화의전당 야외공연장', '전라북도 전주시 덕진구 덕진동 소리로 31', 'www.yes24.com');
--53
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.587279, 127.002027, 'JCC아트센터 콘서트홀', '서울특별시 종로구 창경궁로35길 29', 'www.yes24.com');
--54
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.565313, 126.939686, '연세대학교 노천극장', '서울 신촌동 연세대학교', 'www.yes24.com');
--55
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.544388, 127.037442, '서울숲공원 일대', '서울특별시 성동구 성수동1가 뚝섬로 273', 'www.yes24.com');
--56
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.145127, 129.109079, 'KBS부산홀', '부산광역시 수영구 남천1동 수영로 429', 'www.yes24.com');
--57
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.545766, 127.107881, '예스24 라이브홀', '서울특별시 광진구 광장동 구천면로 20', 'www.yes24.com');
--58
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.434155, 127.020129, '서울랜드', '경기도 과천시 막계동 광명로 181', 'www.yes24.com');
--59
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.547764, 129.296224, '울산 태화강 국가정원 야외공연장', '울산광역시 중구 태화동 신기길', 'www.yes24.com');
--60
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.508189, 127.039566, '소설베뉴 라움', '서울특별시 강남구 역삼1동 언주로 564', 'www.yes24.com');
--61
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.261562, 127.036349, '경기아트센터 소극장', '경기도 수원시 팔달구 인계동 효원로307번길 20', 'www.yes24.com');
--62
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.551199, 126.919538, 'JOB SQUARE', '서울특별시 마포구 잔다리로 31', 'www.yes24.com');
--63
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.580811, 127.003971, '대학로컬쳐스페이스 엔유', '서울특별시 종로구 동숭동 1-144', 'www.yes24.com');
--64
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.578922, 126.988940, '북촌아트홀', '서울특별시 종로구 원서동 157-1', 'www.yes24.com');
--65
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.283457, 126.569816, '안산 대부도 동춘서커스 빅탑극장', '경기도 안산시 단원구 대부북동 대부황금로 1432', 'www.yes24.com');
--66
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.824175, 127.508457, '가평문화예술회관', '경기도 가평군 가평읍 문화로 131', 'www.yes24.com');
--67
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 36.636904, 127.469447, '청주아트홀', '충청북도 청주시 흥덕구 사직동 808', 'www.yes24.com');
--68
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.583341, 126.970635, '경복궁아트홀', '서울특별시 종로구 효자동 70-1', 'www.yes24.com');
--69
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.580570, 127.004542, '대학로 마로니에극장', '서울특별시 종로구 동숭길 50 (동숭동) 지하 1층', 'www.yes24.com');
--70
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 33.445604, 126.547560, '제주 난타 theater', '제주시 KR특별자치도 제주시 선돌목동길56-26', 'www.yes24.com');
--71
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.163879, 126.909130, '상무지구 기분좋은극장', '광주광역시 서구 중흥동 상무중앙로 90', 'www.yes24.com');
--72
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.814855, 127.108750, '전주 한해랑아트홀', '완산구 효자동2가 1155-10번지 3층 전주시 전라북도 KR', 'www.yes24.com');
--73
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.581662, 127.003424, '대학로 틴틴홀', '서울특별시 종로구 동숭동 1-97', 'www.yes24.com');
--74
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.580961, 127.003949, '대학로 연극 M씨어터', '서울특별시 종로구 이화동 대학로12길 69 3층', 'www.yes24.com');
--75
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.576749, 127.003903, '대학로 JTN아트홀 4관', '서울특별시 종로구 이화동 이화장길 26 JTN 아트홀', 'www.yes24.com');
--76
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.582450, 127.003252, '대학로 컬쳐씨어터', '서울특별시 종로구 이화동 대학로8가길 80 5층', 'www.yes24.com');
--77
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.148217, 126.920452, '광주 국립아시아문화전당 예술극장 극장2', '광주광역시 동구 대의동 59-1', 'www.yes24.com');
--78
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.157037, 129.113000, '부산 메트로홀', '부산광역시 수영구 광안로 4 부산광역시 수영구 광안로 4 광안지하철역 지하1층 상가 1호', 'www.yes24.com');
--79
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.906851, 128.613310, '엑스코 오디토리움', '대구광역시 북구 산격2동 엑스코로 10', 'www.yes24.com');
--80
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 36.325599, 127.427954, '대전 아신극장', '대전광역시 중구 대흥동 159-2', 'www.yes24.com');
--81
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.578449, 127.004664, '대학로 삼형제극장 죽여주는 이야기 전용관', '서울특별시 종로구 동숭동 199-33', 'www.yes24.com');
--82
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.581861, 127.002498, '대학로 바탕골 소극장', '서울특별시 종로구 동숭동 199-33', 'www.yes24.com');
--83
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.580068, 127.004295, '업스테이지', '서울특별시 종로구 동숭동 동숭길 41', 'www.yes24.com');
--84
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.583643, 127.000300, '대학로 열린극장', '서울특별시 종로구 명륜2가 21-18', 'www.yes24.com');
--85
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.581818, 127.003709, '대학로 댕로홀', '서울특별시 종로구 동숭동 1-78 B1', 'www.yes24.com');
--86
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.136762, 129.102275, '해바라기소극장', '부산광역시 남구 대연3동 용소로13번길 30', 'www.yes24.com');
--87
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.571467, 127.010819, '1호선 동대문역 6번 출구', '서울특별시 종로구 창신동 464-4', 'www.yes24.com');
--88
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.576647, 126.986417, '3호선 안국역 4번출구', '서울특별시 종로구 안국동 318-1', 'www.yes24.com');
--89
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 36.977440, 128.361689, '단양 오션플레이', '충청북도 단양군 단양읍 삼봉로 187-17', 'www.yes24.com');
--90
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.565804, 126.975147, '덕수궁', '서울특별시 중구 정동 세종대로 99', 'www.yes24.com');
--91
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 38.212010, 128.494087, '델피노 오션플레이', '강원도 고성군 토성면 미시령옛길 1153', 'www.yes24.com');
--92
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 35.632347, 126.470444, '변산 오션플레이', '전라북도 부안군 변산면 변산해변로 51', 'www.yes24.com');
--93
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.504490, 127.048960, '선릉', '서울특별시 역삼동', 'www.yes24.com');
--94
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 38.043048, 128.206706, '내린천', '강원도 인제군 인제읍 고사리 540-3', 'www.yes24.com');
--95
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.576000, 126.973210, ' 3호선 경복궁역 4번출구', '서울특별시 종로구 적선동 93-3', 'www.yes24.com');
--96
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 0, 0, ' 온라인 모임', '-', 'www.yes24.com');
--97
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.576000, 126.973210, '강릉시 정동초등학교', '서울특별시 종로구 적선동 93-3', 'www.yes24.com');
--98
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.578768, 126.994872, '창경궁', '서울특별시 종로구 와룡동 창경궁로 185', 'www.yes24.com');
--99
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.578768, 126.994872, '창덕궁', '서울특별시 종로구 와룡동 창경궁로 185', 'www.yes24.com');
--100
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 36.757041, 127.223139, '천안 오션파크', '충청남도 천안시 동남구 성남면 종합휴양지로 200', 'www.yes24.com');
--101
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 36.757041, 127.223139, '세종 마크원에비뉴 5층', '서울특별시 종로구 종로5가 321-4', 'www.yes24.com');
--102
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.581923, 127.003937, '대학로 세우아트센터 1관', '서울특별시 종로구 동숭동 1-86', 'www.yes24.com');
--103
insert into yes_show_map(map_id, map_lng, map_lat, map_name, map_address, map_url)
values(seq_show_map.nextval, 37.582408, 127.002440, '파랑씨어터', '서울특별시 종로구 이화동 대학로8가길 36', 'www.yes24.com');
--104

commit;


-----------------------------------



-- 공연일시 테이블
drop table yes_show_date cascade constraints purge;
create table yes_show_date
(date_id        number(10)      -- 공연일시코드
,prod_id        number          -- 공연코드(FK)
,date_showday   date            -- 공연하는날짜
,date_showtime  varchar2(20)    -- 공연시간, 회차
,constraint PK_date_id primary key(date_id)
,constraint FK_prod_id_date foreign key(prod_id) references prod(prod_id) on delete cascade
);

drop sequence seq_show_date;
create sequence seq_show_date
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *
from yes_show_date;


insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 1, to_date('2020/08/20','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 1, to_date('2020/08/20','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 1, to_date('2020/08/22','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 1, to_date('2020/08/22','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 2, to_date('2020/08/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 2, to_date('2020/08/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 3, to_date('2020/08/09','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 3, to_date('2020/08/09','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 4, to_date('2020/08/08','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 4, to_date('2020/08/08','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 5, to_date('2020/07/28','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 5, to_date('2020/07/28','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 6, to_date('2020/11/11','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 6, to_date('2020/11/12','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 7, to_date('2020/09/04','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 7, to_date('2020/09/05','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 8, to_date('2020/08/18','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 8, to_date('2020/08/20','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 9, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 9, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 10, to_date('2020/07/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 10, to_date('2020/07/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 11, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 11, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 12, to_date('2020/08/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 12, to_date('2020/08/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 13, to_date('2020/08/09','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 13, to_date('2020/08/09','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 14, to_date('2020/08/08','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 14, to_date('2020/08/08','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 15, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 15, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 16, to_date('2020/11/11','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 16, to_date('2020/11/11','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 16, to_date('2020/11/15','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 16, to_date('2020/11/15','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 16, to_date('2020/11/15','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 16, to_date('2020/11/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 17, to_date('2020/09/04','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 17, to_date('2020/09/05','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 18, to_date('2020/08/18','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 18, to_date('2020/08/18','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 19, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 19, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 20, to_date('2020/07/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 20, to_date('2020/07/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 21, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 21, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 22, to_date('2020/08/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 22, to_date('2020/08/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 23, to_date('2020/08/09','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 23, to_date('2020/08/09','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 24, to_date('2020/08/08','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 24, to_date('2020/08/08','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 25, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 25, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 26, to_date('2020/11/11','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 26, to_date('2020/11/11','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 27, to_date('2020/09/04','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 27, to_date('2020/09/05','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 28, to_date('2020/08/18','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 28, to_date('2020/08/19','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 28, to_date('2020/08/20','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 28, to_date('2020/08/21','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 28, to_date('2020/08/22','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 29, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 29, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 30, to_date('2020/07/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 30, to_date('2020/07/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 31, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 31, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 32, to_date('2020/08/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 32, to_date('2020/08/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 33, to_date('2020/08/09','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 33, to_date('2020/08/09','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 34, to_date('2020/08/08','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 34, to_date('2020/08/08','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 35, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 35, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 36, to_date('2020/11/11','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 36, to_date('2020/11/12','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 36, to_date('2020/11/13','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 36, to_date('2020/11/14','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 36, to_date('2020/11/15','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 37, to_date('2020/09/04','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 37, to_date('2020/09/05','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 38, to_date('2020/08/18','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 38, to_date('2020/08/22','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 39, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 39, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 40, to_date('2020/07/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 40, to_date('2020/07/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 41, to_date('2020/08/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 41, to_date('2020/08/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 42, to_date('2020/08/09','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 42, to_date('2020/08/09','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 43, to_date('2020/08/09','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 43, to_date('2020/08/09','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 44, to_date('2020/08/08','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 44, to_date('2020/08/08','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 45, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 45, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 46, to_date('2020/11/11','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 46, to_date('2020/11/15','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 47, to_date('2020/09/04','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 47, to_date('2020/09/05','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 48, to_date('2020/08/18','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 48, to_date('2020/08/22','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 49, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 49, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 50, to_date('2020/07/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 50, to_date('2020/07/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 51, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 51, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 52, to_date('2020/08/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 52, to_date('2020/08/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 53, to_date('2020/08/09','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 53, to_date('2020/08/09','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 54, to_date('2020/08/08','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 54, to_date('2020/08/08','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 55, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 55, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 56, to_date('2020/11/11','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 56, to_date('2020/11/15','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 57, to_date('2020/09/04','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 57, to_date('2020/09/05','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 58, to_date('2020/08/18','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 58, to_date('2020/08/18','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 59, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 59, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 60, to_date('2020/07/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 60, to_date('2020/07/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 61, to_date('2020/08/18','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 61, to_date('2020/08/18','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 62, to_date('2020/08/12','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 62, to_date('2020/08/12','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 63, to_date('2020/08/19','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 63, to_date('2020/08/19','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 64, to_date('2020/08/06','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 64, to_date('2020/08/06','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 65, to_date('2020/08/03','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 65, to_date('2020/08/03','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 66, to_date('2020/09/13','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 66, to_date('2020/09/13','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 67, to_date('2020/08/22','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 67, to_date('2020/08/22','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 68, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 68, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 69, to_date('2020/08/08','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 69, to_date('2020/08/08','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 70, to_date('2020/08/22','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 70, to_date('2020/08/22','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 71, to_date('2020/08/22','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 71, to_date('2020/08/22','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 72, to_date('2020/09/10','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 72, to_date('2020/09/10','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 73, to_date('2020/08/22','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 73, to_date('2020/08/22','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 74, to_date('2020/09/12','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 74, to_date('2020/09/12','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 75, to_date('2020/12/08','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 75, to_date('2020/12/08','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 76, to_date('2020/12/08','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 76, to_date('2020/12/08','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 77, to_date('2020/08/15','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 77, to_date('2020/08/15','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 78, to_date('2020/08/11','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 78, to_date('2020/08/11','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 79, to_date('2020/08/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 79, to_date('2020/08/02','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 80, to_date('2020/08/14','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 80, to_date('2020/08/15','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 80, to_date('2020/08/16','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 81, to_date('2020/10/09','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 81, to_date('2020/10/09','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 82, to_date('2020/08/23','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 82, to_date('2020/08/23','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 83, to_date('2020/08/22','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 83, to_date('2020/08/22','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 84, to_date('2020/10/09','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 84, to_date('2020/10/10','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 84, to_date('2020/10/11','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 85, to_date('2020/12/09','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 85, to_date('2020/12/09','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 86, to_date('2020/10/09','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 86, to_date('2020/10/10','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 86, to_date('2020/10/11','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 87, to_date('2021/05/07','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 87, to_date('2021/05/07','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 88, to_date('2020/08/20','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 88, to_date('2020/08/23','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 89, to_date('2020/08/16','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 89, to_date('2020/08/16','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 90, to_date('2020/11/12','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 90, to_date('2020/11/12','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 91, to_date('2020/08/19','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 91, to_date('2020/08/19','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 92, to_date('2020/09/24','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 92, to_date('2020/09/24','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 93, to_date('2020/09/24','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 93, to_date('2020/09/24','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 94, to_date('2020/08/14','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 94, to_date('2020/08/14','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 95, to_date('2020/08/14','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 95, to_date('2020/08/14','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 96, to_date('2020/08/13','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 96, to_date('2020/08/13','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 97, to_date('2020/08/28','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 97, to_date('2020/08/30','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 98, to_date('2020/08/09','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 98, to_date('2020/08/09','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 99, to_date('2020/08/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 99, to_date('2020/08/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 100, to_date('2020/08/15','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 100, to_date('2020/08/15','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 101, to_date('2020/08/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 101, to_date('2020/08/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 102, to_date('2020/11/24','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 102, to_date('2020/12/30','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 103, to_date('2020/08/29','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 103, to_date('2020/08/29','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 104, to_date('2020/03/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 104, to_date('2020/03/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 105, to_date('2020/08/29','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 105, to_date('2020/08/30','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 106, to_date('2020/08/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 106, to_date('2020/08/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 107, to_date('2020/08/16','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 107, to_date('2020/08/16','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 108, to_date('2020/08/29','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 108, to_date('2020/08/30','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 109, to_date('2020/10/16','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 109, to_date('2020/10/17','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 110, to_date('2020/08/29','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 110, to_date('2020/08/29','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 111, to_date('2020/08/29','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 111, to_date('2020/08/29','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 112, to_date('2020/10/12','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 112, to_date('2020/11/29','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 113, to_date('2020/08/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 113, to_date('2020/08/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 114, to_date('2020/12/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 114, to_date('2020/12/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 115, to_date('2020/10/25','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 115, to_date('2020/10/25','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 116, to_date('2020/08/14','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 116, to_date('2020/08/14','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 117, to_date('2020/08/30','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 117, to_date('2020/08/30','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 118, to_date('2020/08/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 118, to_date('2020/08/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 119, to_date('2020/09/30','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 119, to_date('2020/09/30','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 120, to_date('2020/08/19','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 120, to_date('2020/08/23','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 121, to_date('2020/08/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 121, to_date('2020/08/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 122, to_date('2020/09/30','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 122, to_date('2020/09/30','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 123, to_date('2020/12/11','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 123, to_date('2020/12/12','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 123, to_date('2020/12/13','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 124, to_date('2020/08/16','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 124, to_date('2020/08/16','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 125, to_date('2020/12/24','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 125, to_date('2020/12/25','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 125, to_date('2020/12/26','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 126, to_date('2020/10/16','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 126, to_date('2020/10/17','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 127, to_date('2020/10/10','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 127, to_date('2020/10/11','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 128, to_date('2020/10/10','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 128, to_date('2020/10/11','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 129, to_date('2020/08/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 129, to_date('2020/08/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 130, to_date('2020/08/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 130, to_date('2020/08/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 131, to_date('2020/08/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 131, to_date('2020/08/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 132, to_date('2020/09/06','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 132, to_date('2020/09/06','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 133, to_date('2020/09/30','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 133, to_date('2020/09/30','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 134, to_date('2020/08/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 134, to_date('2020/08/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 135, to_date('2020/08/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 135, to_date('2020/08/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 136, to_date('2020/08/30','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 136, to_date('2020/08/30','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 137, to_date('2020/08/16','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 137, to_date('2020/08/16','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 138, to_date('2020/10/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 138, to_date('2020/10/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 139, to_date('2020/12/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 139, to_date('2020/12/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 140, to_date('2020/10/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 140, to_date('2020/10/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 141, to_date('2020/09/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 141, to_date('2020/09/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 142, to_date('2020/08/30','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 142, to_date('2020/08/30','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 143, to_date('2020/12/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 143, to_date('2020/12/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 144, to_date('2020/09/30','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 144, to_date('2020/09/30','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 145, to_date('2020/08/30','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 145, to_date('2020/08/30','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 146, to_date('2020/12/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 146, to_date('2020/12/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 147, to_date('2020/08/16','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 147, to_date('2020/08/16','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 148, to_date('2020/12/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 148, to_date('2020/12/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 149, to_date('2020/08/07','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 149, to_date('2020/08/09','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 150, to_date('2020/10/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 150, to_date('2020/10/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 151, to_date('2020/11/13','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 151, to_date('2020/11/13','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 152, to_date('2020/12/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 152, to_date('2020/12/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 153, to_date('2020/10/01','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 153, to_date('2020/10/01','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 154, to_date('2020/08/23','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 154, to_date('2020/08/23','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 155, to_date('2020/08/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 155, to_date('2020/08/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 156, to_date('2020/10/16','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 156, to_date('2020/10/17','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 157, to_date('2020/08/29','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 157, to_date('2020/08/30','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 158, to_date('2020/10/02','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 158, to_date('2020/10/02','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 159, to_date('2020/08/29','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 159, to_date('2020/08/29','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 160, to_date('2021/01/08','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 160, to_date('2021/01/08','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 161, to_date('2020/09/27','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 161, to_date('2020/09/27','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 162, to_date('2020/10/31','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 162, to_date('2020/10/31','yyyy/mm/dd'), '2회차 7시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 163, to_date('2020/09/30','yyyy/mm/dd'), '1회차 4시');

insert into yes_show_date(date_id, prod_id, date_showday, date_showtime)
values(seq_show_date.nextval, 163, to_date('2020/09/30','yyyy/mm/dd'), '2회차 7시');

commit;
------------------------------------------------------------------------


-- 공연 좌석 종류 테이블
drop table yes_seat_type cascade constraints purge;
create table yes_seat_type
(seattype_id        number(10)                  -- 좌석종류코드
,prod_id            number
,seat_type          varchar(3)                  -- 좌석타입(R, S, A..)
,seat_price         number(10)                  -- 좌석이름
,seat_color         varchar2(20)                -- 좌석색깔
,constraint PK_seattype_id primary key(seattype_id)
);

drop sequence seq_seat_type;
create sequence seq_seat_type
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into yes_seat_type(seattype_id, prod_id, seat_type, seat_price, seat_color)
values(seq_seat_type.nextval, 1, 'VIP', '120000', 'indianred');
insert into yes_seat_type(seattype_id, prod_id, seat_type, seat_price, seat_color)
values(seq_seat_type.nextval, 1, 'R', 80000, 'darkslateblue');
insert into yes_seat_type(seattype_id, prod_id, seat_type, seat_price, seat_color)
values(seq_seat_type.nextval, 1, 'S', 40000, 'mediumpurple');

commit;


---------------------------------------------------------
-- 공연 좌석 테이블
drop table yes_show_seat cascade constraints purge;
create table yes_show_seat
(seat_id        number(10)                  -- 좌석코드
,prod_id        number
,seattype_id    number                      -- 좌석타입코드(FK)
,date_id        number(20)                  -- 공연 일시/회차 (FK)
,seat_name      varchar2(40)                -- 좌석이름
,seat_status    number(1)       default 0   -- 좌석상태
,constraint PK_seat_id primary key(seat_id)
,constraint FK_prod_id_seat foreign key(prod_id) references prod(prod_id) on delete cascade
,constraint FK_seattype_id_seat foreign key(seattype_id) references yes_seat_type(seattype_id) on delete cascade
);

select * 
from yes_show_seat;

alter table yes_show_seat ADD prod_id number;
alter table yes_show_seat 
ADD CONSTRAINT FK_prod_id_seat
foreign key(prod_id) references prod(prod_id) on delete cascade;


constraint FK_prod_id_seat foreign key(prod_id) references prod(prod_id) on delete cascade

drop sequence seq_show_seat;
create sequence seq_show_seat
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

update yes_show_seat set seat_status = 1 where seat_id = 17;
commit;


INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (1, 2, '1층 A구역 01열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (2, 2, '1층 A구역 01열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (3, 2, '1층 A구역 01열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (4, 2, '1층 A구역 01열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (5, 2, '1층 A구역 01열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (6, 2, '1층 A구역 01열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (7, 2, '1층 A구역 01열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (8, 2, '1층 A구역 01열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (9, 2, '1층 B구역 01열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (10, 2, '1층 B구역 01열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (11, 2, '1층 B구역 01열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (12, 2, '1층 B구역 01열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (13, 2, '1층 B구역 01열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (14, 1, '1층 B구역 01열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (15, 1, '1층 B구역 01열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (16, 1, '1층 B구역 01열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (17, 1, '1층 B구역 01열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (18, 1, '1층 B구역 01열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (19, 1, '1층 B구역 01열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (20, 1, '1층 B구역 01열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (21, 1, '1층 B구역 01열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (22, 1, '1층 B구역 01열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (23, 1, '1층 B구역 01열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (24, 1, '1층 B구역 01열 016번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (25, 2, '1층 B구역 01열 017번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (26, 2, '1층 B구역 01열 018번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (27, 2, '1층 B구역 01열 019번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (28, 2, '1층 B구역 01열 020번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (29, 2, '1층 B구역 01열 021번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (30, 2, '1층 C구역 01열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (31, 2, '1층 C구역 01열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (32, 2, '1층 C구역 01열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (33, 2, '1층 C구역 01열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (34, 2, '1층 C구역 01열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (35, 2, '1층 C구역 01열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (36, 2, '1층 C구역 01열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (37, 2, '1층 C구역 01열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (38, 2, '1층 A구역 02열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (39, 2, '1층 A구역 02열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (40, 2, '1층 A구역 02열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (41, 2, '1층 A구역 02열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (42, 2, '1층 A구역 02열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (43, 2, '1층 A구역 02열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (44, 2, '1층 A구역 02열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (45, 2, '1층 A구역 02열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (46, 2, '1층 B구역 02열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (47, 2, '1층 B구역 02열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (48, 2, '1층 B구역 02열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (49, 2, '1층 B구역 02열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (50, 1, '1층 B구역 02열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (51, 1, '1층 B구역 02열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (52, 1, '1층 B구역 02열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (53, 1, '1층 B구역 02열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (54, 1, '1층 B구역 02열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (55, 1, '1층 B구역 02열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (56, 1, '1층 B구역 02열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (57, 1, '1층 B구역 02열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (58, 1, '1층 B구역 02열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (59, 1, '1층 B구역 02열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (60, 1, '1층 B구역 02열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (61, 1, '1층 B구역 02열 016번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (62, 1, '1층 B구역 02열 017번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (63, 2, '1층 B구역 02열 018번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (64, 2, '1층 B구역 02열 019번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (65, 2, '1층 B구역 02열 020번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (66, 2, '1층 B구역 02열 021번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (67, 2, '1층 C구역 02열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (68, 2, '1층 C구역 02열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (69, 2, '1층 C구역 02열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (70, 2, '1층 C구역 02열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (71, 2, '1층 C구역 02열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (72, 2, '1층 C구역 02열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (73, 2, '1층 C구역 02열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (74, 2, '1층 C구역 02열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (75, 2, '1층 A구역 03열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (76, 2, '1층 A구역 03열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (77, 2, '1층 A구역 03열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (78, 2, '1층 A구역 03열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (79, 2, '1층 A구역 03열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (80, 2, '1층 A구역 03열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (81, 2, '1층 A구역 03열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (82, 2, '1층 A구역 03열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (83, 2, '1층 B구역 03열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (84, 2, '1층 B구역 03열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (85, 2, '1층 B구역 03열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (86, 1, '1층 B구역 03열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (87, 1, '1층 B구역 03열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (88, 1, '1층 B구역 03열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (89, 1, '1층 B구역 03열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (90, 1, '1층 B구역 03열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (91, 1, '1층 B구역 03열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (92, 1, '1층 B구역 03열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (93, 1, '1층 B구역 03열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (94, 1, '1층 B구역 03열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (95, 1, '1층 B구역 03열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (96, 1, '1층 B구역 03열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (97, 1, '1층 B구역 03열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (98, 1, '1층 B구역 03열 016번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (99, 1, '1층 B구역 03열 017번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (100, 1, '1층 B구역 03열 018번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (101, 2, '1층 B구역 03열 019번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (102, 2, '1층 B구역 03열 020번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (103, 2, '1층 B구역 03열 021번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (104, 2, '1층 C구역 03열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (105, 2, '1층 C구역 03열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (106, 2, '1층 C구역 03열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (107, 2, '1층 C구역 03열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (108, 2, '1층 C구역 03열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (109, 2, '1층 C구역 03열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (110, 2, '1층 C구역 03열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (111, 2, '1층 C구역 03열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (112, 2, '1층 A구역 04열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (113, 2, '1층 A구역 04열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (114, 2, '1층 A구역 04열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (115, 2, '1층 A구역 04열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (116, 2, '1층 A구역 04열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (117, 2, '1층 A구역 04열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (118, 2, '1층 A구역 04열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (119, 2, '1층 A구역 04열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (120, 2, '1층 B구역 04열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (121, 2, '1층 B구역 04열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (122, 1, '1층 B구역 04열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (123, 1, '1층 B구역 04열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (124, 1, '1층 B구역 04열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (125, 1, '1층 B구역 04열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (126, 1, '1층 B구역 04열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (127, 1, '1층 B구역 04열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (128, 1, '1층 B구역 04열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (129, 1, '1층 B구역 04열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (130, 1, '1층 B구역 04열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (131, 1, '1층 B구역 04열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (132, 1, '1층 B구역 04열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (133, 1, '1층 B구역 04열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (134, 1, '1층 B구역 04열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (135, 1, '1층 B구역 04열 016번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (136, 1, '1층 B구역 04열 017번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (137, 1, '1층 B구역 04열 018번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (138, 1, '1층 B구역 04열 019번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (139, 2, '1층 B구역 04열 020번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (140, 2, '1층 B구역 04열 021번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (141, 2, '1층 C구역 04열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (142, 2, '1층 C구역 04열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (143, 2, '1층 C구역 04열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (144, 2, '1층 C구역 04열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (145, 2, '1층 C구역 04열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (146, 2, '1층 C구역 04열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (147, 2, '1층 C구역 04열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (148, 2, '1층 C구역 04열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (149, 2, '1층 A구역 05열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (150, 2, '1층 A구역 05열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (151, 2, '1층 A구역 05열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (152, 2, '1층 A구역 05열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (153, 2, '1층 A구역 05열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (154, 2, '1층 A구역 05열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (155, 2, '1층 A구역 05열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (156, 2, '1층 A구역 05열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (157, 2, '1층 B구역 05열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (158, 1, '1층 B구역 05열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (159, 1, '1층 B구역 05열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (160, 1, '1층 B구역 05열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (161, 1, '1층 B구역 05열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (162, 1, '1층 B구역 05열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (163, 1, '1층 B구역 05열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (164, 1, '1층 B구역 05열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (165, 1, '1층 B구역 05열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (166, 1, '1층 B구역 05열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (167, 1, '1층 B구역 05열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (168, 1, '1층 B구역 05열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (169, 1, '1층 B구역 05열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (170, 1, '1층 B구역 05열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (171, 1, '1층 B구역 05열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (172, 1, '1층 B구역 05열 016번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (173, 1, '1층 B구역 05열 017번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (174, 1, '1층 B구역 05열 018번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (175, 1, '1층 B구역 05열 019번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (176, 1, '1층 B구역 05열 020번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (177, 2, '1층 B구역 05열 021번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (178, 2, '1층 C구역 05열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (179, 2, '1층 C구역 05열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (180, 2, '1층 C구역 05열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (181, 2, '1층 C구역 05열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (182, 2, '1층 C구역 05열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (183, 2, '1층 C구역 05열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (184, 2, '1층 C구역 05열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (185, 2, '1층 C구역 05열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (186, 2, '1층 A구역 06열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (187, 2, '1층 A구역 06열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (188, 2, '1층 A구역 06열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (189, 2, '1층 A구역 06열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (190, 2, '1층 A구역 06열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (191, 2, '1층 A구역 06열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (192, 2, '1층 A구역 06열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (193, 2, '1층 A구역 06열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (194, 1, '1층 B구역 06열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (195, 1, '1층 B구역 06열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (196, 1, '1층 B구역 06열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (197, 1, '1층 B구역 06열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (198, 1, '1층 B구역 06열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (199, 1, '1층 B구역 06열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (200, 1, '1층 B구역 06열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (201, 1, '1층 B구역 06열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (202, 1, '1층 B구역 06열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (203, 1, '1층 B구역 06열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (204, 1, '1층 B구역 06열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (205, 1, '1층 B구역 06열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (206, 1, '1층 B구역 06열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (207, 1, '1층 B구역 06열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (208, 1, '1층 B구역 06열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (209, 1, '1층 B구역 06열 016번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (210, 1, '1층 B구역 06열 017번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (211, 1, '1층 B구역 06열 018번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (212, 1, '1층 B구역 06열 019번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (213, 1, '1층 B구역 06열 020번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (214, 1, '1층 B구역 06열 021번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (215, 2, '1층 C구역 06열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (216, 2, '1층 C구역 06열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (217, 2, '1층 C구역 06열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (218, 2, '1층 C구역 06열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (219, 2, '1층 C구역 06열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (220, 2, '1층 C구역 06열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (221, 2, '1층 C구역 06열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (222, 2, '1층 C구역 06열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (223, 2, '1층 A구역 07열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (224, 2, '1층 A구역 07열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (225, 2, '1층 A구역 07열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (226, 2, '1층 A구역 07열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (227, 2, '1층 A구역 07열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (228, 2, '1층 A구역 07열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (229, 2, '1층 A구역 07열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (230, 2, '1층 A구역 07열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (231, 1, '1층 B구역 07열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (232, 1, '1층 B구역 07열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (233, 1, '1층 B구역 07열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (234, 1, '1층 B구역 07열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (235, 1, '1층 B구역 07열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (236, 1, '1층 B구역 07열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (237, 1, '1층 B구역 07열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (238, 1, '1층 B구역 07열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (239, 1, '1층 B구역 07열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (240, 1, '1층 B구역 07열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (241, 1, '1층 B구역 07열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (242, 1, '1층 B구역 07열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (243, 1, '1층 B구역 07열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (244, 1, '1층 B구역 07열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (245, 1, '1층 B구역 07열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (246, 1, '1층 B구역 07열 016번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (247, 1, '1층 B구역 07열 017번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (248, 1, '1층 B구역 07열 018번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (249, 1, '1층 B구역 07열 019번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (250, 1, '1층 B구역 07열 020번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (251, 1, '1층 B구역 07열 021번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (252, 2, '1층 C구역 07열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (253, 2, '1층 C구역 07열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (254, 2, '1층 C구역 07열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (255, 2, '1층 C구역 07열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (256, 2, '1층 C구역 07열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (257, 2, '1층 C구역 07열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (258, 2, '1층 C구역 07열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (259, 2, '1층 C구역 07열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (260, 2, '1층 A구역 08열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (261, 2, '1층 A구역 08열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (262, 2, '1층 A구역 08열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (263, 2, '1층 A구역 08열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (264, 2, '1층 A구역 08열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (265, 2, '1층 A구역 08열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (266, 2, '1층 A구역 08열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (267, 2, '1층 A구역 08열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (268, 1, '1층 B구역 08열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (269, 1, '1층 B구역 08열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (270, 1, '1층 B구역 08열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (271, 1, '1층 B구역 08열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (272, 1, '1층 B구역 08열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (273, 1, '1층 B구역 08열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (274, 1, '1층 B구역 08열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (275, 1, '1층 B구역 08열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (276, 1, '1층 B구역 08열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (277, 1, '1층 B구역 08열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (278, 1, '1층 B구역 08열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (279, 1, '1층 B구역 08열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (280, 1, '1층 B구역 08열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (281, 1, '1층 B구역 08열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (282, 1, '1층 B구역 08열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (283, 1, '1층 B구역 08열 016번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (284, 1, '1층 B구역 08열 017번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (285, 1, '1층 B구역 08열 018번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (286, 1, '1층 B구역 08열 019번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (287, 1, '1층 B구역 08열 020번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (288, 1, '1층 B구역 08열 021번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (289, 2, '1층 C구역 08열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (290, 2, '1층 C구역 08열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (291, 2, '1층 C구역 08열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (292, 2, '1층 C구역 08열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (293, 2, '1층 C구역 08열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (294, 2, '1층 C구역 08열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (295, 2, '1층 C구역 08열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (296, 2, '1층 C구역 08열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (297, 2, '1층 A구역 09열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (298, 2, '1층 A구역 09열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (299, 2, '1층 A구역 09열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (300, 2, '1층 A구역 09열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (301, 2, '1층 A구역 09열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (302, 2, '1층 A구역 09열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (303, 2, '1층 A구역 09열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (304, 2, '1층 A구역 09열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (305, 1, '1층 B구역 09열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (306, 1, '1층 B구역 09열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (307, 1, '1층 B구역 09열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (308, 1, '1층 B구역 09열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (309, 1, '1층 B구역 09열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (310, 1, '1층 B구역 09열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (311, 1, '1층 B구역 09열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (312, 1, '1층 B구역 09열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (313, 1, '1층 B구역 09열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (314, 1, '1층 B구역 09열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (315, 1, '1층 B구역 09열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (316, 1, '1층 B구역 09열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (317, 1, '1층 B구역 09열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (318, 1, '1층 B구역 09열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (319, 1, '1층 B구역 09열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (320, 1, '1층 B구역 09열 016번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (321, 1, '1층 B구역 09열 017번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (322, 1, '1층 B구역 09열 018번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (323, 1, '1층 B구역 09열 019번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (324, 1, '1층 B구역 09열 020번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (325, 1, '1층 B구역 09열 021번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (326, 2, '1층 C구역 09열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (327, 2, '1층 C구역 09열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (328, 2, '1층 C구역 09열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (329, 2, '1층 C구역 09열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (330, 2, '1층 C구역 09열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (331, 2, '1층 C구역 09열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (332, 2, '1층 C구역 09열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (333, 2, '1층 C구역 09열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (334, 2, '1층 A구역 10열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (335, 2, '1층 A구역 10열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (336, 2, '1층 A구역 10열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (337, 2, '1층 A구역 10열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (338, 2, '1층 A구역 10열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (339, 2, '1층 A구역 10열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (340, 2, '1층 A구역 10열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (341, 2, '1층 A구역 10열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (342, 2, '1층 B구역 10열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (343, 2, '1층 B구역 10열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (344, 2, '1층 B구역 10열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (345, 2, '1층 B구역 10열 019번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (346, 2, '1층 B구역 10열 020번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (347, 2, '1층 B구역 10열 021번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (348, 2, '1층 C구역 10열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (349, 2, '1층 C구역 10열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (350, 2, '1층 C구역 10열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (351, 2, '1층 C구역 10열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (352, 2, '1층 C구역 10열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (353, 2, '1층 C구역 10열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (354, 2, '1층 C구역 10열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (355, 2, '1층 C구역 10열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (356, 3, '2층 A구역 01열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (357, 3, '2층 A구역 01열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (358, 3, '2층 A구역 01열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (359, 3, '2층 A구역 01열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (360, 3, '2층 A구역 01열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (361, 3, '2층 A구역 01열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (362, 3, '2층 A구역 01열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (363, 3, '2층 A구역 01열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (364, 3, '2층 A구역 01열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (365, 3, '2층 A구역 01열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (366, 3, '2층 B구역 01열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (367, 3, '2층 B구역 01열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (368, 3, '2층 B구역 01열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (369, 3, '2층 B구역 01열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (370, 3, '2층 B구역 01열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (371, 3, '2층 B구역 01열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (372, 3, '2층 B구역 01열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (373, 3, '2층 B구역 01열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (374, 3, '2층 B구역 01열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (375, 3, '2층 B구역 01열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (376, 3, '2층 B구역 01열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (377, 3, '2층 B구역 01열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (378, 3, '2층 B구역 01열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (379, 3, '2층 B구역 01열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (380, 3, '2층 B구역 01열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (381, 3, '2층 C구역 01열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (382, 3, '2층 C구역 01열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (383, 3, '2층 C구역 01열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (384, 3, '2층 C구역 01열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (385, 3, '2층 C구역 01열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (386, 3, '2층 C구역 01열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (387, 3, '2층 C구역 01열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (388, 3, '2층 C구역 01열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (389, 3, '2층 C구역 01열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (390, 3, '2층 C구역 01열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (391, 3, '2층 A구역 02열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (392, 3, '2층 A구역 02열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (393, 3, '2층 A구역 02열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (394, 3, '2층 A구역 02열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (395, 3, '2층 A구역 02열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (396, 3, '2층 A구역 02열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (397, 3, '2층 A구역 02열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (398, 3, '2층 A구역 02열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (399, 3, '2층 A구역 02열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (400, 3, '2층 A구역 02열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (401, 3, '2층 B구역 02열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (402, 3, '2층 B구역 02열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (403, 3, '2층 B구역 02열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (404, 3, '2층 B구역 02열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (405, 3, '2층 B구역 02열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (406, 3, '2층 B구역 02열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (407, 3, '2층 B구역 02열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (408, 3, '2층 B구역 02열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (409, 3, '2층 B구역 02열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (410, 3, '2층 B구역 02열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (411, 3, '2층 B구역 02열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (412, 3, '2층 B구역 02열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (413, 3, '2층 B구역 02열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (414, 3, '2층 B구역 02열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (415, 3, '2층 B구역 02열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (416, 3, '2층 C구역 02열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (417, 3, '2층 C구역 02열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (418, 3, '2층 C구역 02열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (419, 3, '2층 C구역 02열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (420, 3, '2층 C구역 02열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (421, 3, '2층 C구역 02열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (422, 3, '2층 C구역 02열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (423, 3, '2층 C구역 02열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (424, 3, '2층 C구역 02열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (425, 3, '2층 C구역 02열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (426, 3, '2층 A구역 03열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (427, 3, '2층 A구역 03열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (428, 3, '2층 A구역 03열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (429, 3, '2층 A구역 03열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (430, 3, '2층 A구역 03열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (431, 3, '2층 A구역 03열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (432, 3, '2층 A구역 03열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (433, 3, '2층 A구역 03열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (434, 3, '2층 A구역 03열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (435, 3, '2층 A구역 03열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (436, 3, '2층 B구역 03열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (437, 3, '2층 B구역 03열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (438, 3, '2층 B구역 03열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (439, 3, '2층 B구역 03열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (440, 3, '2층 B구역 03열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (441, 3, '2층 B구역 03열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (442, 3, '2층 B구역 03열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (443, 3, '2층 B구역 03열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (444, 3, '2층 B구역 03열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (445, 3, '2층 B구역 03열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (446, 3, '2층 B구역 03열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (447, 3, '2층 B구역 03열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (448, 3, '2층 B구역 03열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (449, 3, '2층 B구역 03열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (450, 3, '2층 B구역 03열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (451, 3, '2층 C구역 03열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (452, 3, '2층 C구역 03열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (453, 3, '2층 C구역 03열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (454, 3, '2층 C구역 03열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (455, 3, '2층 C구역 03열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (456, 3, '2층 C구역 03열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (457, 3, '2층 C구역 03열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (458, 3, '2층 C구역 03열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (459, 3, '2층 C구역 03열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (460, 3, '2층 C구역 03열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (461, 3, '2층 A구역 04열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (462, 3, '2층 A구역 04열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (463, 3, '2층 A구역 04열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (464, 3, '2층 A구역 04열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (465, 3, '2층 A구역 04열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (466, 3, '2층 A구역 04열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (467, 3, '2층 A구역 04열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (468, 3, '2층 A구역 04열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (469, 3, '2층 A구역 04열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (470, 3, '2층 A구역 04열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (471, 3, '2층 B구역 04열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (472, 3, '2층 B구역 04열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (473, 3, '2층 B구역 04열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (474, 3, '2층 B구역 04열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (475, 3, '2층 B구역 04열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (476, 3, '2층 B구역 04열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (477, 3, '2층 B구역 04열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (478, 3, '2층 B구역 04열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (479, 3, '2층 B구역 04열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (480, 3, '2층 B구역 04열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (481, 3, '2층 B구역 04열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (482, 3, '2층 B구역 04열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (483, 3, '2층 B구역 04열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (484, 3, '2층 B구역 04열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (485, 3, '2층 B구역 04열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (486, 3, '2층 C구역 04열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (487, 3, '2층 C구역 04열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (488, 3, '2층 C구역 04열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (489, 3, '2층 C구역 04열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (490, 3, '2층 C구역 04열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (491, 3, '2층 C구역 04열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (492, 3, '2층 C구역 04열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (493, 3, '2층 C구역 04열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (494, 3, '2층 C구역 04열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (495, 3, '2층 C구역 04열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (496, 3, '2층 A구역 05열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (497, 3, '2층 A구역 05열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (498, 3, '2층 A구역 05열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (499, 3, '2층 A구역 05열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (500, 3, '2층 A구역 05열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (501, 3, '2층 A구역 05열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (502, 3, '2층 A구역 05열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (503, 3, '2층 A구역 05열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (504, 3, '2층 A구역 05열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (505, 3, '2층 A구역 05열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (506, 3, '2층 B구역 05열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (507, 3, '2층 B구역 05열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (508, 3, '2층 B구역 05열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (509, 3, '2층 B구역 05열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (510, 3, '2층 B구역 05열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (511, 3, '2층 B구역 05열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (512, 3, '2층 B구역 05열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (513, 3, '2층 B구역 05열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (514, 3, '2층 B구역 05열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (515, 3, '2층 B구역 05열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (516, 3, '2층 B구역 05열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (517, 3, '2층 B구역 05열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (518, 3, '2층 B구역 05열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (519, 3, '2층 B구역 05열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (520, 3, '2층 B구역 05열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (521, 3, '2층 C구역 05열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (522, 3, '2층 C구역 05열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (523, 3, '2층 C구역 05열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (524, 3, '2층 C구역 05열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (525, 3, '2층 C구역 05열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (526, 3, '2층 C구역 05열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (527, 3, '2층 C구역 05열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (528, 3, '2층 C구역 05열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (529, 3, '2층 C구역 05열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (530, 3, '2층 C구역 05열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (531, 3, '2층 A구역 06열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (532, 3, '2층 A구역 06열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (533, 3, '2층 A구역 06열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (534, 3, '2층 A구역 06열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (535, 3, '2층 A구역 06열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (536, 3, '2층 A구역 06열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (537, 3, '2층 A구역 06열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (538, 3, '2층 A구역 06열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (539, 3, '2층 A구역 06열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (540, 3, '2층 A구역 06열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (541, 3, '2층 B구역 06열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (542, 3, '2층 B구역 06열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (543, 3, '2층 B구역 06열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (544, 3, '2층 B구역 06열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (545, 3, '2층 B구역 06열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (546, 3, '2층 B구역 06열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (547, 3, '2층 B구역 06열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (548, 3, '2층 B구역 06열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (549, 3, '2층 B구역 06열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (550, 3, '2층 B구역 06열 010번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (551, 3, '2층 B구역 06열 011번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (552, 3, '2층 B구역 06열 012번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (553, 3, '2층 B구역 06열 013번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (554, 3, '2층 B구역 06열 014번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (555, 3, '2층 B구역 06열 015번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (556, 3, '2층 C구역 06열 001번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (557, 3, '2층 C구역 06열 002번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (558, 3, '2층 C구역 06열 003번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (559, 3, '2층 C구역 06열 004번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (560, 3, '2층 C구역 06열 005번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (561, 3, '2층 C구역 06열 006번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (562, 3, '2층 C구역 06열 007번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (563, 3, '2층 C구역 06열 008번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (564, 3, '2층 C구역 06열 009번', 0, 1);
INSERT INTO YES_SHOW_SEAT (SEAT_ID, seattype_id, SEAT_NAME, SEAT_STATUS, date_id) VALUES (565, 3, '2층 C구역 06열 010번', 0, 1);
commit;


INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1, 2, 1, '1층 A구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2, 2, 1, '1층 A구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (3, 2, 1, '1층 A구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (4, 2, 1, '1층 A구역 01열 004번', 1, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (5, 2, 1, '1층 A구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (6, 2, 1, '1층 A구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (7, 2, 1, '1층 A구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (8, 2, 1, '1층 A구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (9, 2, 1, '1층 B구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (10, 2, 1, '1층 B구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (11, 2, 1, '1층 B구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (12, 2, 1, '1층 B구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (13, 2, 1, '1층 B구역 01열 005번', 1, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (14, 1, 1, '1층 B구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (15, 1, 1, '1층 B구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (16, 1, 1, '1층 B구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (17, 1, 1, '1층 B구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (18, 1, 1, '1층 B구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (19, 1, 1, '1층 B구역 01열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (20, 1, 1, '1층 B구역 01열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (21, 1, 1, '1층 B구역 01열 013번', 1, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (22, 1, 1, '1층 B구역 01열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (23, 1, 1, '1층 B구역 01열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (24, 1, 1, '1층 B구역 01열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (25, 2, 1, '1층 B구역 01열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (26, 2, 1, '1층 B구역 01열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (27, 2, 1, '1층 B구역 01열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (28, 2, 1, '1층 B구역 01열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (29, 2, 1, '1층 B구역 01열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (30, 2, 1, '1층 C구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (31, 2, 1, '1층 C구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (32, 2, 1, '1층 C구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (33, 2, 1, '1층 C구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (34, 2, 1, '1층 C구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (35, 2, 1, '1층 C구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (36, 2, 1, '1층 C구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (37, 2, 1, '1층 C구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (38, 2, 1, '1층 A구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (39, 2, 1, '1층 A구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (40, 2, 1, '1층 A구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (41, 2, 1, '1층 A구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (42, 2, 1, '1층 A구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (43, 2, 1, '1층 A구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (44, 2, 1, '1층 A구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (45, 2, 1, '1층 A구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (46, 2, 1, '1층 B구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (47, 2, 1, '1층 B구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (48, 2, 1, '1층 B구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (49, 2, 1, '1층 B구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (50, 1, 1, '1층 B구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (51, 1, 1, '1층 B구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (52, 1, 1, '1층 B구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (53, 1, 1, '1층 B구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (54, 1, 1, '1층 B구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (55, 1, 1, '1층 B구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (56, 1, 1, '1층 B구역 02열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (57, 1, 1, '1층 B구역 02열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (58, 1, 1, '1층 B구역 02열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (59, 1, 1, '1층 B구역 02열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (60, 1, 1, '1층 B구역 02열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (61, 1, 1, '1층 B구역 02열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (62, 1, 1, '1층 B구역 02열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (63, 2, 1, '1층 B구역 02열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (64, 2, 1, '1층 B구역 02열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (65, 2, 1, '1층 B구역 02열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (66, 2, 1, '1층 B구역 02열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (67, 2, 1, '1층 C구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (68, 2, 1, '1층 C구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (69, 2, 1, '1층 C구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (70, 2, 1, '1층 C구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (71, 2, 1, '1층 C구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (72, 2, 1, '1층 C구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (73, 2, 1, '1층 C구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (74, 2, 1, '1층 C구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (75, 2, 1, '1층 A구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (76, 2, 1, '1층 A구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (77, 2, 1, '1층 A구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (78, 2, 1, '1층 A구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (79, 2, 1, '1층 A구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (80, 2, 1, '1층 A구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (81, 2, 1, '1층 A구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (82, 2, 1, '1층 A구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (83, 2, 1, '1층 B구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (84, 2, 1, '1층 B구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (85, 2, 1, '1층 B구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (86, 1, 1, '1층 B구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (87, 1, 1, '1층 B구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (88, 1, 1, '1층 B구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (89, 1, 1, '1층 B구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (90, 1, 1, '1층 B구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (91, 1, 1, '1층 B구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (92, 1, 1, '1층 B구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (93, 1, 1, '1층 B구역 03열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (94, 1, 1, '1층 B구역 03열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (95, 1, 1, '1층 B구역 03열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (96, 1, 1, '1층 B구역 03열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (97, 1, 1, '1층 B구역 03열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (98, 1, 1, '1층 B구역 03열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (99, 1, 1, '1층 B구역 03열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (100, 1, 1, '1층 B구역 03열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (101, 2, 1, '1층 B구역 03열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (102, 2, 1, '1층 B구역 03열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (103, 2, 1, '1층 B구역 03열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (104, 2, 1, '1층 C구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (105, 2, 1, '1층 C구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (106, 2, 1, '1층 C구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (107, 2, 1, '1층 C구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (108, 2, 1, '1층 C구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (109, 2, 1, '1층 C구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (110, 2, 1, '1층 C구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (111, 2, 1, '1층 C구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (112, 2, 1, '1층 A구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (113, 2, 1, '1층 A구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (114, 2, 1, '1층 A구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (115, 2, 1, '1층 A구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (116, 2, 1, '1층 A구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (117, 2, 1, '1층 A구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (118, 2, 1, '1층 A구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (119, 2, 1, '1층 A구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (120, 2, 1, '1층 B구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (121, 2, 1, '1층 B구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (122, 1, 1, '1층 B구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (123, 1, 1, '1층 B구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (124, 1, 1, '1층 B구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (125, 1, 1, '1층 B구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (126, 1, 1, '1층 B구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (127, 1, 1, '1층 B구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (128, 1, 1, '1층 B구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (129, 1, 1, '1층 B구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (130, 1, 1, '1층 B구역 04열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (131, 1, 1, '1층 B구역 04열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (132, 1, 1, '1층 B구역 04열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (133, 1, 1, '1층 B구역 04열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (134, 1, 1, '1층 B구역 04열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (135, 1, 1, '1층 B구역 04열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (136, 1, 1, '1층 B구역 04열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (137, 1, 1, '1층 B구역 04열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (138, 1, 1, '1층 B구역 04열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (139, 2, 1, '1층 B구역 04열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (140, 2, 1, '1층 B구역 04열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (141, 2, 1, '1층 C구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (142, 2, 1, '1층 C구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (143, 2, 1, '1층 C구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (144, 2, 1, '1층 C구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (145, 2, 1, '1층 C구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (146, 2, 1, '1층 C구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (147, 2, 1, '1층 C구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (148, 2, 1, '1층 C구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (149, 2, 1, '1층 A구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (150, 2, 1, '1층 A구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (151, 2, 1, '1층 A구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (152, 2, 1, '1층 A구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (153, 2, 1, '1층 A구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (154, 2, 1, '1층 A구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (155, 2, 1, '1층 A구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (156, 2, 1, '1층 A구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (157, 2, 1, '1층 B구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (158, 1, 1, '1층 B구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (159, 1, 1, '1층 B구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (160, 1, 1, '1층 B구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (161, 1, 1, '1층 B구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (162, 1, 1, '1층 B구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (163, 1, 1, '1층 B구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (164, 1, 1, '1층 B구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (165, 1, 1, '1층 B구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (166, 1, 1, '1층 B구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (167, 1, 1, '1층 B구역 05열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (168, 1, 1, '1층 B구역 05열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (169, 1, 1, '1층 B구역 05열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (170, 1, 1, '1층 B구역 05열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (171, 1, 1, '1층 B구역 05열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (172, 1, 1, '1층 B구역 05열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (173, 1, 1, '1층 B구역 05열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (174, 1, 1, '1층 B구역 05열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (175, 1, 1, '1층 B구역 05열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (176, 1, 1, '1층 B구역 05열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (177, 2, 1, '1층 B구역 05열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (178, 2, 1, '1층 C구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (179, 2, 1, '1층 C구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (180, 2, 1, '1층 C구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (181, 2, 1, '1층 C구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (182, 2, 1, '1층 C구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (183, 2, 1, '1층 C구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (184, 2, 1, '1층 C구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (185, 2, 1, '1층 C구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (186, 2, 1, '1층 A구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (187, 2, 1, '1층 A구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (188, 2, 1, '1층 A구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (189, 2, 1, '1층 A구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (190, 2, 1, '1층 A구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (191, 2, 1, '1층 A구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (192, 2, 1, '1층 A구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (193, 2, 1, '1층 A구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (194, 1, 1, '1층 B구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (195, 1, 1, '1층 B구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (196, 1, 1, '1층 B구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (197, 1, 1, '1층 B구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (198, 1, 1, '1층 B구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (199, 1, 1, '1층 B구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (200, 1, 1, '1층 B구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (201, 1, 1, '1층 B구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (202, 1, 1, '1층 B구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (203, 1, 1, '1층 B구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (204, 1, 1, '1층 B구역 06열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (205, 1, 1, '1층 B구역 06열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (206, 1, 1, '1층 B구역 06열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (207, 1, 1, '1층 B구역 06열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (208, 1, 1, '1층 B구역 06열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (209, 1, 1, '1층 B구역 06열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (210, 1, 1, '1층 B구역 06열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (211, 1, 1, '1층 B구역 06열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (212, 1, 1, '1층 B구역 06열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (213, 1, 1, '1층 B구역 06열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (214, 1, 1, '1층 B구역 06열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (215, 2, 1, '1층 C구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (216, 2, 1, '1층 C구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (217, 2, 1, '1층 C구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (218, 2, 1, '1층 C구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (219, 2, 1, '1층 C구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (220, 2, 1, '1층 C구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (221, 2, 1, '1층 C구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (222, 2, 1, '1층 C구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (223, 2, 1, '1층 A구역 07열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (224, 2, 1, '1층 A구역 07열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (225, 2, 1, '1층 A구역 07열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (226, 2, 1, '1층 A구역 07열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (227, 2, 1, '1층 A구역 07열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (228, 2, 1, '1층 A구역 07열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (229, 2, 1, '1층 A구역 07열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (230, 2, 1, '1층 A구역 07열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (231, 1, 1, '1층 B구역 07열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (232, 1, 1, '1층 B구역 07열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (233, 1, 1, '1층 B구역 07열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (234, 1, 1, '1층 B구역 07열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (235, 1, 1, '1층 B구역 07열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (236, 1, 1, '1층 B구역 07열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (237, 1, 1, '1층 B구역 07열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (238, 1, 1, '1층 B구역 07열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (239, 1, 1, '1층 B구역 07열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (240, 1, 1, '1층 B구역 07열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (241, 1, 1, '1층 B구역 07열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (242, 1, 1, '1층 B구역 07열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (243, 1, 1, '1층 B구역 07열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (244, 1, 1, '1층 B구역 07열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (245, 1, 1, '1층 B구역 07열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (246, 1, 1, '1층 B구역 07열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (247, 1, 1, '1층 B구역 07열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (248, 1, 1, '1층 B구역 07열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (249, 1, 1, '1층 B구역 07열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (250, 1, 1, '1층 B구역 07열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (251, 1, 1, '1층 B구역 07열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (252, 2, 1, '1층 C구역 07열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (253, 2, 1, '1층 C구역 07열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (254, 2, 1, '1층 C구역 07열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (255, 2, 1, '1층 C구역 07열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (256, 2, 1, '1층 C구역 07열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (257, 2, 1, '1층 C구역 07열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (258, 2, 1, '1층 C구역 07열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (259, 2, 1, '1층 C구역 07열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (260, 2, 1, '1층 A구역 08열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (261, 2, 1, '1층 A구역 08열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (262, 2, 1, '1층 A구역 08열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (263, 2, 1, '1층 A구역 08열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (264, 2, 1, '1층 A구역 08열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (265, 2, 1, '1층 A구역 08열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (266, 2, 1, '1층 A구역 08열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (267, 2, 1, '1층 A구역 08열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (268, 1, 1, '1층 B구역 08열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (269, 1, 1, '1층 B구역 08열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (270, 1, 1, '1층 B구역 08열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (271, 1, 1, '1층 B구역 08열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (272, 1, 1, '1층 B구역 08열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (273, 1, 1, '1층 B구역 08열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (274, 1, 1, '1층 B구역 08열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (275, 1, 1, '1층 B구역 08열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (276, 1, 1, '1층 B구역 08열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (277, 1, 1, '1층 B구역 08열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (278, 1, 1, '1층 B구역 08열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (279, 1, 1, '1층 B구역 08열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (280, 1, 1, '1층 B구역 08열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (281, 1, 1, '1층 B구역 08열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (282, 1, 1, '1층 B구역 08열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (283, 1, 1, '1층 B구역 08열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (284, 1, 1, '1층 B구역 08열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (285, 1, 1, '1층 B구역 08열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (286, 1, 1, '1층 B구역 08열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (287, 1, 1, '1층 B구역 08열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (288, 1, 1, '1층 B구역 08열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (289, 2, 1, '1층 C구역 08열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (290, 2, 1, '1층 C구역 08열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (291, 2, 1, '1층 C구역 08열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (292, 2, 1, '1층 C구역 08열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (293, 2, 1, '1층 C구역 08열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (294, 2, 1, '1층 C구역 08열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (295, 2, 1, '1층 C구역 08열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (296, 2, 1, '1층 C구역 08열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (297, 2, 1, '1층 A구역 09열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (298, 2, 1, '1층 A구역 09열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (299, 2, 1, '1층 A구역 09열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (300, 2, 1, '1층 A구역 09열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (301, 2, 1, '1층 A구역 09열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (302, 2, 1, '1층 A구역 09열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (303, 2, 1, '1층 A구역 09열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (304, 2, 1, '1층 A구역 09열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (305, 1, 1, '1층 B구역 09열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (306, 1, 1, '1층 B구역 09열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (307, 1, 1, '1층 B구역 09열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (308, 1, 1, '1층 B구역 09열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (309, 1, 1, '1층 B구역 09열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (310, 1, 1, '1층 B구역 09열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (311, 1, 1, '1층 B구역 09열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (312, 1, 1, '1층 B구역 09열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (313, 1, 1, '1층 B구역 09열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (314, 1, 1, '1층 B구역 09열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (315, 1, 1, '1층 B구역 09열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (316, 1, 1, '1층 B구역 09열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (317, 1, 1, '1층 B구역 09열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (318, 1, 1, '1층 B구역 09열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (319, 1, 1, '1층 B구역 09열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (320, 1, 1, '1층 B구역 09열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (321, 1, 1, '1층 B구역 09열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (322, 1, 1, '1층 B구역 09열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (323, 1, 1, '1층 B구역 09열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (324, 1, 1, '1층 B구역 09열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (325, 1, 1, '1층 B구역 09열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (326, 2, 1, '1층 C구역 09열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (327, 2, 1, '1층 C구역 09열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (328, 2, 1, '1층 C구역 09열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (329, 2, 1, '1층 C구역 09열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (330, 2, 1, '1층 C구역 09열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (331, 2, 1, '1층 C구역 09열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (332, 2, 1, '1층 C구역 09열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (333, 2, 1, '1층 C구역 09열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (334, 2, 1, '1층 A구역 10열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (335, 2, 1, '1층 A구역 10열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (336, 2, 1, '1층 A구역 10열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (337, 2, 1, '1층 A구역 10열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (338, 2, 1, '1층 A구역 10열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (339, 2, 1, '1층 A구역 10열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (340, 2, 1, '1층 A구역 10열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (341, 2, 1, '1층 A구역 10열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (342, 2, 1, '1층 B구역 10열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (343, 2, 1, '1층 B구역 10열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (344, 2, 1, '1층 B구역 10열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (345, 2, 1, '1층 B구역 10열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (346, 2, 1, '1층 B구역 10열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (347, 2, 1, '1층 B구역 10열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (348, 2, 1, '1층 C구역 10열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (349, 2, 1, '1층 C구역 10열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (350, 2, 1, '1층 C구역 10열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (351, 2, 1, '1층 C구역 10열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (352, 2, 1, '1층 C구역 10열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (353, 2, 1, '1층 C구역 10열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (354, 2, 1, '1층 C구역 10열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (355, 2, 1, '1층 C구역 10열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (356, 3, 1, '2층 A구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (357, 3, 1, '2층 A구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (358, 3, 1, '2층 A구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (359, 3, 1, '2층 A구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (360, 3, 1, '2층 A구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (361, 3, 1, '2층 A구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (362, 3, 1, '2층 A구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (363, 3, 1, '2층 A구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (364, 3, 1, '2층 A구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (365, 3, 1, '2층 A구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (366, 3, 1, '2층 B구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (367, 3, 1, '2층 B구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (368, 3, 1, '2층 B구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (369, 3, 1, '2층 B구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (370, 3, 1, '2층 B구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (371, 3, 1, '2층 B구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (372, 3, 1, '2층 B구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (373, 3, 1, '2층 B구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (374, 3, 1, '2층 B구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (375, 3, 1, '2층 B구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (376, 3, 1, '2층 B구역 01열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (377, 3, 1, '2층 B구역 01열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (378, 3, 1, '2층 B구역 01열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (379, 3, 1, '2층 B구역 01열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (380, 3, 1, '2층 B구역 01열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (381, 3, 1, '2층 C구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (382, 3, 1, '2층 C구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (383, 3, 1, '2층 C구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (384, 3, 1, '2층 C구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (385, 3, 1, '2층 C구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (386, 3, 1, '2층 C구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (387, 3, 1, '2층 C구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (388, 3, 1, '2층 C구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (389, 3, 1, '2층 C구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (390, 3, 1, '2층 C구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (391, 3, 1, '2층 A구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (392, 3, 1, '2층 A구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (393, 3, 1, '2층 A구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (394, 3, 1, '2층 A구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (395, 3, 1, '2층 A구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (396, 3, 1, '2층 A구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (397, 3, 1, '2층 A구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (398, 3, 1, '2층 A구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (399, 3, 1, '2층 A구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (400, 3, 1, '2층 A구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (401, 3, 1, '2층 B구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (402, 3, 1, '2층 B구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (403, 3, 1, '2층 B구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (404, 3, 1, '2층 B구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (405, 3, 1, '2층 B구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (406, 3, 1, '2층 B구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (407, 3, 1, '2층 B구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (408, 3, 1, '2층 B구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (409, 3, 1, '2층 B구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (410, 3, 1, '2층 B구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (411, 3, 1, '2층 B구역 02열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (412, 3, 1, '2층 B구역 02열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (413, 3, 1, '2층 B구역 02열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (414, 3, 1, '2층 B구역 02열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (415, 3, 1, '2층 B구역 02열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (416, 3, 1, '2층 C구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (417, 3, 1, '2층 C구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (418, 3, 1, '2층 C구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (419, 3, 1, '2층 C구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (420, 3, 1, '2층 C구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (421, 3, 1, '2층 C구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (422, 3, 1, '2층 C구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (423, 3, 1, '2층 C구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (424, 3, 1, '2층 C구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (425, 3, 1, '2층 C구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (426, 3, 1, '2층 A구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (427, 3, 1, '2층 A구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (428, 3, 1, '2층 A구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (429, 3, 1, '2층 A구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (430, 3, 1, '2층 A구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (431, 3, 1, '2층 A구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (432, 3, 1, '2층 A구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (433, 3, 1, '2층 A구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (434, 3, 1, '2층 A구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (435, 3, 1, '2층 A구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (436, 3, 1, '2층 B구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (437, 3, 1, '2층 B구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (438, 3, 1, '2층 B구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (439, 3, 1, '2층 B구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (440, 3, 1, '2층 B구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (441, 3, 1, '2층 B구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (442, 3, 1, '2층 B구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (443, 3, 1, '2층 B구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (444, 3, 1, '2층 B구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (445, 3, 1, '2층 B구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (446, 3, 1, '2층 B구역 03열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (447, 3, 1, '2층 B구역 03열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (448, 3, 1, '2층 B구역 03열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (449, 3, 1, '2층 B구역 03열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (450, 3, 1, '2층 B구역 03열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (451, 3, 1, '2층 C구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (452, 3, 1, '2층 C구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (453, 3, 1, '2층 C구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (454, 3, 1, '2층 C구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (455, 3, 1, '2층 C구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (456, 3, 1, '2층 C구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (457, 3, 1, '2층 C구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (458, 3, 1, '2층 C구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (459, 3, 1, '2층 C구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (460, 3, 1, '2층 C구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (461, 3, 1, '2층 A구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (462, 3, 1, '2층 A구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (463, 3, 1, '2층 A구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (464, 3, 1, '2층 A구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (465, 3, 1, '2층 A구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (466, 3, 1, '2층 A구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (467, 3, 1, '2층 A구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (468, 3, 1, '2층 A구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (469, 3, 1, '2층 A구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (470, 3, 1, '2층 A구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (471, 3, 1, '2층 B구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (472, 3, 1, '2층 B구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (473, 3, 1, '2층 B구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (474, 3, 1, '2층 B구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (475, 3, 1, '2층 B구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (476, 3, 1, '2층 B구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (477, 3, 1, '2층 B구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (478, 3, 1, '2층 B구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (479, 3, 1, '2층 B구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (480, 3, 1, '2층 B구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (481, 3, 1, '2층 B구역 04열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (482, 3, 1, '2층 B구역 04열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (483, 3, 1, '2층 B구역 04열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (484, 3, 1, '2층 B구역 04열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (485, 3, 1, '2층 B구역 04열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (486, 3, 1, '2층 C구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (487, 3, 1, '2층 C구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (488, 3, 1, '2층 C구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (489, 3, 1, '2층 C구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (490, 3, 1, '2층 C구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (491, 3, 1, '2층 C구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (492, 3, 1, '2층 C구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (493, 3, 1, '2층 C구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (494, 3, 1, '2층 C구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (495, 3, 1, '2층 C구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (496, 3, 1, '2층 A구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (497, 3, 1, '2층 A구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (498, 3, 1, '2층 A구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (499, 3, 1, '2층 A구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (500, 3, 1, '2층 A구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (501, 3, 1, '2층 A구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (502, 3, 1, '2층 A구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (503, 3, 1, '2층 A구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (504, 3, 1, '2층 A구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (505, 3, 1, '2층 A구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (506, 3, 1, '2층 B구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (507, 3, 1, '2층 B구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (508, 3, 1, '2층 B구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (509, 3, 1, '2층 B구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (510, 3, 1, '2층 B구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (511, 3, 1, '2층 B구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (512, 3, 1, '2층 B구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (513, 3, 1, '2층 B구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (514, 3, 1, '2층 B구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (515, 3, 1, '2층 B구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (516, 3, 1, '2층 B구역 05열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (517, 3, 1, '2층 B구역 05열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (518, 3, 1, '2층 B구역 05열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (519, 3, 1, '2층 B구역 05열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (520, 3, 1, '2층 B구역 05열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (521, 3, 1, '2층 C구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (522, 3, 1, '2층 C구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (523, 3, 1, '2층 C구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (524, 3, 1, '2층 C구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (525, 3, 1, '2층 C구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (526, 3, 1, '2층 C구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (527, 3, 1, '2층 C구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (528, 3, 1, '2층 C구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (529, 3, 1, '2층 C구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (530, 3, 1, '2층 C구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (531, 3, 1, '2층 A구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (532, 3, 1, '2층 A구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (533, 3, 1, '2층 A구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (534, 3, 1, '2층 A구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (535, 3, 1, '2층 A구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (536, 3, 1, '2층 A구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (537, 3, 1, '2층 A구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (538, 3, 1, '2층 A구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (539, 3, 1, '2층 A구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (540, 3, 1, '2층 A구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (541, 3, 1, '2층 B구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (542, 3, 1, '2층 B구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (543, 3, 1, '2층 B구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (544, 3, 1, '2층 B구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (545, 3, 1, '2층 B구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (546, 3, 1, '2층 B구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (547, 3, 1, '2층 B구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (548, 3, 1, '2층 B구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (549, 3, 1, '2층 B구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (550, 3, 1, '2층 B구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (551, 3, 1, '2층 B구역 06열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (552, 3, 1, '2층 B구역 06열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (553, 3, 1, '2층 B구역 06열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (554, 3, 1, '2층 B구역 06열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (555, 3, 1, '2층 B구역 06열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (556, 3, 1, '2층 C구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (557, 3, 1, '2층 C구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (558, 3, 1, '2층 C구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (559, 3, 1, '2층 C구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (560, 3, 1, '2층 C구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (561, 3, 1, '2층 C구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (562, 3, 1, '2층 C구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (563, 3, 1, '2층 C구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (564, 3, 1, '2층 C구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (565, 3, 1, '2층 C구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (566, 2, 2, '1층 A구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (567, 2, 2, '1층 A구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (568, 2, 2, '1층 A구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (569, 2, 2, '1층 A구역 01열 004번', 1, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (570, 2, 2, '1층 A구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (571, 2, 2, '1층 A구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (572, 2, 2, '1층 A구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (573, 2, 2, '1층 A구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (574, 2, 2, '1층 B구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (575, 2, 2, '1층 B구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (576, 2, 2, '1층 B구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (577, 2, 2, '1층 B구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (578, 2, 2, '1층 B구역 01열 005번', 1, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (579, 1, 2, '1층 B구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (580, 1, 2, '1층 B구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (581, 1, 2, '1층 B구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (582, 1, 2, '1층 B구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (583, 1, 2, '1층 B구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (584, 1, 2, '1층 B구역 01열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (585, 1, 2, '1층 B구역 01열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (586, 1, 2, '1층 B구역 01열 013번', 1, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (587, 1, 2, '1층 B구역 01열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (588, 1, 2, '1층 B구역 01열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (589, 1, 2, '1층 B구역 01열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (590, 2, 2, '1층 B구역 01열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (591, 2, 2, '1층 B구역 01열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (592, 2, 2, '1층 B구역 01열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (593, 2, 2, '1층 B구역 01열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (594, 2, 2, '1층 B구역 01열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (595, 2, 2, '1층 C구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (596, 2, 2, '1층 C구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (597, 2, 2, '1층 C구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (598, 2, 2, '1층 C구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (599, 2, 2, '1층 C구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (600, 2, 2, '1층 C구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (601, 2, 2, '1층 C구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (602, 2, 2, '1층 C구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (603, 2, 2, '1층 A구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (604, 2, 2, '1층 A구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (605, 2, 2, '1층 A구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (606, 2, 2, '1층 A구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (607, 2, 2, '1층 A구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (608, 2, 2, '1층 A구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (609, 2, 2, '1층 A구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (610, 2, 2, '1층 A구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (611, 2, 2, '1층 B구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (612, 2, 2, '1층 B구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (613, 2, 2, '1층 B구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (614, 2, 2, '1층 B구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (615, 1, 2, '1층 B구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (616, 1, 2, '1층 B구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (617, 1, 2, '1층 B구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (618, 1, 2, '1층 B구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (619, 1, 2, '1층 B구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (620, 1, 2, '1층 B구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (621, 1, 2, '1층 B구역 02열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (622, 1, 2, '1층 B구역 02열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (623, 1, 2, '1층 B구역 02열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (624, 1, 2, '1층 B구역 02열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (625, 1, 2, '1층 B구역 02열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (626, 1, 2, '1층 B구역 02열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (627, 1, 2, '1층 B구역 02열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (628, 2, 2, '1층 B구역 02열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (629, 2, 2, '1층 B구역 02열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (630, 2, 2, '1층 B구역 02열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (631, 2, 2, '1층 B구역 02열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (632, 2, 2, '1층 C구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (633, 2, 2, '1층 C구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (634, 2, 2, '1층 C구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (635, 2, 2, '1층 C구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (636, 2, 2, '1층 C구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (637, 2, 2, '1층 C구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (638, 2, 2, '1층 C구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (639, 2, 2, '1층 C구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (640, 2, 2, '1층 A구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (641, 2, 2, '1층 A구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (642, 2, 2, '1층 A구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (643, 2, 2, '1층 A구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (644, 2, 2, '1층 A구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (645, 2, 2, '1층 A구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (646, 2, 2, '1층 A구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (647, 2, 2, '1층 A구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (648, 2, 2, '1층 B구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (649, 2, 2, '1층 B구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (650, 2, 2, '1층 B구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (651, 1, 2, '1층 B구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (652, 1, 2, '1층 B구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (653, 1, 2, '1층 B구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (654, 1, 2, '1층 B구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (655, 1, 2, '1층 B구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (656, 1, 2, '1층 B구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (657, 1, 2, '1층 B구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (658, 1, 2, '1층 B구역 03열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (659, 1, 2, '1층 B구역 03열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (660, 1, 2, '1층 B구역 03열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (661, 1, 2, '1층 B구역 03열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (662, 1, 2, '1층 B구역 03열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (663, 1, 2, '1층 B구역 03열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (664, 1, 2, '1층 B구역 03열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (665, 1, 2, '1층 B구역 03열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (666, 2, 2, '1층 B구역 03열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (667, 2, 2, '1층 B구역 03열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (668, 2, 2, '1층 B구역 03열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (669, 2, 2, '1층 C구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (670, 2, 2, '1층 C구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (671, 2, 2, '1층 C구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (672, 2, 2, '1층 C구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (673, 2, 2, '1층 C구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (674, 2, 2, '1층 C구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (675, 2, 2, '1층 C구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (676, 2, 2, '1층 C구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (677, 2, 2, '1층 A구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (678, 2, 2, '1층 A구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (679, 2, 2, '1층 A구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (680, 2, 2, '1층 A구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (681, 2, 2, '1층 A구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (682, 2, 2, '1층 A구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (683, 2, 2, '1층 A구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (684, 2, 2, '1층 A구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (685, 2, 2, '1층 B구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (686, 2, 2, '1층 B구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (687, 1, 2, '1층 B구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (688, 1, 2, '1층 B구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (689, 1, 2, '1층 B구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (690, 1, 2, '1층 B구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (691, 1, 2, '1층 B구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (692, 1, 2, '1층 B구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (693, 1, 2, '1층 B구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (694, 1, 2, '1층 B구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (695, 1, 2, '1층 B구역 04열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (696, 1, 2, '1층 B구역 04열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (697, 1, 2, '1층 B구역 04열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (698, 1, 2, '1층 B구역 04열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (699, 1, 2, '1층 B구역 04열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (700, 1, 2, '1층 B구역 04열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (701, 1, 2, '1층 B구역 04열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (702, 1, 2, '1층 B구역 04열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (703, 1, 2, '1층 B구역 04열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (704, 2, 2, '1층 B구역 04열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (705, 2, 2, '1층 B구역 04열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (706, 2, 2, '1층 C구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (707, 2, 2, '1층 C구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (708, 2, 2, '1층 C구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (709, 2, 2, '1층 C구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (710, 2, 2, '1층 C구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (711, 2, 2, '1층 C구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (712, 2, 2, '1층 C구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (713, 2, 2, '1층 C구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (714, 2, 2, '1층 A구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (715, 2, 2, '1층 A구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (716, 2, 2, '1층 A구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (717, 2, 2, '1층 A구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (718, 2, 2, '1층 A구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (719, 2, 2, '1층 A구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (720, 2, 2, '1층 A구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (721, 2, 2, '1층 A구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (722, 2, 2, '1층 B구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (723, 1, 2, '1층 B구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (724, 1, 2, '1층 B구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (725, 1, 2, '1층 B구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (726, 1, 2, '1층 B구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (727, 1, 2, '1층 B구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (728, 1, 2, '1층 B구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (729, 1, 2, '1층 B구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (730, 1, 2, '1층 B구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (731, 1, 2, '1층 B구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (732, 1, 2, '1층 B구역 05열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (733, 1, 2, '1층 B구역 05열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (734, 1, 2, '1층 B구역 05열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (735, 1, 2, '1층 B구역 05열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (736, 1, 2, '1층 B구역 05열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (737, 1, 2, '1층 B구역 05열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (738, 1, 2, '1층 B구역 05열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (739, 1, 2, '1층 B구역 05열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (740, 1, 2, '1층 B구역 05열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (741, 1, 2, '1층 B구역 05열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (742, 2, 2, '1층 B구역 05열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (743, 2, 2, '1층 C구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (744, 2, 2, '1층 C구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (745, 2, 2, '1층 C구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (746, 2, 2, '1층 C구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (747, 2, 2, '1층 C구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (748, 2, 2, '1층 C구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (749, 2, 2, '1층 C구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (750, 2, 2, '1층 C구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (751, 2, 2, '1층 A구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (752, 2, 2, '1층 A구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (753, 2, 2, '1층 A구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (754, 2, 2, '1층 A구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (755, 2, 2, '1층 A구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (756, 2, 2, '1층 A구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (757, 2, 2, '1층 A구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (758, 2, 2, '1층 A구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (759, 1, 2, '1층 B구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (760, 1, 2, '1층 B구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (761, 1, 2, '1층 B구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (762, 1, 2, '1층 B구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (763, 1, 2, '1층 B구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (764, 1, 2, '1층 B구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (765, 1, 2, '1층 B구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (766, 1, 2, '1층 B구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (767, 1, 2, '1층 B구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (768, 1, 2, '1층 B구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (769, 1, 2, '1층 B구역 06열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (770, 1, 2, '1층 B구역 06열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (771, 1, 2, '1층 B구역 06열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (772, 1, 2, '1층 B구역 06열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (773, 1, 2, '1층 B구역 06열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (774, 1, 2, '1층 B구역 06열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (775, 1, 2, '1층 B구역 06열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (776, 1, 2, '1층 B구역 06열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (777, 1, 2, '1층 B구역 06열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (778, 1, 2, '1층 B구역 06열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (779, 1, 2, '1층 B구역 06열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (780, 2, 2, '1층 C구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (781, 2, 2, '1층 C구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (782, 2, 2, '1층 C구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (783, 2, 2, '1층 C구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (784, 2, 2, '1층 C구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (785, 2, 2, '1층 C구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (786, 2, 2, '1층 C구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (787, 2, 2, '1층 C구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (788, 2, 2, '1층 A구역 07열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (789, 2, 2, '1층 A구역 07열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (790, 2, 2, '1층 A구역 07열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (791, 2, 2, '1층 A구역 07열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (792, 2, 2, '1층 A구역 07열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (793, 2, 2, '1층 A구역 07열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (794, 2, 2, '1층 A구역 07열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (795, 2, 2, '1층 A구역 07열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (796, 1, 2, '1층 B구역 07열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (797, 1, 2, '1층 B구역 07열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (798, 1, 2, '1층 B구역 07열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (799, 1, 2, '1층 B구역 07열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (800, 1, 2, '1층 B구역 07열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (801, 1, 2, '1층 B구역 07열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (802, 1, 2, '1층 B구역 07열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (803, 1, 2, '1층 B구역 07열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (804, 1, 2, '1층 B구역 07열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (805, 1, 2, '1층 B구역 07열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (806, 1, 2, '1층 B구역 07열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (807, 1, 2, '1층 B구역 07열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (808, 1, 2, '1층 B구역 07열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (809, 1, 2, '1층 B구역 07열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (810, 1, 2, '1층 B구역 07열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (811, 1, 2, '1층 B구역 07열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (812, 1, 2, '1층 B구역 07열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (813, 1, 2, '1층 B구역 07열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (814, 1, 2, '1층 B구역 07열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (815, 1, 2, '1층 B구역 07열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (816, 1, 2, '1층 B구역 07열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (817, 2, 2, '1층 C구역 07열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (818, 2, 2, '1층 C구역 07열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (819, 2, 2, '1층 C구역 07열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (820, 2, 2, '1층 C구역 07열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (821, 2, 2, '1층 C구역 07열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (822, 2, 2, '1층 C구역 07열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (823, 2, 2, '1층 C구역 07열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (824, 2, 2, '1층 C구역 07열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (825, 2, 2, '1층 A구역 08열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (826, 2, 2, '1층 A구역 08열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (827, 2, 2, '1층 A구역 08열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (828, 2, 2, '1층 A구역 08열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (829, 2, 2, '1층 A구역 08열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (830, 2, 2, '1층 A구역 08열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (831, 2, 2, '1층 A구역 08열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (832, 2, 2, '1층 A구역 08열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (833, 1, 2, '1층 B구역 08열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (834, 1, 2, '1층 B구역 08열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (835, 1, 2, '1층 B구역 08열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (836, 1, 2, '1층 B구역 08열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (837, 1, 2, '1층 B구역 08열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (838, 1, 2, '1층 B구역 08열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (839, 1, 2, '1층 B구역 08열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (840, 1, 2, '1층 B구역 08열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (841, 1, 2, '1층 B구역 08열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (842, 1, 2, '1층 B구역 08열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (843, 1, 2, '1층 B구역 08열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (844, 1, 2, '1층 B구역 08열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (845, 1, 2, '1층 B구역 08열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (846, 1, 2, '1층 B구역 08열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (847, 1, 2, '1층 B구역 08열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (848, 1, 2, '1층 B구역 08열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (849, 1, 2, '1층 B구역 08열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (850, 1, 2, '1층 B구역 08열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (851, 1, 2, '1층 B구역 08열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (852, 1, 2, '1층 B구역 08열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (853, 1, 2, '1층 B구역 08열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (854, 2, 2, '1층 C구역 08열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (855, 2, 2, '1층 C구역 08열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (856, 2, 2, '1층 C구역 08열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (857, 2, 2, '1층 C구역 08열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (858, 2, 2, '1층 C구역 08열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (859, 2, 2, '1층 C구역 08열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (860, 2, 2, '1층 C구역 08열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (861, 2, 2, '1층 C구역 08열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (862, 2, 2, '1층 A구역 09열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (863, 2, 2, '1층 A구역 09열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (864, 2, 2, '1층 A구역 09열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (865, 2, 2, '1층 A구역 09열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (866, 2, 2, '1층 A구역 09열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (867, 2, 2, '1층 A구역 09열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (868, 2, 2, '1층 A구역 09열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (869, 2, 2, '1층 A구역 09열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (870, 1, 2, '1층 B구역 09열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (871, 1, 2, '1층 B구역 09열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (872, 1, 2, '1층 B구역 09열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (873, 1, 2, '1층 B구역 09열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (874, 1, 2, '1층 B구역 09열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (875, 1, 2, '1층 B구역 09열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (876, 1, 2, '1층 B구역 09열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (877, 1, 2, '1층 B구역 09열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (878, 1, 2, '1층 B구역 09열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (879, 1, 2, '1층 B구역 09열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (880, 1, 2, '1층 B구역 09열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (881, 1, 2, '1층 B구역 09열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (882, 1, 2, '1층 B구역 09열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (883, 1, 2, '1층 B구역 09열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (884, 1, 2, '1층 B구역 09열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (885, 1, 2, '1층 B구역 09열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (886, 1, 2, '1층 B구역 09열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (887, 1, 2, '1층 B구역 09열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (888, 1, 2, '1층 B구역 09열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (889, 1, 2, '1층 B구역 09열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (890, 1, 2, '1층 B구역 09열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (891, 2, 2, '1층 C구역 09열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (892, 2, 2, '1층 C구역 09열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (893, 2, 2, '1층 C구역 09열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (894, 2, 2, '1층 C구역 09열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (895, 2, 2, '1층 C구역 09열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (896, 2, 2, '1층 C구역 09열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (897, 2, 2, '1층 C구역 09열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (898, 2, 2, '1층 C구역 09열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (899, 2, 2, '1층 A구역 10열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (900, 2, 2, '1층 A구역 10열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (901, 2, 2, '1층 A구역 10열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (902, 2, 2, '1층 A구역 10열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (903, 2, 2, '1층 A구역 10열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (904, 2, 2, '1층 A구역 10열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (905, 2, 2, '1층 A구역 10열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (906, 2, 2, '1층 A구역 10열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (907, 2, 2, '1층 B구역 10열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (908, 2, 2, '1층 B구역 10열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (909, 2, 2, '1층 B구역 10열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (910, 2, 2, '1층 B구역 10열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (911, 2, 2, '1층 B구역 10열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (912, 2, 2, '1층 B구역 10열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (913, 2, 2, '1층 C구역 10열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (914, 2, 2, '1층 C구역 10열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (915, 2, 2, '1층 C구역 10열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (916, 2, 2, '1층 C구역 10열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (917, 2, 2, '1층 C구역 10열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (918, 2, 2, '1층 C구역 10열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (919, 2, 2, '1층 C구역 10열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (920, 2, 2, '1층 C구역 10열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (921, 3, 2, '2층 A구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (922, 3, 2, '2층 A구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (923, 3, 2, '2층 A구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (924, 3, 2, '2층 A구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (925, 3, 2, '2층 A구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (926, 3, 2, '2층 A구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (927, 3, 2, '2층 A구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (928, 3, 2, '2층 A구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (929, 3, 2, '2층 A구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (930, 3, 2, '2층 A구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (931, 3, 2, '2층 B구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (932, 3, 2, '2층 B구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (933, 3, 2, '2층 B구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (934, 3, 2, '2층 B구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (935, 3, 2, '2층 B구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (936, 3, 2, '2층 B구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (937, 3, 2, '2층 B구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (938, 3, 2, '2층 B구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (939, 3, 2, '2층 B구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (940, 3, 2, '2층 B구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (941, 3, 2, '2층 B구역 01열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (942, 3, 2, '2층 B구역 01열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (943, 3, 2, '2층 B구역 01열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (944, 3, 2, '2층 B구역 01열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (945, 3, 2, '2층 B구역 01열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (946, 3, 2, '2층 C구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (947, 3, 2, '2층 C구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (948, 3, 2, '2층 C구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (949, 3, 2, '2층 C구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (950, 3, 2, '2층 C구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (951, 3, 2, '2층 C구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (952, 3, 2, '2층 C구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (953, 3, 2, '2층 C구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (954, 3, 2, '2층 C구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (955, 3, 2, '2층 C구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (956, 3, 2, '2층 A구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (957, 3, 2, '2층 A구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (958, 3, 2, '2층 A구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (959, 3, 2, '2층 A구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (960, 3, 2, '2층 A구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (961, 3, 2, '2층 A구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (962, 3, 2, '2층 A구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (963, 3, 2, '2층 A구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (964, 3, 2, '2층 A구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (965, 3, 2, '2층 A구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (966, 3, 2, '2층 B구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (967, 3, 2, '2층 B구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (968, 3, 2, '2층 B구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (969, 3, 2, '2층 B구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (970, 3, 2, '2층 B구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (971, 3, 2, '2층 B구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (972, 3, 2, '2층 B구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (973, 3, 2, '2층 B구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (974, 3, 2, '2층 B구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (975, 3, 2, '2층 B구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (976, 3, 2, '2층 B구역 02열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (977, 3, 2, '2층 B구역 02열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (978, 3, 2, '2층 B구역 02열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (979, 3, 2, '2층 B구역 02열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (980, 3, 2, '2층 B구역 02열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (981, 3, 2, '2층 C구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (982, 3, 2, '2층 C구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (983, 3, 2, '2층 C구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (984, 3, 2, '2층 C구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (985, 3, 2, '2층 C구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (986, 3, 2, '2층 C구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (987, 3, 2, '2층 C구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (988, 3, 2, '2층 C구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (989, 3, 2, '2층 C구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (990, 3, 2, '2층 C구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (991, 3, 2, '2층 A구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (992, 3, 2, '2층 A구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (993, 3, 2, '2층 A구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (994, 3, 2, '2층 A구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (995, 3, 2, '2층 A구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (996, 3, 2, '2층 A구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (997, 3, 2, '2층 A구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (998, 3, 2, '2층 A구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (999, 3, 2, '2층 A구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1000, 3, 2, '2층 A구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1001, 3, 2, '2층 B구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1002, 3, 2, '2층 B구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1003, 3, 2, '2층 B구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1004, 3, 2, '2층 B구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1005, 3, 2, '2층 B구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1006, 3, 2, '2층 B구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1007, 3, 2, '2층 B구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1008, 3, 2, '2층 B구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1009, 3, 2, '2층 B구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1010, 3, 2, '2층 B구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1011, 3, 2, '2층 B구역 03열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1012, 3, 2, '2층 B구역 03열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1013, 3, 2, '2층 B구역 03열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1014, 3, 2, '2층 B구역 03열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1015, 3, 2, '2층 B구역 03열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1016, 3, 2, '2층 C구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1017, 3, 2, '2층 C구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1018, 3, 2, '2층 C구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1019, 3, 2, '2층 C구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1020, 3, 2, '2층 C구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1021, 3, 2, '2층 C구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1022, 3, 2, '2층 C구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1023, 3, 2, '2층 C구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1024, 3, 2, '2층 C구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1025, 3, 2, '2층 C구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1026, 3, 2, '2층 A구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1027, 3, 2, '2층 A구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1028, 3, 2, '2층 A구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1029, 3, 2, '2층 A구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1030, 3, 2, '2층 A구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1031, 3, 2, '2층 A구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1032, 3, 2, '2층 A구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1033, 3, 2, '2층 A구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1034, 3, 2, '2층 A구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1035, 3, 2, '2층 A구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1036, 3, 2, '2층 B구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1037, 3, 2, '2층 B구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1038, 3, 2, '2층 B구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1039, 3, 2, '2층 B구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1040, 3, 2, '2층 B구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1041, 3, 2, '2층 B구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1042, 3, 2, '2층 B구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1043, 3, 2, '2층 B구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1044, 3, 2, '2층 B구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1045, 3, 2, '2층 B구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1046, 3, 2, '2층 B구역 04열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1047, 3, 2, '2층 B구역 04열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1048, 3, 2, '2층 B구역 04열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1049, 3, 2, '2층 B구역 04열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1050, 3, 2, '2층 B구역 04열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1051, 3, 2, '2층 C구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1052, 3, 2, '2층 C구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1053, 3, 2, '2층 C구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1054, 3, 2, '2층 C구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1055, 3, 2, '2층 C구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1056, 3, 2, '2층 C구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1057, 3, 2, '2층 C구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1058, 3, 2, '2층 C구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1059, 3, 2, '2층 C구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1060, 3, 2, '2층 C구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1061, 3, 2, '2층 A구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1062, 3, 2, '2층 A구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1063, 3, 2, '2층 A구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1064, 3, 2, '2층 A구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1065, 3, 2, '2층 A구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1066, 3, 2, '2층 A구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1067, 3, 2, '2층 A구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1068, 3, 2, '2층 A구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1069, 3, 2, '2층 A구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1070, 3, 2, '2층 A구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1071, 3, 2, '2층 B구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1072, 3, 2, '2층 B구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1073, 3, 2, '2층 B구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1074, 3, 2, '2층 B구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1075, 3, 2, '2층 B구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1076, 3, 2, '2층 B구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1077, 3, 2, '2층 B구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1078, 3, 2, '2층 B구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1079, 3, 2, '2층 B구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1080, 3, 2, '2층 B구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1081, 3, 2, '2층 B구역 05열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1082, 3, 2, '2층 B구역 05열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1083, 3, 2, '2층 B구역 05열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1084, 3, 2, '2층 B구역 05열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1085, 3, 2, '2층 B구역 05열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1086, 3, 2, '2층 C구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1087, 3, 2, '2층 C구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1088, 3, 2, '2층 C구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1089, 3, 2, '2층 C구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1090, 3, 2, '2층 C구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1091, 3, 2, '2층 C구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1092, 3, 2, '2층 C구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1093, 3, 2, '2층 C구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1094, 3, 2, '2층 C구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1095, 3, 2, '2층 C구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1096, 3, 2, '2층 A구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1097, 3, 2, '2층 A구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1098, 3, 2, '2층 A구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1099, 3, 2, '2층 A구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1100, 3, 2, '2층 A구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1101, 3, 2, '2층 A구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1102, 3, 2, '2층 A구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1103, 3, 2, '2층 A구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1104, 3, 2, '2층 A구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1105, 3, 2, '2층 A구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1106, 3, 2, '2층 B구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1107, 3, 2, '2층 B구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1108, 3, 2, '2층 B구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1109, 3, 2, '2층 B구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1110, 3, 2, '2층 B구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1111, 3, 2, '2층 B구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1112, 3, 2, '2층 B구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1113, 3, 2, '2층 B구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1114, 3, 2, '2층 B구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1115, 3, 2, '2층 B구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1116, 3, 2, '2층 B구역 06열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1117, 3, 2, '2층 B구역 06열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1118, 3, 2, '2층 B구역 06열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1119, 3, 2, '2층 B구역 06열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1120, 3, 2, '2층 B구역 06열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1121, 3, 2, '2층 C구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1122, 3, 2, '2층 C구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1123, 3, 2, '2층 C구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1124, 3, 2, '2층 C구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1125, 3, 2, '2층 C구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1126, 3, 2, '2층 C구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1127, 3, 2, '2층 C구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1128, 3, 2, '2층 C구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1129, 3, 2, '2층 C구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1130, 3, 2, '2층 C구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1131, 2, 3, '1층 A구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1132, 2, 3, '1층 A구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1133, 2, 3, '1층 A구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1134, 2, 3, '1층 A구역 01열 004번', 1, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1135, 2, 3, '1층 A구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1136, 2, 3, '1층 A구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1137, 2, 3, '1층 A구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1138, 2, 3, '1층 A구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1139, 2, 3, '1층 B구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1140, 2, 3, '1층 B구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1141, 2, 3, '1층 B구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1142, 2, 3, '1층 B구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1143, 2, 3, '1층 B구역 01열 005번', 1, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1144, 1, 3, '1층 B구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1145, 1, 3, '1층 B구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1146, 1, 3, '1층 B구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1147, 1, 3, '1층 B구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1148, 1, 3, '1층 B구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1149, 1, 3, '1층 B구역 01열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1150, 1, 3, '1층 B구역 01열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1151, 1, 3, '1층 B구역 01열 013번', 1, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1152, 1, 3, '1층 B구역 01열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1153, 1, 3, '1층 B구역 01열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1154, 1, 3, '1층 B구역 01열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1155, 2, 3, '1층 B구역 01열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1156, 2, 3, '1층 B구역 01열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1157, 2, 3, '1층 B구역 01열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1158, 2, 3, '1층 B구역 01열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1159, 2, 3, '1층 B구역 01열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1160, 2, 3, '1층 C구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1161, 2, 3, '1층 C구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1162, 2, 3, '1층 C구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1163, 2, 3, '1층 C구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1164, 2, 3, '1층 C구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1165, 2, 3, '1층 C구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1166, 2, 3, '1층 C구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1167, 2, 3, '1층 C구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1168, 2, 3, '1층 A구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1169, 2, 3, '1층 A구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1170, 2, 3, '1층 A구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1171, 2, 3, '1층 A구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1172, 2, 3, '1층 A구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1173, 2, 3, '1층 A구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1174, 2, 3, '1층 A구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1175, 2, 3, '1층 A구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1176, 2, 3, '1층 B구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1177, 2, 3, '1층 B구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1178, 2, 3, '1층 B구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1179, 2, 3, '1층 B구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1180, 1, 3, '1층 B구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1181, 1, 3, '1층 B구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1182, 1, 3, '1층 B구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1183, 1, 3, '1층 B구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1184, 1, 3, '1층 B구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1185, 1, 3, '1층 B구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1186, 1, 3, '1층 B구역 02열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1187, 1, 3, '1층 B구역 02열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1188, 1, 3, '1층 B구역 02열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1189, 1, 3, '1층 B구역 02열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1190, 1, 3, '1층 B구역 02열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1191, 1, 3, '1층 B구역 02열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1192, 1, 3, '1층 B구역 02열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1193, 2, 3, '1층 B구역 02열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1194, 2, 3, '1층 B구역 02열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1195, 2, 3, '1층 B구역 02열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1196, 2, 3, '1층 B구역 02열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1197, 2, 3, '1층 C구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1198, 2, 3, '1층 C구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1199, 2, 3, '1층 C구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1200, 2, 3, '1층 C구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1201, 2, 3, '1층 C구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1202, 2, 3, '1층 C구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1203, 2, 3, '1층 C구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1204, 2, 3, '1층 C구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1205, 2, 3, '1층 A구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1206, 2, 3, '1층 A구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1207, 2, 3, '1층 A구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1208, 2, 3, '1층 A구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1209, 2, 3, '1층 A구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1210, 2, 3, '1층 A구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1211, 2, 3, '1층 A구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1212, 2, 3, '1층 A구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1213, 2, 3, '1층 B구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1214, 2, 3, '1층 B구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1215, 2, 3, '1층 B구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1216, 1, 3, '1층 B구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1217, 1, 3, '1층 B구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1218, 1, 3, '1층 B구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1219, 1, 3, '1층 B구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1220, 1, 3, '1층 B구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1221, 1, 3, '1층 B구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1222, 1, 3, '1층 B구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1223, 1, 3, '1층 B구역 03열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1224, 1, 3, '1층 B구역 03열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1225, 1, 3, '1층 B구역 03열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1226, 1, 3, '1층 B구역 03열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1227, 1, 3, '1층 B구역 03열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1228, 1, 3, '1층 B구역 03열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1229, 1, 3, '1층 B구역 03열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1230, 1, 3, '1층 B구역 03열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1231, 2, 3, '1층 B구역 03열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1232, 2, 3, '1층 B구역 03열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1233, 2, 3, '1층 B구역 03열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1234, 2, 3, '1층 C구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1235, 2, 3, '1층 C구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1236, 2, 3, '1층 C구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1237, 2, 3, '1층 C구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1238, 2, 3, '1층 C구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1239, 2, 3, '1층 C구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1240, 2, 3, '1층 C구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1241, 2, 3, '1층 C구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1242, 2, 3, '1층 A구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1243, 2, 3, '1층 A구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1244, 2, 3, '1층 A구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1245, 2, 3, '1층 A구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1246, 2, 3, '1층 A구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1247, 2, 3, '1층 A구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1248, 2, 3, '1층 A구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1249, 2, 3, '1층 A구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1250, 2, 3, '1층 B구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1251, 2, 3, '1층 B구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1252, 1, 3, '1층 B구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1253, 1, 3, '1층 B구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1254, 1, 3, '1층 B구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1255, 1, 3, '1층 B구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1256, 1, 3, '1층 B구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1257, 1, 3, '1층 B구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1258, 1, 3, '1층 B구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1259, 1, 3, '1층 B구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1260, 1, 3, '1층 B구역 04열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1261, 1, 3, '1층 B구역 04열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1262, 1, 3, '1층 B구역 04열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1263, 1, 3, '1층 B구역 04열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1264, 1, 3, '1층 B구역 04열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1265, 1, 3, '1층 B구역 04열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1266, 1, 3, '1층 B구역 04열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1267, 1, 3, '1층 B구역 04열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1268, 1, 3, '1층 B구역 04열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1269, 2, 3, '1층 B구역 04열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1270, 2, 3, '1층 B구역 04열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1271, 2, 3, '1층 C구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1272, 2, 3, '1층 C구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1273, 2, 3, '1층 C구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1274, 2, 3, '1층 C구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1275, 2, 3, '1층 C구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1276, 2, 3, '1층 C구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1277, 2, 3, '1층 C구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1278, 2, 3, '1층 C구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1279, 2, 3, '1층 A구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1280, 2, 3, '1층 A구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1281, 2, 3, '1층 A구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1282, 2, 3, '1층 A구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1283, 2, 3, '1층 A구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1284, 2, 3, '1층 A구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1285, 2, 3, '1층 A구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1286, 2, 3, '1층 A구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1287, 2, 3, '1층 B구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1288, 1, 3, '1층 B구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1289, 1, 3, '1층 B구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1290, 1, 3, '1층 B구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1291, 1, 3, '1층 B구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1292, 1, 3, '1층 B구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1293, 1, 3, '1층 B구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1294, 1, 3, '1층 B구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1295, 1, 3, '1층 B구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1296, 1, 3, '1층 B구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1297, 1, 3, '1층 B구역 05열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1298, 1, 3, '1층 B구역 05열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1299, 1, 3, '1층 B구역 05열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1300, 1, 3, '1층 B구역 05열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1301, 1, 3, '1층 B구역 05열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1302, 1, 3, '1층 B구역 05열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1303, 1, 3, '1층 B구역 05열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1304, 1, 3, '1층 B구역 05열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1305, 1, 3, '1층 B구역 05열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1306, 1, 3, '1층 B구역 05열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1307, 2, 3, '1층 B구역 05열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1308, 2, 3, '1층 C구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1309, 2, 3, '1층 C구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1310, 2, 3, '1층 C구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1311, 2, 3, '1층 C구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1312, 2, 3, '1층 C구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1313, 2, 3, '1층 C구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1314, 2, 3, '1층 C구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1315, 2, 3, '1층 C구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1316, 2, 3, '1층 A구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1317, 2, 3, '1층 A구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1318, 2, 3, '1층 A구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1319, 2, 3, '1층 A구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1320, 2, 3, '1층 A구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1321, 2, 3, '1층 A구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1322, 2, 3, '1층 A구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1323, 2, 3, '1층 A구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1324, 1, 3, '1층 B구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1325, 1, 3, '1층 B구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1326, 1, 3, '1층 B구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1327, 1, 3, '1층 B구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1328, 1, 3, '1층 B구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1329, 1, 3, '1층 B구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1330, 1, 3, '1층 B구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1331, 1, 3, '1층 B구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1332, 1, 3, '1층 B구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1333, 1, 3, '1층 B구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1334, 1, 3, '1층 B구역 06열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1335, 1, 3, '1층 B구역 06열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1336, 1, 3, '1층 B구역 06열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1337, 1, 3, '1층 B구역 06열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1338, 1, 3, '1층 B구역 06열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1339, 1, 3, '1층 B구역 06열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1340, 1, 3, '1층 B구역 06열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1341, 1, 3, '1층 B구역 06열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1342, 1, 3, '1층 B구역 06열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1343, 1, 3, '1층 B구역 06열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1344, 1, 3, '1층 B구역 06열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1345, 2, 3, '1층 C구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1346, 2, 3, '1층 C구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1347, 2, 3, '1층 C구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1348, 2, 3, '1층 C구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1349, 2, 3, '1층 C구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1350, 2, 3, '1층 C구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1351, 2, 3, '1층 C구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1352, 2, 3, '1층 C구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1353, 2, 3, '1층 A구역 07열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1354, 2, 3, '1층 A구역 07열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1355, 2, 3, '1층 A구역 07열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1356, 2, 3, '1층 A구역 07열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1357, 2, 3, '1층 A구역 07열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1358, 2, 3, '1층 A구역 07열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1359, 2, 3, '1층 A구역 07열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1360, 2, 3, '1층 A구역 07열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1361, 1, 3, '1층 B구역 07열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1362, 1, 3, '1층 B구역 07열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1363, 1, 3, '1층 B구역 07열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1364, 1, 3, '1층 B구역 07열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1365, 1, 3, '1층 B구역 07열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1366, 1, 3, '1층 B구역 07열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1367, 1, 3, '1층 B구역 07열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1368, 1, 3, '1층 B구역 07열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1369, 1, 3, '1층 B구역 07열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1370, 1, 3, '1층 B구역 07열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1371, 1, 3, '1층 B구역 07열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1372, 1, 3, '1층 B구역 07열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1373, 1, 3, '1층 B구역 07열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1374, 1, 3, '1층 B구역 07열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1375, 1, 3, '1층 B구역 07열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1376, 1, 3, '1층 B구역 07열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1377, 1, 3, '1층 B구역 07열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1378, 1, 3, '1층 B구역 07열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1379, 1, 3, '1층 B구역 07열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1380, 1, 3, '1층 B구역 07열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1381, 1, 3, '1층 B구역 07열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1382, 2, 3, '1층 C구역 07열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1383, 2, 3, '1층 C구역 07열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1384, 2, 3, '1층 C구역 07열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1385, 2, 3, '1층 C구역 07열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1386, 2, 3, '1층 C구역 07열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1387, 2, 3, '1층 C구역 07열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1388, 2, 3, '1층 C구역 07열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1389, 2, 3, '1층 C구역 07열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1390, 2, 3, '1층 A구역 08열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1391, 2, 3, '1층 A구역 08열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1392, 2, 3, '1층 A구역 08열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1393, 2, 3, '1층 A구역 08열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1394, 2, 3, '1층 A구역 08열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1395, 2, 3, '1층 A구역 08열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1396, 2, 3, '1층 A구역 08열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1397, 2, 3, '1층 A구역 08열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1398, 1, 3, '1층 B구역 08열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1399, 1, 3, '1층 B구역 08열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1400, 1, 3, '1층 B구역 08열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1401, 1, 3, '1층 B구역 08열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1402, 1, 3, '1층 B구역 08열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1403, 1, 3, '1층 B구역 08열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1404, 1, 3, '1층 B구역 08열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1405, 1, 3, '1층 B구역 08열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1406, 1, 3, '1층 B구역 08열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1407, 1, 3, '1층 B구역 08열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1408, 1, 3, '1층 B구역 08열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1409, 1, 3, '1층 B구역 08열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1410, 1, 3, '1층 B구역 08열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1411, 1, 3, '1층 B구역 08열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1412, 1, 3, '1층 B구역 08열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1413, 1, 3, '1층 B구역 08열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1414, 1, 3, '1층 B구역 08열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1415, 1, 3, '1층 B구역 08열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1416, 1, 3, '1층 B구역 08열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1417, 1, 3, '1층 B구역 08열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1418, 1, 3, '1층 B구역 08열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1419, 2, 3, '1층 C구역 08열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1420, 2, 3, '1층 C구역 08열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1421, 2, 3, '1층 C구역 08열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1422, 2, 3, '1층 C구역 08열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1423, 2, 3, '1층 C구역 08열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1424, 2, 3, '1층 C구역 08열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1425, 2, 3, '1층 C구역 08열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1426, 2, 3, '1층 C구역 08열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1427, 2, 3, '1층 A구역 09열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1428, 2, 3, '1층 A구역 09열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1429, 2, 3, '1층 A구역 09열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1430, 2, 3, '1층 A구역 09열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1431, 2, 3, '1층 A구역 09열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1432, 2, 3, '1층 A구역 09열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1433, 2, 3, '1층 A구역 09열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1434, 2, 3, '1층 A구역 09열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1435, 1, 3, '1층 B구역 09열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1436, 1, 3, '1층 B구역 09열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1437, 1, 3, '1층 B구역 09열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1438, 1, 3, '1층 B구역 09열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1439, 1, 3, '1층 B구역 09열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1440, 1, 3, '1층 B구역 09열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1441, 1, 3, '1층 B구역 09열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1442, 1, 3, '1층 B구역 09열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1443, 1, 3, '1층 B구역 09열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1444, 1, 3, '1층 B구역 09열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1445, 1, 3, '1층 B구역 09열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1446, 1, 3, '1층 B구역 09열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1447, 1, 3, '1층 B구역 09열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1448, 1, 3, '1층 B구역 09열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1449, 1, 3, '1층 B구역 09열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1450, 1, 3, '1층 B구역 09열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1451, 1, 3, '1층 B구역 09열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1452, 1, 3, '1층 B구역 09열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1453, 1, 3, '1층 B구역 09열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1454, 1, 3, '1층 B구역 09열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1455, 1, 3, '1층 B구역 09열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1456, 2, 3, '1층 C구역 09열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1457, 2, 3, '1층 C구역 09열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1458, 2, 3, '1층 C구역 09열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1459, 2, 3, '1층 C구역 09열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1460, 2, 3, '1층 C구역 09열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1461, 2, 3, '1층 C구역 09열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1462, 2, 3, '1층 C구역 09열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1463, 2, 3, '1층 C구역 09열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1464, 2, 3, '1층 A구역 10열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1465, 2, 3, '1층 A구역 10열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1466, 2, 3, '1층 A구역 10열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1467, 2, 3, '1층 A구역 10열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1468, 2, 3, '1층 A구역 10열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1469, 2, 3, '1층 A구역 10열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1470, 2, 3, '1층 A구역 10열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1471, 2, 3, '1층 A구역 10열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1472, 2, 3, '1층 B구역 10열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1473, 2, 3, '1층 B구역 10열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1474, 2, 3, '1층 B구역 10열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1475, 2, 3, '1층 B구역 10열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1476, 2, 3, '1층 B구역 10열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1477, 2, 3, '1층 B구역 10열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1478, 2, 3, '1층 C구역 10열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1479, 2, 3, '1층 C구역 10열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1480, 2, 3, '1층 C구역 10열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1481, 2, 3, '1층 C구역 10열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1482, 2, 3, '1층 C구역 10열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1483, 2, 3, '1층 C구역 10열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1484, 2, 3, '1층 C구역 10열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1485, 2, 3, '1층 C구역 10열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1486, 3, 3, '2층 A구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1487, 3, 3, '2층 A구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1488, 3, 3, '2층 A구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1489, 3, 3, '2층 A구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1490, 3, 3, '2층 A구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1491, 3, 3, '2층 A구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1492, 3, 3, '2층 A구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1493, 3, 3, '2층 A구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1494, 3, 3, '2층 A구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1495, 3, 3, '2층 A구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1496, 3, 3, '2층 B구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1497, 3, 3, '2층 B구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1498, 3, 3, '2층 B구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1499, 3, 3, '2층 B구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1500, 3, 3, '2층 B구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1501, 3, 3, '2층 B구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1502, 3, 3, '2층 B구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1503, 3, 3, '2층 B구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1504, 3, 3, '2층 B구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1505, 3, 3, '2층 B구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1506, 3, 3, '2층 B구역 01열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1507, 3, 3, '2층 B구역 01열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1508, 3, 3, '2층 B구역 01열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1509, 3, 3, '2층 B구역 01열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1510, 3, 3, '2층 B구역 01열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1511, 3, 3, '2층 C구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1512, 3, 3, '2층 C구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1513, 3, 3, '2층 C구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1514, 3, 3, '2층 C구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1515, 3, 3, '2층 C구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1516, 3, 3, '2층 C구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1517, 3, 3, '2층 C구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1518, 3, 3, '2층 C구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1519, 3, 3, '2층 C구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1520, 3, 3, '2층 C구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1521, 3, 3, '2층 A구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1522, 3, 3, '2층 A구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1523, 3, 3, '2층 A구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1524, 3, 3, '2층 A구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1525, 3, 3, '2층 A구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1526, 3, 3, '2층 A구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1527, 3, 3, '2층 A구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1528, 3, 3, '2층 A구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1529, 3, 3, '2층 A구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1530, 3, 3, '2층 A구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1531, 3, 3, '2층 B구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1532, 3, 3, '2층 B구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1533, 3, 3, '2층 B구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1534, 3, 3, '2층 B구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1535, 3, 3, '2층 B구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1536, 3, 3, '2층 B구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1537, 3, 3, '2층 B구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1538, 3, 3, '2층 B구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1539, 3, 3, '2층 B구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1540, 3, 3, '2층 B구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1541, 3, 3, '2층 B구역 02열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1542, 3, 3, '2층 B구역 02열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1543, 3, 3, '2층 B구역 02열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1544, 3, 3, '2층 B구역 02열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1545, 3, 3, '2층 B구역 02열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1546, 3, 3, '2층 C구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1547, 3, 3, '2층 C구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1548, 3, 3, '2층 C구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1549, 3, 3, '2층 C구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1550, 3, 3, '2층 C구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1551, 3, 3, '2층 C구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1552, 3, 3, '2층 C구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1553, 3, 3, '2층 C구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1554, 3, 3, '2층 C구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1555, 3, 3, '2층 C구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1556, 3, 3, '2층 A구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1557, 3, 3, '2층 A구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1558, 3, 3, '2층 A구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1559, 3, 3, '2층 A구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1560, 3, 3, '2층 A구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1561, 3, 3, '2층 A구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1562, 3, 3, '2층 A구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1563, 3, 3, '2층 A구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1564, 3, 3, '2층 A구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1565, 3, 3, '2층 A구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1566, 3, 3, '2층 B구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1567, 3, 3, '2층 B구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1568, 3, 3, '2층 B구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1569, 3, 3, '2층 B구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1570, 3, 3, '2층 B구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1571, 3, 3, '2층 B구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1572, 3, 3, '2층 B구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1573, 3, 3, '2층 B구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1574, 3, 3, '2층 B구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1575, 3, 3, '2층 B구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1576, 3, 3, '2층 B구역 03열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1577, 3, 3, '2층 B구역 03열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1578, 3, 3, '2층 B구역 03열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1579, 3, 3, '2층 B구역 03열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1580, 3, 3, '2층 B구역 03열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1581, 3, 3, '2층 C구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1582, 3, 3, '2층 C구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1583, 3, 3, '2층 C구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1584, 3, 3, '2층 C구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1585, 3, 3, '2층 C구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1586, 3, 3, '2층 C구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1587, 3, 3, '2층 C구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1588, 3, 3, '2층 C구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1589, 3, 3, '2층 C구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1590, 3, 3, '2층 C구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1591, 3, 3, '2층 A구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1592, 3, 3, '2층 A구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1593, 3, 3, '2층 A구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1594, 3, 3, '2층 A구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1595, 3, 3, '2층 A구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1596, 3, 3, '2층 A구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1597, 3, 3, '2층 A구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1598, 3, 3, '2층 A구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1599, 3, 3, '2층 A구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1600, 3, 3, '2층 A구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1601, 3, 3, '2층 B구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1602, 3, 3, '2층 B구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1603, 3, 3, '2층 B구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1604, 3, 3, '2층 B구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1605, 3, 3, '2층 B구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1606, 3, 3, '2층 B구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1607, 3, 3, '2층 B구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1608, 3, 3, '2층 B구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1609, 3, 3, '2층 B구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1610, 3, 3, '2층 B구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1611, 3, 3, '2층 B구역 04열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1612, 3, 3, '2층 B구역 04열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1613, 3, 3, '2층 B구역 04열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1614, 3, 3, '2층 B구역 04열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1615, 3, 3, '2층 B구역 04열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1616, 3, 3, '2층 C구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1617, 3, 3, '2층 C구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1618, 3, 3, '2층 C구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1619, 3, 3, '2층 C구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1620, 3, 3, '2층 C구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1621, 3, 3, '2층 C구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1622, 3, 3, '2층 C구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1623, 3, 3, '2층 C구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1624, 3, 3, '2층 C구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1625, 3, 3, '2층 C구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1626, 3, 3, '2층 A구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1627, 3, 3, '2층 A구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1628, 3, 3, '2층 A구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1629, 3, 3, '2층 A구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1630, 3, 3, '2층 A구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1631, 3, 3, '2층 A구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1632, 3, 3, '2층 A구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1633, 3, 3, '2층 A구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1634, 3, 3, '2층 A구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1635, 3, 3, '2층 A구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1636, 3, 3, '2층 B구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1637, 3, 3, '2층 B구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1638, 3, 3, '2층 B구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1639, 3, 3, '2층 B구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1640, 3, 3, '2층 B구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1641, 3, 3, '2층 B구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1642, 3, 3, '2층 B구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1643, 3, 3, '2층 B구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1644, 3, 3, '2층 B구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1645, 3, 3, '2층 B구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1646, 3, 3, '2층 B구역 05열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1647, 3, 3, '2층 B구역 05열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1648, 3, 3, '2층 B구역 05열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1649, 3, 3, '2층 B구역 05열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1650, 3, 3, '2층 B구역 05열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1651, 3, 3, '2층 C구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1652, 3, 3, '2층 C구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1653, 3, 3, '2층 C구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1654, 3, 3, '2층 C구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1655, 3, 3, '2층 C구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1656, 3, 3, '2층 C구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1657, 3, 3, '2층 C구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1658, 3, 3, '2층 C구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1659, 3, 3, '2층 C구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1660, 3, 3, '2층 C구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1661, 3, 3, '2층 A구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1662, 3, 3, '2층 A구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1663, 3, 3, '2층 A구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1664, 3, 3, '2층 A구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1665, 3, 3, '2층 A구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1666, 3, 3, '2층 A구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1667, 3, 3, '2층 A구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1668, 3, 3, '2층 A구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1669, 3, 3, '2층 A구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1670, 3, 3, '2층 A구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1671, 3, 3, '2층 B구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1672, 3, 3, '2층 B구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1673, 3, 3, '2층 B구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1674, 3, 3, '2층 B구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1675, 3, 3, '2층 B구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1676, 3, 3, '2층 B구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1677, 3, 3, '2층 B구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1678, 3, 3, '2층 B구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1679, 3, 3, '2층 B구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1680, 3, 3, '2층 B구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1681, 3, 3, '2층 B구역 06열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1682, 3, 3, '2층 B구역 06열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1683, 3, 3, '2층 B구역 06열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1684, 3, 3, '2층 B구역 06열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1685, 3, 3, '2층 B구역 06열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1686, 3, 3, '2층 C구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1687, 3, 3, '2층 C구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1688, 3, 3, '2층 C구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1689, 3, 3, '2층 C구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1690, 3, 3, '2층 C구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1691, 3, 3, '2층 C구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1692, 3, 3, '2층 C구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1693, 3, 3, '2층 C구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1694, 3, 3, '2층 C구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1695, 3, 3, '2층 C구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1696, 2, 4, '1층 A구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1697, 2, 4, '1층 A구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1698, 2, 4, '1층 A구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1699, 2, 4, '1층 A구역 01열 004번', 1, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1700, 2, 4, '1층 A구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1701, 2, 4, '1층 A구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1702, 2, 4, '1층 A구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1703, 2, 4, '1층 A구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1704, 2, 4, '1층 B구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1705, 2, 4, '1층 B구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1706, 2, 4, '1층 B구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1707, 2, 4, '1층 B구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1708, 2, 4, '1층 B구역 01열 005번', 1, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1709, 1, 4, '1층 B구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1710, 1, 4, '1층 B구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1711, 1, 4, '1층 B구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1712, 1, 4, '1층 B구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1713, 1, 4, '1층 B구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1714, 1, 4, '1층 B구역 01열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1715, 1, 4, '1층 B구역 01열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1716, 1, 4, '1층 B구역 01열 013번', 1, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1717, 1, 4, '1층 B구역 01열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1718, 1, 4, '1층 B구역 01열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1719, 1, 4, '1층 B구역 01열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1720, 2, 4, '1층 B구역 01열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1721, 2, 4, '1층 B구역 01열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1722, 2, 4, '1층 B구역 01열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1723, 2, 4, '1층 B구역 01열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1724, 2, 4, '1층 B구역 01열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1725, 2, 4, '1층 C구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1726, 2, 4, '1층 C구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1727, 2, 4, '1층 C구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1728, 2, 4, '1층 C구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1729, 2, 4, '1층 C구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1730, 2, 4, '1층 C구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1731, 2, 4, '1층 C구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1732, 2, 4, '1층 C구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1733, 2, 4, '1층 A구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1734, 2, 4, '1층 A구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1735, 2, 4, '1층 A구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1736, 2, 4, '1층 A구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1737, 2, 4, '1층 A구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1738, 2, 4, '1층 A구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1739, 2, 4, '1층 A구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1740, 2, 4, '1층 A구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1741, 2, 4, '1층 B구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1742, 2, 4, '1층 B구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1743, 2, 4, '1층 B구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1744, 2, 4, '1층 B구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1745, 1, 4, '1층 B구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1746, 1, 4, '1층 B구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1747, 1, 4, '1층 B구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1748, 1, 4, '1층 B구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1749, 1, 4, '1층 B구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1750, 1, 4, '1층 B구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1751, 1, 4, '1층 B구역 02열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1752, 1, 4, '1층 B구역 02열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1753, 1, 4, '1층 B구역 02열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1754, 1, 4, '1층 B구역 02열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1755, 1, 4, '1층 B구역 02열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1756, 1, 4, '1층 B구역 02열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1757, 1, 4, '1층 B구역 02열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1758, 2, 4, '1층 B구역 02열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1759, 2, 4, '1층 B구역 02열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1760, 2, 4, '1층 B구역 02열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1761, 2, 4, '1층 B구역 02열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1762, 2, 4, '1층 C구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1763, 2, 4, '1층 C구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1764, 2, 4, '1층 C구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1765, 2, 4, '1층 C구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1766, 2, 4, '1층 C구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1767, 2, 4, '1층 C구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1768, 2, 4, '1층 C구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1769, 2, 4, '1층 C구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1770, 2, 4, '1층 A구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1771, 2, 4, '1층 A구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1772, 2, 4, '1층 A구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1773, 2, 4, '1층 A구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1774, 2, 4, '1층 A구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1775, 2, 4, '1층 A구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1776, 2, 4, '1층 A구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1777, 2, 4, '1층 A구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1778, 2, 4, '1층 B구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1779, 2, 4, '1층 B구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1780, 2, 4, '1층 B구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1781, 1, 4, '1층 B구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1782, 1, 4, '1층 B구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1783, 1, 4, '1층 B구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1784, 1, 4, '1층 B구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1785, 1, 4, '1층 B구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1786, 1, 4, '1층 B구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1787, 1, 4, '1층 B구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1788, 1, 4, '1층 B구역 03열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1789, 1, 4, '1층 B구역 03열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1790, 1, 4, '1층 B구역 03열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1791, 1, 4, '1층 B구역 03열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1792, 1, 4, '1층 B구역 03열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1793, 1, 4, '1층 B구역 03열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1794, 1, 4, '1층 B구역 03열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1795, 1, 4, '1층 B구역 03열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1796, 2, 4, '1층 B구역 03열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1797, 2, 4, '1층 B구역 03열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1798, 2, 4, '1층 B구역 03열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1799, 2, 4, '1층 C구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1800, 2, 4, '1층 C구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1801, 2, 4, '1층 C구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1802, 2, 4, '1층 C구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1803, 2, 4, '1층 C구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1804, 2, 4, '1층 C구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1805, 2, 4, '1층 C구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1806, 2, 4, '1층 C구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1807, 2, 4, '1층 A구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1808, 2, 4, '1층 A구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1809, 2, 4, '1층 A구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1810, 2, 4, '1층 A구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1811, 2, 4, '1층 A구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1812, 2, 4, '1층 A구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1813, 2, 4, '1층 A구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1814, 2, 4, '1층 A구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1815, 2, 4, '1층 B구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1816, 2, 4, '1층 B구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1817, 1, 4, '1층 B구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1818, 1, 4, '1층 B구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1819, 1, 4, '1층 B구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1820, 1, 4, '1층 B구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1821, 1, 4, '1층 B구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1822, 1, 4, '1층 B구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1823, 1, 4, '1층 B구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1824, 1, 4, '1층 B구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1825, 1, 4, '1층 B구역 04열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1826, 1, 4, '1층 B구역 04열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1827, 1, 4, '1층 B구역 04열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1828, 1, 4, '1층 B구역 04열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1829, 1, 4, '1층 B구역 04열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1830, 1, 4, '1층 B구역 04열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1831, 1, 4, '1층 B구역 04열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1832, 1, 4, '1층 B구역 04열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1833, 1, 4, '1층 B구역 04열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1834, 2, 4, '1층 B구역 04열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1835, 2, 4, '1층 B구역 04열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1836, 2, 4, '1층 C구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1837, 2, 4, '1층 C구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1838, 2, 4, '1층 C구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1839, 2, 4, '1층 C구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1840, 2, 4, '1층 C구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1841, 2, 4, '1층 C구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1842, 2, 4, '1층 C구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1843, 2, 4, '1층 C구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1844, 2, 4, '1층 A구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1845, 2, 4, '1층 A구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1846, 2, 4, '1층 A구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1847, 2, 4, '1층 A구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1848, 2, 4, '1층 A구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1849, 2, 4, '1층 A구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1850, 2, 4, '1층 A구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1851, 2, 4, '1층 A구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1852, 2, 4, '1층 B구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1853, 1, 4, '1층 B구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1854, 1, 4, '1층 B구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1855, 1, 4, '1층 B구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1856, 1, 4, '1층 B구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1857, 1, 4, '1층 B구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1858, 1, 4, '1층 B구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1859, 1, 4, '1층 B구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1860, 1, 4, '1층 B구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1861, 1, 4, '1층 B구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1862, 1, 4, '1층 B구역 05열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1863, 1, 4, '1층 B구역 05열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1864, 1, 4, '1층 B구역 05열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1865, 1, 4, '1층 B구역 05열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1866, 1, 4, '1층 B구역 05열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1867, 1, 4, '1층 B구역 05열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1868, 1, 4, '1층 B구역 05열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1869, 1, 4, '1층 B구역 05열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1870, 1, 4, '1층 B구역 05열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1871, 1, 4, '1층 B구역 05열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1872, 2, 4, '1층 B구역 05열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1873, 2, 4, '1층 C구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1874, 2, 4, '1층 C구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1875, 2, 4, '1층 C구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1876, 2, 4, '1층 C구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1877, 2, 4, '1층 C구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1878, 2, 4, '1층 C구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1879, 2, 4, '1층 C구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1880, 2, 4, '1층 C구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1881, 2, 4, '1층 A구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1882, 2, 4, '1층 A구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1883, 2, 4, '1층 A구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1884, 2, 4, '1층 A구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1885, 2, 4, '1층 A구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1886, 2, 4, '1층 A구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1887, 2, 4, '1층 A구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1888, 2, 4, '1층 A구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1889, 1, 4, '1층 B구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1890, 1, 4, '1층 B구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1891, 1, 4, '1층 B구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1892, 1, 4, '1층 B구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1893, 1, 4, '1층 B구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1894, 1, 4, '1층 B구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1895, 1, 4, '1층 B구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1896, 1, 4, '1층 B구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1897, 1, 4, '1층 B구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1898, 1, 4, '1층 B구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1899, 1, 4, '1층 B구역 06열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1900, 1, 4, '1층 B구역 06열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1901, 1, 4, '1층 B구역 06열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1902, 1, 4, '1층 B구역 06열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1903, 1, 4, '1층 B구역 06열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1904, 1, 4, '1층 B구역 06열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1905, 1, 4, '1층 B구역 06열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1906, 1, 4, '1층 B구역 06열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1907, 1, 4, '1층 B구역 06열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1908, 1, 4, '1층 B구역 06열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1909, 1, 4, '1층 B구역 06열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1910, 2, 4, '1층 C구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1911, 2, 4, '1층 C구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1912, 2, 4, '1층 C구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1913, 2, 4, '1층 C구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1914, 2, 4, '1층 C구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1915, 2, 4, '1층 C구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1916, 2, 4, '1층 C구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1917, 2, 4, '1층 C구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1918, 2, 4, '1층 A구역 07열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1919, 2, 4, '1층 A구역 07열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1920, 2, 4, '1층 A구역 07열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1921, 2, 4, '1층 A구역 07열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1922, 2, 4, '1층 A구역 07열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1923, 2, 4, '1층 A구역 07열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1924, 2, 4, '1층 A구역 07열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1925, 2, 4, '1층 A구역 07열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1926, 1, 4, '1층 B구역 07열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1927, 1, 4, '1층 B구역 07열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1928, 1, 4, '1층 B구역 07열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1929, 1, 4, '1층 B구역 07열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1930, 1, 4, '1층 B구역 07열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1931, 1, 4, '1층 B구역 07열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1932, 1, 4, '1층 B구역 07열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1933, 1, 4, '1층 B구역 07열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1934, 1, 4, '1층 B구역 07열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1935, 1, 4, '1층 B구역 07열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1936, 1, 4, '1층 B구역 07열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1937, 1, 4, '1층 B구역 07열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1938, 1, 4, '1층 B구역 07열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1939, 1, 4, '1층 B구역 07열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1940, 1, 4, '1층 B구역 07열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1941, 1, 4, '1층 B구역 07열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1942, 1, 4, '1층 B구역 07열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1943, 1, 4, '1층 B구역 07열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1944, 1, 4, '1층 B구역 07열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1945, 1, 4, '1층 B구역 07열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1946, 1, 4, '1층 B구역 07열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1947, 2, 4, '1층 C구역 07열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1948, 2, 4, '1층 C구역 07열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1949, 2, 4, '1층 C구역 07열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1950, 2, 4, '1층 C구역 07열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1951, 2, 4, '1층 C구역 07열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1952, 2, 4, '1층 C구역 07열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1953, 2, 4, '1층 C구역 07열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1954, 2, 4, '1층 C구역 07열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1955, 2, 4, '1층 A구역 08열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1956, 2, 4, '1층 A구역 08열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1957, 2, 4, '1층 A구역 08열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1958, 2, 4, '1층 A구역 08열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1959, 2, 4, '1층 A구역 08열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1960, 2, 4, '1층 A구역 08열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1961, 2, 4, '1층 A구역 08열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1962, 2, 4, '1층 A구역 08열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1963, 1, 4, '1층 B구역 08열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1964, 1, 4, '1층 B구역 08열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1965, 1, 4, '1층 B구역 08열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1966, 1, 4, '1층 B구역 08열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1967, 1, 4, '1층 B구역 08열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1968, 1, 4, '1층 B구역 08열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1969, 1, 4, '1층 B구역 08열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1970, 1, 4, '1층 B구역 08열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1971, 1, 4, '1층 B구역 08열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1972, 1, 4, '1층 B구역 08열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1973, 1, 4, '1층 B구역 08열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1974, 1, 4, '1층 B구역 08열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1975, 1, 4, '1층 B구역 08열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1976, 1, 4, '1층 B구역 08열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1977, 1, 4, '1층 B구역 08열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1978, 1, 4, '1층 B구역 08열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1979, 1, 4, '1층 B구역 08열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1980, 1, 4, '1층 B구역 08열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1981, 1, 4, '1층 B구역 08열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1982, 1, 4, '1층 B구역 08열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1983, 1, 4, '1층 B구역 08열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1984, 2, 4, '1층 C구역 08열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1985, 2, 4, '1층 C구역 08열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1986, 2, 4, '1층 C구역 08열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1987, 2, 4, '1층 C구역 08열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1988, 2, 4, '1층 C구역 08열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1989, 2, 4, '1층 C구역 08열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1990, 2, 4, '1층 C구역 08열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1991, 2, 4, '1층 C구역 08열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1992, 2, 4, '1층 A구역 09열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1993, 2, 4, '1층 A구역 09열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1994, 2, 4, '1층 A구역 09열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1995, 2, 4, '1층 A구역 09열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1996, 2, 4, '1층 A구역 09열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1997, 2, 4, '1층 A구역 09열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1998, 2, 4, '1층 A구역 09열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (1999, 2, 4, '1층 A구역 09열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2000, 1, 4, '1층 B구역 09열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2001, 1, 4, '1층 B구역 09열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2002, 1, 4, '1층 B구역 09열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2003, 1, 4, '1층 B구역 09열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2004, 1, 4, '1층 B구역 09열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2005, 1, 4, '1층 B구역 09열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2006, 1, 4, '1층 B구역 09열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2007, 1, 4, '1층 B구역 09열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2008, 1, 4, '1층 B구역 09열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2009, 1, 4, '1층 B구역 09열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2010, 1, 4, '1층 B구역 09열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2011, 1, 4, '1층 B구역 09열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2012, 1, 4, '1층 B구역 09열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2013, 1, 4, '1층 B구역 09열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2014, 1, 4, '1층 B구역 09열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2015, 1, 4, '1층 B구역 09열 016번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2016, 1, 4, '1층 B구역 09열 017번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2017, 1, 4, '1층 B구역 09열 018번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2018, 1, 4, '1층 B구역 09열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2019, 1, 4, '1층 B구역 09열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2020, 1, 4, '1층 B구역 09열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2021, 2, 4, '1층 C구역 09열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2022, 2, 4, '1층 C구역 09열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2023, 2, 4, '1층 C구역 09열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2024, 2, 4, '1층 C구역 09열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2025, 2, 4, '1층 C구역 09열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2026, 2, 4, '1층 C구역 09열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2027, 2, 4, '1층 C구역 09열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2028, 2, 4, '1층 C구역 09열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2029, 2, 4, '1층 A구역 10열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2030, 2, 4, '1층 A구역 10열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2031, 2, 4, '1층 A구역 10열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2032, 2, 4, '1층 A구역 10열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2033, 2, 4, '1층 A구역 10열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2034, 2, 4, '1층 A구역 10열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2035, 2, 4, '1층 A구역 10열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2036, 2, 4, '1층 A구역 10열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2037, 2, 4, '1층 B구역 10열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2038, 2, 4, '1층 B구역 10열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2039, 2, 4, '1층 B구역 10열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2040, 2, 4, '1층 B구역 10열 019번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2041, 2, 4, '1층 B구역 10열 020번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2042, 2, 4, '1층 B구역 10열 021번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2043, 2, 4, '1층 C구역 10열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2044, 2, 4, '1층 C구역 10열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2045, 2, 4, '1층 C구역 10열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2046, 2, 4, '1층 C구역 10열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2047, 2, 4, '1층 C구역 10열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2048, 2, 4, '1층 C구역 10열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2049, 2, 4, '1층 C구역 10열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2050, 2, 4, '1층 C구역 10열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2051, 3, 4, '2층 A구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2052, 3, 4, '2층 A구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2053, 3, 4, '2층 A구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2054, 3, 4, '2층 A구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2055, 3, 4, '2층 A구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2056, 3, 4, '2층 A구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2057, 3, 4, '2층 A구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2058, 3, 4, '2층 A구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2059, 3, 4, '2층 A구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2060, 3, 4, '2층 A구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2061, 3, 4, '2층 B구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2062, 3, 4, '2층 B구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2063, 3, 4, '2층 B구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2064, 3, 4, '2층 B구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2065, 3, 4, '2층 B구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2066, 3, 4, '2층 B구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2067, 3, 4, '2층 B구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2068, 3, 4, '2층 B구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2069, 3, 4, '2층 B구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2070, 3, 4, '2층 B구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2071, 3, 4, '2층 B구역 01열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2072, 3, 4, '2층 B구역 01열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2073, 3, 4, '2층 B구역 01열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2074, 3, 4, '2층 B구역 01열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2075, 3, 4, '2층 B구역 01열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2076, 3, 4, '2층 C구역 01열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2077, 3, 4, '2층 C구역 01열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2078, 3, 4, '2층 C구역 01열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2079, 3, 4, '2층 C구역 01열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2080, 3, 4, '2층 C구역 01열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2081, 3, 4, '2층 C구역 01열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2082, 3, 4, '2층 C구역 01열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2083, 3, 4, '2층 C구역 01열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2084, 3, 4, '2층 C구역 01열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2085, 3, 4, '2층 C구역 01열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2086, 3, 4, '2층 A구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2087, 3, 4, '2층 A구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2088, 3, 4, '2층 A구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2089, 3, 4, '2층 A구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2090, 3, 4, '2층 A구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2091, 3, 4, '2층 A구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2092, 3, 4, '2층 A구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2093, 3, 4, '2층 A구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2094, 3, 4, '2층 A구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2095, 3, 4, '2층 A구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2096, 3, 4, '2층 B구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2097, 3, 4, '2층 B구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2098, 3, 4, '2층 B구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2099, 3, 4, '2층 B구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2100, 3, 4, '2층 B구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2101, 3, 4, '2층 B구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2102, 3, 4, '2층 B구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2103, 3, 4, '2층 B구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2104, 3, 4, '2층 B구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2105, 3, 4, '2층 B구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2106, 3, 4, '2층 B구역 02열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2107, 3, 4, '2층 B구역 02열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2108, 3, 4, '2층 B구역 02열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2109, 3, 4, '2층 B구역 02열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2110, 3, 4, '2층 B구역 02열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2111, 3, 4, '2층 C구역 02열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2112, 3, 4, '2층 C구역 02열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2113, 3, 4, '2층 C구역 02열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2114, 3, 4, '2층 C구역 02열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2115, 3, 4, '2층 C구역 02열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2116, 3, 4, '2층 C구역 02열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2117, 3, 4, '2층 C구역 02열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2118, 3, 4, '2층 C구역 02열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2119, 3, 4, '2층 C구역 02열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2120, 3, 4, '2층 C구역 02열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2121, 3, 4, '2층 A구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2122, 3, 4, '2층 A구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2123, 3, 4, '2층 A구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2124, 3, 4, '2층 A구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2125, 3, 4, '2층 A구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2126, 3, 4, '2층 A구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2127, 3, 4, '2층 A구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2128, 3, 4, '2층 A구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2129, 3, 4, '2층 A구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2130, 3, 4, '2층 A구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2131, 3, 4, '2층 B구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2132, 3, 4, '2층 B구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2133, 3, 4, '2층 B구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2134, 3, 4, '2층 B구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2135, 3, 4, '2층 B구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2136, 3, 4, '2층 B구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2137, 3, 4, '2층 B구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2138, 3, 4, '2층 B구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2139, 3, 4, '2층 B구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2140, 3, 4, '2층 B구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2141, 3, 4, '2층 B구역 03열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2142, 3, 4, '2층 B구역 03열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2143, 3, 4, '2층 B구역 03열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2144, 3, 4, '2층 B구역 03열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2145, 3, 4, '2층 B구역 03열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2146, 3, 4, '2층 C구역 03열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2147, 3, 4, '2층 C구역 03열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2148, 3, 4, '2층 C구역 03열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2149, 3, 4, '2층 C구역 03열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2150, 3, 4, '2층 C구역 03열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2151, 3, 4, '2층 C구역 03열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2152, 3, 4, '2층 C구역 03열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2153, 3, 4, '2층 C구역 03열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2154, 3, 4, '2층 C구역 03열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2155, 3, 4, '2층 C구역 03열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2156, 3, 4, '2층 A구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2157, 3, 4, '2층 A구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2158, 3, 4, '2층 A구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2159, 3, 4, '2층 A구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2160, 3, 4, '2층 A구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2161, 3, 4, '2층 A구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2162, 3, 4, '2층 A구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2163, 3, 4, '2층 A구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2164, 3, 4, '2층 A구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2165, 3, 4, '2층 A구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2166, 3, 4, '2층 B구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2167, 3, 4, '2층 B구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2168, 3, 4, '2층 B구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2169, 3, 4, '2층 B구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2170, 3, 4, '2층 B구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2171, 3, 4, '2층 B구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2172, 3, 4, '2층 B구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2173, 3, 4, '2층 B구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2174, 3, 4, '2층 B구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2175, 3, 4, '2층 B구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2176, 3, 4, '2층 B구역 04열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2177, 3, 4, '2층 B구역 04열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2178, 3, 4, '2층 B구역 04열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2179, 3, 4, '2층 B구역 04열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2180, 3, 4, '2층 B구역 04열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2181, 3, 4, '2층 C구역 04열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2182, 3, 4, '2층 C구역 04열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2183, 3, 4, '2층 C구역 04열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2184, 3, 4, '2층 C구역 04열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2185, 3, 4, '2층 C구역 04열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2186, 3, 4, '2층 C구역 04열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2187, 3, 4, '2층 C구역 04열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2188, 3, 4, '2층 C구역 04열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2189, 3, 4, '2층 C구역 04열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2190, 3, 4, '2층 C구역 04열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2191, 3, 4, '2층 A구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2192, 3, 4, '2층 A구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2193, 3, 4, '2층 A구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2194, 3, 4, '2층 A구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2195, 3, 4, '2층 A구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2196, 3, 4, '2층 A구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2197, 3, 4, '2층 A구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2198, 3, 4, '2층 A구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2199, 3, 4, '2층 A구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2200, 3, 4, '2층 A구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2201, 3, 4, '2층 B구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2202, 3, 4, '2층 B구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2203, 3, 4, '2층 B구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2204, 3, 4, '2층 B구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2205, 3, 4, '2층 B구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2206, 3, 4, '2층 B구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2207, 3, 4, '2층 B구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2208, 3, 4, '2층 B구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2209, 3, 4, '2층 B구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2210, 3, 4, '2층 B구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2211, 3, 4, '2층 B구역 05열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2212, 3, 4, '2층 B구역 05열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2213, 3, 4, '2층 B구역 05열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2214, 3, 4, '2층 B구역 05열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2215, 3, 4, '2층 B구역 05열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2216, 3, 4, '2층 C구역 05열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2217, 3, 4, '2층 C구역 05열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2218, 3, 4, '2층 C구역 05열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2219, 3, 4, '2층 C구역 05열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2220, 3, 4, '2층 C구역 05열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2221, 3, 4, '2층 C구역 05열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2222, 3, 4, '2층 C구역 05열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2223, 3, 4, '2층 C구역 05열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2224, 3, 4, '2층 C구역 05열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2225, 3, 4, '2층 C구역 05열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2226, 3, 4, '2층 A구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2227, 3, 4, '2층 A구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2228, 3, 4, '2층 A구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2229, 3, 4, '2층 A구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2230, 3, 4, '2층 A구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2231, 3, 4, '2층 A구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2232, 3, 4, '2층 A구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2233, 3, 4, '2층 A구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2234, 3, 4, '2층 A구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2235, 3, 4, '2층 A구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2236, 3, 4, '2층 B구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2237, 3, 4, '2층 B구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2238, 3, 4, '2층 B구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2239, 3, 4, '2층 B구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2240, 3, 4, '2층 B구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2241, 3, 4, '2층 B구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2242, 3, 4, '2층 B구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2243, 3, 4, '2층 B구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2244, 3, 4, '2층 B구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2245, 3, 4, '2층 B구역 06열 010번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2246, 3, 4, '2층 B구역 06열 011번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2247, 3, 4, '2층 B구역 06열 012번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2248, 3, 4, '2층 B구역 06열 013번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2249, 3, 4, '2층 B구역 06열 014번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2250, 3, 4, '2층 B구역 06열 015번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2251, 3, 4, '2층 C구역 06열 001번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2252, 3, 4, '2층 C구역 06열 002번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2253, 3, 4, '2층 C구역 06열 003번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2254, 3, 4, '2층 C구역 06열 004번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2255, 3, 4, '2층 C구역 06열 005번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2256, 3, 4, '2층 C구역 06열 006번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2257, 3, 4, '2층 C구역 06열 007번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2258, 3, 4, '2층 C구역 06열 008번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2259, 3, 4, '2층 C구역 06열 009번', 0, 1);
INSERT INTO FINALPROJECT4.YES_SHOW_SEAT (SEAT_ID, SEATTYPE_ID, DATE_ID, SEAT_NAME, SEAT_STATUS, PROD_ID) VALUES (2260, 3, 4, '2층 C구역 06열 010번', 0, 1);
commit
-------------------------------------------------------------------------

----------------------------------- 제약조건 -----------------------------------
-- 제약조건 조회
select * from all_constraints where table_name = '테이블명';

-- 제약조건 삭제
alter table yes_show_map drop constraint FK_PROD_ID cascade;

----------------------------------- 회원 테이블 - User -----------------------------------
-- 회원 테이블
drop table yes_member cascade constraints;
create table yes_member
(idx                number(10)     not null       -- 회원번호(시퀀스로 데이터가 들어온다)
,userid             varchar2(20)   not null       -- 회원아이디
,name               varchar2(30)   not null       -- 회원명
,pwd                varchar2(200)  not null       -- 비밀번호 (SHA-256 암호화 대상)
,email              varchar2(200)  not null       -- 이메일   (AES-256 암호화/복호화 대상)
,hp1                varchar2(3)                   -- 연락처
,hp2                varchar2(200)                 --         (AES-256 암호화/복호화 대상) 
,hp3                varchar2(200)                 --         (AES-256 암호화/복호화 대상)
,postcode           varchar2(5)                   -- 우편번호
,address            varchar2(200)                 -- 주소
,detailaddress      varchar2(200)                 -- 상세주소
,extraaddress       varchar2(200)                 -- 참고항목
,gender             varchar2(3)                   -- 성별     남자 : 1 / 여자 : 2
,birthday           varchar2(8)                   -- 생년월일 
,coin               number default 0              -- 코인액
,point              number default 0              -- 포인트 
,registerday        date default sysdate          -- 가입일자
,status             number(1) default 1           -- 회원탈퇴유무   1:사용가능(가입중) / 0:사용불능(탈퇴) 
,lastLoginDate      date default sysdate          -- 마지막으로 로그인 한 날짜시간 기록용
,lastPwdChangeDate  date default sysdate          -- 마지막으로 암호를 변경한 날짜시간 기록용
,clientip           varchar2(20)                  -- 클라이언트의 IP 주소
,kakaoStatus        varchar2(1) default '0'       -- 카카오 로그인 유무
,naverStatus        varchar2(1) default '0'       -- 네이버 로그인 유무
,isSMS              varchar2(1) default '0'       -- sms 수신 여부
,isEMAIL            varchar2(1) default '0'       -- email 수신 여부
,sessionKey         varchar2(100) default 'none'  -- 로그인 유지시 세션 저장
,sessionLimit       timestamp
,constraint   PK_yes_member_idx primary key(idx)
,constraint   UK_yes_member_userid unique(userid)
,constraint   CK_yes_member_gender check( gender in('1','2') ) 
,constraint   CK_yes_member_status check( status in('0','1') ) 
,constraint   CK_yes_member_kakao check( status in('0','1') ) 
,constraint   CK_yes_member_isSMS check( status in('0','1') )
,constraint   CK_yes_member_isEMAIL check( status in('0','1') )
);

drop sequence seq_member;
create sequence seq_member
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into yes_member(idx, userid, name, pwd, email, hp1, hp2, hp3, postcode, address, detailAddress, extraAddress, gender, birthday, coin, point, registerday, status, lastlogindate, lastpwdchangedate, clientip, kakaoStatus, naverStatus) 
values(seq_member.nextval, 'kimjy', '김진영', '9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382', 'KaDz2RcfIWg51HF/fFWvOxLoX5Y6H9S5+AmisF8ovv0=' , '010', '5vlo5ZBnIbLMyMz3NtK38A==', 'TYENQOsy0AExa9/mtma0ow==', '50234', '서울 송파구 오금로 95', '337동 708호', '오금동 현대아파트', '1', '19960920', default, default, default, default, default, default, '127.0.0.1', '1', default);


insert into yes_member(idx, userid, name, pwd, email, hp1, hp2, hp3, postcode, address, detailAddress, extraAddress, gender, birthday, coin, point, registerday, status, lastlogindate, lastpwdchangedate, clientip, kakaoStatus, naverStatus) 
values(seq_member.nextval, 'admin', '관리자', '9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382', 'KaDz2RcfIWg51HF/fFWvOxLoX5Y6H9S5+AmisF8ovv0=' , '010', '5vlo5ZBnIbLMyMz3NtK38A==', 'TYENQOsy0AExa9/mtma0ow==', '50234', '서울 송파구 오금로 95', '337동 708호', '오금동 현대아파트', '1', '19960920', default, default, default, default, default, default, '127.0.0.1', '1', default);

insert into yes_member(idx, userid, name, pwd, email, hp1, hp2, hp3, postcode, address, detailAddress, extraAddress, gender, birthday, coin, point, registerday, status, lastlogindate, lastpwdchangedate, clientip, kakaoStatus, naverStatus) 
values(seq_member.nextval, 'kkimsg93', '김슬기', '4d4f26369171994f3a46776ee2d88494fb9955800a5bb6261c016c4bb9f30b56', 'KaDz2RcfIWg51HF/fFWvOxLoX5Y6H9S5+AmisF8ovv0=' , '010', '5vlo5ZBnIbLMyMz3NtK38A==', 'TYENQOsy0AExa9/mtma0ow==', '50234', '서울 송파구 오금로 95', '337동 708호', '오금동 현대아파트', '1', '19960920', default, default, default, default, default, default, '127.0.0.1', '1', default);

insert into yes_member(idx, userid, name, pwd, email, hp1, hp2, hp3, postcode, address, detailAddress, extraAddress, gender, birthday, coin, point, registerday, status, lastlogindate, lastpwdchangedate, clientip, kakaoStatus, naverStatus) 
values(seq_member.nextval, 'leess', '이순신', '4d4f26369171994f3a46776ee2d88494fb9955800a5bb6261c016c4bb9f30b56', 'KaDz2RcfIWg51HF/fFWvOxLoX5Y6H9S5+AmisF8ovv0=' , '010', '5vlo5ZBnIbLMyMz3NtK38A==', 'TYENQOsy0AExa9/mtma0ow==', '50234', '서울 송파구 오금로 95', '337동 708호', '오금동 현대아파트', '1', '19960920', default, default, default, default, default, default, '127.0.0.1', '1', default);

insert into yes_member(idx, userid, name, pwd, email, hp1, hp2, hp3, postcode, address, detailAddress, extraAddress, gender, birthday, coin, point, registerday, status, lastlogindate, lastpwdchangedate, clientip, kakaoStatus, naverStatus) 
values(seq_member.nextval, 'eomjh', '엄정화', '4d4f26369171994f3a46776ee2d88494fb9955800a5bb6261c016c4bb9f30b56', 'KaDz2RcfIWg51HF/fFWvOxLoX5Y6H9S5+AmisF8ovv0=' , '010', '5vlo5ZBnIbLMyMz3NtK38A==', 'TYENQOsy0AExa9/mtma0ow==', '50234', '서울 송파구 오금로 95', '337동 708호', '오금동 현대아파트', '1', '19960920', default, default, default, default, default, default, '127.0.0.1', '1', default);

insert into yes_member(idx, userid, name, pwd, email, hp1, hp2, hp3, postcode, address, detailAddress, extraAddress, gender, birthday, coin, point, registerday, status, lastlogindate, lastpwdchangedate, clientip, kakaoStatus, naverStatus) 
values(seq_member.nextval, 'guzi10', '구지', '4d4f26369171994f3a46776ee2d88494fb9955800a5bb6261c016c4bb9f30b56', 'KaDz2RcfIWg51HF/fFWvOxLoX5Y6H9S5+AmisF8ovv0=' , '010', '5vlo5ZBnIbLMyMz3NtK38A==', 'TYENQOsy0AExa9/mtma0ow==', '50234', '서울 송파구 오금로 95', '337동 708호', '오금동 현대아파트', '1', '19960920', default, default, default, default, default, default, '127.0.0.1', '1', default);

commit;

update yes_member
set point = 1000
where userid = 'admin';

update yes_member set pwd = '4d4f26369171994f3a46776ee2d88494fb9955800a5bb6261c016c4bb9f30b56'
where userid = 'kimjy';
-- qwer1234 비밀번호

update yes_member
set point = 1000
where userid = 'guzi10';

select * from yes_member;
delete from yes_member;
commit;

----------------------------------- 예매 테이블 - Reservation -----------------------------------
-- 예매 테이블
drop table yes_reserve;
create table yes_reserve
(rev_id         number(10)                  -- 예매코드
,prod_id        number                      -- 공연코드(FK)
,user_id        varchar2(20)                -- 회원코드(FK)
,seat_id        number                      -- 좌석코드(FK)
,status_id      number                      -- 상태코드(FK)
,date_id        number                      -- 공연일시 코드(FK)
,rev_email      varchar2(20)                -- 예매자이메일
,rev_qnty       number(6)                   -- 예매수
,rev_date       date        default sysdate -- 예매일자
,rev_price      number(10)                  -- 예매가격
,rev_ship_method    number(1)               -- 수령방법
,rev_pay_method     number(1)               -- 결제방법
,rev_pay_status     number(1)               -- 결제상태
,constraint PK_rev_id primary key(rev_id)
,constraint FK_prod_id_rev foreign key(prod_id) references prod(prod_id) on delete cascade
,constraint FK_user_id_rev foreign key(user_id) references yes_member(userid) on delete cascade
,constraint FK_seat_id_rev foreign key(seat_id) references yes_show_seat(seat_id) on delete cascade
,constraint FK_date_id_rev foreign key(date_id) references yes_show_date(date_id) on delete cascade
--,constraint FK_status_id_rev foreign key(status_id) references yes_rev_status(status_id) on delete cascade
);



drop sequence seq_reserve;
create sequence seq_reserve
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *
from yes_reserve;


-----------------------------------------
-- 상태 테이블
drop table yes_rev_status;
create table yes_rev_status
(status_id          number(10)              -- 상태코드
,rev_id             number                  -- 예매코드(FK)
,status             number(1)   default 0   -- 상태
,status_cng_date    date                    -- 수정일자
,constraint PK_status_id primary key(status_id)
,constraint FK_rev_id_status foreign key(rev_id) references yes_reserve(rev_id) on delete cascade
);

drop sequence seq_rev_status;
create sequence seq_rev_status
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *
from yes_rev_status;

insert into yes_reserve(rev_id, prod_id, user_id, seat_id, status_id, date_id, rev_email, rev_qnty, rev_price, rev_ship_method, rev_pay_method, rev_pay_status)
values(seq_reserve.nextval, 1, 'kkimsg93', 1, 1, 1, 'hyunho2005@naver.com', 2, 50000, 0, 0, 0);

insert into yes_reserve(rev_id, prod_id, user_id, seat_id, status_id, date_id, rev_email, rev_qnty, rev_price, rev_ship_method, rev_pay_method, rev_pay_status)
values(seq_reserve.nextval, 1, 'kkimsg93', 2, 1, 1, 'hyunho2005@naver.com', 2, 50000, 0, 0, 0);

insert into yes_reserve(rev_id, prod_id, user_id, seat_id, status_id, date_id, rev_email, rev_qnty, rev_price, rev_ship_method, rev_pay_method, rev_pay_status)
values(seq_reserve.nextval, 2, 'kkimsg93', 1, 1, 1, 'hyunho2005@naver.com', 2, 50000, 0, 0, 0);

insert into yes_reserve(rev_id, prod_id, user_id, seat_id, status_id, date_id, rev_email, rev_qnty, rev_price, rev_ship_method, rev_pay_method, rev_pay_status)
values(seq_reserve.nextval, 2, 'kkimsg93', 2, 1, 1, 'hyunho2005@naver.com', 2, 50000, 0, 0, 0);

commit;

insert into yes_reserve(rev_id, prod_id, user_id, seat_id, status_id, date_id, rev_email, rev_qnty, rev_date, rev_price, rev_ship_method, rev_pay_method, rev_pay_status   )
values(seq_reserve.nextval, 1, 'guzi10', 3, 1, 1, 'guzi1010@naver.com', 1, sysdate, 50000, 0, 0, 0 );

insert into yes_reserve(rev_id, prod_id, user_id, seat_id, status_id, date_id, rev_email, rev_qnty, rev_date, rev_price, rev_ship_method, rev_pay_method, rev_pay_status   )
values(seq_reserve.nextval, 2, 'guzi10', 4, 1, 6, 'guzi1010@naver.com', 2, sysdate, 30000, 0, 0, 0 );

insert into yes_reserve(rev_id, prod_id, user_id, seat_id, status_id, date_id, rev_email, rev_qnty, rev_date, rev_price, rev_ship_method, rev_pay_method, rev_pay_status   )
values(seq_reserve.nextval, 3, 'guzi10', 1, 1, 6, 'guzi1010@naver.com', 1, sysdate, 30000, 0, 0, 0 );


commit;

insert into yes_rev_status(status_id, rev_id, status, status_cng_date )
values(seq_rev_status.nextval, 1, 1, sysdate);
insert into yes_rev_status(status_id, rev_id, status, status_cng_date )
values(seq_rev_status.nextval, 2, 1, sysdate);
insert into yes_rev_status(status_id, rev_id, status, status_cng_date )
values(seq_rev_status.nextval, 3, 1, sysdate);
insert into yes_rev_status(status_id, rev_id, status, status_cng_date )
values(seq_rev_status.nextval, 4, 0, sysdate);

commit;

/*
insert into yes_rev_status(status_id, rev_id, status, status_cng_date )
values(seq_rev_status.nextval, 1, 1, sysdate);

insert into yes_rev_status(status_id, rev_id, status, status_cng_date )
values(seq_rev_status.nextval, 2, 1, sysdate);

insert into yes_rev_status(status_id, rev_id, status, status_cng_date )
values(seq_rev_status.nextval, 3, 0, sysdate);
*/ 
-- insert 예시


------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- 예매 시, 공연 정보가져올 view
create or replace view view_rev_showInfo
AS
select P.prod_id, P.prod_img, P.prod_title, P.info_grade, P.info_run_time, M.map_name 
from prod P
JOIN yes_show_map M
ON P.map_id = M.map_id;
--JOIN yes_show_seat S
--ON M.prod_id = S.prod_id;

select *
from view_rev_showInfo
where prod_id = 1;

-----------------------------------------------------------------------------
-- 예매 시, 공연 정보가져올 view
create or replace view view_rev_showInfo
AS
select P.prod_id, P.prod_img, P.prod_title, P.info_grade, P.info_run_time, M.map_name 
from prod P
JOIN yes_show_map M
ON P.map_id = M.map_id; -- ### ON P.prod_id = M.prod_id --
--JOIN yes_show_seat S
--ON M.prod_id = S.prod_id;

select *
from view_rev_showInfo
where prod_id = 2;

-- 예매 시, 공연 시간 정보 가져옴
select prod_id, to_char(date_showday, 'yy/mm/dd') || ' ' || to_char(date_showday, 'day') as date_showday, date_showtime
from yes_show_date
where prod_id = 2
order by 1, 2;

select distinct to_char(date_showday, 'yy/mm/dd') || ' ' || to_char(date_showday, 'day') as date_showday
from yes_show_date
where prod_id = 2
order by date_showday;

----------------------------------- 공지 카테고리 테이블 -----------------------------------


drop table yes_notice_cate purge;

create table yes_notice_cate
(no_cate_id    number(8)     not null  -- 카테고리 대분류 번호
,no_cate_code  varchar2(20)  not null  -- 카테고리 코드
,no_cate_name  varchar2(100) not null  -- 카테고리명
,constraint PK_no_cate_cnum primary key(no_cate_id)
,constraint UQ_no_cate_code unique(no_cate_code)
);

drop sequence noticeCateSeq;

create sequence noticeCateSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into yes_notice_cate values(noticeCateSeq.nextval, '1', '티켓오픈');
insert into yes_notice_cate values(noticeCateSeq.nextval, '2', '서비스점검');
insert into yes_notice_cate values(noticeCateSeq.nextval, '3', '변경/취소');
insert into yes_notice_cate values(noticeCateSeq.nextval, '4', '기타');
commit;

select * 
from yes_notice_cate;


----------------------------------- QNA 카테고리 테이블 -----------------------------------


drop table yes_qna_cate purge;

create table yes_qna_cate
(qna_cate_id    number(8)     not null  -- 카테고리 대분류 번호
,qna_cate_code  varchar2(20)  not null  -- 카테고리 코드
,qna_cate_name  varchar2(100) not null  -- 카테고리명
,constraint PK_qna_cate_cnum primary key(qna_cate_id)
,constraint UQ_qna_cate_code unique(qna_cate_code)
);

drop sequence qnaCateSeq;

create sequence qnaCateSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into yes_qna_cate values(qnaCateSeq.nextval, '1', '예매/결제');
insert into yes_qna_cate values(qnaCateSeq.nextval, '2', '티켓수령');
insert into yes_qna_cate values(qnaCateSeq.nextval, '3', '취소/환불');
insert into yes_qna_cate values(qnaCateSeq.nextval, '4', '기타');
commit;

select * 
from yes_qna_cate;


select prod_id, fk_category_id, fk_category_detail_id, prod_title, prod_img, prod_detail_img, date_start, date_end
		     , info_open_date, info_close_date, info_rev_status, info_grade, info_run_time, info_qnty, status, map_id
		from prod
		where fk_category_id = 1
		order by info_open_date desc



----------------------------------- QNA 게시판 테이블 -----------------------------------

drop table yes_qna purge;

create table yes_qna
(qna_id         number                not null   -- 글번호
,fk_userid      varchar2(20)          not null   -- 사용자ID
,name           Nvarchar2(20)         not null   -- 글쓴이
,category       varchar2(20)          not null   -- 카테고리
,fk_rev_id      number(10)            default 0 
,subject        Nvarchar2(200)        not null   -- 글제목
,content        Nvarchar2(2000)       not null   -- 글내용    -- clob
,pw             varchar2(20)    default '1234'      not null   -- 글암호
,readCount      number default 0      not null   -- 글조회수
,regDate        date default sysdate  not null   -- 글쓴시간
,secret         number(1) default 0   not null   -- 비밀글여부  1:비밀글, 0:공개글
,adminread      number(1) default 0
,adminans       number(1) default 0
,status         number(1) default 1   not null   -- 글삭제여부  1:사용가능한글,  0:삭제된글 
,groupno        number                not null   -- 답변글쓰기에 있어서 그룹번호 
                                                 -- 원글(부모글)과 답변글은 동일한 groupno 를 가진다.
                                                 -- 답변글이 아닌 원글(부모글)인 경우 groupno 의 값은 groupno 컬럼의 최대값(max)+1 로 한다.
,fk_seq         number default 0      not null   -- 답변글쓰기에 있어서 답변글이라면 fk_seq 컬럼의 값은 
                                                 -- 원글(부모글)의 seq 컬럼의 값을 가지게 되며,
                                                 -- 답변글이 아닌 원글일 경우 0 을 가지도록 한다.
,depthno        number default 0                 -- 답변글쓰기에 있어서 답변글 이라면
                                                 -- 원글(부모글)의 depthno + 1 을 가지게 되며,
                                                 -- 답변글이 아닌 원글일 경우 0 을 가지도록 한다.
,constraint  PK_qna_id primary key(qna_id)
,constraint  FK_qna_fk_userid foreign key(fk_userid) references yes_member(userid)
--,constraint  FK_qna_fk_rev_id foreign key(fk_rev_id) references yes_reserve(rev_id)
,constraint  FK_qna_category foreign key(category) references yes_qna_cate(qna_cate_code)
,constraint  CK_qna_status check( status in(0,1) )
,constraint  CK_qna_secret check( secret in (0,1) )
,constraint  CK_qna_adminread check( adminread in (0,1) )
,constraint  CK_qna_adminans check( adminans in (0,1) )
);
--user_id 컬럼 필요(seq)


alter table yes_qna 
modify pw default '1234';

alter table yes_qna
modify fk_rev_id default 0; 

drop sequence qnaSeq;

create sequence qnaSeq
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;

insert into yes_qna(qna_id,fk_userid,name,category,fk_rev_id,subject,content,groupno,fk_seq,depthno)
values(qnaSeq.nextval, 'admin', '관리자', '1', 0, '관리자 답변입니다. ', '답변내용입니다.', 1, 1, 1);

select * 
from view_qna_info
where groupno = 1;

select *
from view_qna_info
where qna_id = 1;

--kimjy 가 문의한글, 그 문의에 답변글(admin)
-- kimjy 문의한글 qna_id, groupno 



select qna_id, fk_userid, name, qna_cate_name, subject, content
                 , regDate, adminread, adminans, groupno, fk_seq, depthno
                 ,fk_rev_id, prod_id, rev_email, prod_img, prod_title
		from 
		(
		    select rownum AS rno
		         , qna_id, fk_userid, name, qna_cate_name, subject, content
                 , regDate, adminread, adminans, groupno, fk_seq, depthno
                 ,fk_rev_id, prod_id, rev_email, prod_img, prod_title
		    from
		    (
		        select qna_id, fk_userid, name, qna_cate_name, subject, content
                        , to_char(regDate, 'yyyy-mm-dd hh24:mi:ss') as regDate, adminread, adminans, groupno, fk_seq, depthno
                        ,fk_rev_id, prod_id, rev_email, prod_img, prod_title
		        from view_qna_info
		        where status = 1
		        -- and lower(${searchType}) like '%' || lower(#{searchWord}) || '%' 
		        start with fk_seq = 0
		        connect by prior qna_id = fk_seq
		        order siblings by groupno desc, qna_id asc
		    ) V
		) T
		where rno between 1 and 5;
        -- 문의게시판 계층형 쿼리


select *
from view_qna_info
where fk_userid in ('kimjy', 'admin')
start with fk_seq = 0
connect by prior qna_id = fk_seq
order siblings by groupno desc, qna_id asc;
-- 나의문의와 관리자 답변 같이보기(다른사람에게 답변한 관리자 답변도 같이 보인다.)

select *
from
(select *
from view_qna_info
where fk_userid in ('kimjy', 'admin')
start with fk_seq = 0
connect by prior qna_id = fk_seq 
order siblings by groupno desc, qna_id asc
) V
where groupno in (1,2,3);
-- 나의문의와 관리자 답변 같이보기(내가쓴 글의 groupno 를 알아와야 한다.)


select nvl(max(groupno),0)
from yes_qna;

select qna_id, fk_userid, name, qna_cate_name, subject, content, regDate, adminread, adminans, groupno, fk_seq, depthno
     ,fk_rev_id, prod_id, rev_email, prod_img, prod_title
from view_qna_info
where qna_id = 1;

commit;

delete from yes_qna;
select * from yes_qna;





select * 
from yes_qna Q left join yes_reserve R 
on Q.fk_rev_id = R.rev_id
left join view_rev_showInfo I
on R.prod_id = I.prod_id;
-- 예매한 공연목록을 합쳐서 QNA 나타내기

select qna_id, fk_userid, name, category, subject, content, readcount, regDate, secret, adminread, adminans, status, groupno, fk_seq, depthno
        ,fk_rev_id, I.prod_id, rev_email, rev_qnty, rev_date, rev_price, prod_img, prod_title
from yes_qna Q left join yes_reserve R 
on Q.fk_rev_id = R.rev_id
left join view_rev_showInfo I
on R.prod_id = I.prod_id;

create or replace view view_qna_info
as
select qna_id, fk_userid, name, category, qna_cate_name, subject, content, readcount, regDate, secret, adminread, adminans, status, groupno, fk_seq, depthno
      ,fk_rev_id, nvl(I.prod_id, 0) as prod_id, nvl(rev_email, ' ') as rev_email, nvl(prod_img, ' ') as prod_img, nvl(prod_title, ' ') as prod_title
from yes_qna Q left join yes_reserve R 
on Q.fk_rev_id = R.rev_id
left join view_rev_showInfo I
on R.prod_id = I.prod_id
left join yes_qna_cate C
on Q.category = C.qna_cate_code;
-- 예매한 공연목록문의 합쳐진 QNA 리스트 나타내기

select * from view_qna_info
where status = 1
order by qna_id desc;
-- 예매한 공연목록문의 합쳐진 QNA 리스트 나타내기 (status = 1 인 목록만 출력)

select *
from yes_reserve;

select * 
from yes_reserve R join view_rev_showInfo I
on R.prod_id = I.prod_id;

create or replace view view_rev_memberInfo
as
select rev_id, R.prod_id, user_id, seat_id, status_id, rev_email, rev_qnty, rev_date, rev_price, rev_ship_method, rev_pay_method, rev_pay_status, prod_img, prod_title, info_grade, info_run_time, map_name, idx, userid, name
from yes_reserve R join view_rev_showInfo I
on R.prod_id = I.prod_id
join yes_member M
on R.user_id = M.userid;

select *
from view_rev_memberInfo
where userid = 'kimjy';
-- where idx = 1;
-- 'kimjy' 이 예매한 공연목록

select distinct prod_title, prod_id
from view_rev_memberInfo
where userid = 'kimjy';
-- where idx = 1;
-- 'kimjy' 이 예매한 공연목록중 중복을 제거하고 공연이름과 공연정보코드만 가져오기



select *
from yes_reserve R join view_rev_showInfo I
on R.prod_id = I.prod_id
join yes_member M
on R.user_id = M.idx;
-- ### --

select *
from view_rev_showInfo
where prod_id = 2;


select * 
from view_qna_info
where 1=1 
and ( fk_userid like 'kimjy'  or prod_title like '%' || '클래식' || '%' )
and category = '1';
-- 5개

select *
from view_qna_info
where 1=1 
and ( fk_userid like 'kimjy'  or prod_title like '%' || 'kimjy' || '%' )
and category = '1';
-- 5개

select *
from view_qna_info
where 1=1 
and ( fk_userid like '클래식'  or prod_title like '%' || '클래식' || '%' )
and category = '1';
-- 3개

select *
from(
    select rownum as rno, qna_id, fk_userid, name, category, qna_cate_name, subject, content, readcount, regDate, secret, adminread, adminans, status, groupno, fk_seq, depthno
          ,fk_rev_id, prod_id, rev_email, prod_img, prod_title
    from view_qna_info
    where status = 1
    and ( lower(fk_userid) like lower('%%')  or lower(prod_title) like '%' ||  '%' )
    --and category = '1'
    order by qna_id desc
)T
where rno between  1 and 5;
-- qna List 페이징처리


----------------------------------- 공지 게시판 테이블 -----------------------------------



drop table yes_notice purge;

create table yes_notice
(notice_id      number                not null   -- 글번호
,fk_userid      varchar2(20)          not null   -- 사용자ID
--,name           Nvarchar2(20)         not null   -- 글쓴이
,category       varchar2(20)          not null   -- 카테고리
,ticketopenday  varchar2(100)         default null
,subject        Nvarchar2(200)        not null   -- 글제목
,content        Nvarchar2(2000)       default '공지사항입니다.'       not null   -- 글내용    -- clob
,pw             varchar2(20)          default '1234' not null   -- 글암호
,readCount      number default 0      not null   -- 글조회수
,regDate        date default sysdate  not null   -- 글쓴시간
,status         number(1) default 1   not null   -- 글삭제여부  1:사용가능한글,  0:삭제된글 
,fileName       varchar2(255)                    -- WAS(톰캣)에 저장될 파일명(20190725092715353243254235235234.png)                                       
,orgFilename    varchar2(255)                    -- 진짜 파일명(강아지.png)  // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명 
,fileSize       number                           -- 파일크기  
,constraint  PK_notice_id primary key(notice_id)
,constraint  FK_notice_fk_userid foreign key(fk_userid) references yes_member(userid)
,constraint  FK_notice_category foreign key(category) references yes_notice_cate(no_cate_code)
,constraint  CK_notice_status check( status in(0,1) )
);

select *
from yes_review;


drop sequence noticeSeq;

create sequence noticeSeq
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;

select * 
from yes_notice_cate;

delete from yes_notice;

select notice_id,fk_userid,no_cate_name,category,ticketopenday,subject,content,pw,readCount,regDate,status,fileName,orgFilename,fileSize
from yes_notice N join yes_notice_cate C
on N.category = C.no_cate_code;

select * from yes_notice
order by notice_id desc;

select ticketopenday from yes_notice;

select notice_id,fk_userid,no_cate_name,category,ticketopenday,subject,readCount,regDate,status,fileName,orgFilename,fileSize
from yes_notice N join yes_notice_cate C
on N.category = C.no_cate_code
order by notice_id;

insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
values(noticeSeq.nextval, 'admin', '4', default, '[공지] 고객센터 이용 안내', '안녕하세요. 예스24 입니다.<br/>
금일 예스24 공연 고객센터로의 전화문의량이 많아 연결이 지연되고 있습니다.<br/>
양해 부탁드리며, 문의하실 내용이 있으신 고객님께서는 일대일문의를 이용해주시기 바랍니다.<br/>
불편드려 죄송합니다.', sysdate-300);

insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
values(noticeSeq.nextval, 'admin', '1', '2019.11.27(수) 오후 2:00', '허각 콘서트〈공연각〉- 부산 티켓오픈안내', '오랜만입니다.<br/>
공연하는 남자, 허각 입니다<br/>
캐스팅<br/><br/>허각', '2019-10-21');

insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
values(noticeSeq.nextval, 'admin', '1', '2019.12.02(월) 오후 18:00', '2019 임한별 연말 단독 콘서트〈Agit〉티켓오픈안내', '[공연소개]<br/>임한별, 데뷔 후 첫 단독 콘서트<br/>
임한별은 지난해부터 ‘이별하러 가는 길’, ‘사랑 이딴 거’, ‘오월의 어느 봄날’ 등의 곡을 잇따라 발매하며 특유의 미성과 폭발적인 가창력을 선보여 대중들의 사랑을 받는 음원강자로 등극했다.<br/>
또한 EXO-CBX(첸백시), 슈퍼주니어, NCT DREAM, 오마이걸, V.O.S. 등 여러 아티스트 앨범의 작사, 작곡을 비롯하여 ‘동백꽃 필 무렵’ OST에서 본인이 가창한 "꽃처럼 예쁜 그대"의 작사, 작곡도 직접 참여해 실력을 입증하며 프로듀서, 창작자로서 다양한 활약을 펼치고 있다.<br/>
이번 단독 콘서트의 주제는 "AGIT"이며, 임한별의 개인공간인 아지트에서 관객들과 함께 음악을 즐기고 소통하는 특별한 시간을 갖겠다는 의미로 준비되었다. 비밀스러운 주제처럼 그 동안 임한별이 하지 못했던 이야기를 들려주고, 솔로 데뷔 이후 갖는 첫 단독 콘서트인 만큼 오랜 시간 자신과 함께 해온 팬들을 위한 임한별의 대표 곡들과 함께 다양한 커버 무대를 라이브로 선보일 예정이다.<br/>
또한 임한별의 감미로운 보이스와 재치 있는 입담으로 추운 겨울 팬들의 마음을 녹여줄 따뜻한 시간을 선사할 것으로 기대된다.<br/>
2019년 12월, 그만의 색깔을 가득 채운 콘서트 무대로 여러분들과 함께하고 싶습니다.<br/><br/>
[출연진]<br/>임한별<br/>', '2019-10-26');

insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
values(noticeSeq.nextval, 'admin', '1', '2019.11.26(화) 오후 16:00', '2019 팬텀 오브 클래식 - 부산 티켓오픈 안내', '공연소개<br/>
팬텀싱어를 대표하는 세 팀 - 포르테 디 콰트로, 포레스텔라, 미라클라스!<br/>
한 해를 마무리하는 최고의 감동, 크로스오버의 진면목을 만날 수 있는 <br/>
2019 최고의 음악회가 준비된다.<br/>
팬텀싱어 초대 우승팀이자, 남성 사중창의 힘과 단단한 하모니를 들려주는 ‘포르테 디 콰트로’, <br/>
정교한 하모니와 다이나믹을 모두 겸비한, 팬텀싱어2 우승팀 ‘포레스텔라’,<br/>
클래시컬한 보이스로 풍부하면서도 균형잡힌 밸런스가 감동을 자아내는, 기적의 하모니 ‘미라클라스’ <br/>
2019년 연말! 코리아쿱오케스트라와 함께 세 팀의 대표곡과 특별한 명곡들까지, 노래가 주는 최고의 감동으로 한 해를 마무리하시기 바랍니다. <br/><br/>
캐스팅<br/>포르테 디 콰트로<br/>포레스텔라<br/>미라클라스', '2019-10-28');


begin
    for i in 1..10 loop 
        insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
        values(noticeSeq.nextval, 'admin', '1', to_char(sysdate-240+i, 'yyyy.mm.dd') || '(' || to_char(sysdate-240+i,'dy') ||') 오후 2:00', '허각 콘서트〈컴백공연각>'||i||'차 오픈', '오랜만입니다.<br/>
        공연하는 남자, 허각 입니다<br/>
        캐스팅<br/><br/>허각', sysdate - 260+i);
    end loop;
end;

begin
    for i in 1..10 loop 
        insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
        values(noticeSeq.nextval, 'admin', '1', to_char(sysdate-230+i, 'yyyy.mm.dd') || '(' || to_char(sysdate-230+i,'dy') ||') 오후 5:00', '연극 [히스토리 보이즈] '||i||'차 티켓 오픈 안내', 
        '공연 소개<br/>[시놉시스]<br/>
        1980년대 초 영국 북부지방의 한 공립 고등학교 대학입시 준비반. 똑똑하지만 장난기 넘치는 8명의 남학생들이 옥스퍼드와 캠브리지에 입학하기 위해 학업에 몰두하고 있다. <br/>
        시험과는 무관한, "인생을 위한 수업"을 하는 낭만적인 문학 교사 헥터와 학교생활을 하던 이들 앞에, 오로지 시험 성적을 올리기 위해 고용된 젊고 비판적인 옥스퍼드 출신 역사교사 어윈이 등장한다. <br/>
        가르치는 방식이 전혀 다른 두 선생님 사이에서 학생들은 그들 나름의 기준을 찾으려 노력한다. 한 편, 평소 헥터를 못마땅해하던 교장은 헥터에게 퇴교를 권하고, 어윈은 학생들과의 예상치 못한 관계 속에서 흔들리기 시작한다. <br/>
        인생의 출발점에 선 학생들과 삶의 큰 전환점을 맞이한 선생님들. 이들의 역사는 과연 어떤 기록으로 남게 될까?<br/><br/>
        [캐스팅]<br/>헥터 │ 오대석 조영규<br/>어윈│ 박정복 안재영<br/>린톳 │ 양소민 이지현<br/>교장│ 견민성', sysdate - 250+i);
    end loop;
end;

insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
values(noticeSeq.nextval, 'admin', '3', default, '2020 태사자 콘서트［THE RETURN］좌석거리 두기 관련 안내', 
'본 공연은 5월 13일 질병관리본부, 문화체육관광부에서 발표한 지침에 의거하여 콘서트도 거리두기 좌석제(지그재그 띄어 앉기) 시행이 의무화되어, 현재 1일 1회 공연을 1일 2회 공연으로 분리해서 진행하게 되었습니다. 기존 관람객 분들의 많은 양해와 이해를 부탁드립니다.<br/>
<상세 안내><br/>
- 공연 시간 변경 : 토일 모두 1회차(14:00) ㅣ 2회차(19:30) 좌석 분리 진행 <br/>
- 좌우앞뒤 좌석을 한 칸씩 지그재그로 떨어져서 착석 <br/>
  ( 변경 좌석배치도 확인 ☞ http://naver.me/5Efpdweb )<br/>
- 해당 회차에 관람이 불가한 분들은 아래 이메일로 문의 접수 하시면 교차 관람이 가능하도록 안내 도와드리겠습니다. 단, 같은 요일 공연만 교차 관람이 가능하며 2층 잔여석에 한해서 변경 가능합니다. <br/>
- 2층 연석 예매자의 경우, 불가피하게 1회차/2회차로 분리되어야 하지만, 문의하시는 분에 한해서 일행끼리 같은 회차에 최대한 가깝게 관람 가능하시도록 안내 협력하겠습니다. <br/>
- 교차 관람 mail 문의 :  주관사 비에프케이 info@bforest.kr <br/>
- 문의 기간 :  공지 이후 ~ 7월 23일까지 <br/>
- 작성 내용 :  예스24 ID / 예매자 성함 / 휴대전화번호 / 예매 좌석 (00층 00구역 00열 00번)', '2019-12-25');


insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
values(noticeSeq.nextval, 'admin', '2', default, '[점검] 시스템 점검으로 인한 로그인 불가 안내 (1/9 02:00~06:00)', 
'안녕하세요. 예스24 공연입니다.<br/>보다 나은 서비스를 제공해드리기 위해 아래와 같이 시스템 점검을 실시하오니,<br/>이용에 착오 없으시기 바랍니다.<br/>
------------------아 래--------------------------------------------------<br/>
1. 작업시간 : 2020년 1월 8일(일) 02:00 ~ 06:00 (4시간)<br/>
2. 작업내용 : 시스템 점검<br/>
3. 작업영향 : 로그인 불가(예매/취소 및 MY공연 이용 불가),
                         예스24 결제수단 사용 불가(YES머니/YES상품권 등)<br/>
-------------------------------------------------------------------------<br/>
이용에 불편을 드려 대단히 죄송합니다.<br/>항상 안정적인 서비스 제공을 위해 최선의 노력을 다할 것을 약속 드립니다.<br/>감사합니다.', '2020-01-08');

begin
    for i in 1..10 loop 
        insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
        values(noticeSeq.nextval, 'admin', '1', to_char(sysdate-180+i, 'yyyy.mm.dd') || '(' || to_char(sysdate-180+i,'dy') ||') 오후 4:00', '그랜드 민트 페스티벌 2020 - 공식 '||i||'차 티켓 오픈 안내', 
        '공연 소개<br/>[시놉시스]<br/>
        공연 제목 : 그랜드 민트 페스티벌 2020 - 공식 티켓<br/>
        공연 일시 : 2020년 02월 14일(금) ~ 02월 23일(일)<br/>
        공연 장소 : 올림픽공원 내<br/>
        티켓 가격 : 1일권 99,000원 / 10일권 158,000원(양일간 관람)', sysdate - 200+i);
    end loop;
end;


insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
values(noticeSeq.nextval, 'admin', '2', default, '[점검] 시스템 점검으로 인한 로그인 불가 안내 (3/1 02:00~06:00)', 
'안녕하세요. 예스24 공연입니다.<br/>보다 나은 서비스를 제공해드리기 위해 아래와 같이 시스템 점검을 실시하오니,<br/>이용에 착오 없으시기 바랍니다.<br/>
------------------아 래--------------------------------------------------<br/>
1. 작업시간 : 2020년 3월 1일(일) 02:00 ~ 06:00 (4시간)<br/>
2. 작업내용 : 시스템 점검<br/>
3. 작업영향 : 로그인 불가(예매/취소 및 MY공연 이용 불가),
                         예스24 결제수단 사용 불가(YES머니/YES상품권 등)<br/>
-------------------------------------------------------------------------<br/>
이용에 불편을 드려 대단히 죄송합니다.<br/>항상 안정적인 서비스 제공을 위해 최선의 노력을 다할 것을 약속 드립니다.<br/>감사합니다.', '2020-02-27');

insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
values(noticeSeq.nextval, 'admin', '4', default, '[공지] 고객센터 이용 안내', '안녕하세요. 예스24 입니다.<br/>
금일 예스24 공연 고객센터로의 전화문의량이 많아 연결이 지연되고 있습니다.<br/>
양해 부탁드리며, 문의하실 내용이 있으신 고객님께서는 일대일문의를 이용해주시기 바랍니다.<br/>
불편드려 죄송합니다.', '2020-03-27');

begin
    for i in 1..10 loop 
        insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
        values(noticeSeq.nextval, 'admin', '3', default, '뮤지컬 레베카 - 공식 '||i||'차 티켓 취소 안내', 
        '안녕하세요. 뮤지컬 <레베카> - 인천 공연 주최·주관사 인천문화예술회관, (주)하늘이엔티, (주)공연마루 입니다. <br/>
        먼저 뮤지컬〈레베카〉 공연을 기다려주신 많은 분들께 진심으로 사과의 말씀드립니다. <br/>
        최근 산발적으로 지역 내 코로나-19 재 확산이 이루어지며, 지역사회 확산세가 계속됨에 따라, 확진자가 다시 증가세를 보여 2차 확산이 우려되는 상황으로 추가적 확산을 방지하고, 관객 및 아티스트 보호 차원에서 불가피하게 본 일정을 취소하기로 결정하게 되었습니다. <br/>
        본 공연을 기다려 주셨던 관객 여러분, 그리고 한차례 연기됨으로 인해 예약 회차 변경의 수고를 마다하지 않고 공연을 예매해 주셨던 관객 여러분께 다시 한번 머리 숙여 사과의 말씀을 드립니다. <br/>
        예매 티켓은 결제금액 전액 환불 조치되며, 환불 절차에 불편함이 없도록 최선을 다하겠습니다. ', sysdate - 130+i);
    end loop;
end;


begin
    for i in 1..10 loop 
        insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
        values(noticeSeq.nextval, 'admin', '3', default, '뮤지컬 투란도트 - 공식 '||i||'차 티켓 취소 안내', 
        '안녕하세요. 뮤지컬 <투란도트> - 인천 공연 주최·주관사 인천문화예술회관, (주)하늘이엔티, (주)공연마루 입니다. <br/>
        먼저 뮤지컬〈투란도트〉 공연을 기다려주신 많은 분들께 진심으로 사과의 말씀드립니다. <br/>
        최근 산발적으로 지역 내 코로나-19 재 확산이 이루어지며, 지역사회 확산세가 계속됨에 따라, 확진자가 다시 증가세를 보여 2차 확산이 우려되는 상황으로 추가적 확산을 방지하고, 관객 및 아티스트 보호 차원에서 불가피하게 본 일정을 취소하기로 결정하게 되었습니다. <br/>
        본 공연을 기다려 주셨던 관객 여러분, 그리고 한차례 연기됨으로 인해 예약 회차 변경의 수고를 마다하지 않고 공연을 예매해 주셨던 관객 여러분께 다시 한번 머리 숙여 사과의 말씀을 드립니다. <br/>
        예매 티켓은 결제금액 전액 환불 조치되며, 환불 절차에 불편함이 없도록 최선을 다하겠습니다. ', sysdate - 100+5*i);
    end loop;
end;

insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
values(noticeSeq.nextval, 'admin', '1', '2020.07.27(월) 오후 2:00', '팬텀싱어3 콘서트 - 서울 추가회차 티켓오픈 안내', '공연소개<br/>
팬텀싱어3 부산공연에 보여주신 많은 분들의 사랑과 관심에 진심으로 감사 드리며,<br/>
여러분의 뜨거운 성원과 요청에 힘입어 더 많은 분들과 함께 하고자 8월 30일(일) 공연을 추가 진행하게 되었습니다. 감사합니다.<br/><br/>
<추가 공연 안내><br/>
※ 추가 회차 공연 일정: 2020년 8월 30일(일) 오후 5시<br/>
※ 추가 회차 공연 티켓오픈 일정: 2020년 7월 27일(월) 오후 2시<br/><br/>
공 연 명: 팬텀싱어3 콘서트 - 서울<br/>
공연일자: 2020년 8월 29일(토) ~ 30일(일)<br/>
공연시간: 토요일 오후 6시 / 일요일 오후 5시<br/>
공연장소: 벡스코 제1전시장 1홀<br/>
티켓가격: R석 121,000원 / S석 110,000원<br/>
관람등급: 만 7세 이상 관람가<br/>
관람시간: 약 150분(인터미션 없음)<br/>
매수제한: 회차당 1인 최대 4매', '2020-07-01');


insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
values(noticeSeq.nextval, 'admin', '1', '2020.07.28(화) 오후 14:00', '2020 임한별 연말 단독 콘서트〈2nd〉티켓오픈안내', '[공연소개]<br/>임한별, 두번째 콘서트<br/>
임한별은 지난해부터 ‘이별하러 가는 길’, ‘사랑 이딴 거’, ‘오월의 어느 봄날’ 등의 곡을 잇따라 발매하며 특유의 미성과 폭발적인 가창력을 선보여 대중들의 사랑을 받는 음원강자로 등극했다.<br/>
또한 EXO-CBX(첸백시), 슈퍼주니어, NCT DREAM, 오마이걸, V.O.S. 등 여러 아티스트 앨범의 작사, 작곡을 비롯하여 ‘동백꽃 필 무렵’ OST에서 본인이 가창한 "꽃처럼 예쁜 그대"의 작사, 작곡도 직접 참여해 실력을 입증하며 프로듀서, 창작자로서 다양한 활약을 펼치고 있다.<br/>
이번 단독 콘서트의 주제는 "AGIT"이며, 임한별의 개인공간인 아지트에서 관객들과 함께 음악을 즐기고 소통하는 특별한 시간을 갖겠다는 의미로 준비되었다. 비밀스러운 주제처럼 그 동안 임한별이 하지 못했던 이야기를 들려주고, 솔로 데뷔 이후 갖는 첫 단독 콘서트인 만큼 오랜 시간 자신과 함께 해온 팬들을 위한 임한별의 대표 곡들과 함께 다양한 커버 무대를 라이브로 선보일 예정이다.<br/>
또한 임한별의 감미로운 보이스와 재치 있는 입담으로 추운 겨울 팬들의 마음을 녹여줄 따뜻한 시간을 선사할 것으로 기대된다.<br/>
2020년 12월, 그만의 색깔을 가득 채운 콘서트 무대로 여러분들과 함께하고 싶습니다.<br/><br/>
[출연진]<br/>임한별<br/>', '2020-07-13');


begin
    for i in 1..100 loop 
        insert into yes_notice(notice_id,fk_userid,category,ticketopenday,subject,content,regDate)
        values(noticeSeq.nextval, 'admin', '3', default, '뮤지컬 투란도트2 - 공식 '||i||'차 티켓 취소 안내', 
        '안녕하세요. 뮤지컬 <투란도트> - 인천 공연 주최·주관사 인천문화예술회관, (주)하늘이엔티, (주)공연마루 입니다. <br/>
        먼저 뮤지컬〈투란도트〉 공연을 기다려주신 많은 분들께 진심으로 사과의 말씀드립니다. <br/>
        최근 산발적으로 지역 내 코로나-19 재 확산이 이루어지며, 지역사회 확산세가 계속됨에 따라, 확진자가 다시 증가세를 보여 2차 확산이 우려되는 상황으로 추가적 확산을 방지하고, 관객 및 아티스트 보호 차원에서 불가피하게 본 일정을 취소하기로 결정하게 되었습니다. <br/>
        본 공연을 기다려 주셨던 관객 여러분, 그리고 한차례 연기됨으로 인해 예약 회차 변경의 수고를 마다하지 않고 공연을 예매해 주셨던 관객 여러분께 다시 한번 머리 숙여 사과의 말씀을 드립니다. <br/>
        예매 티켓은 결제금액 전액 환불 조치되며, 환불 절차에 불편함이 없도록 최선을 다하겠습니다. ', sysdate - 15);
    end loop;
end;


commit;

select sysdate - 20 from dual;
select to_char(sysdate-130, 'dy') from dual;
select sysdate - 130+10 from dual;
select to_char(sysdate-130+10, 'dy') from dual;


select to_char(to_date('2020-03-01'), 'dy') from dual;

select notice_id,fk_userid,no_cate_name,category,ticketopenday,subject,readCount,regDate,status,fileName,orgFilename,fileSize
from yes_notice N join yes_notice_cate C
on N.category = C.no_cate_code
order by notice_id;

select count(*) 
from yes_notice;
-- 총 공지글 개수

select count(*) 
from yes_notice
where 1=1 and subject like '%오픈%';
-- 검색어가 있는 총 공지글 개수

select count(*) 
from yes_notice
where category='1';
-- 카테고리별 총 공지글 개수



select notice_id, fk_userid,no_cate_name,category,ticketopenday,subject,readCount,regDate,status,fileName,orgFilename,fileSize
    from
    (
        select row_number() over(order by notice_id desc) AS rno, notice_id,fk_userid,no_cate_name,category,ticketopenday,subject,readCount,regDate,status,fileName,orgFilename,fileSize
        from
        (
            select notice_id,fk_userid,no_cate_name,category,ticketopenday,subject,readCount,regDate,status,fileName,orgFilename,fileSize
            from yes_notice N join yes_notice_cate C
            on N.category = C.no_cate_code
        )
        where status = 1 and subject like '%%'
    )V
where rno between 1 and 10;


----------------------------------- FAQ 카테고리 테이블 -----------------------------------


drop table yes_faq_cate purge;

create table yes_faq_cate
(faq_cate_id     number(8)     not null  -- 카테고리 대분류 번호
,faq_cate_code   varchar2(20)  not null  -- 카테고리 코드
,faq_cate_name   varchar2(100) not null  -- 카테고리명
,constraint PK_faq_cate_cnum primary key(faq_cate_id)
,constraint UQ_faq_cate_code unique(faq_cate_code)
);

drop sequence faqCateSeq;

create sequence faqCateSeq
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;


insert into yes_faq_cate values(faqCateSeq.nextval, '1', '예매/결제');
insert into yes_faq_cate values(faqCateSeq.nextval, '2', '취소/환불');
insert into yes_faq_cate values(faqCateSeq.nextval, '3', '티켓수령');
insert into yes_faq_cate values(faqCateSeq.nextval, '4', '기타');
commit;

select * 
from yes_faq_cate;


----------------------------------- 고객센터질문(FAQ) 테이블 -----------------------------------

drop table yes_faq purge;

create table yes_faq
(faq_id         number                not null   -- 글번호
,fk_userid      varchar2(20)          not null   -- 사용자ID
,fk_category    varchar2(20)          not null   -- 카테고리  
,subject        Nvarchar2(200)        not null   -- 글제목
,content        Nvarchar2(2000)       not null   -- 글내용    -- clob
,regDate        date default sysdate  not null   -- 글쓴시간
,status         number(1) default 1   not null   -- 글삭제여부  1:사용가능한글,  0:삭제된글 
,constraint  PK_faq_id primary key(faq_id)
,constraint  FK_faq_fk_userid foreign key(fk_userid) references yes_member(userid)
,constraint  FK_faq_fk_category foreign key(fk_category) references yes_faq_cate(faq_cate_code)
,constraint  CK_faq_status check( status in(0,1) )
);


drop sequence faqSeq;

create sequence faqSeq
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;

insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '1', '비회원도 공연 예매를 할 수 있나요?', '비회원 및 간편 가입 회원은 예매를 하실 수가 없습니다. <br/>
예매 서비스 이용을 위해서는 휴대폰 또는 I-PIN 본인 인증을 해주시기 바랍니다. ');
insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '1', '법인회원도 공연 예매를 할 수 있나요?', '법인회원도 공연예매 가능합니다. <br/>
현장에서 티켓 수령을 위해 사업자등록증 사본, 명함 또는 사원증, 예매내역서, 신분증 등을 지참해주시기 바랍니다. ');
insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '2', '환불 계좌 정보를 잘못 입력해서 환불 받지 못했어요!', '환불 계좌 정보를 잘못 입력하여 환불이 되지 않은 경우 환불 계좌 수정이 가능합니다. <br/>
MY티켓>예매확인/취소>결제내역 의 환불진행상태에서 [수정] 버튼을 클릭하시어 환불 계좌 정보를 입력해주세요. <br/>
단, PC 에서만, 평일 오전 10시 ~ 오후 3시 에 가능합니다. <br/>');
insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '4', '예매한 이후 회원정보를 변경했어요. 예매 정보에도 자동으로 반경되나요?', '아닙니다. 회원 정보 수정 후 기존 로그인 상태를 유지할 경우 변경된 회원 정보는 예매 정보에 반영이 되지 않습니다. <br/>
번거로우시겠지만 반드시 로그아웃 후 재 로그인을 하셔야 반영되므로, 최신 회원 정보 반영을 위해서는 재로그인해주시기 바랍니다. <br/>');
insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '3', '결제수단을 여러 개 이용하여 예매한 경우 취소는 어떻게 하나요?', '결제수단을 여러 개 이용하여 예매한 경우 취소는 어떻게 하나요? <br/>
여러 결제 수단을 이용 해 예매한 경우 부분 취소는 불가하며, 전체 취소만 가능합니다. <br/>
부분 취소를 원하시는 경우 고객센터(T.1544-6399)로 문의해주시기 바랍니다. <br/>
단, 취소 마감 시간 전까지만 가능합니다.');
insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '3', '예매 취소는 언제까지 할 수 있나요?', '예매 취소는 취소 마감 시간까지만 가능하며, 취소 일자에 따라 수수료가 부과됩니다. <br/>
<span style="color: red;">[예매취소 마감일]</span> <br/>
* 공연관람일이 일요일~월요일 → 토요일 오전 11시<br/>
* 공연관람일이 화요일~토요일 → 전날 오후 5시<br/>
* 공연관람일이 공휴일 및 공휴일 다음날<br/>
  → 공휴일 전날이 평일인 경우 오후 5시 <br/>
  → 공휴일 전날이 토요일, 일요일인 경우 토요일 오전 11시<br/>
  → 공휴일이 긴 경우에는 공휴일 첫날 기준 (평일 - 오후 5시 이전 / 일, 월 - 오전 11시 이전)<br/><br/>
단, 각 상품 정책에 따라 취소 마감 시간이 다를 수 있으며, 이 경우 해당 상품 정책이 우선 적용되오니 예매 시 상품 상세 정보 내 안내 사항을 참고해주시기 바랍니다.');

insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '3', '예매취소시 취소수수료가 부과되나요?', '취소 일자에 따라 취소수수료가 다르게 부과됩니다. ');

insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '3', '배송 받은 티켓을 취소하고 싶습니다.', '배송 받은 티켓은 웹/모바일 취소가 불가하며, 취소 마감 시간 전까지 예스24 고객센터로 반송되어야 취소 가능합니다. <br/>
단, 고객센터 운영시간에 한하며, 티켓이 고객센터에 도착한 날짜를 기준으로 취소수수료가 적용됩니다. <br/>');

insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '3', '공연 관람 당일 취소가 가능한가요 ?', '기본적으로 <span style="color: red;">공연 관람 당일 취소는 불가</span>합니다. <br/>
(관람일 당일 취소가 가능한 일부 공연의 경우 티켓 금액의 90%가 취소수수료로 부과됩니다.) <br/>
공연의 특성에 따라 취소마감시간/취소수수료 정책이 달라질 수 있으니 예매 시 반드시 각 공연 상세 정보를 확인해주시기 바랍니다.<br/>');

insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '3', '예매 취소 시 환불은 어떻게 받나요?', '결제 수단에 따라 아래의 방법과 같이 환불 됩니다.<br/>
신용카드<br/>- 일반적으로 취소완료 4~5일(토, 공휴일 제외) 후 카드 승인 취소가 확인됩니다.<br/>
무통장입금<br/>- 예매 취소 시 반드시 환불 받으실 은행명과 계좌번호를 입력해주세요.<br/>
YES상품권<br/>- 정상적으로 예매를 취소하는 경우 취소 시 바로 복원됩니다.<br/>
YES머니, 예치금<br/>- 정상적으로 예매를 취소하는 경우 취소 시 바로 복원됩니다.<br/>
쿠폰<br/>- 예매 취소시 쿠폰은 자동 복원됩니다.(쿠폰 사용 기간이 종료된 경우 복원되지 않습니다.)<br/>
* 단, 쿠폰에 따라 복원되지 않는 경우도 있으니 쿠폰 유의사항을 확인해주시기 바랍니다.');


insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '1', '공연 예매 시 몇 장까지 예매할 수 있나요?', '일반적으로 1회 예매 시 최대 10장까지 예매 가능합니다. <br/>
단, 공연에 따라 ID당 또는 회차당 예매 매수 제한이 있을 수 있으니, 각 상품 상세 정보를 확인해주시기 바랍니다.');

insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '1', '예매한 티켓의 관람일시 또는 좌석을 변경할 수 있나요?', '예매 건의 날짜, 시간, 좌석 등의 일부 변경을 원하실 경우 재예매 하신 후 기존 예매를 취소해주셔야 합니다. <br/>
단, 취소 마감시간 전까지만 가능하며, 취소 시점에 따라 예매수수료가 환불되지 않으며 취소수수료가 부과될 수있습니다. <br/>
* 재예매하시고 결제 완료 후 기존 예매 건의 취소 마감 시간 내에 고객센터(1544-6399)로 전화주시면 동일한 공연, 1회에 한해 100% 취소처리 해드립니다.');

insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '1', '공연 예매 시에도 YES포인트 적립이 되나요?', '일반적으로 공연 예매 시에는 YES포인트가 적립되지 않습니다. <br/> 
(간혹 이벤트 진행 시 특정 기간 동안 일부 상품에 한해 적립되는 경우가 있으며, 이 경우 YES포인트 적립 상품은 해당 상품 상세 정보에 별도 표기됩니다.) ');

insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '1', '예매(예약) 건의 결제 수단을 변경할 수 있나요?', ' "무통장입금"을 선택하여 예매한 경우 입금 완료 전 신용카드로 결제 수단을 변경할 수 있습니다. <br/>
PC>MY공연>예매확인/취소 상세에서 직접 변경하시거나 <br/>
고객센터 전화(1544-6399) 또는 일대일문의를 남겨주시면 처리 가능합니다. <br/>
단, 신용카드로 결제한 경우 다른 카드로 변경 또는 할부 개월 수 변경 등은 하실 수 없으니 카드 결제 시 유의해 주시기 바랍니다. ');


insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '4', '본인인증된 ID 로만 예매할 수 있나요?', '<span style="color: red;">공연 예매는 본인 인증된 ID로만 예매 가능합니다. </span><br/>
비회원 또는 간편 가입 회원 예매는 불가하오니, 예매 전 휴대폰 또는 I-PIN 으로 본인 인증을 하신 후 재로그인 해주시기 바랍니다.');

insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '4', 'YES마니아에게는 어떤 공연 예매 혜택이 있나요?', '매월 예매수수료 면제쿠폰 1장이 지급되며, 일부 공연에 한해 YES마니아 전용 할인이 제공됩니다.');

insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '2', '티켓 수령 방법은 어떤 것이 있나요?', '[현장수령]<br/>- 공연 관람 당일 공연장에서 예매 내역 확인 후 티켓을 수령하실 수 있습니다.><br/>
- 티켓 수령을 위해 예매자 본인 신분증과 예매내역서를 지참해주시기 바랍니다. <br/><br/>[배송]<br/>- 예매완료(결제익일) 기준 5~7일 이내에 배송됩니다. (주말, 공휴일 제외한 영업일 기준) <br/>
- 배송료는 2,800원이며 공연일 14일 전 예매 건에 한해 배송 접수 가능합니다. <br/>');

insert into yes_faq(faq_id, fk_userid, fk_category, subject, content)
values(faqSeq.nextval, 'admin', '2', '배송지 정보를 변경할 수 있나요?', '티켓 배송이 시작되기 전(발송대기 상태)에는 MY티켓>예매상세내역 에서 직접 변경할 수 있습니다. <br/>
배송이 시작된 이후에는 고객님께서 직접 배송 업체로 문의 및 변경 요청해주셔야 하며, <br/>
경우에 따라 배송지 변경이 불가할 수 있습니다. <br/>');

commit;


select faq_id, fk_userid, subject, content, regDate, status, faq_cate_name
from(
select rownum as rno, faq_id, fk_userid, subject, content, regDate, status, faq_cate_name
from 
(
    select faq_id, fk_userid, C.faq_cate_name, fk_category, subject, content, regDate, status
    from yes_faq F join yes_faq_cate C
    on F.fk_category = C.faq_cate_code
) T
where 1=1 
and fk_category = 2 
and subject like '%' ||  '%'
) V
where rno between 1 and 5;


----------------------------------- 리뷰 테이블 -----------------------------------
drop table yes_review purge;
create table yes_review
(review_id     number               not null   -- 리뷰번호
,fk_userid     varchar2(20)         not null   -- 사용자ID
,name          varchar2(20)         not null   -- 성명
,content       varchar2(1000)       not null   -- 리뷰내용
,star          number(1) default 5  not null   -- 별점
,regDate       date default sysdate not null   -- 작성일자
,parentProdId  number               not null   -- 원게시물 글번호(공연ID)
--,fk_rev_status number default 0     not null   -- 예매상태
--,fk_rev_date   date                            -- 예매일자
,status        number(1) default 1  not null   -- 글삭제여부
                                               -- 1 : 사용가능한 글,  0 : 삭제된 글
                                               -- 댓글은 원글이 삭제되면 자동적으로 삭제되어야 한다.
,constraint PK_review_id primary key(review_id)
,constraint FK_review_fk_userid foreign key(fk_userid)
                                references yes_member(userid)
,constraint FK_review_parentProdId foreign key(parentProdId) 
                                   references prod(prod_id) on delete cascade
--,constraint FK_review_fk_rev_date foreign key(fk_rev_date)
--                               references yes_reserve(rev_date)
,constraint CK_review_star check( star in (1,2,3,4,5) )
,constraint CK_review_status check( status in(1,0) ) 
);


select parentProdId
from yes_review;




drop sequence reviewSeq;

create sequence reviewSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


select *
from yes_review;


----------------------------------- 리뷰 테이블 -----------------------------------


drop table like_review purge;

create table like_review
(seq          number          not null    -- 시퀀스
,fk_userid          varchar2(20)	not null    -- 사용자ID
,fk_parentReviewId  number          not null    -- 리뷰ID
,fk_parentProdId    number          not null    -- 공연ID
,constraint	PK_like_rev primary key(fk_userid, fk_parentReviewId) -- 복합 primary key
,constraint FK_like_rev_userid foreign key(fk_userid) references yes_member(userid)
,constraint FK_like_rev_parentReviewId foreign key(fk_parentReviewId) references yes_review(review_id)
,constraint FK_like_rev_parentProdId foreign key(fk_parentProdId) references prod(prod_id) on delete cascade
);

drop sequence likeReviewSeq;

create sequence likeReviewSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;



----------------------------------- 관심공연 테이블 -----------------------------------


drop table like_prod purge;

create table like_prod
(seq                number          not null    -- 시퀀스
,fk_userid          varchar2(20)	not null    -- 사용자ID
,fk_parentProdId    number          not null    -- 공연ID
,constraint FK_like_prod_fk_userid foreign key(fk_userid) references yes_member(userid)
,constraint FK_like_prod_fk_parentProdId foreign key(fk_parentProdId) references prod(prod_id) on delete cascade
);

drop sequence likeProdSeq;

create sequence likeProdSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;



select count(*)
from like_prod
where fk_parentProdId = 1 and fk_userid = 'kkimsg93';
-- 관심상품 중복확인

select prod_id, prod_img, prod_detail_img, prod_title, info_open_date, info_close_date, info_grade, info_run_time
    , map_name, map_address, local 
from view_detail_prod;

select fk_userid, prod_id, prod_img, prod_detail_img, prod_title, info_open_date, info_close_date, info_grade, info_run_time
    , map_name, map_address, local 
from like_prod L join view_detail_prod D
on L.fk_parentProdId = D.prod_id;
-- 관심상품정보


select *
from(
select fk_userid, prod_id, prod_img, prod_detail_img, prod_title, info_open_date, info_close_date, info_grade, info_run_time
    , map_name, map_address, local 
from like_prod L join view_detail_prod D
on L.fk_parentProdId = D.prod_id
)T
where fk_userid = 'kkimsg93';
-- kkimsg93 의 관심상품목록 조회

insert into  like_prod (seq, fk_userid, fk_parentProdId)
values (likeProdSeq.nextval, 'leess', 1);

delete from like_prod;
commit;

select count(*)
		from like_prod
		where fk_parentProdId = 1
	
-- 해당상품의 관심상품 수 --	
	
-- 해당상품의 관심상품 누른 사람 목록 --
		select fk_userid
		from like_prod
		where fk_parentProdId = 1


drop view view_seat_info;
create or replace view view_seat_info
AS
select S.seattype_id, S.seat_name, S.seat_status, T.prod_id, T.seat_type, T.seat_price, S.date_id, T.seat_color
from yes_show_seat S
join yes_seat_type T
on S.seattype_id = T.seattype_id;

select *
from yes_seat_type



select date_id, prod_id, seattype_id, seat_type, seat_name, seat_price, seat_status
from view_seat_info
where prod_id = 1;

select date_id
from yes_show_date
where prod_id=1 and to_char(date_showday, 'yy/mm/dd') || ' ' || to_char(date_showday, 'day')='20/09/01 화요일' and date_showtime = '1회차 9시';

select *
from yes_show_date
where prod_id=1 and to_char(date_showday, 'yy/mm/dd') || ' ' || to_char(date_showday, 'day')='20/10/01 목요일' and date_showtime = '1회차 9시';

select date_id, prod_id, seattype_id, seat_type, seat_name, seat_price, seat_status, date_id, seat_color
from view_seat_info
where prod_id = 1;






--DROP TABLE YES_SHOW_SEAT CASCADE CONSTRAINTS;
--DROP TABLE YES_NOTICE_CATE CASCADE CONSTRAINTS;
--DROP TABLE YES_NOTICE CASCADE CONSTRAINTS;
--DROP TABLE YES_QNA_CATE CASCADE CONSTRAINTS;
--DROP TABLE LIKE_PROD CASCADE CONSTRAINTS;
--DROP TABLE YES_FAQ CASCADE CONSTRAINTS;
--DROP TABLE YES_FAQ_CATE CASCADE CONSTRAINTS;
--DROP TABLE YES_MEMBER CASCADE CONSTRAINTS;
--DROP TABLE YES_LOGIN CASCADE CONSTRAINTS;
--DROP TABLE YES_SHOW_CATEGORY CASCADE CONSTRAINTS;
--DROP TABLE YES_SHOW_CATEGORY_DETAIL CASCADE CONSTRAINTS;


--DROP TABLE YES_SHOW_MAP CASCADE CONSTRAINTS purge;
--DROP TABLE YES_SHOW_DATE CASCADE CONSTRAINTS purge;

SELECT  'DROP TABLE ' || object_name || ' CASCADE CONSTRAINTS;'
  FROM    user_objects
WHERE   object_type = 'TABLE';

SELECT  'DROP VIEW ' || object_name ||';'
  FROM    user_objects
WHERE   object_type = 'VIEW';

DROP VIEW VIEW_REV_SHOWINFO;


purge recyclebin;


select RNO, prod_id, category_name, fk_category_id, prod_title, prod_img, date_start, date_end, info_open_date, info_close_date, info_rev_status, info_qnty, map_address, map_id
from (
    select ROW_NUMBER() OVER (ORDER BY prod_id desc) as RNO, prod_id, category_name, fk_category_id, prod_title, prod_img, date_start, date_end, info_open_date, info_close_date, info_rev_status, info_qnty, map_address, map_id
    from (
        select P.prod_id, C.category_name, fk_category_id, prod_title, prod_img, date_start, date_end, info_open_date, info_close_date, info_rev_status, info_qnty, map_address, M.map_id, status
        from prod P join yes_show_category C
        on P. fk_category_id = C.category_id
        left join yes_show_map M
        on P.prod_id = M. prod_id
        order by P.prod_id
    ) V
    where status = 1 
        and lower(prod_title) like '%' || '%'
) T
where rno between 1 and 8;

------------------ 포인트 테이블 --------------------------------
drop table yes_point purge;

create table yes_point
(point_id     number(8)     not null  -- 포인트 시퀀스
,fk_userid    varchar2(20)  not null  -- 회원 아이디
,content      varchar2(200) not null  -- 포인트 적립 내용
,point        number(8)     not null  -- 적립되는 포인트
,fk_rev_date  date  default sysdate   -- 적립 날짜
,fk_rev_id    number(10)    not null  -- 적립된 예매 코드
,constraint PK_point_id primary key(point_id)
,constraint FK_point_fk_userid foreign key(fk_userid) references yes_member(userid)
--,constraint FK_point_rev_date foreign key(fk_rev_date) references yes_reserve(rev_date) 
--,constraint FK_point_rev_id foreign key(fk_rev_id) references yes_reserve(rev_id)
);

drop sequence seq_point;
create sequence seq_point
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select * from yes_member;

select point_id, fk_userid, content, point, to_char(fk_rev_date, 'yyyy.mm.dd hh24:mi:ss') AS fk_rev_date, fk_rev_id 
from yes_point 
where fk_userid = 'admin';

insert into yes_point(point_id, fk_userid, content, point, fk_rev_date, fk_rev_id) 
values(seq_point.nextval, 'kimjy', '포인트 적립!', 1500, sysdate, 123);

--insert into yes_point(point_id, fk_userid, content, point, fk_rev_date, fk_rev_id) 
--values(seq_point.nextval, 'kimjy', '포인트 적립222!', 1400, sysdate, 124);

--insert into yes_point(point_id, fk_userid, content, point, fk_rev_date, fk_rev_id) 
--values(seq_point.nextval, 'kimjy', '포인트 적립33!', 1200, sysdate, 114);

--insert into yes_point(point_id, fk_userid, content, point, fk_rev_date, fk_rev_id) 
--values(seq_point.nextval, 'kimjy', '포인트 적립ㅁㄴㅇ2!', 1400, sysdate, 14);

--insert into yes_point(point_id, fk_userid, content, point, fk_rev_date, fk_rev_id) 
--values(seq_point.nextval, 'kimjy', '포인트 적2!', 400, sysdate, 11);

--insert into yes_point(point_id, fk_userid, content, point, fk_rev_date, fk_rev_id) 
--values(seq_point.nextval, 'kimjy', '포인트 적립222!', 1400, sysdate, 1123);

--commit;


select * 
from yes_point
where fk_userid = 'kimjy';

select previousseq, previoussubject
       , qna_id, fk_userid, name, category, qna_cate_name, subject, content, regDate, adminread, adminans, groupno, fk_seq, depthno
       , fk_rev_id, prod_id, rev_email, prod_img, prod_title
       , nextseq, nextsubject
        from
            (
               select lag(qna_id, 1) over(order by qna_id desc) as previousseq
               , lag(subject, 1) over(order by qna_id desc) as previoussubject
               
               , qna_id, fk_userid, name, category, qna_cate_name, subject, content, to_char(regDate, 'yy/mm/dd') as regDate, adminread, adminans, groupno, fk_seq, depthno
               , fk_rev_id, prod_id, rev_email, prod_img, prod_title
               
               , lead(qna_id, 1) over(order by qna_id desc) as nextseq
               , lead(subject, 1) over(order by qna_id desc) as nextsubject
               
                from view_qna_info
                where status = 1 and fk_userid != 'admin'
                -- 관리자 게시판에서 관리자의 답글이 아닌 회원들의 글만 이전글/다음글로 보고싶은 경우
            ) V
where qna_id = 2;


-- 공연상세페이지 표시할 정보 view --
create or replace view view_detail_prod
as
select P.prod_id, P.prod_img, P.prod_detail_img, P.prod_title, P.info_open_date, P.info_close_date, P.info_grade, P.info_run_time
    , M.map_name, M.map_address, substr(M.map_address, 0,2) as local
    --, S.seat_type, S.seat_price , S.seat_color
from prod P
JOIN yes_show_map M
ON P.map_id = M.map_id
--left join yes_seat_type S 
--on P.prod_id = S.prod_id
;

select prod_id, prod_img, prod_detail_img, prod_title, info_open_date, info_close_date, info_grade, info_run_time
    , map_name, map_address, local 
from view_detail_prod;

-- 공연상세페이지에서 필요한 좌석의 정보
-- R석121,000원
-- S석110,000원

select seat_type, seat_price, seat_color
from yes_seat_type
where prod_id=1;

-- 공연시간안내
-- "2020년 8월 29일(토) 오후 6시" -- 공연날짜
-- "2020년 8월 20일(일) 오후 5시"

select distinct to_char(date_showday, 'yyyy-mm-dd') as date_showday, date_showtime
from yes_show_date
where prod_id =1;

select distinct to_char(date_showday, 'yyyy-mm-dd') || ' (' || to_char(date_showday, 'dy') || ')' as date_showday, date_showtime
from yes_show_date
where prod_id = 2
order by date_showday;

select distinct to_char(date_showday, 'yyyy-mm-dd') || ' (' || to_char(date_showday, 'dy') || ')' as date_showday, date_showtime
from yes_show_date
where prod_id = 2
order by date_showday;

select *
from yes_show_date
where prod_id=1 and to_char(date_showday, 'yy/mm/dd') || ' ' || to_char(date_showday, 'day')='20/10/01 목요일' and date_showtime = '1회차 9시';


select date_id, prod_id, date_showday, date_showtime
from yes_show_date
where prod_id=1 and to_char(date_showday, 'yyyy-mm-dd') ='2020-09-02' --and date_showtime = '1회차 9시';


select seattype_id, count(*)
from(
select *
from yes_show_seat
where date_id = 1 and seat_status = 0
)
group by seattype_id;
-- 선택한 날짜회차(date_id)의 예약가능한 좌석의 타입별 개수

select seattype_id, count(*)
from(
    select *
    -- select count(*)
    from (
        select seat_id, seattype_id, seat_name, seat_status, D.date_id, D.prod_id, date_showday, date_showtime
        from yes_show_seat S join yes_show_date D
        on S.date_id = D.date_id
    )T
    where T.prod_id =1 and seat_status = 0
)
group by seattype_id;
-- 어떤 공연에 대한 전날짜 전회차에 대한 예약가능한 좌석의 타입별 개수


select *
-- select count(*)
from (
    select *
    from yes_show_seat S join yes_show_date D
    on S.date_id = D.date_id
)T
where prod_id =1 and seat_status = 1;
-- 어떤 공연에 대한 전날짜 전회차에 대해 예매가 된 좌석


select rno, review_id, fk_userid, name, content, star, regDate, parentProdId, status
from(
select rownum as rno, review_id, fk_userid, name, content, star, regDate, parentProdId, status
from yes_review
where status = 1 and parentProdId = 1
order by review_id desc
) T
where rno between 1 and 5;
-- 어떤 공연에 대한 리뷰모음 (페이징처리)

select count(*)
from yes_review
where status = 1 and parentProdId = 1
-- 총리뷰수

select round(sum(star)/count(*),2)
from 
(
    select * 
    from yes_review
    where status = 1
) V
group by parentProdId
having(parentProdId = 1)
-- 총 평균평점

desc yes_review;

--update yes_review set content = '확인용입니다', star = 3
--where status = 1 and review_id = 1;

--rollback;
---------------쿠폰 테이블---------------------- 
drop table yes_coupon purge;
create table yes_coupon
(coupon_id          varchar2(10)  not null  -- 쿠폰번호
,coupon_dc          number(10)    not null  -- 할인금액
,coupon_status      number(1)     not null  -- 사용상태
,coupon_newdate     date default sysdate -- 발급일자
,coupon_usedate     date                 -- 사용일자
,coupon_olddate     date                 -- 사용기한(만료날짜)
,coupon_name        varchar2(100) not null  -- 쿠폰명
,coupon_condition   varchar2(100) default '모든 공연 가능'       -- 사용조건
,fk_userid          varchar2(20)  not null  -- 사용가능회원코드
,constraint PK_coupon_id primary key(coupon_id)
,constraint fk_userid_coupon foreign key(fk_userid) references yes_member(userid)
);

drop sequence seq_coupon;
create sequence seq_coupon
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

    
-- delete from yes_coupon where coupon_id = 1;
-- update yes_coupon set coupon_status = 0 where coupon_id = 1;
-- commit;

select *
from yes_coupon
where fk_userid = 'guzi10';



--insert into yes_coupon(coupon_id, coupon_dc, coupon_status, coupon_newdate, coupon_usedate, coupon_olddate, coupon_name, coupon_condition, fk_userid, fk_prod_id) 
--values('AB3C212C3D', 5000, 1, sysdate, null, sysdate +4, '[2020 캣츠 내한공연] 5천원 할인 쿠폰', default, 'guzi10', 1);

--insert into yes_coupon(coupon_id, coupon_dc, coupon_status, coupon_newdate, coupon_usedate, coupon_olddate, coupon_name, coupon_condition, fk_userid, fk_prod_id) 
--values('AB4C212C3D', 10000, 1, sysdate, null, sysdate +2, '[2020 특별재난쿠폰] 코로나 재난쿠폰', default, 'guzi10', 2);

--insert into yes_coupon(coupon_id, coupon_dc, coupon_status, coupon_newdate, coupon_usedate, coupon_olddate, coupon_name, coupon_condition, fk_userid, fk_prod_id) 
--values('AB5C212C3D', 4000, 1, sysdate, null, sysdate +10, '김밥일번가 쿠폰', default, 'guzi10', 3);

--insert into yes_coupon(coupon_id, coupon_dc, coupon_status, coupon_newdate, coupon_usedate, coupon_olddate, coupon_name, coupon_condition, fk_userid, fk_prod_id) 
--values('AB6C212C3D', 2500, 1, sysdate, null, sysdate +7, 'MOMO 커피 쿠폰', default, 'guzi10', 4);

--commit;


--insert into yes_coupon(coupon_id, coupon_dc, coupon_status, coupon_newdate, coupon_usedate, coupon_olddate, coupon_name, coupon_condition, fk_userid) 
--values(seq_coupon.nextval, 1000, 1, sysdate, null, sysdate+7, '수수료면제', default, 'guzi10');




---insert into yes_coupon(coupon_id, coupon_dc, coupon_status, coupon_newdate, coupon_usedate, coupon_olddate, coupon_name, coupon_condition, fk_userid) 
--values(seq_coupon.nextval, 3000, 1, sysdate, null, sysdate+7, '3000원할인', default, 'guzi10');

--insert into yes_coupon(coupon_id, coupon_dc, coupon_status, coupon_newdate, coupon_usedate, coupon_olddate, coupon_name, coupon_condition, fk_userid) 
--values(seq_coupon.nextval, 5000, 1, sysdate, null, sysdate+7, '5000원할인', default, 'guzi10');

--insert into yes_coupon(coupon_id, coupon_dc, coupon_status, coupon_newdate, coupon_usedate, coupon_olddate, coupon_name, coupon_condition, fk_userid) 
--values(seq_coupon.nextval, 10000, 1, sysdate, null, sysdate+7, '10000원할인', default, 'guzi10');


--insert into yes_coupon(coupon_id, coupon_dc, coupon_status, coupon_newdate, coupon_usedate, coupon_olddate, coupon_name, coupon_condition, fk_userid) 
--values(seq_coupon.nextval, 1000, 1, sysdate, null, sysdate+7, '수수료면제', default, 'kkimsg93');

--insert into yes_coupon(coupon_id, coupon_dc, coupon_status, coupon_newdate, coupon_usedate, coupon_olddate, coupon_name, coupon_condition, fk_userid) 
--values(seq_coupon.nextval, 3000, 1, sysdate, null, sysdate+7, '3000원할인', default, 'kkimsg93');

---insert into yes_coupon(coupon_id, coupon_dc, coupon_status, coupon_newdate, coupon_usedate, coupon_olddate, coupon_name, coupon_condition, fk_userid) 
---values(seq_coupon.nextval, 5000, 1, sysdate, null, sysdate+7, '5000원할인', default, 'kkimsg93');

--insert into yes_coupon(coupon_id, coupon_dc, coupon_status, coupon_newdate, coupon_usedate, coupon_olddate, coupon_name, coupon_condition, fk_userid) 
--values(seq_coupon.nextval, 10000, 1, sysdate, null, sysdate+7, '10000원할인', default, 'kkimsg93');

---commit;

------------------------------------------------------------



create or replace view view_detail_prod
as
select P.prod_id, P.prod_img, P.prod_detail_img, P.prod_title, P.info_open_date, P.info_close_date, P.info_grade, P.info_run_time
    , M.map_id, M.map_name, M.map_address, substr(M.map_address, 0,2) as local, map_lng, map_lat, map_url
    --, S.seat_type, S.seat_price , S.seat_color
from prod P
JOIN yes_show_map M
ON P.map_id = M.map_id;


select *
from yes_show_map

select prod_id, fk_category_id, fk_category_detail_id, prod_title, prod_img, prod_detail_img, to_char(date_start, 'yyyy-mm-dd') as date_start, to_char(date_end, 'yyyy-mm-dd') as date_end
		     , to_char(info_open_date, 'yyyy-mm-dd') as info_open_date, to_char(info_close_date, 'yyyy-mm-dd') as info_close_date, info_rev_status, info_grade, info_run_time, info_qnty, status, map_id
		from prod
		where fk_category_id = 1
		order by info_open_date desc;

select * 
from yes_show_seat;

select *
from yes_show_seat
where seat_status = 1;


select RNO, prod_id, prod_title, prod_img, map_name, prod_discount
		from
		(
		    select rownum AS RNO, prod_id, prod_title, prod_img, map_name, prod_discount
		    from
		    (
		        select P.prod_id, P.prod_title, P.prod_img, M.map_name, P.prod_discount
		        from prod P join yes_show_map M
		        on P.map_id = M.map_id
		        where fk_category_id like '%'||#{categoryNum}||'%' and fk_category_detail_id like '%'||#{detailCategoryNum}||'%'
		        order by info_close_date
		    ) V
		) T
		where T.RNO between 1 and 5;
        
select *
from prod;

select * 
from yes_coupon;


--------------------------------- ### 리뷰 관람일시 가져오기 위한 쿼리문 변경 ### ----------------------
select distinct *
from view_rev_memberInfo
where userid = 'kkimsg93' and prod_id = 1;
        
        
create or replace view view_revdate_Info
as
select rev_id, R.prod_id, user_id, D.date_id, D.date_showday, D.date_showtime, seat_id, status_id, rev_email, rev_qnty, rev_date, rev_price, rev_ship_method, rev_pay_method, rev_pay_status, prod_img, prod_title, info_grade, info_run_time, map_name, idx, userid, name
from yes_reserve R join view_rev_showInfo I
on R.prod_id = I.prod_id
join yes_member M
on R.user_id = M.userid
join yes_show_date D
on R.prod_id = D.prod_id and R.date_id = D.date_id;
-- ### 새로운 뷰 만들기

select distinct rev_id, prod_id, date_id, to_char(date_showday, 'yy/mm/dd') as date_showday
from view_revdate_Info
where userid = 'kkimsg93' and prod_id = 1;
-- ### 리뷰에서 관람일시를 불러오기 위한 쿼리문

select * from view_rev_showInfo;
select * from yes_show_date;
select * from yes_reserve;

select *
from yes_reserve R join yes_show_date D
on R.prod_id = D.prod_id and R.date_id = D.date_id;
        
        
alter table yes_review 
add date_id number;

select * 
from yes_review;


select rno, review_id, fk_userid, name, content, star, regDate, parentProdId, date_id, status, date_showday, date_showtime
from(
    select rownum as rno, review_id, fk_userid, name, content, star, regDate, parentProdId, date_id, status , date_showday, date_showtime
    from 
    (
    select review_id, fk_userid, name, content, star, regDate, parentProdId, date_id, status, date_showday, date_showtime
    from 
    (
        select review_id, fk_userid, name, content, star, to_char(regDate, 'yyyy-mm-dd') as regDate, parentProdId, D.date_id, status, date_showday, date_showtime
        from yes_review R left join yes_show_date D
        on R.date_id = D.date_id
    ) W
    where status = 1 and parentProdId = 1
    order by review_id desc
    )T
) V
where rno between 1 and 5; 
-- 관람일시 포함한 리뷰 페이징처리한 것

select rno, review_id, fk_userid, name, content, star, regDate, parentProdId, date_id, status, date_showday, date_showtime
from(
    select rownum as rno, review_id, fk_userid, name, content, star, regDate, parentProdId, date_id, status , date_showday, date_showtime
    from 
    (
    select review_id, fk_userid, name, content, star, regDate, parentProdId, date_id, status, date_showday, date_showtime
    from 
    (
        select review_id, fk_userid, name, content, star, to_char(regDate, 'yyyy-mm-dd') as regDate, parentProdId, D.date_id, status, date_showday, date_showtime
        from yes_review R left join yes_show_date D
        on R.date_id = D.date_id
    ) W
    where status = 1 and parentProdId = 1 and date_id is not null
    order by review_id desc
    )T
) V
where rno between 1 and 5; 
-- 예매평만보기

select rno, review_id, fk_userid, name, content, star, regDate, parentProdId, date_id, status, date_showday, date_showtime
from(
    select rownum as rno, review_id, fk_userid, name, content, star, regDate, parentProdId, date_id, status , date_showday, date_showtime
    from 
    (
    select review_id, fk_userid, name, content, star, regDate, parentProdId, date_id, status, date_showday, date_showtime
    from 
    (
        select review_id, fk_userid, name, content, star, to_char(regDate, 'yyyy-mm-dd') as regDate, parentProdId, D.date_id, status, date_showday, date_showtime
        from yes_review R left join yes_show_date D
        on R.date_id = D.date_id
    ) W
    where status = 1 and parentProdId = 1 and date_id is null
    order by review_id desc
    )T
) V
where rno between 1 and 5; 
-- 기대평만 보기



-- 리뷰 포인트증가(트랜잭션)처리하고 마이페이지에 표시되는 포인트테이블에 리뷰적립금 추가하기

------------------ 포인트 테이블 내가바꾼것 리뷰번호참조 넣음 --------------------------------
drop table yes_point purge;

create table yes_point
(point_id     number(8)     not null  -- 포인트 시퀀스
,fk_userid    varchar2(20)  not null  -- 회원 아이디
,content      varchar2(200) not null  -- 포인트 적립 내용
,point        number(8)     not null  -- 적립되는 포인트
,fk_rev_date  date  default sysdate   -- 적립 날짜
,fk_rev_id    number(10)    not null  -- 적립된 예매 코드
,fk_review_id number                  -- 적립된 리뷰 코드
,constraint PK_point_id primary key(point_id)
,constraint FK_point_fk_userid foreign key(fk_userid) references yes_member(userid)
,constraint FK_point_fk_review_id foreign key(fk_review_id) references yes_review(review_id) on delete cascade
--,constraint FK_point_rev_date foreign key(fk_rev_date) references yes_reserve(rev_date) 
--,constraint FK_point_rev_id foreign key(fk_rev_id) references yes_reserve(rev_id)
);

drop sequence seq_point;
create sequence seq_point
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;





select point_id, fk_userid, content, point, to_char(fk_rev_date, 'yyyy.mm.dd hh24:mi:ss') AS fk_rev_date, fk_rev_id, fk_review_id
from yes_point 
where fk_userid = 'kkimsg93';

insert into yes_point(point_id, fk_userid, content, point, fk_rev_date, fk_rev_id, fk_review_id) 
values(seq_point.nextval, 'kkimsg93', '리뷰예매평 포인트 적립', 100, sysdate, 0, 1);

select point
from yes_member
where userid = 'kkimsg93';
-- 900 포인트 -> 리뷰등록후 1000(트랜잭션 잘 됨) 
-- 1000 포인트 -> 리뷰삭제후 900(트랜잭션 잘 됨)

select * 
from yes_review
order by review_id desc;



select seattype_id, seat_type, seat_price, seat_color
from yes_seat_type
where prod_id = 1;
-- 해당 공연(1번)의 좌석코드와 좌석타입과 좌석가격과 좌석컬러

-- 좌석타입별, 회차별 잔여좌석 구하기

-- select *
select S.seattype_id, seat_type, seat_price, seat_color, remainseatCnt
from yes_seat_type T join (
    select seattype_id, count(*) as remainseatCnt
    from(
    select *
    from yes_show_seat
    where date_id = 3 and seat_status = 0
    )
    group by seattype_id
) S
on T.seattype_id = S.seattype_id;
-- 선택한 날짜회차(date_id)의 예약가능한 좌석의 타입별 개수

-- select *
select S.seattype_id, seat_type, seat_price, seat_color, remainseatCnt
from yes_seat_type T join (
    select seattype_id, count(*) as remainseatCnt
    from(
        select *
        -- select count(*)
        from (
            select seat_id, seattype_id, seat_name, seat_status, D.date_id, D.prod_id, date_showday, date_showtime
            from yes_show_seat S join yes_show_date D
            on S.date_id = D.date_id
        )T
        -- where T.prod_id =1 and seat_status = 0
        -- where T.prod_id =1 and date_id = 1 and seat_status = 0
        where T.prod_id =1 and date_id in (1,2) and seat_status = 0
    )
    group by seattype_id
) S
on T.seattype_id = S.seattype_id;
-- 어떤 공연에 대한 전날짜 전회차에 대한 예약가능한 좌석의 타입별 개수


select *
-- select count(*)
from (
    select *
    from yes_show_seat S join yes_show_date D
    on S.date_id = D.date_id
)T
where prod_id =1 and seat_status = 1;
-- 어떤 공연에 대한 전날짜 전회차에 대해 예매가 된 좌석




select S.seattype_id, seat_type, seat_price, seat_color, remainseatCnt
		from yes_seat_type T join (
		    select seattype_id, count(*) as remainseatCnt
		    from(
		        select *
		        from (
		            select seat_id, seattype_id, seat_name, seat_status, D.date_id, D.prod_id, date_showday, date_showtime
		            from yes_show_seat S join yes_show_date D
		            on S.date_id = D.date_id
		        )T
				where T.prod_id = 1 and seat_status = 0
				and date_id = 1
		    )
		    group by seattype_id
		) S
		on T.seattype_id = S.seattype_id