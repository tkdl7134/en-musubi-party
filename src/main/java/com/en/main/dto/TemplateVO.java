package com.en.main.dto;

import lombok.Data;

@Data
public class TemplateVO {
    private String m_id;
    private int e_no;
    private int t_pk;

    private String w_fam_jp_groom;
    private String w_name_jp_groom;
    private String w_fam_eng_groom;
    private String w_name_eng_groom;
    private String w_fam_jp_bride;
    private String w_name_jp_bride;
    private String w_fam_eng_bride;
    private String w_name_eng_bride;
    private String w_date;
    private String w_wedding_time;
    private String w_wedding_assemble;
    private String w_wedding_building;
    private String w_wedding_address;
    private String w_reception_time;
    private String w_reception_assemble;
    private String w_reception_building;
    private String w_reception_address;
    private String w_message_invite;
    private String w_message_bye;
    private String w_img1;
    private String w_img2;
    private String w_img3;
    private String w_img_share;

    private String g_attend;
    private String g_guest_type;
    private String g_allergy_or;
    private String g_message;
    private String g_relation;

    private String allergy;

    private int p_adult;
    private int p_child;
    private int p_baby;
}
