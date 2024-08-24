-- 멤버
create table member
(
    m_id         varchar2(50 char) primary key,
    m_pw         varchar2(50 char)  not null,
    m_fam_kanji  varchar2(50 char)  not null,
    m_name_kanji varchar2(50 char)  not null,
    m_fam_kana   varchar2(50 char)  not null,
    m_name_kana  varchar2(50 char)  not null,
    m_fam_eng    varchar2(50 char)  not null,
    m_name_eng   varchar2(50 char)  not null,
    m_birth      varchar2(30 char)  not null,
    m_gender     varchar2(10 char)  not null,
    m_email      varchar2(50 char)  not null,
    m_phone      varchar2(20 char)  not null,
    m_address    varchar2(100 char) not null,
    m_zipcode    varchar2(10 char)  not null,
    m_img        varchar2(20 char)  not null
);
insert into member
values ('test3', '1111', '佐藤', '由紀', 'サト', 'ユキ', 'sato', 'yuki', '1993-09-12', '女', 'sato@enparty.com',
        '000-0000-0000', '東京都渋谷区神宮前1-1-1明治神宮', '150-0001', 'profile.jpg');
insert into member
values ('test9', '1111', '金', '宥', 'キム', 'ユウ', 'kimu', 'yuu', '1997-03-31', '女', 'yujeongstellakim@gmail.com',
        '000-0000-0000', '東京都渋谷区神宮前1-1-1明治神宮', '150-0001', 'profile.jpg');
insert into member
values ('test10', '1111', '朴', 'JE', 'パク', 'ユウ', 'park', 'je', '1997-03-31', '女', 'pje961011@gmail.com',
        '000-0000-0000', '東京都渋谷区神宮前1-1-1明治神宮', '150-0001', 'profile.jpg');
delete
from member
where m_id = 'test10';
select *
from member
order by m_id;
select *
from member;
SELECT m_id
FROM member
WHERE m_fam_eng = 'kimu'
  AND m_email = 'yujeongstellakim@gmail.com';

-- 주소
-- create table address(
--     m_id varchar2(50 char) not null,
--     a_address varchar2(100 char) not null,
--     a_postcode varchar2(20 char) not null,
--     foreign key(m_id) references member(m_id)
-- );
-- select * from address order by m_id;
-- insert into address values ('test3', '東京都渋谷区神宮前1-1-1明治神宮', '150-0001');
-- drop table address;

-- 이벤트
create table event
(
    e_no     number(5) primary key,
    m_id     varchar2(50 char)  not null,
    e_amazon varchar2(200 char) not null,
    foreign key (m_id) references member (m_id)
);
create sequence event_seq;
select *
from event;
insert into event
values (event_seq.nextval, 'test3', 'https://www.amazon.co.jp/');

-- 템플릿(상품)
create table template
(
    t_pk       number(5) primary key,
    t_title    varchar2(200 char) not null,
    t_preview  varchar2(200 char) not null,
    t_example  varchar2(200 char) not null,
    t_template varchar2(200 char) not null
);
create sequence template_seq;
select *
from template
order by t_pk;
insert into template
values (template_seq.nextval, 'test10', 'product-t10.png', 'example.jpg', 'template.jpg');
update template
set t_example = 'product-t3.png'
where t_pk = 3;

-- 템플릿에 넣는 결혼정보
create table wedding_info
(
    e_no                 number(5)          not null,
    t_pk                 number(5)          not null,
    w_fam_jp_groom       varchar2(10 char)  not null,
    w_name_jp_groom      varchar2(10 char)  not null,
    w_fam_eng_groom      varchar2(50 char)  not null,
    w_name_eng_groom     varchar2(50 char)  not null,
    w_fam_jp_bride       varchar2(10 char)  not null,
    w_name_jp_bride      varchar2(10 char)  not null,
    w_fam_eng_bride      varchar2(50 char)  not null,
    w_name_eng_bride     varchar2(50 char)  not null,
--     w_date date not null,
--     w_wedding_time timestamp not null,
--     w_wedding_assemble timestamp not null,
    w_date               varchar2(30 char)  not null,
    w_wedding_time       varchar2(10 char)  not null,
    w_wedding_assemble   varchar2(10 char)  not null,
    w_wedding_postcode   varchar2(10 char)  not null,
    w_wedding_address    varchar2(200 char) not null,
    w_wedding_building   varchar2(50 char)  not null,
--     w_reception_time timestamp not null,
--     w_reception_assemble timestamp not null,--
    w_reception_time     varchar2(10 char)  not null,
    w_reception_assemble varchar2(10 char)  not null,
    w_reception_postcode varchar2(10 char)  not null,
    w_reception_address  varchar2(200 char) not null,
    w_reception_building varchar2(50 char)  not null,
    w_message_invite     varchar2(500 char) not null,
    w_message_bye        varchar2(500 char) not null,
    w_img1               varchar2(50 char)  not null,
    w_img2               varchar2(50 char)  not null,
    w_img3               varchar2(50 char)  not null,
    w_img_share          varchar2(500 char) not null,

    foreign key (e_no) references event (e_no),
    foreign key (t_pk) references template (t_pk)
);
select *
from WEDDING_INFO;
drop table wedding_info;


-- 위시리스트
create table wishlist
(
    wl_no      number(5) primary key,
    e_no       number(5)          not null,
    wl_product varchar2(100 char) not null,
    wl_price   number(8)          not null,
    foreign key (e_no) references event (e_no)
);
create sequence wishlist_seq;
select *
from wishlist;

update wishlist set wl_product = 'パソコン' where wl_no='5';

-- 참가자
create table guest
(
    e_no                number(5)         not null,
    m_id                varchar2(50 char) not null,
    g_attend_wedding    varchar2(5 char)  not null,
    g_attend_afterparty varchar2(5 char)  not null,
    g_guest_type        varchar2(5 char)  not null,
    g_allergy_or        varchar2(5 char),
    g_relation          varchar2(20 char) not null,
    g_relation_detail   varchar2(30 char) not null,

    foreign key (e_no) references event (e_no),
    foreign key (m_id) references member (m_id)
);
select *
from guest;
drop table guest;
delete
from guest
where e_no = 68;

-- 알러지
create table allergy
(
    e_no    number(5)         not null,
    m_id    varchar2(50 char) not null,
    allergy varchar2(100 char),

    foreign key (e_no) references event (e_no),
    foreign key (m_id) references member (m_id)
);
select *
from allergy;
drop table allergy;

delete
from allergy
where e_no = 68;

-- 동반자 유형
create table party
(
    p_pk             number(5) primary key,
    e_no             number(5)         not null,
    m_id             varchar2(50 char) not null,
    p_accompany_type varchar2(5 char)  not null,
    p_accompany_num  number(3)         not null,
    p_fam_kangi      varchar2(50 char) not null,
    p_name_kangi     varchar2(50 char) not null,
    p_fam_kana       varchar2(50 char) not null,
    p_name_kana      varchar2(50 char) not null,
    p_fam_eng        varchar2(50 char) not null,
    p_name_eng       varchar2(50 char) not null,
    p_gender         varchar2(10 char) not null,
    p_allergy_or     varchar2(5 char)  not null,
    p_relation       varchar2(20 char) not null,

    foreign key (e_no) references event (e_no),
    foreign key (m_id) references member (m_id)
);
create sequence party_seq;
insert into party
values (party_seq.nextval, '68', 'test9', 'ご成年', '2', '李', '泰坤', 'イ', 'テゴン', 'LEE', 'TAE KON', '男', '有',
        '姉');

select *
from party;
drop table party;

-- 동반자 알러지
create table partyAllergy
(
    p_pk    number(5)          not null,
    e_no    number(5)          not null,
    m_id    varchar2(50 char)  not null,
    allergy varchar2(100 char) not null,

    foreign key (p_pk) references party (p_pk),
    foreign key (e_no) references event (e_no),
    foreign key (m_id) references member (m_id)
);


create sequence partyAllergy_seq;
select *
from partyAllergy;
drop table partyAllergy;


-- 축하메세지
create table message
(
    e_no       number(5)         not null,
    m_id       varchar2(50 char) not null,
    me_content varchar2(300 char),
    me_img     varchar2(200 char),

    foreign key (e_no) references event (e_no),
    foreign key (m_id) references member (m_id)
);
select *
from message;
drop table message;
delete
from message
where e_no = 68;

-- 지불
create table pay
(
    e_no    number(5)         not null,
    m_id    varchar2(50 char) not null,
    wl_no   number(8) default 0 not null,
    p_type  varchar2(10 char) not null,
    p_price number(8)         not null,
    p_date  date              not null,

    foreign key (e_no) references event (e_no),
    foreign key (m_id) references member (m_id)
);
select *
from pay;

delete from pay;
delete from member;
delete from event;
delete from wishlist;

drop table pay cascade constraints purge ;

-- 이벤트 댓글
create table event_comment
(
    e_no      number(5)          not null,
    c_writer  varchar2(50 char)  not null,
    c_content varchar2(300 char) not null,
    c_date    date               not null,
    c_type    varchar2(10 char)  not null,

    foreign key (e_no) references event (e_no)
);
select *
from event_comment;
alter table event_comment
    add c_no number(5) not null;
create sequence event_comment_seq;
insert into event_comment
values (22, '아는형', '축하해', sysdate, '신랑', event_comment_seq.nextval);


--엔파티
create table en_party
(
    e_no    number(5)         not null,
    m_id    varchar2(50 char) not null,
    ep_type varchar2(10 char) not null,

    foreign key (e_no) references event (e_no),
    foreign key (m_id) references member (m_id)
);
select *
from en_party;
alter table en_party
    add ep_selectedType varchar2(300 char);
alter table en_party
    add ep_finalChoice varchar2(100 char);

-- 엔파티 채팅
create table en_chatting
(
    e_no       number(5)          not null,
    m_id       varchar2(50 char)  not null,
    ec_content varchar2(500 char) not null,
    ec_date    date               not null,

    foreign key (e_no) references event (e_no),
    foreign key (m_id) references member (m_id)
);
select *
from en_chatting;


WITH wish_fund AS (SELECT wl_no,
                          wl_price,
                          wl_product,
                          e_no,
                          (SELECT SUM(p_price) FROM pay sp WHERE p_type = 'fund' AND wl_no = sw.wl_no) AS payed,
                          FLOOR((SELECT SUM(p_price) FROM pay sp WHERE p_type = 'fund' AND wl_no = sw.wl_no) /
                                wl_price * 100)                                                        AS percent
                   FROM wishlist sw
                   WHERE e_no = 68)
SELECT wl_no, wl_price, wl_product, e_no, payed, COALESCE(percent, 0) AS percent
FROM wish_fund
ORDER BY percent DESC;
select * from en_chatting;


SELECT *
FROM wedding_info
         JOIN event ON event.e_no = wedding_info.e_no
         JOIN member ON event.m_id = member.m_id
WHERE member.m_id = 'test778';


select * from pay;

select * from pay;
select * from wishlist;
select * from member;

select * from guest;

select * from companion;

insert into COMPANION
values (COMPANION_SEQ.nextval, '68', 'test10', 'ご成年', '2', '李', '泰坤', 'イ', 'テゴン', 'LEE', 'TAE KON', '男', 'YES');

insert into COMPANION
values (COMPANION_SEQ.nextval, '68', 'test10', 'ご成年', '2', '李', '泰坤', 'イ', 'テゴン', 'LEE', 'TAE KON', '男', 'YES');

SELECT COUNT(*) FROM COMPANION where P_ACCOMPANY_TYPE = 'BABY';
