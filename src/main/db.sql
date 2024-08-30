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
select * from member;
delete member where m_id = 'yamada';
insert into member values ('yamada01', 'EnMusubi1!', '山田', '太郎', 'ヤマダ', 'タロウ', 'Yamada', 'Taro', '1995-03-12', '男性', 'yamada@gmail.com', '080-1234-5678','東京都渋谷区道玄坂1-2-3', '150-0001', 'profile.png');
insert into member values ('takahashi01', 'EnMusubi1!', '高橋', '翔', 'タカハシ', 'ショウ', 'Takahashi', 'Sho', '1994-11-05', '男性', 'takahashi@gmail.com', '080-3456-7890','愛知県名古屋市中区栄3-6-7', '460-0008', 'profile.png');
insert into member values ('suzuki01', 'EnMusubi1!', '鈴木', '亮', 'スズキ', 'リョウ', 'Suzuki', 'Ryo', '1991-05-16', '男性', 'suzuki@gmail.com', '080-4567-8901','北海道札幌市中央区大通西4-1', '060-0001', 'profile.png');
insert into member values ('matsumoto01', 'EnMusubi1!', '松本', '大輔', 'マツモト', 'ダイスケ', 'Matsumoto', 'Daisuke', '1993-09-25', '男性', 'matsumoto@gmail.com', '080-5678-9012','福岡県福岡市博多区博多駅前2-8-1', '812-0011', 'profile.png');
insert into member values ('kobayashi01', 'EnMusubi1!', '小林', '涼', 'コバヤシ', 'リョウ', 'Kobayashi', 'Ryo', '1990-12-08', '男性', 'kobayashi@gmail.com', '080-6789-0123','京都府京都市下京区四条通高倉西入ル', '600-8009', 'profile.png');
insert into member values ('nakamura01', 'EnMusubi1!', '中村', '拓也', 'ナカムラ', 'タクヤ', 'Nakamura', 'Takuya', '1996-02-18', '男性', 'nakamura@gmail.com', '080-7890-1234','神奈川県横浜市西区みなとみらい1-1-1', '220-0012', 'profile.png');
insert into member values ('inoue01', 'EnMusubi1!', '井上', '直樹', 'イノウエ', 'ナオキ', 'Inoue', 'Naoki', '1994-04-30', '男性', 'inoue@gmail.com', '080-8901-2345','兵庫県神戸市中央区三宮町1-1-1', '650-0021', 'profile.png');
insert into member values ('tanaka01', 'EnMusubi1!', '田中', '勇', 'タナカ', 'イサム', 'Tanaka', 'Isamu', '1995-10-10', '男性', 'tanaka@gmail.com', '080-9012-3456','埼玉県さいたま市大宮区桜木町1-10-1', '330-0854', 'profile.png');
insert into member values ('watanabe01', 'EnMusubi1!', '渡辺', '亮太', 'ワタナベ', 'リョウタ', 'Watanabe', 'Ryota', '1992-06-14', '男性', 'watanabe@gmail.com', '080-9012-3456','千葉県千葉市中央区中央1-1-1', '260-0013', 'profile.png');
insert into member values ('ishii01', 'EnMusubi1!', '石井', '拓', 'イシイ', 'タク', 'Ishii', 'Taku', '1993-08-20', '男性', 'ishii@gmail.com', '080-1234-5679','岡山県岡山市北区駅前町2-3-4', '700-0024', 'profile.png');
insert into member values ('matsui01', 'EnMusubi1!', '松井', '亮介', 'マツイ', 'リョウスケ', 'Matsui', 'Ryosuke', '1991-01-04', '男性', 'matsui@gmail.com', '080-2345-6780','新潟県新潟市中央区弁天1-1-1', '950-0901', 'profile.png');
insert into member values ('kono01', 'EnMusubi1!', '河野', '直樹', 'コウノ', 'ナオキ', 'Kono', 'Naoki', '1994-07-08', '男性', 'kono@gmail.com', '080-3456-7891','和歌山県和歌山市本町1-1-1', '640-8132', 'profile.png');
insert into member values ('tamura01', 'EnMusubi1!', '田村', '修司', 'タムラ', 'シュウジ', 'Tamura', 'Shuji', '1992-03-29', '男性', 'tamura@gmail.com', '080-4567-8902','広島県広島市中区基町1-2-3', '730-0011', 'profile.png');

insert into member values ('takahashi02', 'EnMusubi1!', '高橋', '絵里', 'タカハシ', 'エリ', 'Takahashi', 'Eri', '1992-08-09', '女性', 'takahashi@gmail.com', '080-3456-7890','大阪府大阪市淀川区西中島4-12-15', '532-0011', 'profile.png');
insert into member values ('suzuki02', 'EnMusubi1!', '鈴木', 'さくら', 'スズキ', 'サクラ', 'Suzuki', 'Sakura', '1994-05-25', '女性', 'suzuki@gmail.com', '080-4567-8901','愛知県名古屋市名東区上社1-15-10', '465-0027', 'profile.png');
insert into member values ('matsumoto02', 'EnMusubi1!', '松本', '由美', 'マツモト', 'ユミ', 'Matsumoto', 'Yumi', '1991-11-28', '女性', 'matsumoto@gmail.com', '080-5678-9012','福岡県福岡市中央区天神1-2-3', '810-0001', 'profile.png');
insert into member values ('kobayashi02', 'EnMusubi1!', '小林', '美奈', 'コバヤシ', 'ミナ', 'Kobayashi', 'Mina', '1993-03-06', '女性', 'kobayashi@gmail.com', '090-6789-0123','北海道札幌市東区北8条東1-2-3', '065-0028', 'profile.png');
insert into member values ('nakamura02', 'EnMusubi1!', '中村', '愛', 'ナカムラ', 'アイ', 'Nakamura', 'Ai', '1996-06-12', '女性', 'nakamura@gmail.com', '080-7890-1234','神奈川県横浜市磯子区岡村町4-5-6', '235-0024', 'profile.png');
insert into member values ('inoue02', 'EnMusubi1!', '井上', '美穂', 'イノウエ', 'ミホ', 'Inoue', 'Miho', '1994-09-02', '女性', 'inoue@gmail.com', '090-8901-2345','兵庫県神戸市須磨区須磨浦公園1-2-3', '654-0038', 'profile.png');
insert into member values ('tanaka02', 'EnMusubi1!', '田中', '彩', 'タナカ', 'アヤ', 'Tanaka', 'Aya', '1995-12-01', '女性', 'tanaka@gmail.com', '080-9012-3456','埼玉県さいたま市浦和区高砂1-2-3', '330-0063', 'profile.png');
insert into member values ('watanabe02', 'EnMusubi1!', '渡辺', '由香', 'ワタナベ', 'ユカ', 'Watanabe', 'Yuka', '1992-10-19', '女性', 'watanabe@gmail.com', '080-9012-3456','千葉県千葉市美浜区ひび野1-3-4', '261-0021', 'profile.png');
insert into member values ('ishii02', 'EnMusubi1!', '石井', '恵', 'イシイ', 'ケイ', 'Ishii', 'Kei', '1991-07-30', '女性', 'ishii@gmail.com', '090-1234-5679','岡山県岡山市南区福富西1-2-3', '702-8058', 'profile.png');
insert into member values ('matsui02', 'EnMusubi1!', '松井', '由紀', 'マツイ', 'ユキ', 'Matsui', 'Yuki', '1998-04-20', '女性', 'matsui@gmail.com', '090-2345-6780','新潟県新潟市西区寺尾東1-2-3', '950-2025', 'profile.png');
insert into member values ('kono02', 'EnMusubi1!', '河野', '美沙', 'コウノ', 'ミサ', 'Kono', 'Misa', '1993-08-24', '女性', 'kono@gmail.com', '080-3456-7891','和歌山県和歌山市本町2-3-4', '640-8032', 'profile.png');
insert into member values ('sugimoto02', 'EnMusubi1!', '杉本', '由美', 'スギモト', 'ユミ', 'Sugimoto', 'Yumi', '1995-04-13', '女性', 'sugimoto@gmail.com', '080-4567-8902','京都府京都市右京区西院高山寺町4-5-6', '615-0041', 'profile.png');



-- 이벤트
create table event
(
    e_no     number(5) primary key,
    m_id     varchar2(50 char)  not null,
    e_amazon varchar2(200 char) not null,
    foreign key (m_id) references member (m_id) ON DELETE CASCADE
);
select * from event;

create sequence event_seq;

-- 템플릿(상품)
create table template
(
    t_pk       number(5) primary key,
    t_title    varchar2(200 char) not null,
    t_preview  varchar2(200 char) not null,
    t_example  varchar2(200 char) not null,
    t_template varchar2(200 char) not null
);

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
    w_date               varchar2(30 char)  not null,
    w_wedding_time       varchar2(10 char)  not null,
    w_wedding_assemble   varchar2(10 char)  not null,
    w_wedding_postcode   varchar2(10 char)  not null,
    w_wedding_address    varchar2(200 char) not null,
    w_wedding_building   varchar2(50 char)  not null,
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

    foreign key (e_no) references event (e_no) ON DELETE CASCADE,
    foreign key (t_pk) references template (t_pk) ON DELETE CASCADE
);
select * from wedding_info;

-- 위시리스트
create table wishlist
(
    wl_no      number(5) primary key,
    e_no       number(5)          not null,
    wl_product varchar2(100 char) not null,
    wl_price   number(8)          not null,
    foreign key (e_no) references event (e_no)
);
select * from wishlist;

create sequence wishlist_seq;


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

    foreign key (e_no) references event (e_no) ON DELETE CASCADE,
    foreign key (m_id) references member (m_id) ON DELETE CASCADE
);
select * from guest;
delete guest where m_id = 'yamada01';

-- 알러지
create table allergy
(
    e_no    number(5)         not null,
    m_id    varchar2(50 char) not null,
    allergy varchar2(100 char),

    foreign key (e_no) references event (e_no) ON DELETE CASCADE,
    foreign key (m_id) references member (m_id) ON DELETE CASCADE
);
select * from allergy;


-- 동반자 유형
create table companion
(
    p_pk             number(5) primary key,
    e_no             number(5)         not null,
    m_id             varchar2(50 char) not null,
    p_accompany_type varchar2(5 char)  not null,
    p_accompany_num  number(3)         not null,
    p_fam_kanji      varchar2(50 char) not null,
    p_name_kanji     varchar2(50 char) not null,
    p_fam_kana       varchar2(50 char) not null,
    p_name_kana      varchar2(50 char) not null,
    p_fam_eng        varchar2(50 char) not null,
    p_name_eng       varchar2(50 char) not null,
    p_gender         varchar2(10 char) not null,
    p_allergy_or     varchar2(5 char)  not null,

    foreign key (e_no) references event (e_no) ON DELETE CASCADE,
    foreign key (m_id) references member (m_id) ON DELETE CASCADE
);
select * from companion;
create sequence companion_seq;


-- 축하메세지
create table message
(
    e_no       number(5)         not null,
    m_id       varchar2(50 char) not null,
    me_content varchar2(300 char),
    me_img     varchar2(200 char),

    foreign key (e_no) references event (e_no) ON DELETE CASCADE,
    foreign key (m_id) references member (m_id) ON DELETE CASCADE
);
select * from message;

-- 지불
create table pay
(
    e_no    number(5)         not null,
    m_id    varchar2(50 char) not null,
    wl_no   number(8) default 0 not null,
    p_type  varchar2(10 char) not null,
    p_price number(8)         not null,
    p_date  date              not null,

    foreign key (e_no) references event (e_no) ON DELETE CASCADE,
    foreign key (m_id) references member (m_id) ON DELETE CASCADE
);
select * from pay;


-- 이벤트 댓글
create table event_comment
(
    e_no      number(5)          not null,
    c_writer  varchar2(50 char)  not null,
    c_content varchar2(300 char) not null,
    c_date    date               not null,
    c_type    varchar2(10 char)  not null,
    c_no      number(5)          primary key,
    c_delete_code number(5)      not null,

    foreign key (e_no) references event (e_no) ON DELETE CASCADE
);
<<<<<<< HEAD
select * from event_comment;
drop table event_comment;
=======
drop table event_comment cascade constraints purge;
select *from event_comment;
create sequence event_comment_seq;

insert into event_comment
values (22, '아는형', '축하해', sysdate, '신랑', event_comment_seq.nextval);
>>>>>>> da7a076567c4843dd4c66b371890c5530285f767


--엔파티
create table en_party
(
    e_no    number(5)         not null,
    m_id    varchar2(50 char) not null,
    ep_type varchar2(10 char) not null,
    ep_selectedType varchar2(300 char),
    ep_finalChoice varchar2(100 char),
    ep_lineID varchar2(50 char),

    foreign key (e_no) references event (e_no) ON DELETE CASCADE,
    foreign key (m_id) references member (m_id) ON DELETE CASCADE
);


<<<<<<< HEAD

-- 엔파티 채팅
create table en_chatting
(
    e_no       number(5)          not null,
    m_id       varchar2(50 char)  not null,
    ec_content varchar2(500 char) not null,
    ec_date    date               not null,

    foreign key (e_no) references event (e_no) ON DELETE CASCADE,
    foreign key (m_id) references member (m_id) ON DELETE CASCADE
);

drop table en_chatting;

select * from en_chatting;
=======
select *
from en_party;

>>>>>>> da7a076567c4843dd4c66b371890c5530285f767




-- ----------------------------------------------
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

SELECT e.e_no, m.m_id, m.m_fam_kanji, m.m_name_kanji, m.m_email, m.m_phone, g.g_allergy_or, g.g_relation, a.allergy,w.w_img1, w.w_img2, w.w_img3, w.w_img_share, w.w_date, w.w_wedding_address, g.g_attend_wedding, g.g_guest_type, c.p_accompany_num, c.p_accompany_type, c.p_fam_kanji, c.p_name_kanji
            FROM guest g
            LEFT JOIN member m ON g.m_id = m.m_id
            LEFT JOIN wedding_info w ON g.e_no = w.e_no
            LEFT JOIN event e ON g.e_no = e.e_no
            LEFT JOIN companion c ON g.m_id = c.m_id
            LEFT JOIN allergy a ON g.m_id = a.m_id
            WHERE g.m_id = 'test778';

select * from guest where m_id = 'test2';
delete guest where m_id = 'test778';

select * from event where e_no = 255;
select * from wishlist where e_no =255;
select * from guest;

select * from companion;

insert into COMPANION
values (COMPANION_SEQ.nextval, '68', 'test10', 'ご成年', '2', '李', '泰坤', 'イ', 'テゴン', 'LEE', 'TAE KON', '男', 'YES');

insert into COMPANION
values (COMPANION_SEQ.nextval, '68', 'test10', 'ご成年', '2', '李', '泰坤', 'イ', 'テゴン', 'LEE', 'TAE KON', '男', 'YES');

select * from template;
update template set t_title = '縁結び' where t_pk = 1;
update template set t_title = '幸せの和' where t_pk = 2;
update template set t_title = '桜の舞' where t_pk = 3;
update template set t_title = '喜びの詩' where t_pk = 21;
update template set t_title = '光の誓い' where t_pk = 22;
update template set t_title = '永遠の愛' where t_pk = 23;
update template set t_title = '夢見草' where t_pk = 24;
update template set t_title = '心の絆' where t_pk = 25;
update template set t_title = '朝陽の祝福' where t_pk = 26;
update template set t_title = '恋の調べ' where t_pk = 27;
