package com.en.main.dto;

import lombok.Data;


import java.util.Date;
import java.util.List;

@Data
public class PartyVO {
    private int e_no;

    private String m_id;
    private String m_fam_kanji;
    private String m_name_kanji;
    private String m_gender;
    private String m_phone;
    private String m_birth;

    private String g_guest_type;

    private String ep_type;
    private String ep_selectedType;
    private String ep_finalChoice;
    private String ep_lineID;

    private String w_fam_jp_groom;
    private String w_name_jp_groom;
    private String w_fam_jp_bride;
    private String w_name_jp_bride;
    private String w_date;
    private String w_wedding_time;
    private String w_wedding_address;
    private String w_wedding_building;

}
