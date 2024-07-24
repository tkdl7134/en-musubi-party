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
select * from member;
insert into member values ('test3', '1111', '山本', '光', 'ヤマモト', 'ヒカリ', 'yamamoto', 'hikari', '2000-01-01', '女', 'yamamoto@enparty.com', '000-0000-0000', '東京', '1234567', 'profile.jpg' )

