-- 멤버
create table member(
    m_id varchar2(50 char) primary key,
    m_pw varchar2(50 char) not null,
    m_fam_kanji varchar2(50 char) not null,
    m_name_kanji varchar2(50 char) not null,
    m_fam_kana varchar2(50 char) not null,
    m_name_kana varchar2(50 char) not null,
    m_fam_eng varchar2(50 char) not null,
    m_name_eng varchar2(50 char) not null,
    m_birth varchar2(30 char) not null,
    m_gender varchar2(10 char) not null,
    m_email varchar2(50 char) not null,
    m_phone varchar2(20 char) not null,
    m_address varchar2(100 char) not null,
    m_zipcode varchar2(10 char) not null,
    m_img varchar2(20 char) not null
);
select * from member order by m_id;
insert into member values ('test3', '1111', '佐藤', '由紀', 'サト', 'ユキ', 'sato', 'yuki', '1993-09-12', '女', 'sato@enparty.com', '000-0000-0000', '東京都渋谷区神宮前1-1-1明治神宮', '150-0001', 'profile.jpg' );


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
create table event(
  e_no number(5) primary key,
  m_id varchar2(50 char) not null,
  e_amazon varchar2(200 char) not null,
  foreign key(m_id) references member(m_id)
);
create sequence event_seq;
select * from event;
insert into event values (event_seq.nextval, 'test3', 'https://www.amazon.co.jp/');

-- 템플릿(상품)
create table template(
    t_pk number(5) primary key,
    t_title varchar2(200 char) not null,
    t_preview varchar2(200 char) not null,
    t_example varchar2(200 char) not null,
    t_template varchar2(200 char) not null
);
create sequence template_seq;
select * from template order by t_pk;
insert into template values (template_seq.nextval, 'test10', 'product-t10.png', 'example.jpg', 'template.jpg');
update template set t_example = 'product-t3.png' where t_pk = 3;

-- 템플릿에 넣는 결혼정보
create table wedding_info(
    e_no number(5) not null,
    t_pk number(5) not null,
    w_fam_jp_groom varchar2(10 char) not null,
    w_name_jp_groom varchar2(10 char) not null,
    w_fam_eng_groom varchar2(50 char) not null,
    w_name_eng_groom varchar2(50 char) not null,
    w_fam_jp_bride varchar2(10 char) not null,
    w_name_jp_bride varchar2(10 char) not null,
    w_fam_eng_bride varchar2(50 char) not null,
    w_name_eng_bride varchar2(50 char) not null,
    w_date date not null,
    w_wedding_time date not null,
    w_wedding_assemble date not null,
    w_wedding_building varchar2(50 char) not null,
    w_wedding_address varchar2(200 char) not null,
    w_reception_time date not null,
    w_reception_assemble date not null,
    w_reception_building varchar2(50 char) not null,
    w_reception_address varchar2(200 char) not null,
    w_message_invite varchar2(500 char) not null,
    w_message_bye varchar2(500 char) not null,
    w_img1 varchar2 (50 char) not null,
    w_img2 varchar2 (50 char) not null,
    w_img3 varchar2 (50 char) not null,
    w_img_share varchar2 (500 char) not null,

    foreign key(e_no) references event(e_no),
    foreign key (t_pk) references template(t_pk)
);
select * from WEDDING_iNFO;

-- 위시리스트
create table wishlist(
    wl_no number(5) primary key,
    e_no number(5) not null,
    wl_product varchar2(100 char) not null,
    wl_price number(8) not null,
    foreign key(e_no) references event(e_no)
);
create sequence wishlist_seq;
select * from wishlist;

-- 참가자
create table guest(
    e_no number(5) not null,
    m_id varchar2(50 char) not null,
    g_attend_wedding varchar2(5 char) not null,
    g_attend_afterparty varchar2(5 char) not null,
    g_guest_type varchar2(5 char) not null,
    g_allergy_or varchar2(5 char) not null,
    g_relation varchar2(10 char) not null,
    g_relation_detail varchar2(30 char) not null,

    foreign key(e_no) references event(e_no),
    foreign key (m_id) references member(m_id)
);
select * from guest;

-- 알러지
create table allergy(
    e_no number(5) not null,
    m_id varchar2(50 char) not null,
    allergy varchar2(10 char) not null,

    foreign key(e_no) references event(e_no),
    foreign key (m_id) references member(m_id)
);
select * from allergy;

-- 동반자 유형
create table party(
    e_no number(5) not null,
    m_id varchar2(50 char) not null,
    p_accompany_type varchar2(5 char) not null,
    p_accompany_num number(3) not null,

    foreign key(e_no) references event(e_no),
    foreign key (m_id) references member(m_id)
);
select * from party;

-- 축하메세지
create table message(
    e_no number(5) not null,
    m_id varchar2(50 char) not null,
    me_content varchar2(300 char) not null,
    me_img varchar2(200 char) not null,

    foreign key(e_no) references event(e_no),
    foreign key (m_id) references member(m_id)
);
select * from message;

-- 지불
create table pay(
    e_no number(5) not null,
    m_id varchar2(50 char) not null,
    wl_no number(8) not null,
    p_type varchar2(10 char) not null,
    p_price number(8) not null,
    p_date date not null,

    foreign key(e_no) references event(e_no),
    foreign key (m_id) references member(m_id),
    foreign key (wl_no) references wishlist(wl_no)
);
select * from pay;

-- 이벤트 댓글
create table event_comment(
    e_no number(5) not null,
    c_writer varchar2(50 char) not null,
    c_content varchar2(300 char) not null,
    c_date date not null,
    c_type varchar2(10 char) not null,

    foreign key(e_no) references event(e_no)
);
select * from event_comment;

--엔파티
create table en_party(
    e_no number(5) not null,
    m_id varchar2(50 char) not null,
    ep_type varchar2(10 char) not null,

    foreign key(e_no) references event(e_no),
    foreign key (m_id) references member(m_id)
);
select * from en_party;

-- 엔파티 채팅
create table en_chatting(
    e_no number(5) not null,
    m_id varchar2(50 char) not null,
    ec_content varchar2(500 char) not null,
    ec_date date not null,

    foreign key(e_no) references event(e_no),
    foreign key (m_id) references member(m_id)
);
select * from en_chatting;