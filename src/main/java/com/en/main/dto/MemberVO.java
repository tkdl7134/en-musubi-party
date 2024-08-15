package com.en.main.dto;

import lombok.Data;

@Data
public class MemberVO {
    private String m_id;
    private String m_pw;
    private String m_fam_kanji;
    private String m_name_kanji;
    private String m_fam_kana;
    private String m_name_kana;
    private String m_fam_eng;
    private String m_name_eng;
    private String m_birth;
    private String m_gender;
    private String m_email;
    private String m_phone;
    private String m_address;
    private String m_zipcode;
    private String m_img;
}