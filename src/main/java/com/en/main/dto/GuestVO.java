package com.en.main.dto;

import lombok.Data;

@Data
public class GuestVO {
    private int e_no;
    private String m_id;

    private String g_attend_wedding;
    private String g_attend_afterParty;
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
    private String p_allergy_or;
    private String p_relation;


}
