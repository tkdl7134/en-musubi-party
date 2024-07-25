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

create table template(
    t_pk number(5) primary key,
    t_title varchar2(200 char) not null,
    t_preview varchar2(200 char) not null,
    t_example varchar2(200 char) not null,
    t_template varchar2(200 char) not null
);

create sequence template_seq;

select * from template;

insert into template values (template_seq.nextval, 'test3', 'preview.jpg', 'example.jpg', 'template.jpg')