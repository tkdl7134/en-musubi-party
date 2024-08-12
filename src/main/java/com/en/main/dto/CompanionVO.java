package com.en.main.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CompanionVO {
    private int p_pk;
    private int p_accompany_num;
    private int e_no;
    private String m_id;
    private String p_accompany_type;
    private String p_fam_kanji;
    private String p_name_kanji;
    private String p_fam_kana;
    private String p_name_kana;
    private String p_fam_eng;
    private String p_name_eng;
    private String p_gender;
    private String p_allergy_or;
    private String p_allergy;
    private String p_relation;
}
