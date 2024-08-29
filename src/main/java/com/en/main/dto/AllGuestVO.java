package com.en.main.dto;


import lombok.Data;

@Data
public class AllGuestVO {

    private int e_no;
    private String m_id;

    private String m_fam_kanji;
    private String m_name_kanji;
    private String m_email;
    private String m_phone;

    private String w_date;
    private String w_fam_jp_groom;
    private String w_name_jp_groom;
    private String w_fam_jp_bride;
    private String w_name_jp_bride;
    private String w_wedding_time;
    private String w_wedding_address;
    private String w_wedding_building;
    private String w_img1;
    private String w_img2;
    private String w_img3;
    private String w_img_share;

    private String g_attend_wedding;
    private String g_attend_afterparty;
    private String g_guest_type;
    private String g_allergy_or;
    private String g_relation;
    private String g_relation_detail;

    private String allergy;

    private String p_accompany_num;
    private String p_accompany_type;
    private String p_fam_kanji;
    private String p_name_kanji;
    private String p_fam_kana;
    private String p_name_kana;
    private String p_fam_eng;
    private String p_name_eng;
    private String p_gender;
    private String p_relation;

}
